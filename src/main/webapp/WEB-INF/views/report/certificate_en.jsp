<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Sick Leave Certificate(${report.wrappedCaseID})</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/print.css"/>"
	media="screen">
</head>
<body>
	<div class="container-fluid ">
		<div class="text-center">
			<h3 class="verticalnarrow"><b>Jian Zhi Chinese Medicine Clinic</b></h3>		
			<h3 class="verticalnarrow"><b>健至(全科)註冊中醫診所</b></h3>
		</div>
		<div class="row">			
			<div class="col-xs-2 reportcontent narrow">Address:</div>
			<div class="col-xs-8 reportcontent narrow">M/F Fairview Mansion, No.60, Electric Road, North Point, Hong Kong</div>					
		</div>	
		<div class="row">
			<div class="col-xs-2 reportcontent narrow">Telephone No.:</div>			
			<div class="col-xs-8 reportcontent narrow">5970&nbsp;6565, 3483&nbsp;1155</div>			
		</div>		
	</div>
	<div class="container-fluid ">
		<div class="row">
			<div class="text-center"><h4><b>Sick Leave Certificate</b></h4></div>	
		</div>
		<br/>
		<div class="row">	
			<div class="col-xs-10 reportcontent narrow">This is to certify that <u>${report.customerName}</u>
			has attended this clinic for medical consultation on <u>${report.displayDate}</u>.
			</div>
		</div>
		<div class="row">	
			<div class="col-xs-10 reportcontent narrow">She is diagnosed as <u>${report.sickness}</u> and is recommended sick leave from 
			<input type="text" id="fromDate" value="${report.displayDate}" onchange="calculateDate();"></input><span id="fromDateForPrint" style="text-decoration: underline;"></span>
			 to <input type="text" id="toDate" value="${report.displayDate}" onchange="calculateDate();"></input><span id="toDateForPrint" style="text-decoration: underline;"></span> for total 
			 <span id="noOfDateForPrint" style="text-decoration: underline;">1</span>&nbsp;day.
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-xs-6 reportcontent narrow">Remark：<input type="text" id="remark"></input>
			<span id="remarkForPrint" style="text-decoration: underline; display:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
		</div>						
	</div>
	<br/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-6"></div>
			<div class="col-xs-6 reportcontent">Registered Chinese medicine：&nbsp;&nbsp;${report.doctor}</div>			
		</div>	
		<div class="row">
			<div class="col-xs-6"></div>			
			<div class="col-xs-6 reportcontent">(Registration number：&nbsp;&nbsp;${report.registerNo})</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-xs-6"></div>
			<div class="col-xs-6 reportcontent narrow">Signature：&nbsp;&nbsp;______________</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-xs-6 reportcontent narrow"></div>
			<div class="col-xs-6 reportcontent narrow">Issue date：<u>${report.displayDate}</u></div>			
		</div>						
	</div>	
	<div class="text-center">
		<button id="print" type="button" class="btn btn-purple btn-lg hidden-print" onclick="printCert();">列印</button>			
	</div>	
	<div class="row">
		<div class="col-xs-2">
			<form:form action="${pageContext.request.contextPath}/report/cert" commandName="reportForm" method="post" target="report">
				<button id="report" type="button" class="btn btn-info btn-lg hidden-print" onclick="submit();">中文</button>								
				<form:input type="hidden" path="caseID" value="${caseID}"></form:input>
			</form:form>			
		</div>
		<div class="col-xs-2">
		<button type="button" class="btn btn-success btn-lg hidden-print" onclick="window.close();">關閉</button>	
		</div>
		<div class="col-xs-2"></div>
	</div>
	
	<script>	
	initDatePicker("fromDate");
	initDatePicker("toDate");
	
	function printCert(){
		$("#fromDate").hide();
		$("#toDate").hide();
		$("#remark").hide();
		
		$("#fromDateForPrint").text($("#fromDate").val());
		$("#toDateForPrint").text($("#toDate").val());
		
		$("#remarkForPrint").show();
		if($("#remark").val() == ""){			
		}
		else{
			$("#remarkForPrint").text($("#remark").val());	
		}
		
		window.print();
	}
	
	function calculateDate(){
		var from = $("#fromDate").datepicker("getDate");
		var to = $("#toDate").datepicker("getDate");
		var days = (to- from) / (1000 * 60 * 60 * 24)+1;
		days = Math.round(days);		
		if(days > 0){
			$("#noOfDateForPrint").text(days);
		}
		else{
			$("#noOfDateForPrint").text("");
		}
	}
	</script>		
</body>
</html>
