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
						<form:option value="-1">--選擇--</form:option>
						<form:option value="男">男</form:option>
						<form:option value="女">女</form:option>
						<form:option value="其他">其他</form:option>
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
	
	<div class="container-fluid">
		<span class="contenttitle">共有${customerTotal}客戶</span>
		<table class="table table-bordered">
			
				<thead>
					<tr class="success2">
						<th><div class="contentsubtitle">客戶編號</div></th>
						<th><div class="contentsubtitle">姓名</div></th>
						<th><div class="contentsubtitle">姓別</div></th>
						<th><div class="contentsubtitle">聯絡電話</div></th>						
						<th><div class="contentsubtitle">身份證號碼</div></th>
						<th><div class="contentsubtitle">電郵</div></th>
						<th><div class="contentsubtitle"></div></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cust" items="${customerList}" varStatus="status">
					<c:if test="${status.index%2==0 }">	
					<tr class="success">
					</c:if>
					<c:if test="${status.index%2==1 }">	
					<tr class=success2>
					</c:if>		
						<td>${cust.customerID}</td>
						<td>${cust.name}</td>
						<td>${cust.gender}</td>
						<td>${cust.mobileNumber}</td>
						<td>${cust.maskedDocumentID}</td>
						<td>${cust.email}</td>
						<td><a href="<spring:url value="/customer/view?id="/>${cust.customerID}" target="_blank">檢視</a>
						<a href="<spring:url value="/customer/edit?id="/>${cust.customerID}">更改</a></td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
</body>
</html>
