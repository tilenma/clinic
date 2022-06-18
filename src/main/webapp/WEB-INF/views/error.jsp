<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Error page</title>
</head>
<body>
	<p>
		<h2>We are sorry!</h2>
	</p>
	<p>	Ooops! The system has some problem. Please contact system admin to fix.
		很抱歉! 系統發生問題。請與技術支援相關同事聯絡。
	</p>
	
	<div><a href="<c:url value="/" />">回到主頁</a></div>
	
	<p>
		<code>
		${errorMsg}
		</code>
	</p>	
	<p>
		<code>
		${exceptionMessage}
		</code>
	</p>
</body>
</html>