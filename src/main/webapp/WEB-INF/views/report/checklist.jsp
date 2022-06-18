<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>最近十個病案</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
</head>
<body>	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>最近十個病案 (共有${caseTotal}病案未確認)</h1>
			</div>
			<div class="col-md-2 narrow">
				<button type="button" class="btn btn-success btn-lg hidden-print" onclick="window.close();">關閉</button>	
			</div>	
		</div>	
		
		<table class="table table-bordered">
				<thead>
					<tr class="success2">
						<th><div class="contentsubtitle">編號</div></th>
						<th><div class="contentsubtitle">客戶名字</div></th>
						<th><div class="contentsubtitle">主訴</div></th>
						<th><div class="contentsubtitle">診斷病名</div></th>						
						<th><div class="contentsubtitle">到診日期</div></th>
						<th><div class="contentsubtitle">費用</div></th>
						<th><div class="contentsubtitle2">管理</div></th>
					</tr>
				</thead>	
				<tbody>
					<c:forEach var="thiscase" items="${caseList}" varStatus="status">
					<c:if test="${status.index%2==0 }">	
					<tr class="success">
					</c:if>
					<c:if test="${status.index%2==1 }">	
					<tr class=success2>
					</c:if>		
						<td>${thiscase.caseID}</td>
						<td>${thiscase.customer}</td>
						<td>${thiscase.problem}</td>
						<td>${thiscase.sickness}</td>
						<td>${thiscase.displayDate}</td>
						<td>${thiscase.price}</td>
						<td>					
							<form:form action="./check" commandName="reportForm" method="post">
								<button id="report" type="button" class="btn btn-warning" onclick="submit();">確認病案</button>								
								<form:input type="hidden" path="caseID" value="${thiscase.caseID}"></form:input>
							</form:form>						
						</td>					
					</tr>
					</c:forEach>			
				</tbody>					
		</table>		
	</div>	
	
	<script type="text/javascript">	
	</script>	
</body>
</html>
