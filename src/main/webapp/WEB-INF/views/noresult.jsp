<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>No result page</title>
</head>
<body>
	<p>
	Dear <strong>${user}</strong>, 
	</p>
	<p>	Ooops! I am sorry that there is no result to be shown.
		Please try again later. 
		抱歉! 沒有搜㝷結果。請容後再試。
	</p>
	
	<div><a href="<c:url value="/" />">回到主頁</a></div>
</body>
</html>