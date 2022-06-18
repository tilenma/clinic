<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Download Confirmation(ID:${reportForm.caseID})</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/print.css"/>" media="screen">
</head>
<body>
	<div class="container-fluid ">
		<div class="menutitlecontainer">
		<div class="row">
			<div class="col-md-4 col-xd-4"></div>
			<div class="col-md-4 col-xd-4">
				<h3 class="verticalnarrow">下載成功</h3>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-md-2 col-xd-2"></div>	
			<div class="col-md-8 col-xd-8">
				<h4>你需要的報表(ID:${reportForm.caseID})已成功下載至${reportForm.path}。</h4>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-md-4 col-xd-4"></div>	
			<div class="col-md-4 col-xd-4">
				<button type="button" class="btn btn-success btn-lg hidden-print"
					onclick="window.close();">關閉</button>
			</div>
		</div>
	</div>
	</div>
</body>
</html>