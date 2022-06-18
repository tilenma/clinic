<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>新增方藥</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
</head>
<body>
	<form:form action="./new" commandName="medicineForm" method="post">	
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>新增方藥</h1>
			</div>
			<div class="col-md-4 narrow">	
				<a href="/web" class="btn btn-success btn-md" role="button">回到主目錄</a>	
			</div>
		</div>

	<div class="container-fluid backpink">
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">編號*</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="code"></form:input>
				<form:errors path="code" class="alert-danger"></form:errors>
			</div>
			<div class="col-md-2 narrow">				
				<span class="contentsubtitle">參考份量*</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="number" placeholder="0.00" min="0" value="0" step="0.5" path="referenceUnit"></form:input>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">名稱*</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="name"></form:input>
				<form:errors path="name" class="alert-danger"></form:errors>
			</div>		
			<div class="col-md-2 narrow"><span class="contentsubtitle">類別*</span></div>
			<div class="col-md-4 narrow">	
				<form:select path="type">
					<form:option value="-1">--選擇--</form:option>
					<form:option value="方">方</form:option>
					<form:option value="藥">藥</form:option>						
				</form:select>		
				<form:errors path="type" class="alert-danger"></form:errors>		
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">價目分類*</span></div>
			<div class="col-md-4 narrow">
				<form:select path="priceCategory">
					<form:option value="-1">--選擇--</form:option>
					<form:option value="A">A</form:option>
					<form:option value="B">B</form:option>
					<form:option value="C">C</form:option>
					<form:option value="D">D</form:option>
					<form:option value="E">E</form:option>						
				</form:select>
				<form:errors path="priceCategory" class="alert-danger"></form:errors>		
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">用法用量</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="usage"></form:input>
			</div>
		</div>		
		<br/>		
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">條碼</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="barcode"></form:input>
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">性味</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="taste"></form:input>
			</div>
		</div>		
		<br/>			
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">歸經</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="meridian"></form:input>
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">功效</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="effect"></form:input>
			</div>
		</div>		
		<br/>			
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">禁忌</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="contraint"></form:input>
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">方劑內容(內部)</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="content"></form:input>
			</div>
		</div>		
		<br/>		
		<div class="row">
			<div class="col-md-2 narrow"><span class="contentsubtitle">方劑內容(中文處方)</span></div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="detailCH"></form:input>
			</div>
			<div class="col-md-2 narrow">
				<span class="contentsubtitle">方劑內容(英文處方)</span>
			</div>
			<div class="col-md-4 narrow">
				<form:input type="text" path="detailEN"></form:input>
			</div>
		</div>		
		<br/>
		<div class="text-center">
			<button type="button" class="btn btn-primary btn" onclick="submit();">儲存表格</button>			
		</div>				
	</div>
	
	</form:form>
	
</body>

</html>
