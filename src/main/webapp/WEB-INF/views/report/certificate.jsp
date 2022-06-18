<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>病假證明書(${report.caseID})</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/print.css"/>"
	media="screen">
</head>
<body>
	<div class="container-fluid ">
		<div class="text-center"><h3 class="verticalnarrow"><b>健至(全科)註冊中醫診所</b></h3></div>
		<div class="row">			
			<div class="col-xs-2 reportcontent narrow">地址：</div>
			<div class="col-xs-8 reportcontent narrow">香港天后電氣道60號美景樓閣樓</div>					
		</div>	
		<div class="row">
			<div class="col-xs-2 reportcontent narrow">電話：</div>			
			<div class="col-xs-8 reportcontent narrow">34831155&nbsp;59706565</div>			
		</div>		
	</div>
	<form:form action="${pageContext.request.contextPath}/report/certificate" commandName="reportForm" method="post" target="report">
	<div class="container-fluid ">
		<div class="row">
			<div class="text-center"><h4><b>病假證明書</b></h4></div>	
		</div>
		<div class="row">			
			<div class="col-xs-6 reporttitle narrow">茲證明</div>
		</div>
		<br/>
		<div class="row">	
			<div class="col-xs-6 reportcontent">姓名：<u>${report.customerName}</u></div>
		</div>
		<div class="row">	
			<div class="col-xs-6 reportcontent"><u>${report.displayDate}</u>在本診所接受診治。</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-xs-6 reportcontent">診斷：<u>${report.sickness}</u></div>
		</div>
		<br/>
		<div class="row">
			<div class="col-xs-10 reportcontent">病假需休息：
				<form:input type="text" path="startDateStr" value="${report.displayDate}" onchange="calculateDate();"></form:input>
				至<form:input type="text" path="endDateStr" value="${report.displayDate}" onchange="calculateDate();"></form:input>。</div>
		</div>	
		<div class="row">
			<div class="col-xs-6 col-md-4 reportcontent">共：&nbsp;<form:input path="noOfDate" type="number" style="text-decoration: underline;" value="1"></form:input>&nbsp;天。</div>
		</div>						
	</div>
	<br/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-6"></div>
			<div class="col-xs-6 reportcontent">註冊中醫：&nbsp;&nbsp;${report.doctor}</div>			
		</div>	
		<div class="row">
			<div class="col-xs-6"></div>			
			<div class="col-xs-6 reportcontent">(註冊編號：&nbsp;&nbsp;${report.registerNo})</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-xs-6"></div>
			<div class="col-xs-6 reportcontent narrow">簽署：&nbsp;&nbsp;______________</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-lg-6 col-md-6 col-xs-6 reportcontent narrow"></div>
			<div class="col-lg-6 col-md-6 col-xs-6 reportcontent narrow">簽發日期*：
				<form:input type="text" path="issueDateStr"></form:input>
			</div>			
		</div>						
	</div>	
	<div class="row">
		<div class="col-xs-2">		
		</div>
		<div class="col-xs-2">
				<button id="report" type="button" class="btn btn-lg btn-info hidden-print" onclick="submit();">預覧</button>								
				<form:input type="hidden" path="caseID" value="${caseID}"></form:input>			
		</div>
		<div class="col-xs-2"></div>
	</div>
	</form:form>	
	<script>	
	initDatePicker("startDateStr");
	initDatePicker("endDateStr");
	initDatePicker("issueDateStr");	
	
	function calculateDate(){
		var from = $("#startDateStr").datepicker("getDate");
		var to = $("#endDateStr").datepicker("getDate");
		var days = (to- from) / (1000 * 60 * 60 * 24)+1;
		days = Math.round(days);		
		if(days > 0){
			$("#noOfDate").val(days);
		}
		else{
			$("#noOfDate").val(0);
		}
	}
	</script>		
</body>
</html>
