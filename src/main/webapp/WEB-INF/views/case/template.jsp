<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>搜尋病案</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
</head>
<body>
	<form:form action="./case" commandName="caseCriteria">
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>搜尋病案</h1>
			</div>
			<div class="col-md-4 narrow">
				<a href="<spring:url value="/"/>" class="btn btn-success btn-md" role="button">回到主目錄</a>	
			</div>
		</div>

		<div class="container-fluid backpurple">
			<div class="row">
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">編號</span>
				</div>
				<div class="col-md-3 narrow">
					<form:input type="text" path="caseID"></form:input>					
				</div>
				<div class="col-md-2 narrow"></div>
				<div class="col-md-6 narrow">
					<button type="button" class="btn btn-primary btn-md"
						onclick="submit();">&nbsp;&nbsp;&nbsp;過濾&nbsp;&nbsp;&nbsp;</button>
					<form:errors path="customerName" class="alert-danger"></form:errors>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">客戶名字</span>					
				</div>
				<div class="col-md-3 narrow">					
					<form:input type="text" path="customerName"></form:input>
				</div>
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">到診日期</span>					
				</div>
				<div class="col-md-4 narrow">
					由&nbsp;&nbsp;<form:input type="text" path="fromDateStr"></form:input>&nbsp;至&nbsp;&nbsp;<form:input type="text" path="toDateStr"></form:input>
					<form:errors path="fromDateStr" class="alert-danger"></form:errors>
					<form:errors path="toDateStr" class="alert-danger"></form:errors>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">主訴</span>					
				</div>
				<div class="col-md-3 narrow">
					<form:input type="text" path="problem"></form:input>
				</div>
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">費用</span>					
				</div>
				<div class="col-md-4 narrow">
					由&nbsp;&nbsp;<form:input type="text" path="fromPrice"></form:input>&nbsp;至&nbsp;&nbsp;<form:input type="text" path="toPrice"></form:input>
				</div>
			</div>		
			<br />
			<div class="row">
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">診斷病名</span>
				</div>
				<div class="col-md-3 narrow">
					<form:input type="text" path="sickness"></form:input>
				</div>

			</div>					
		</div>
	</form:form>
	<br />
	<script type="text/javascript">	
	initDatePicker("fromDateStr");
	initDatePicker("toDateStr");
	
	setDefaultToday("fromDateStr");
	setDefaultToday("toDateStr");
	</script>	
</body>
</html>
