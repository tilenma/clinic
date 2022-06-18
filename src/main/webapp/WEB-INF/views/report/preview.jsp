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
<script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
<link rel="stylesheet" href="https://printjs-4de6.kxcdn.com/print.min.css">
	
<script>
function printPdf(){
	document.getElementById('pdf-iframe').contentWindow.print();	
	//var url="<spring:url value="/ws"/>"+"${saveUrl}";
	//console.log("call save via "+url);
}
</script>
</head>
<body>	
	<div class="container-fluid ">
		<div class="row">
			<div class="col-md-2 col-xs-2"></div>
			<div class="col-md-3 col-xs-3">
				<form:form action="${downloadUrl}" commandName="reportForm" method="post" target="report">						
					<form:input type="hidden" path="caseID" value="${caseID}"></form:input>
					<form:input type="hidden" path="startDateStr" value="${startDateStr}"></form:input>
					<form:input type="hidden" path="endDateStr" value="${endDateStr}"></form:input>
					<form:input type="hidden" path="noOfDate" value="${noOfDate}"></form:input>
					<button id="report" type="button" class="btn btn-lg btn-info" onclick="submit()">下載</button>
				</form:form>
			</div>
			<div class="col-md-3 col-xs-3">
				<button id="report" type="button" class="btn btn-lg btn-success" onclick="printPdf()">列印</button>
			</div>
			<div class="col-md-3 col-xs-3">
				<form:form action="${otherLangUrl}" commandName="reportForm" method="post" target="report">						
					<form:input type="hidden" path="caseID" value="${caseID}"></form:input>
					<form:input type="hidden" path="lang" value="${otherLang}"></form:input>
					<form:input type="hidden" path="startDateStr" value="${startDateStr}"></form:input>
					<form:input type="hidden" path="endDateStr" value="${endDateStr}"></form:input>
					<form:input type="hidden" path="noOfDate" value="${noOfDate}"></form:input>
					<form:input type="hidden" path="issueDateStr" value="${issueDateStr}"></form:input>
					<button id="report" type="button" class="btn btn-lg btn-warning" onclick="submit()">${otherLangName}</button>
				</form:form>
			</div>			
		</div>
		<object id="pdf-object" type="application/pdf" data="${previewUrl}#toolbar=1&navpanes=0&scrollbar=1&page=1&zoom=100"  
			width="800px" height="600px">
			<embed id="pdf-embed" src="${previewUrl}" type="application/pdf">
				<p>
					This browser does not support PDFs. Please download the PDF to view it: 
					<a href="${previewUrl}" target="_blank">Download PDF</a>. 
				</p>
			</embed>
		</object>
		<!-- 
		<embed id="pdf-embed" src="${previewUrl}" type="application/pdf" width="800px" height="600px">
		</embed>
		-->
		<iframe id="pdf-iframe" src="${previewUrl}" width="1px" height="1px" style="visibility: hidden"></iframe>
		
	</div>	
</body>
</html>
