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
	<form:form action="${pageContext.request.contextPath}/case" commandName="caseCriteria">
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
	
	<div class="container-fluid">
		<span class="contenttitle">共有${caseTotal}病案</span>
		
		<table class="table table-bordered">
				<thead>
					<tr class="success2">
						<th><div class="contentsubtitle">編號</div></th>
						<th><div class="contentsubtitle">客戶名字</div></th>
						<th><div class="contentsubtitle">主訴</div></th>
						<th><div class="contentsubtitle">診斷病名</div></th>						
						<th><div class="contentsubtitle">到診日期</div></th>
						<th><div class="contentsubtitle">費用</div></th>
						<th colspan="4"><div class="contentsubtitle2">管理</div></th>
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
							<a href="<spring:url value="/case/view?id="/>${thiscase.caseID}" target="viewCase" class="btn btn-danger btn-md" role="button">檢視</a>
							<a href="<spring:url value="/case/edit?id="/>${thiscase.caseID}" class="btn btn-danger btn-md" role="button">更改</a>
							<a href="<spring:url value="/access?id="/>${thiscase.caseID}" target="access" class="btn btn-warning btn-md" role="button">權限</a>								
						</td>
						<td>					
							<form:form action="${pageContext.request.contextPath}/report/report" commandName="reportForm" method="post" target="report">
								<button id="report" type="button" class="btn btn-success" onclick="submit();">病案報表</button>								
								<form:input type="hidden" path="caseID" value="${thiscase.caseID}"></form:input>
							</form:form>
							<form:form action="${pageContext.request.contextPath}/report/prescriptionInput" commandName="reportForm" method="post" target="report">
								<button id="report" type="button" class="btn btn-success" onclick="submit();">客戶報表</button>								
								<form:input type="hidden" path="caseID" value="${thiscase.caseID}"></form:input>
							</form:form>								
						</td>
						<td>		
							<form:form action="${pageContext.request.contextPath}/report/receiptInput" commandName="reportForm" method="post" target="report">
								<button id="report" type="button" class="btn btn-info" onclick="submit();">到診收據</button>								
								<form:input type="hidden" path="caseID" value="${thiscase.caseID}"></form:input>
							</form:form>	
							<form:form action="${pageContext.request.contextPath}/report/followupInput" commandName="reportForm" method="post" target="report">
								<button id="report" type="button" class="btn btn-info" onclick="submit();">到診紙</button>								
								<form:input type="hidden" path="caseID" value="${thiscase.caseID}"></form:input>
							</form:form>																			
						</td>
						<td>			
							<form:form action="${pageContext.request.contextPath}/report/cert" commandName="reportForm" method="post" target="report">
								<button id="report" type="button" class="btn btn-warning" onclick="submit();">病假證明書</button>								
								<form:input type="hidden" path="caseID" value="${thiscase.caseID}"></form:input>
							</form:form>																									
						</td>								
					</tr>
					</c:forEach>			
				</tbody>					
		</table>		
	</div>	
	
	<script type="text/javascript">	
	function gotoReport(id){
		$("#caseID").val(id);
		alert($("#caseID").val());
		$("#reportForm").submit();
	}
	
	initDatePicker("fromDateStr");
	initDatePicker("toDateStr");
	
	</script>	
</body>
</html>
