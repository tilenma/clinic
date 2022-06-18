<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>搜尋方藥</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<script>
$(document).ready(function(){
    $('.openPopup').on('click',function(){
        var dataURL = $(this).attr('data-href');
        $('.modal-body').load(dataURL,function(){
            $('#myModal').modal({show:true});
        });
    }); 
});
</script>
</head>
<body>
	<form:form action="./medicine" commandName="medicineCriteria">
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>搜尋方藥</h1>
			</div>
			<div class="col-md-4 narrow">
				<a href="<spring:url value="/"/>" class="btn btn-success btn-md" role="button">回到主目錄</a>	
			</div>
		</div>

		<div class="container-fluid backpurple">
			<div class="row">
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">名稱</span>
				</div>
				<div class="col-md-3 narrow">
					<form:input type="text" path="name2"></form:input>					
				</div>
				<div class="col-md-2 narrow"></div>
				<div class="col-md-6 narrow">
					<button type="button" class="btn btn-primary btn-md"
						onclick="submit();">&nbsp;&nbsp;&nbsp;過濾&nbsp;&nbsp;&nbsp;</button>
					<form:errors path="name2" class="alert-danger"></form:errors>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">編號</span>					
				</div>
				<div class="col-md-3 narrow">					
					<form:input type="text" path="code2"></form:input>
				</div>
				<div class="col-md-1 narrow">
					<span class="contentsubtitle">類別</span>
				</div>
				<div class="col-md-3 narrow">
				<form:select path="type2">
					<form:option value="-1">--選擇--</form:option>
					<form:option value="方">方</form:option>
					<form:option value="藥">藥</form:option>						
				</form:select>		
				</div>
			</div>
			<br />
		</div>
	</form:form>
	<br />
	
	<div class="container-fluid">
		<span class="contenttitle">共有${medicineTotal}結果</span>
		<table class="table table-bordered">
			
				<thead>
					<tr class="success2">
						<th><div class="contentsubtitle"></div></th>
						<th><div class="contentsubtitle">編號</div></th>
						<th><div class="contentsubtitle">類別</div></th>
						<th><div class="contentsubtitle">名稱</div></th>
						<th><div class="contentsubtitle">價目分類</div></th>						
						<th><div class="contentsubtitle">用法用量</div></th>
						<th><div class="contentsubtitle">條碼</div></th>
						<th><div class="contentsubtitle">性味</div></th>
						<th><div class="contentsubtitle">歸經</div></th>
						<th><div class="contentsubtitle">功效</div></th>
						<th><div class="contentsubtitle">禁忌</div></th>
						<th><div class="contentsubtitle">方劑內容</div></th>
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
						<td><a href="javascript:void(0);" data-href="<c:url value = "/medicine/edit"><c:param name = "code" value = "${med.code}"/></c:url>" class="openPopup">更改</a></td>
						<td>${med.code}</td>
						<td>${med.type}</td>
						<td>${med.name}</td>
						<td>${med.priceCategory}</td>
						<td>${med.usage}</td>
						<td>${med.barcode}</td>
						<td>${med.taste}</td>
						<td>${med.meridian}</td>
						<td>${med.effect}</td>
						<td>${med.contraint}</td>
						<td>${med.content}</td>
					</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
	<!-- Modal -->
	<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">Medicine Detail</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>		
</body>
</html>
