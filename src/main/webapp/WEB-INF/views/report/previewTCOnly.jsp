<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>報表預覧</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/print.css"/>"
	media="screen">
<script>
function printPdf(){
	document.getElementById('pdf-iframe').contentWindow.print();
	var url="<spring:url value="/ws"/>"+"${saveUrl}";
	console.log("call save via "+url);
}
</script>	
</head>
<body>	
	<div class="container-fluid ">
		<form:form action="${downloadUrl}" commandName="reportForm" method="post" target="report">		
		<div class="row">
			<div class="col-md-2 col-xs-2"></div>
			<div class="col-md-3 col-xs-3">								
				<form:input type="text" path="path"></form:input>
			</div>
			<div class="col-md-3 col-xs-3">
				<button id="report" type="button" class="btn btn-lg btn-success" onclick="printPdf()">列印</button>
			</div>			
			<div class="col-md-3 col-xs-3">
				<form:input type="hidden" path="caseID" value="${caseID}"></form:input>
				<form:input type="hidden" path="startDateStr" value="${startDateStr}"></form:input>
				<form:input type="hidden" path="endDateStr" value="${endDateStr}"></form:input>
				<form:input type="hidden" path="noOfDate" value="${noOfDate}"></form:input>
				<button id="report" type="button" class="btn btn-lg btn-info" onclick="submit()">下載</button>	
			</div>			
		</div>
		</form:form>
		
		<iframe id="pdf-iframe" src="${previewUrl}" width="800px" height="600px"></iframe>
	</div>	
</body>
</html>
