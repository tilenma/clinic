<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>檢視病案文件</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />

</head>
<body>	
		<input type="hidden" id="caseId" value="${caseId}" name="caseId"/>
		
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>檢視病案文件</h1>
			</div>
			<div class="col-md-4 narrow">
			</div>
		</div>

		<div class="container-fluid backpurple">
					<table id="attachmentTable" class="table table-bordered">
						<thead>
							<tr class=success2>
								<th></th>
								<th class="normal col-xs-2">文件名稱</th>
								<th class="normal col-xs-2">類別</th>
								<th>內容</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="thisattachment" items="${attachmentList}" varStatus="status">
							<c:if test="${status.index%2==0 }">	
							<tr class="success">
							</c:if>
							<c:if test="${status.index%2==1 }">	
							<tr class=success2>
							</c:if>		
								<td>		
		      						<a href="<spring:url value="/case/deleteAttach?caseId="/>${caseId}&deleteFileId=${thisattachment.fileId}" 
		      						    class="btn btn-danger btn-md" role="button">刪除</a>
								</td>
					            <td>${thisattachment.fileName}</td>
					            <td>${thisattachment.fileType}</td>
					        	<td>
					        		<c:choose>
					        			<c:when test="${thisattachment.fileType== 'image/jpeg'}">
					        				<img src="./download?caseId=${thisattachment.caseId}&fileId=${thisattachment.fileId}" class="img-fluid img-thumbnail"/>
					        			</c:when>
					        			<c:otherwise>
					        				<a href="./download?caseId=${thisattachment.caseId}&fileId=${thisattachment.fileId}" target="attachment">下載</a>
					        			</c:otherwise>
					        		</c:choose>
					        	</td>
					        </c:forEach>
					    </tbody>
					</table>
		</div>	
</body>
</html>
