<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>到診收據(${report.wrappedCaseID})</title>
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
	<form:form action="${pageContext.request.contextPath}/report/receipt" commandName="reportForm" method="post" target="report">
	<div class="container-fluid ">
		<div class="row">
			<div class="text-center"><h4><b>到診收據</b></h4></div>	
		</div>	
		<div class="row">			
			<div class="col-lg-10 col-md-10 col-xs-10 reportcontent narrow">
				證明<u>${report.customerName}</u>於<u>${report.displayDate}</u>在本診所接受診治。
			</div>
		</div>
		<div class="row">
			<div class="col-lg-10 col-md-10 col-xs-10  reportcontent narrow">	
				診斷為<u>${report.sickness}</u>，並已收治療費用：<u>${report.price}</u>。
			</div>
		</div>
		<br/>	
		<c:if test="${not empty report.receiptRemark }">
		<div class="row">
			<div class="col-lg-10 col-md-10 col-xs-10  reportcontent">備註：&nbsp;&nbsp;${report.receiptRemark }</div>			
		</div>				
		<br/>	
		</c:if>		
	</div>
	<br/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-xs-6"></div>
			<div class="col-lg-6 col-md-6 col-xs-6 reportcontent">註冊中醫：&nbsp;&nbsp;${report.doctor}</div>			
		</div>	
		<div class="row">
			<div class="col-lg-6 col-md-6 col-xs-6"></div>			
			<div class="col-lg-6 col-md-6 col-xs-6 reportcontent">(註冊編號：&nbsp;&nbsp;${report.registerNo})</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-lg-6 col-md-6 col-xs-6"></div>
			<div class="col-lg-6 col-md-6 col-xs-6 reportcontent narrow">簽署：&nbsp;&nbsp;______________</div>
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
		<div class="col-lg-2 col-md-2 col-xs-2">		
		</div>
		<div class="col-lg-2 col-md-2 col-xs-2">
				<button id="report" type="button" class="btn btn-lg btn-info hidden-print" onclick="submit();">預覧</button>								
				<form:input type="hidden" path="caseID" value="${caseID}"></form:input>			
		</div>
		<div class="col-lg-2 col-md-2 col-xs-2"></div>
	</div>
	</form:form>	
	<script>	
	initDatePicker("issueDateStr");	
	</script>	
</body>
</html>
