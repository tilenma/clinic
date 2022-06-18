<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>病人首次登記</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
</head>
<body>
	<form:form action="create" commandName="customerForm">	
			<div class="row">
			<div class="col-md-8 narrow">
				<h1>病人首次登記</h1>
			</div>
			<div class="col-md-4 narrow">
				<a href="/web" class="btn btn-success btn-md" role="button">回到主目錄</a>	
			</div>
		</div>

	<div class="container-fluid backpurple">
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">姓名*</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="name"></form:input>
				<form:errors path="name" class="alert-danger"></form:errors>
			</div>
			<div class="col-md-2 narrow"><span class="contentsubtitle">English Name</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="nameEN"></form:input>
				<form:errors path="nameEN" class="alert-danger"></form:errors>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">性別</span></div>
			<div class="col-md-4 narrow">
				<form:select path="gender">
					<form:option value="男">男</form:option>
					<form:option value="女">女</form:option>
					<form:option value="其他">其他</form:option>
				</form:select>				
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">藥食敏感</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="allergy"></form:input>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">身份證號碼</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="documentID"></form:input>
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">病史</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="sickHistory"></form:input>
			</div>
		</div>	
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">出生日期</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="dateOfBirthStr" value="01/01/1980"></form:input>	
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">首次就診日期</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="createDateStr"></form:input>
			</div>
		</div>	
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">聯絡電話</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="mobileNumber"></form:input>
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">關係</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="relationship"></form:input>
			</div>
		</div>	
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">婚姻狀況</span></div>
			<div class="col-md-4 narrow">					
				<form:select path="maritalStatus">
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
				<form:input type="text" path="email"></form:input>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">地址</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="address"></form:input>	
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">備註</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="note"></form:input>
			</div>
		</div>		
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">職業</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="occupation"></form:input>		
			</div>
			<div class="col-md-2 narrow">
				
			</div>
			<div class="col-md-4 narrow">
				
			</div>
		</div>
		<div class="text-center">
			<button type="button" class="btn btn-primary btn" onclick="submit();">儲存表格</button>			
		</div>												
	</div>
	
	</form:form>
	
	<script type="text/javascript">	
	initDatePicker("dateOfBirthStr");
	initDatePicker("createDateStr");
	setDefaultToday("createDateStr");
	
	</script>
</body>

</html>
