<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>註冊中醫診所</title>
<meta charset="utf-8">
<jsp:include page="./common.jsp" />
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-10 col-md-8 col-lg-8 narrow">
				<h1><img src="<spring:url value="/resources/image/logo.jpg"/>" height="80px">健至(全科)註冊中醫診所 系統主頁</h1>
			</div>
			<div class="col-xs-4 col-md-4 col-lg-4 narrow">
				<c:if test="${isLogin}">
					<span class="contenttitle"> Welcome ${username} ! </span>
					<a href="logout" class="btn btn-success btn-md" role="button">登出</a>
				</c:if>
				<c:if test="${!isLogin}">
					<a href="login" class="btn btn-success btn-md" role="button">登入</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-md-10 col-lg-10 narrow">
			<jsp:include page="./header.jsp" />
		</div>
	</div>	
	<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12 col-md-12 col-lg-12 narrow">
			<table class="table table-bordered backlightblue table-responsive">
				<tbody>
					<tr>
						<th style="min-width:50px">西曆</th>
						<c:forEach items="${weatherTable}" var="date">
							<c:choose>
								<c:when test="${fn:contains(date.date,'分')}">
									<td style="min-width:120px"><a href="https://www.hko.gov.hk/textonly/v2/forecast/chinesewx2.htm" target="_blank">${date.date }</a></td>
								</c:when>
								<c:otherwise>
									<td>${date.date }</td>
								</c:otherwise>							
							</c:choose>
						</c:forEach>						
					</tr>
					<tr>
						<th><a href="http://www.nongli.info/index.php" target="_blank">農曆</a></th>
						<c:forEach items="${weatherTable}" var="date">
							<td>${date.lunarDate }
							<c:if test="${fn:contains(date.date,'分')}">
							<a href="#" data-toggle="tooltip" title="${date.granzhi}"><span class="glyphicon glyphicon-question-sign"></span>							
							</a>
							</c:if>
							</td>
						</c:forEach>
											
					</tr>
					<tr>
						<th><a href="https://www.hko.gov.hk/tc/wxinfo/currwx/fnd.htm" target="_blank">天氣</a></th>												
						<c:forEach items="${weatherTable}" var="date">
							<td><img src="${date.imageUrl}" alt="${date.description }"
								title="${date.description }" height="80px"></td>
						</c:forEach>						 
					</tr>
					<tr>
						<th>温度</th>
						<c:forEach items="${weatherTable}" var="temp">
							<td>${temp.temperature }</td>
						</c:forEach>
					</tr>		
					<tr>
						<th>濕度</th>
						<c:forEach items="${weatherTable}" var="humidity">
							<td>${humidity.humidity }</td>
						</c:forEach>
					</tr>									
				</tbody>
			</table>
		</div>
	</div>
	</div>			    
	<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12 col-md-10 col-lg-10 narrow">
		<table class="table table-bordered backgreen table-responsive">
			<tbody>
				<tr>
					<th style="min-width:100px"><span class="contentsubtitle">客戶管理</span></th>
					<td><a href="./customer/create" class="btn btn-success btn-lg"
						role="button">新增客戶</a></td>
					<td><a href="./customer/latest" class="btn btn-success btn-lg"
						role="button" target="customer">最新客戶</a>
						<a href="./weekOfCustomer" class="btn btn-success btn-lg" role="button">本週客戶</a></td></td>
					<td><a href="./customer" class="btn btn-success btn-lg"
						role="button">搜尋客戶</a>
						<a href="./customer/keyword" class="btn btn-success btn-lg" role="button">關鍵字搜尋</a>
					</td>
				</tr>
				<c:if test="${showAdvanced}">
				<tr>
					<th><span class="contentsubtitle">病案管理</span></th>
					<td><a href="./case/create" class="btn btn-info btn-lg"
						role="button">新增病案</a></td>
					<td><a href="./case/latest" class="btn btn-info btn-lg" role="button">最新病案</a>
					<a href="./weekOfCase" class="btn btn-info btn-lg" role="button">本週病案</a></td>
					<td><a href="./case" class="btn btn-info btn-lg" role="button">搜尋病案</a>
						<a href="./case/medicine" class="btn btn-info btn-lg" role="button">搜尋病案(藥方)</a>
					</td>
				</tr>
				</c:if>
				<tr>
					<th><span class="contentsubtitle">報表管理</span></th>
					<td>
					<a href="./report/checkLatest" class="btn btn-warning btn-lg" role="button" target="report">確認最新病案處方</a>
					<a href="./report/checklist" class="btn btn-warning btn-lg" role="button" target="report">確認病案處方列</a>
					</td>
					<td><a href="./report/report" class="btn btn-warning btn-lg" role="button" target="report">最新病案報表</a>
					<a href="./report/prescription" class="btn btn-warning btn-lg" role="button" target="report">最新客戶報表</a>
					<a href="./report/weekOfReport" class="btn btn-warning btn-lg" role="button" target="report">本週報表</a>
					</td>
					<td><a href="./report/search" class="btn btn-warning btn-lg" role="button" target="report">搜尋報表</a>
					</td>
				</tr>
				<c:if test="${showAdmin}">
				<tr>
					<th><span class="contentsubtitle">方藥管理</span></th>
					<td><a href="./medicine/new" class="btn btn-danger btn-lg" role="button">新增方藥</a></td>
					<td>
					</td>
					<td><a href="./medicine" class="btn btn-danger btn-lg" role="button">搜尋方藥</a>
					</td>
				</tr>				
				</c:if>
			</tbody>
		</table>
		</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-1 col-md-1 col-lg-1 narrow"></div>
		<div class="col-xs-8 col-md-8 col-lg-6 narrow">
			<span class="contentitem">${serverTime}.</span>		
			<input type="hidden" value="${jdbc}" />	
		</div>
	</div>	
	<script>
		$(document).ready(function(){
			$('[data-toggle="tooltip"]').tooltip(); 
		});	
	</script>
</body>
</html>
