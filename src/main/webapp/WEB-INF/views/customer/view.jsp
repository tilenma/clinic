<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>病人記錄:${customerForm.name}(${customerForm.customerID}) </title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
</head>
<body>
	<form:form action="./edit" commandName="customerForm" method="post">	
		<form:input type="hidden" path="customerID"></form:input>
		<form:input type="hidden" path="privacy"></form:input>
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>檢視病人記錄 (客戶編號:${customerForm.customerID})</h1>
			</div>
			<div class="col-md-4 narrow">
				<button type="button" class="btn btn-success btn-lg hidden-print" onclick="window.close();">關閉</button>
			</div>
		</div>
		
	<c:if test="${param.update != null}">
	<div class="alert alert-danger">
		<p>病人記錄已更新</p>
	</div>
	</c:if>

	<div class="container-fluid backpink">
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">姓名*</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="name" disabled="true"></form:input>
				<form:errors path="name" class="alert-danger"></form:errors>
			</div>
			<div class="col-md-2 narrow"><span class="contentsubtitle">English Name</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="nameEN" disabled="true"></form:input>
				<form:errors path="nameEN" class="alert-danger"></form:errors>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">性別</span></div>
			<div class="col-md-4 narrow">
				<form:select path="gender" disabled="true">
					<form:option value="男">男</form:option>
					<form:option value="女">女</form:option>
					<form:option value="其他">其他</form:option>
				</form:select>				
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">藥食敏感</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="allergy" disabled="true"></form:input>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">身份證號碼</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="documentID" disabled="true"></form:input>
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">病史</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="sickHistory" disabled="true"></form:input>
			</div>
		</div>	
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">出生日期</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="dateOfBirthStr" disabled="true"></form:input>
				(${customerForm.age})
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">首次就診日期</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="createDateStr" disabled="true"></form:input>
			</div>
		</div>	
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">聯絡電話</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="mobileNumber" disabled="true"></form:input>
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">關係</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="relationship" disabled="true"></form:input>
			</div>
		</div>	
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">婚姻狀況</span></div>
			<div class="col-md-4 narrow">					
				<form:select path="maritalStatus" disabled="true">
					<form:option value="單身">單身</form:option>
					<form:option value="已婚">已婚</form:option>
					<form:option value="離婚">離婚</form:option>
					<form:option value="喪偶">喪偶</form:option>
					<form:option value="其他">其他</form:option>
				</form:select>					
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">電郵</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="email" disabled="true"></form:input>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">地址</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="address" disabled="true"></form:input>	
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">備註</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="note" disabled="true"></form:input>
			</div>
		</div>		
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">職業</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="occupation" disabled="true"></form:input>		
			</div>
			<div class="col-md-2 narrow">
				
			</div>
			<div class="col-md-4 narrow">
				
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-3 narrow"></div>
			<div class="col-md-3 narrow">				
				<a type="button" class="btn btn-primary btn-lg" href="<spring:url value="./edit?id="/>${customerForm.customerID}">更改</a>
			</div>
		</div>								
	</div>
	
	</form:form>	
	
	<script type="text/javascript">	
	initDatePicker("dateOfBirthStr");
	initDatePicker("createDateStr");	
	
	function backToSearch(){
		$("#customerCriteria").submit();
	}
	</script>
</body>

</html>
