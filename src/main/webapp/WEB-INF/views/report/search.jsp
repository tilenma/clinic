<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>搜尋報表</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
</head>
<body>
	<form:form action="./search" commandName="caseCriteria">
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>搜尋報表</h1>
			</div>
			<div class="col-md-4 narrow">
				<button type="button" class="btn btn-success btn-lg hidden-print" onclick="window.close();">取消</button>	
			</div>
		</div>

		<div class="container-fluid backpurple">
			<div class="row">
				<div class="col-md-1 col-sm-1 narrow">
					<span class="contentsubtitle">編號</span>
				</div>
				<div class="col-md-2 col-sm-2 narrow">
					<form:input type="text" path="caseID"></form:input>					
				</div>
				<div class="col-md-2 col-sm-2 narrow">
					<span class="contentsubtitle">客戶名字</span>					
				</div>
				<div class="col-md-2 col-sm-2 narrow">					
					<form:input type="text" path="customerName"></form:input>
				</div>
				<div class="col-md-1 col-sm-1 narrow">
					<button type="button" class="btn btn-primary btn-md"
						onclick="submit();">&nbsp;&nbsp;&nbsp;過濾&nbsp;&nbsp;&nbsp;</button>
					<form:errors path="customerName" class="alert-danger"></form:errors>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-2 narrow">
					<span class="contentsubtitle">到診日期由</span>					
				</div>
				<div class="col-md-2 narrow">
					<form:input type="text" path="fromDateStr"></form:input>
					<form:errors path="fromDateStr" class="alert-danger"></form:errors>
				</div>
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">至</span>					
				</div>
				<div class="col-md-2 narrow">
					<form:input type="text" path="toDateStr"></form:input>
					<form:errors path="toDateStr" class="alert-danger"></form:errors>
				</div>				
			</div>				
		</div>
	</form:form>
	<br />
	<script type="text/javascript">	
	initDatePicker("fromDateStr");	
	setDefaultToday("fromDateStr");
	initDatePicker("toDateStr");	
	setDefaultToday("toDateStr");	
	</script>	
</body>
</html>
