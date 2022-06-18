<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

<title>AccessDenied page</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
</head>
<body>
	<div class="container-fluid">
	
		<div class="row">

			<div class="col-xs-2"></div>
			<div class="col-xs-4">
				<div class="menutitlecontainer">
					親愛的<strong>${user}</strong> Dear <strong>${user}</strong>, <br />
					<br /> 很抱歉!We are sorry! <br /> <br /> 
					你沒有權限進入此頁面。You are not authorized to
					access this page. <br /> <br />
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-2"></div>
			<div class="col-xs-2">
				<a href="<c:url value="/logout" />" class="btn btn-success btn-lg"
					role="button">登出</a>
			</div>
			<div class="col-xs-2">
				<button type="button" class="btn btn-success btn-lg hidden-print" onclick="window.close();">關閉</button>	
			</div>							
			<div class="col-xs-2">
				<a href="<c:url value="/" />" class="btn btn-success btn-lg"
					role="button">回到主目錄</a>
			</div>
			<div class="col-xs-2"></div>
		</div>
	</div>
</body>
</html>