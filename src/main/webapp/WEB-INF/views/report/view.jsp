<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>病案藥方(${report.wrappedCaseID})</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/print.css"/>"
	media="screen">
	
</head>
<body>
	<br/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-2 col-md-2 reporttitle">日期：</div>
			<div class="col-xs-2 col-md-2 reportcontent">${report.displayDate}</div>
			<div class="col-xs-2 col-md-2 reporttitle">時間：</div>
			<div class="col-xs-2 col-md-2 reportcontent">${report.wrappedCaseID}</div>
		</div>	
		<div class="row">			
			<div class="col-xs-2 col-md-2 reporttitle">名字：</div>
			<div class="col-xs-2 col-md-2 reportcontent"><b>${report.customerName}</b></div>
		</div>
		<div class="row">			
			<div class="col-xs-2 col-md-2 reporttitle">劑數：</div>
			<div class="col-xs-2 col-md-2 reportcontent"><b>${report.dosage}</b></div>
			<div class="col-xs-2 col-md-2 reporttitle">費用：</div>
			<div class="col-xs-2 col-md-2 reportcontent">${report.price}</div>			
		</div>		
	</div>
	<br/>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-10 col-md-10">
				<table class="table table-bordered">
					<thead>
						<tr class="">
							<th><div class="reporttitle">編號</div></th>							
							<th><div class="reporttitle">方劑</div></th>
							<th><div class="reporttitle">份量 / 類別</div></th>
							<th><div class="reporttitle">備註</div></th>
						</tr>
					</thead>
					<c:forEach items="${medicList}" var="m">
						<tr>
							<td>${m.code}</td>							
							<td>${m.name}</td>
							<td>${m.displayUnit}</td>
							<td>${m.remark}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-2 reporttitle">附註：</div>
			<div class="col-xs-8 reportcontent">${report.dosageRemark }</div>
		</div>
		<div class="row">
			<div class="col-xs-2 reporttitle">服法：</div>
			<div class="col-xs-8 reportcontent">${report.dosageMethod }</div>
		</div>	
		<div class="row">
			<div class="col-xs-2 reporttitle">醫囑：</div>
			<div class="col-xs-8 reportcontent">${report.dosageRecomment }</div>
		</div>			
	</div>
	<div class="row">
		<div class="col-xs-2">
		</div>
		<div class="col-xs-2">
			<button id="print" type="button" class="btn btn-purple btn-lg hidden-print" onclick="window.print();">列印</button>	
		</div>
		<div class="col-xs-2">
			<button type="button" class="btn btn-success btn-lg hidden-print" onclick="window.close();">關閉</button>	
		</div>		
	</div>		
</body>
</html>
