<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>搜尋病案(藥方)</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<script>
	function addMedicineAuto(id) {		
		$('#' + id).autocomplete({
			source : function(request, response) {
				$.ajax({
					dataType : 'json',
					type : 'GET',
					contentType : "application/json; charset=utf-8",
					url : '../medicine/tag',
					data : {
						tagName : $('#' + id).val(),
					},
					success : function(data) {
						response($.map(data, function(item) {
							return {
								label : item.name,
								value : item.name,
								id : item.type,
								code : item.code
							}

						}));
					}
				});
			},
			minLength : 1,
			select : function(event, ui) {
				var type = ui.item.id;
			}
		});
	}
	
	//Set auto complete for all rows
	function initMedicineAuto(){
		var rowCount = $("#medicineTable tr").length-1; //ignore header tr
		
		for(var i=0;i<rowCount;i++){
			addMedicineAuto('medicineNames'+i);
		}			
	}
	
	function addRow(){
		var table = $("#medicineTable");
		var rowCount = $("#medicineTable tr").length-1; //ignore header tr
		
		var tableBody = $("#medicineTable").find("tbody");
		var trFirst = tableBody.find("tr:first");
		var trLast = tableBody.find("tr:last");
		var trNew = trFirst.clone();
		
		trNew.find('span').each(function(){
			$(this).text(rowCount+1);
		});
		
		trNew.find(':text,select,a').each(function(){
			$(this).attr('id','medicineNames'+rowCount);
			$(this).attr('name','medicineNames['+rowCount+"].");			
			$(this).val("");							
		});
		
		trLast.after(trNew);
		
		//Set auto complete
		addMedicineAuto('medicineNames'+rowCount);
	}	
</script>
</head>
<body>
	<form:form action="${pageContext.request.contextPath}/case/medicine" commandName="selectMedicineForm">
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>搜尋病案(藥方)</h1>
			</div>
			<div class="col-md-4 narrow">
				<a href="<spring:url value="/"/>" class="btn btn-success btn-md"
					role="button">回到主目錄</a>
			</div>
		</div>

		<div class="container-fluid backpurple">
			<div class="row">
				<div class="col-xs-6 col-md-6">
					<table id="medicineTable" class="table table-bordered">
						<thead>
							<tr>
								<th class="normal"></th>
								<th class="normal">方藥
								<form:errors path="medicineNames" />
								</th>
							</tr>
						</thead>
						<c:forEach var="name" items="${selectMedicineForm.medicineNames}" varStatus="status">
						<tr>
							<td><span>${status.index+1}</span></td>
							<td><form:input type="text" class="form-control"
									path="medicineNames[${status.index}]" value="${name}"></form:input></td>
						</tr>						
						</c:forEach>
					</table>
				</div>
				<div class="col-xs-6 col-md-6">
				<button type="button" class="btn btn-success btn-md" onclick="addRow()">新增方劑</button>
				<br/>
				<br/>
				<br/>
				<br/>
				<button type="button" class="btn btn-primary btn-lg" onclick="submit();">搜尋</button>
				</div>
			</div>
		</div>
	</form:form>	
	<br />
	
	<div class="container-fluid">
		<span class="contenttitle">共有${caseTotal}病案</span>
		
		<table class="table table-bordered">
				<thead>
					<tr class="success2">
						<th><div class="contentsubtitle">編號</div></th>
						<th><div class="contentsubtitle">客戶名字</div></th>
						<th><div class="contentsubtitle">主訴</div></th>
						<th><div class="contentsubtitle">診斷病名</div></th>						
						<th><div class="contentsubtitle">到診日期</div></th>
						<th><div class="contentsubtitle">費用</div></th>
						<th><div class="contentsubtitle">方藥</div></th>
						<th><div class="contentsubtitle2">管理</div></th>
					</tr>
				</thead>	
				<tbody>
					<c:forEach var="thiscase" items="${caseList}" varStatus="status">
					<c:if test="${status.index%2==0 }">	
					<tr class="success">
					</c:if>
					<c:if test="${status.index%2==1 }">	
					<tr class=success2>
					</c:if>		
						<td>${thiscase.caseID}</td>
						<td>${thiscase.customer}</td>
						<td>${thiscase.problem}</td>
						<td>${thiscase.sickness}</td>
						<td>${thiscase.displayDate}</td>
						<td>${thiscase.price}</td>
						<td>${thiscase.medicineListString}</td>
						<td>
							<a href="<spring:url value="/case/view?id="/>${thiscase.caseID}" target="viewCase" class="btn btn-danger btn-md" role="button">檢視</a>
							<a href="<spring:url value="/case/edit?id="/>${thiscase.caseID}" class="btn btn-danger btn-md" role="button">更改</a>
							<a href="<spring:url value="/report/view?id="/>${thiscase.caseID}" target="report" class="btn btn-success btn-md" role="button">病案報表</a>
							<a href="<spring:url value="/access?id="/>${thiscase.caseID}" target="access" class="btn btn-warning btn-md" role="button">權限</a>								
						</td>
					</tr>
					</c:forEach>			
				</tbody>					
		</table>		
	</div>	
	
	<script type="text/javascript">
	initMedicineAuto();	
	</script>	
</body>
</html>
