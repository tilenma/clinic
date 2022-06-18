<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>病案權限  (ID: ${caseID} )</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />

</head>
<body>
	<form:form action="${pageContext.request.contextPath}/access" commandName="caseAccessRightForm">
		<form:input type="hidden" id="caseID" path="caseID"></form:input>
		<form:input type="hidden" id="newUser" path="newUser"></form:input>
		<form:input type="hidden" id="accessRightType" path="accessRightType"></form:input>  
		
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>更改病案權限 (ID: ${caseID} )</h1>
			</div>
			<div class="col-md-4 narrow">
				<button type="button" class="btn btn-success btn-lg hidden-print" onclick="window.close();">關閉</button>	
			</div>
		</div>

		<div class="container-fluid backpurple">
			<div class="row">
				<div class="col-md-4 narrow">
					<h3>搜尋權限</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2 narrow">
					<label class="checkbox-inline"><form:checkbox
							id="searchRightAllBox" path="searchRightAll" onchange="uncheckSearchRightAll();"></form:checkbox><span class="checkboxfont">所有用戶</span></label>
				</div>
				<div class="col-md-2 narrow">					
					<c:choose>
					<c:when test="${caseAccessRightForm.searchRightAll}">
						<button id="addAllToSearchBtn" type="button" class="btn btn-success2 btn-md" onclick="addAllToSearch();" disabled>所有用戶</button>
					</c:when>
					<c:otherwise>
					<button id="addAllToSearchBtn" type="button" class="btn btn-success2 btn-md" onclick="addAllToSearch();">所有用戶</button>
					</c:otherwise>
					</c:choose>
				</div>					
				<div class="col-md-3 narrow">
					<div class="input-group">
						<span class="input-group-btn"> <select id="inputSearchUser"
							class="form-control">
								<c:forEach items="${userList}" var="user">
									<option value="${user}">${user}</option>
								</c:forEach>
						</select>
							<c:choose>
							<c:when test="${caseAccessRightForm.searchRightAll}">
							<button id="addUserToSearchBtn" type="button" class="btn btn-success2 btn-md" onclick="addUserToSearch();" disabled>輸入用戶</button>
							</c:when>
							<c:otherwise>
							<button id="addUserToSearchBtn" type="button" class="btn btn-success2 btn-md" onclick="addUserToSearch();">輸入用戶</button>
							</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
			
			</div>
			<div class="row">
				<div class="col-md-6 narrow">
					<table class="table table-bordered" id="searchRightTable">
						<thead>
							<tr class="success2">
								<th><div class="contentsubtitle">用戶</div></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user"
								items="${caseAccessRightForm.searchRightList}"
								varStatus="status">
								<c:if test="${status.index%2==0 }">
									<tr class="warning">
								</c:if>
								<c:if test="${status.index%2==1 }">
									<tr class=warning2>
								</c:if>
								<td>
									<form:input path="searchRightList[${status.index}]" id="${user}" value="${user}" readonly="true"/>
								</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="container-fluid backgreen">
			<div class="row">
				<div class="col-md-4 narrow">
					<h3>檢視權限</h3>
				</div>
				<div class="col-md-4 narrow"></div>
			</div>
			<div class="row">
				<div class="col-md-2 narrow">
					<label class="checkbox-inline"><form:checkbox
							id="viewRightAllBox" path="viewRightAll" onchange="uncheckViewRightAll();"></form:checkbox><span class="checkboxfont">所有用戶</span></label>
				</div>
				<div class="col-md-2 narrow">					
					<c:choose>
					<c:when test="${caseAccessRightForm.viewRightAll}">
						<button id="addAllToViewBtn" type="button" class="btn btn-success2 btn-md" onclick="addAllToView();" disabled>所有用戶</button>
					</c:when>
					<c:otherwise>
					<button id="addAllToViewBtn" type="button" class="btn btn-success2 btn-md" onclick="addAllToView();">所有用戶</button>
					</c:otherwise>
					</c:choose>
				</div>					
				<div class="col-md-3 narrow">
					<div class="input-group">
						<span class="input-group-btn"> <select id="inputViewUser"
							class="form-control">
								<c:forEach items="${userList}" var="user">
									<option value="${user}">${user}</option>
								</c:forEach>
						</select>
							<c:choose>
							<c:when test="${caseAccessRightForm.viewRightAll}">
							<button id="addUserToViewBtn" type="button" class="btn btn-success2 btn-md" onclick="addUserToView();" disabled>輸入用戶</button>
							</c:when>
							<c:otherwise>
							<button id="addUserToViewBtn" type="button" class="btn btn-success2 btn-md" onclick="addUserToView();">輸入用戶</button>
							</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
			
			</div>
			<div class="row">
				<div class="col-md-6 narrow">
					<table class="table table-bordered" id="viewRightTable">
						<thead>
							<tr class="success2">
								<th><div class="contentsubtitle">用戶</div></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user"
								items="${caseAccessRightForm.viewRightList}"
								varStatus="status">
								<c:if test="${status.index%2==0 }">
									<tr class="warning">
								</c:if>
								<c:if test="${status.index%2==1 }">
									<tr class=warning2>
								</c:if>
								<td>
									<form:input path="viewRightList[${status.index}]" id="${user}" value="${user}" readonly="true"/>
								</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>	
		</div>

		<div class="container-fluid backorange">
			<div class="row">
				<div class="col-md-4 narrow">
					<h3>修改權限</h3>
				</div>
				<div class="col-md-4 narrow"></div>
			</div>
			<div class="row">
				<div class="col-md-2 narrow">
					<label class="checkbox-inline"><form:checkbox
							id="editRightAllBox" path="editRightAll" onchange="uncheckEditRightAll();"></form:checkbox><span class="checkboxfont">所有用戶</span></label>
				</div>
				<div class="col-md-2 narrow">					
					<c:choose>
					<c:when test="${caseAccessRightForm.editRightAll}">
						<button id="addAllToEditBtn" type="button" class="btn btn-success2 btn-md" onclick="addAllToEdit();" disabled>所有用戶</button>
					</c:when>
					<c:otherwise>
					<button id="addAllToEditBtn" type="button" class="btn btn-success2 btn-md" onclick="addAllToEdit();">所有用戶</button>
					</c:otherwise>
					</c:choose>
				</div>					
				<div class="col-md-3 narrow">
					<div class="input-group">
						<span class="input-group-btn"> <select id="inputEditUser"
							class="form-control">
								<c:forEach items="${userList}" var="user">
									<option value="${user}">${user}</option>
								</c:forEach>
						</select>
							<c:choose>
							<c:when test="${caseAccessRightForm.editRightAll}">
							<button id="addUserToEditBtn" type="button" class="btn btn-success2 btn-md" onclick="addUserToEdit();" disabled>輸入用戶</button>
							</c:when>
							<c:otherwise>
							<button id="addUserToEditBtn" type="button" class="btn btn-success2 btn-md" onclick="addUserToEdit();">輸入用戶</button>
							</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
			
			</div>
			<div class="row">
				<div class="col-md-6 narrow">
					<table class="table table-bordered" id="editRightTable">
						<thead>
							<tr class="success2">
								<th><div class="contentsubtitle">用戶</div></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user"
								items="${caseAccessRightForm.editRightList}"
								varStatus="status">
								<c:if test="${status.index%2==0 }">
									<tr class="warning">
								</c:if>
								<c:if test="${status.index%2==1 }">
									<tr class=warning2>
								</c:if>
								<td>
									<form:input path="editRightList[${status.index}]" id="${user}" value="${user}" readonly="true"/>
								</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>	
		</div>
	</form:form>
	<script type="text/javascript">
		function addUserToSearch(){			
			var user = $("#inputSearchUser").val();
			if(user !=null && user.length > 0){
				$("#newUser").val(user);
				$("#accessRightType").val("search");
				
				console.log("set user="+user+" and right type=search");
				
				$("#caseAccessRightForm").submit();
			}
		}
		
		function addAllToSearch(){			
			$("#newUser").val("ALL");
			$("#accessRightType").val("search");
				
			console.log("set user=ALL and right type=search");
				
			$("#caseAccessRightForm").submit();
		}
		
		function uncheckSearchRightAll(){
			$("#addAllToSearchBtn").prop("disabled",false);
			$("#addUserToSearchBtn").prop("disabled",false);
			$("#searchRightAllBox").prop("disabled",true);
		}
		
		function addUserToView(){			
			var user = $("#inputViewUser").val();
			if(user !=null && user.length > 0){
				$("#newUser").val(user);
				$("#accessRightType").val("view");
				
				console.log("set user="+user+" and right type=view");
				
				$("#caseAccessRightForm").submit();
			}
		}
		
		function addAllToView(){			
			$("#newUser").val("ALL");
			$("#accessRightType").val("view");
				
			console.log("set user=ALL and right type=view");
				
			$("#caseAccessRightForm").submit();
		}
		
		function uncheckViewRightAll(){
			$("#addAllToViewBtn").prop("disabled",false);
			$("#addUserToViewBtn").prop("disabled",false);
			$("#viewRightAllBox").prop("disabled",true);
		}
		
		function addUserToEdit(){			
			var user = $("#inputEditUser").val();
			if(user !=null && user.length > 0){
				$("#newUser").val(user);
				$("#accessRightType").val("edit");
				
				console.log("set user="+user+" and right type=edit");
				
				$("#caseAccessRightForm").submit();
			}
		}
		
		function addAllToEdit(){			
			$("#newUser").val("ALL");
			$("#accessRightType").val("edit");
				
			console.log("set user=ALL and right type=edit");
				
			$("#caseAccessRightForm").submit();
		}
		
		function uncheckEditRightAll(){
			$("#addAllToEditBtn").prop("disabled",false);
			$("#addUserToEditBtn").prop("disabled",false);
			$("#editRightAllBox").prop("disabled",true);
		}
	</script>	
</body>
</html>
