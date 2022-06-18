<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>選擇方藥</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<script>
function selectMedicine(aType,aName){	
	updateMedicine('${columnId}',aType,aName);
	closeModal();
}
</script>
</head>
<body>
	<div class="container-fluid">
		<table class="table table-bordered">
			
				<thead>
					<tr class="success2">
						<th><div class="contentsubtitle"></div></th>
						<th><div class="contentsubtitle">編號</div></th>
						<th><div class="contentsubtitle">類別</div></th>
						<th class="wide-2"><div class="contentsubtitle">名稱</div></th>
						<th><div class="contentsubtitle">價目分類</div></th>						
						<th><div class="contentsubtitle">用法用量</div></th>
						<th><div class="contentsubtitle">性味</div></th>
						<th><div class="contentsubtitle">歸經</div></th>
						<th><div class="contentsubtitle">功效</div></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="med" items="${medicineList}" varStatus="status">
					<c:if test="${status.index%2==0 }">	
					<tr class="success">
					</c:if>
					<c:if test="${status.index%2==1 }">	
					<tr class=success2>
					</c:if>						
						<td><button type="button" class="btn btn-primary btn-md"
						onclick="selectMedicine('${med.type}','${med.name}');">&nbsp;&nbsp;&nbsp;選擇&nbsp;&nbsp;&nbsp;</button></td>
						<td>${med.code}</td>
						<td>${med.type}</td>
						<td>${med.name}</td>
						<td>${med.priceCategory}</td>
						<td>${med.usage}</td>
						<td>${med.taste}</td>
						<td>${med.meridian}</td>
						<td>${med.effect}</td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
</body>
</html>
