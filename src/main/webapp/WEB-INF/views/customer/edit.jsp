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
		<!-- Modal -->
		<div id="deleteModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">確認清除客戶?</h4>
		      </div>
		      <div class="modal-footer">
		      	<form:form action="./delete" commandName="customerForm" method="post">
		      		<button id="deleteCustomer" type="button" class="btn btn-success btn-default" onclick="submit();">確認</button>
		      		<form:input type="hidden" path="customerID"></form:input>
		      	</form:form>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>							        
		      </div>
		    </div>		
		  </div>
		</div>		
		
	<form:form action="./edit" commandName="customerForm" method="post">	
		<form:input type="hidden" path="customerID"></form:input>
		<form:input type="hidden" path="privacy"></form:input>
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>檢視/更改病人記錄 (客戶編號:${customerForm.customerID})</h1>
			</div>
			<div class="col-md-4 narrow">
				<a href="<spring:url value="/"/>" class="btn btn-success btn-md" role="button">回到主目錄</a>	
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
				<form:input type="text" path="dateOfBirthStr"></form:input>	
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
		
		<br/>
		<div class="row">
			<div class="col-md-3 narrow"></div>
			<div class="col-md-3 narrow">
				<button type="button" class="btn btn-primary btn-lg" onclick="submit();">儲存表格</button>
			</div>
			<div class="col-md-3 narrow">
				<!-- 
				<button type="button" class="btn btn-success btn-lg" onclick="backToSearch();">回到搜尋</button>
				 -->
				 <a type="button" class="btn btn-success btn-lg" href="<spring:url value="/customer"/>">回到搜尋</a>
			</div>
			<div class="col-md-3 narrow">
				<button type="button" class="btn btn-purple btn-lg" data-toggle="modal" data-target="#deleteModal">清除客戶</button>
			</div>			
		</div>						
	</div>
	
	</form:form>
	</script>
</body>

</html>
