<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>上載病案文件</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />

</head>
<body>
	<form action="doUpload?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data" method="POST" id="attachmentForm">	
		<input type="hidden" id="caseId" value="${caseId}" name="caseId"/>
		
		<div class="row">
			<div class="col-md-8 narrow">
				<h1>上載病案文件</h1>
			</div>
			<div class="col-md-4 narrow">
			</div>
		</div>

		<div class="container-fluid backpurple">
			<div class="row">
				<div class="col-xs-6 col-md-6">
					<table id="medicineTable" class="table table-bordered">
						<thead>
						</thead>
						<tbody>
					        <tr>
					            <td>文件名稱</td>
					            <td><input type="text" id="fileName" name="fileName"></input></td>
					        </tr>
					        <tr>
					            <td>類別</td>
					            <td><select id="fileType" name="fileType">
					            		<option id="jpg" value="image/jpeg">jpg</option>
					            		<option id="txt" value="text/plain">txt</option>
					            		<option id="pdf" value="application/pdf">pdf</option>
					            		<!-- 
					            		<option id="gif" value="image/gif">gif</option>
					            		<option id="doc" value="application/msword">doc</option>
					            		<option id="docx" value="application/vnd.openxmlformats-officedocument.wordprocessingml.document">docx</option>
					            		-->			            		
					            	</select>
					            </td>
					        </tr>
					        <tr>
					            <td>請選擇文件</td>
					            <td><input type="file" id="content" name="content" size="50"></input></td>
					        </tr>					        
					        <tr>
					            <td>
					            <button id="deleteCase" type="button" class="btn btn-lg btn-success btn-default" onclick="upload();">上載</button>
					            </td>
					            
					        </tr>
					    </tbody>
					</table>
				</div>
				<div class="col-xs-6 col-md-6">
				</div>
			</div>
		</div>
	</form>
	
	<script>
	function upload(){
		var fileName = $("#fileName").val();		
		if(fileName == null || fileName.length == 0){
			alert("請輸入文件名稱!");
			return;
		}
		var content = $("#content").val();
		if(content == null || content.length == 0){
			alert("請選擇文件!");
			return;
		}
		$("#attachmentForm").submit();
	}
	
	</script>

</body>
</html>
