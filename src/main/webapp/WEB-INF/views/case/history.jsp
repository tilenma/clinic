<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>客戶病歷: ${customerName}</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
</head>
<script type="text/javascript">
function copyHistoryToParent(id){
	window.opener.copyHistory(id);
	window.opener.showRollbackBtn();
	window.close();
}
function copyMedicineToParent(id){
	var caseId = window.opener.document.getElementById("caseID");
	
	if(caseId == null){
		alert("請先儲存病案!");
	}
	else{
		window.opener.copyMedicine(id);
		window.opener.showRollbackMedicine();
	}	
	window.close();
}
</script>
<body>	
	<div class="row">
			<div class="col-md-8 narrow">
				<h1>客戶病歷: ${customerName}</h1>			
			</div>
			<div class="col-md-4 narrow">
				<button type="button" class="btn btn-success btn" onclick="window.close();">關閉</button>	
			</div>
	</div>
	<div class="container-fluid">
		<span class="contenttitle">共有${caseTotal}病案</span>
		
		<table class="table table-bordered">
				<thead>
					<tr class="success2">
						<th></th>
						<th><div class="contentsubtitle">編號</div></th>
						<th><div class="contentsubtitle">客戶名字</div></th>
						<th><div class="contentsubtitle">主訴</div></th>
						<th><div class="contentsubtitle">診斷病名</div></th>						
						<th><div class="contentsubtitle">到診日期</div></th>
						<th><div class="contentsubtitle">費用</div></th>
						<th><div class="contentsubtitle">汗</div></th>
						<th><div class="contentsubtitle">寒熱</div></th>
						<th><div class="contentsubtitle">頭</div></th>
						<th><div class="contentsubtitle">口</div></th>
						<th><div class="contentsubtitle">身</div></th>
						<th><div class="contentsubtitle">大便</div></th>
						<th><div class="contentsubtitle">小便</div></th>
						<th><div class="contentsubtitle">飲</div></th>
						<th><div class="contentsubtitle">食</div></th>
						<th><div class="contentsubtitle">胸腹</div></th>
						<th><div class="contentsubtitle">聾聽</div></th>
						<th><div class="contentsubtitle">睡眠</div></th>
						<th><div class="contentsubtitle">舌</div></th>
						<th><div class="contentsubtitle">脈</div></th>
						<th><div class="contentsubtitle">皮膚</div></th>
						<th><div class="contentsubtitle">經期</div></th>						
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
						<td><button type="button" class="btn btn-info btn-md" onclick="copyHistoryToParent(${thiscase.caseID});">複製病徵</button>
						<button type="button" class="btn btn-warning btn-md" onclick="copyMedicineToParent(${thiscase.caseID});">複製方劑</button>
						<br/>
						<a href="javascript:loadModal('<c:url value = "/case/view"><c:param name = "id" value = "${thiscase.caseID}"/></c:url>', 'viewModal')" class="openPopup btn-danger btn" role="button" data-target="#updateModal">檢視</a>
						</td>
						<td>${thiscase.caseID}</td>
						<td>${thiscase.customer}</td>
						<td>${thiscase.problem}</td>
						<td>${thiscase.sickness}</td>
						<td>${thiscase.displayDate}</td>
						<td>${thiscase.price}</td>
						<td>${thiscase.sweat}</td>
						<td>${thiscase.coldHot}</td>
						<td>${thiscase.head}</td>
						<td>${thiscase.mouth}</td>
						<td>${thiscase.body}</td>
						<td>${thiscase.poo}</td>
						<td>${thiscase.pee}</td>
						<td>${thiscase.drink}</td>
						<td>${thiscase.eat}</td>
						<td>${thiscase.abdomen}</td>
						<td>${thiscase.hearing}</td>
						<td>${thiscase.sleep}</td>
						<td>${thiscase.tongueStatus}</td>
						<td>${thiscase.pulse}</td>
						<td>${thiscase.skin}</td>
						<td>${thiscase.menstruation}</td>						
					</tr>
					</c:forEach>
				</tbody>					
		</table>		
	</div>	
	<!-- Modal -->
	<div id="viewModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">檢視病案</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>	
		
	<script type="text/javascript">	
	initDatePicker("fromDateStr");
	initDatePicker("toDateStr");	
	</script>	
</body>
</html>

