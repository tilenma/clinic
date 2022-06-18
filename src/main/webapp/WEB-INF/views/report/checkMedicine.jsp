<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>病案藥方(${report.wrappedCaseID})</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/print.css"/>"
	media="screen">
	
	<script>
	function checkBarcode(){
		var inputCode = $("#barcode").val();	
		
		if(inputCode.length >= 13){
			var table = $("#medicineTable");
			var rowCount = $("#medicineTable tr").length-1; //ignore header tr
				
			var tableBody = $("#medicineTable").find("tbody");
			var update = false;
			var requireCheck = false;
			
			tableBody.find("tr").each(function(){
				var this_row = $(this);
				var barcode = $.trim(this_row.find('td:eq(3)').html());
				
				if(barcode !=null && barcode.length>0){
					if(barcode == inputCode){
						$(this).removeClass();
						$(this).addClass("success");
						update = true;
						$("#barcode").val(""); //reset barcode
					}
				}
				
				if($(this).hasClass("success") || $(this).hasClass("info")){
					//completed
				}
				else{
					requireCheck = true;
				}
			});
			
			if(!update){
				alert("找不到方劑!");
			}
			
			if(!requireCheck){
				$("#completeBtn").removeAttr('disabled');
			}
		}
	}
	
	function completeAndLog(){
		var totalNo = $("#medicineTable tr").length-1; //ignore header tr
		
		var table = $("#medicineTable");			
		var tableBody = $("#medicineTable").find("tbody");		
		var checkedNo = 0;
		tableBody.find("tr").each(function(){
			if($(this).hasClass("success")){
				//completed
				checkedNo = checkedNo+1;
			}
		});
		
		var thisCaseId = ${caseId};
		
		var wsUrl = '../ws/case/check?caseId='+thisCaseId+"&checkedNo="+checkedNo+"&totalNo="+totalNo;
		
		$.ajax({
			url: wsUrl,
			type: 'GET',
			success: function(resp){				
				console.log("Check case log with case id: " + thisCaseId+" response="+resp);
				window.close();
			},
			error: function(e){
				alert('Error:'+e);
			}
		})
	}
	
	function confirmAndLog(){
		var totalNo = $("#medicineTable tr").length-1; //ignore header tr
		
		var table = $("#medicineTable");			
		var tableBody = $("#medicineTable").find("tbody");		
		var checkedNo = 0;
		tableBody.find("tr").each(function(){
			if($(this).hasClass("success")){
				//completed
				checkedNo = checkedNo+1;
			}
		});
		
		var thisCaseId = ${caseId};
		
		var wsUrl = '../ws/case/confirm?caseId='+thisCaseId+"&checkedNo="+checkedNo+"&totalNo="+totalNo;
		
		$.ajax({
			url: wsUrl,
			type: 'GET',
			success: function(resp){				
				console.log("Direct confirm case log with case id: " + thisCaseId+" response="+resp);
				window.close();
			},
			error: function(e){
				alert('Error:'+e);
			}
		})	
	}
	</script>
</head>
<body>
	<div id="confirmModal" class="modal fade" role="dialog">
		<div class="modal-dialog">		
		   <!-- Modal content-->
		   <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">直接確認嗎?</h4>
		      </div>
		      <div class="modal-footer">
      			<button type="button" class="btn btn-success btn-default" onclick="confirmAndLog();">確認及離開</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>							        
		      </div>
		   </div>		
		</div>
	</div>		
	<br/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-1 col-md-1 reporttitle">編號：</div>
			<div class="col-xs-1 col-md-1 reportcontent">${report.wrappedCaseID}</div>
			<div class="col-xs-1 col-md-1 reporttitle">日期：</div>
			<div class="col-xs-1 col-md-1 reportcontent">${report.displayDate}</div>
			<div class="col-xs-1 col-md-1"></div>
			<div class="col-xs-2 col-md-2">				
				<button id="directBtn" type="button" class="btn btn-purple btn-md hidden-print" data-toggle="modal" data-target="#confirmModal">一鍵確認</button>
			</div>	
		</div>
		<div class="row">
			<div class="col-xs-1 col-md-1 reporttitle">名字：</div>
			<div class="col-xs-2 col-md-1 reportcontent">${report.customerName}</div>
			<div class="col-xs-1 col-md-1 reporttitle">費用：</div>
			<div class="col-xs-1 col-md-1 reportcontent">$${report.price}</div>
		</div>		
	</div>
	<br/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-10 col-md-10">
				<table id="medicineTable" class="table table-bordered">
					<thead>
						<tr class="">
							<th><div class="reporttitle">編號</div></th>							
							<th><div class="reporttitle">方劑</div></th>
							<th><div class="reporttitle">份量 / 類別</div></th>
							<th><div class="reporttitle">條碼</div></th>
							<th><div class="reporttitle">備註</div></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${medicList}" var="m">
						<c:choose>
							<c:when test="${empty m.barCode}">
							<tr class="info">
							</c:when>
							<c:otherwise>
							<tr class="warning">
							</c:otherwise>							 
						</c:choose>
							<td>${m.code}</td>							
							<td>${m.name}</td>
							<td>${m.displayUnit}</td>
							<td>${m.barCode}</td>
							<td>${m.remark}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-2 reporttitle">附註：</div>
			<div class="col-xs-8 reportcontent">${report.dosageRemark }</div>
		</div>
		<div class="row">
			<div class="col-xs-2 reporttitle">服法：</div>
			<div class="col-xs-8 reportcontent">${report.dosageMethod }</div>
		</div>	
		<div class="row">
			<div class="col-xs-2 reporttitle">醫囑：</div>
			<div class="col-xs-8 reportcontent">${report.dosageRecomment }</div>
		</div>			
	</div>
	<br/>
	<div class="text-center">
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">輸入條碼</span></div>
			<div class="col-md-4 narrow">
				<input type="text" id="barcode" maxlength="13" onchange="checkBarcode();"></input>
				<input type="hidden" id="checkedNo" value="0"></input>
				<input type="hidden" id="caseId" value="${caseId}"></input>
			</div>
		</div>	
	</div>
	<br/>
	<br/>
	<div class="row">
		<div class="col-xs-2"></div>
		<div class="col-xs-2">	
		</div>
		<div class="col-xs-2">
		<button id="completeBtn" type="button" class="btn btn-success btn-lg hidden-print" onclick="completeAndLog();" disabled="disabled">完成及關閉</button>	
		</div>
		<div class="col-xs-2"></div>
	</div>			
</body>
</html>
