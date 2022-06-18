<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>病徵選擇</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
</head>
<body>
	<form:form action="./selectSymptom" commandName="selectSymptomForm">
		<form:input type="hidden" path="nextType"></form:input>
		<form:input type="hidden" path="nextLevel"></form:input>
		<form:input type="hidden" path="previousType"></form:input>
		<form:input type="hidden" path="previousLevel"></form:input>
		
		<div class="row">
			<div class="col-xs-8 col-md-8 narrow">
				<h1>病徵選擇</h1>
			</div>
			<div class="col-xs-4 col-md-4 narrow"></div>
		</div>

		<div class="container-fluid backpurple">
			<div class="row">
				<div class="col-xs-2 col-md-1 narrow">
					<span class="contentsubtitle">項目</span>
				</div>
				<div class="col-xs-2 col-md-2 narrow">
					<form:input type="text" path="currentType" readonly="true" class="form-control input-sm"></form:input>
				</div>
				<div class="col-xs-2 col-md-1 narrow">
					<span class="contentsubtitle">層數</span>
				</div>
				<div class="col-xs-2 col-md-2 narrow">
					<form:input type="text" path="currentLevel" readonly="true" class="form-control input-sm"></form:input>
				</div>
				<div class="col-xs-1 col-md-1 narrow">
					<c:if test="${selectSymptomForm.previousType !=null}">
						<button id="${selectSymptomForm.previousType}${selectSymptomForm.previousLevel}Btn" type="button" class="btn btn-warning btn-md" onclick="next('${selectSymptomForm.previousType}',${selectSymptomForm.previousLevel})">上一層</button>	
					</c:if>					
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6 col-md-6 narrow">
					<table class="table table-bordered" id="searchRightTable">
						<tbody>
							<c:forEach var="sym" items="${symptoms}" varStatus="status">
								<c:if test="${status.index%2==0 }">
									<tr class="warning">
								</c:if>
								<c:if test="${status.index%2==1 }">
									<tr class=warning2>
								</c:if>
								<td><input id="${sym.type}${sym.level}"
									value="${sym.description}" readonly="true" />
								</td>
								<td>
									<button id="${sym.type}${sym.level}Btn" type="button" class="btn btn-success2 btn-md" onclick="select('${sym.description}')">確定</button>
									<c:if test="${sym.nextLevel }">
									<button id="${sym.type}${sym.level}Btn" type="button" class="btn btn-info btn-md" onclick="next('${sym.description}',${sym.level+1})">下一層</button>	
									</c:if>								
								</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</form:form>
	<br />
	<script type="text/javascript">
		function select(desc){
			//alert(desc);
			//set value to parent and close
			setParentSymptom(desc);
		}
		function next(type,level){
			//alert(type+level);			
			$("#nextType").val(type);
			$("#nextLevel").val(level);
				
			console.log("set nextType="+type+" and level="+level);
				
			$("#selectSymptomForm").submit();
		}
		
		function setParentSymptom(desc){
			var field = window.opener.field;
			
			var parentItem = $("#"+field, window.opener.document);
			parentItem.val(desc);
			
			window.close();
		}
	</script>
</body>
</html>
