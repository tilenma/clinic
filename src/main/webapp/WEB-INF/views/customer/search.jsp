<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>搜尋客戶</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
</head>
<body>
	<form:form action="./customer" commandName="customerCriteria">
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>搜尋客戶</h1>
			</div>
			<div class="col-md-4 narrow">
				<a href="<spring:url value="/"/>" class="btn btn-success btn-md" role="button">回到主目錄</a>	
			</div>
		</div>

		<div class="container-fluid backpurple">
			<div class="row">
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">姓名</span>
				</div>
				<div class="col-md-3 narrow">
					<form:input type="text" path="name"></form:input>					
				</div>
				<div class="col-md-2 narrow"></div>
				<div class="col-md-6 narrow">
					<button type="button" class="btn btn-primary btn-md"
						onclick="submit();">&nbsp;&nbsp;&nbsp;過濾&nbsp;&nbsp;&nbsp;</button>
					<form:errors path="name" class="alert-danger"></form:errors>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">聯絡電話</span>					
				</div>
				<div class="col-md-3 narrow">					
					<form:input type="text" path="mobileNumber"></form:input>
				</div>
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">性別</span>
				</div>
				<div class="col-md-3 narrow">
					<form:select path="gender">
						<option value="-1">--選擇--</option>
						<option value="男">男</option>
						<option value="女">女</option>
						<option value="其他">其他</option>
					</form:select>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">身份證號碼</span>					
				</div>
				<div class="col-md-3 narrow">
					<form:input type="text" path="documentID"></form:input>
				</div>
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">電郵</span>
				</div>
				<div class="col-md-3 narrow">
					<form:input type="text" path="email"></form:input>
				</div>

			</div>
		</div>
	</form:form>
			<br />
</body>
</html>
