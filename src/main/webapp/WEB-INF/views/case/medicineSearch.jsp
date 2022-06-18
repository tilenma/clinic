<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>搜尋病案(藥方)</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />

<script>
	function addMedicineAuto(id) {		
		$('#' + id).autocomplete({
			source : function(request, response) {
				$.ajax({
					dataType : 'json',
					type : 'GET',
					contentType : "application/json; charset=utf-8",
					url : '../medicine/tag',
					data : {
						tagName : $('#' + id).val(),
					},
					success : function(data) {
						response($.map(data, function(item) {
							return {
								label : item.name,
								value : item.name,
								id : item.type,
								code : item.code
							}

						}));
					}
				});
			},
			minLength : 1,
			select : function(event, ui) {
				var type = ui.item.id;
			}
		});
	}
	
	//Set auto complete for all rows
	function initMedicineAuto(){
		var rowCount = $("#medicineTable tr").length-1; //ignore header tr
		
		for(var i=0;i<rowCount;i++){
			addMedicineAuto('medicineNames'+i);
		}			
	}
	
	function addRow(){
		var table = $("#medicineTable");
		var rowCount = $("#medicineTable tr").length-1; //ignore header tr
		
		var tableBody = $("#medicineTable").find("tbody");
		var trFirst = tableBody.find("tr:first");
		var trLast = tableBody.find("tr:last");
		var trNew = trFirst.clone();
		
		trNew.find('span').each(function(){
			$(this).text(rowCount+1);
		});
		
		trNew.find(':text,select,a').each(function(){
			$(this).attr('id','medicineNames'+rowCount);
			$(this).attr('name','medicineNames['+rowCount+"].");			
			$(this).val("");							
		});
		
		trLast.after(trNew);
		
		//Set auto complete
		addMedicineAuto('medicineNames'+rowCount);
	}	
</script>
</head>
<body>
	<form:form action="${pageContext.request.contextPath}/case/medicine" commandName="selectMedicineForm">
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>搜尋病案(藥方)</h1>
			</div>
			<div class="col-md-4 narrow">
				<a href="<spring:url value="/"/>" class="btn btn-success btn-md"
					role="button">回到主目錄</a>
			</div>
		</div>

		<div class="container-fluid backpurple">
			<div class="row">
				<div class="col-xs-6 col-md-6">
					<table id="medicineTable" class="table table-bordered">
						<thead>
							<tr>
								<th class="normal"></th>
								<th class="normal">方藥
								<form:errors path="medicineNames" />
								</th>
							</tr>
						</thead>
						<tr>
							<td><span>1</span></td>
							<td><form:input type="text" class="form-control"
									path="medicineNames[0]"></form:input></td>
						</tr>
						<tr>
							<td><span>2</span></td>
							<td><form:input type="text" class="form-control"
									path="medicineNames[1]"></form:input></td>
						</tr>
						<tr>
							<td><span>3</span></td>
							<td><form:input type="text" class="form-control"
									path="medicineNames[2]"></form:input></td>
						</tr>

					</table>
				</div>
				<div class="col-xs-6 col-md-6">
				<button type="button" class="btn btn-success btn-md" onclick="addRow()">新增方劑</button>
				<br/>
				<br/>
				<br/>
				<br/>
				<button type="button" class="btn btn-primary btn-lg" onclick="submit();">搜尋</button>
				</div>
			</div>
		</div>
	</form:form>
	<br />
	
	<script>
	initMedicineAuto();
	</script>
</body>
</html>
