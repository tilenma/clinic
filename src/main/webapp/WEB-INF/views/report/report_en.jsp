<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Prescription(${report.wrappedCaseID})</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/print.css"/>"
	media="screen">
</head>
<body>	
	<div class="container-fluid ">
		<div class="text-center"><h4 class="verticalnarrow"><b>Prescription</b></h4></div>
		<hr class="thick">
		<div class="row">			
			<div class="col-xs-6 reporttitle narrow">Jian Zhi Chinese Medicine Clinic</div>
			<div class="col-xs-6 reporttitle narrow">Telephone No.:5970&nbsp;6565, 3483&nbsp;1155</div>			
		</div>		
		<div class="row">
			<div class="col-xs-1"></div>
			<div class="col-xs-11 reportcontent">M/F Fairview Mansion, No.60, Electric Road, North Point, Hong Kong</div>
		</div>
		<div class="row">
			<div class="col-xs-1"></div>			
			<div class="col-xs-11 reportcontent">Registered Chinese medicine practitioner：&nbsp${report.doctor}&nbsp;&nbsp;(Registration number:${report.registerNo})</div>			
		</div>				
		<hr class="thin">
		<div class="row">						
			<div class="col-xs-6 reporttitle narrow">Name：&nbsp;&nbsp;${report.customerName}</div>			
			<div class="col-xs-6 reporttitle narrow">Date：&nbsp;&nbsp;${report.displayDate}</div>			
		</div>
	</div>
	<br/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12">
				<table class="table table-bordered">
					<thead>
						<tr class="">
							<th class="col-xs-4"><div class="reporttitle">Recipe</div></th>
							<th><div class="reporttitle">Unit / Type</div></th>
							<th class="col-xs-4"><div class="reporttitle">Recipe</div></th>
							<th><div class="reporttitle">Unit / Type</div></th>
						</tr>
					</thead>
					<c:forEach items="${medicList}" var="m" varStatus="rowCount">
						<c:if test="${rowCount.count % 2 ==1 }">
						<tr>
						</c:if>
							<td>${m.name}
								<c:if test="${m.showDetail}"><span class="reportsmall">(Ingredient：${m.detailCH})</span></c:if>
							</td>
							<td>${m.displayUnit}</td>
						<c:if test="${rowCount.count % 2 ==0 || rowCount.count == fn:length(values)}">
						</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<c:if test="${not empty report.receiptRemark }">
		<div class="row">
			<div class="col-xs-12 reportcontent">Remark：&nbsp;&nbsp;${report.reportRemark }</div>			
		</div>			
		</c:if>
		<div class="row">
			<div class="col-xs-12 reportcontent">Usage：&nbsp;&nbsp;${report.dosageMethod }</div>			
		</div>	
		<div class="row">			
			<div class="col-xs-12 reportcontent">Recommendation：&nbsp;&nbsp;${report.dosageRecomment }</div>
		</div>			
		<div class="row">
			<div class="col-xs-4 reportcontent narrow">Redispense count：${report.redispense }</div>
			<div class="col-xs-5 reportcontent narrow">Expiry date:${report.displayExpiryDate}</div>
			<div class="col-xs-3 reportcontent narrow">Signature:______</div>			
		</div>						
	</div>	
	<div class="text-center">
		<button id="print" type="button" class="btn btn-purple btn-lg hidden-print" onclick="window.print();">Print</button>			
	</div>	
	<div class="row">
		<div class="col-xs-2"></div>
		<div class="col-xs-2">
		<form:form action="${pageContext.request.contextPath}/report2/view" commandName="reportForm" method="post" target="report">
			<button id="report" type="button" class="btn btn-info btn-lg hidden-print" onclick="submit();">中文</button>		
			<form:input type="hidden" path="caseID" value="${caseID}"></form:input>
		</form:form>	
		</div>
		<div class="col-xs-2">
		<button type="button" class="btn btn-success btn-lg hidden-print" onclick="window.close();">Close</button>	
		</div>
		<div class="col-xs-2"></div>
	</div>		
</body>
</html>
