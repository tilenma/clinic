<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<title>更新病案 (ID: ${caseID} ) </title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<script src="<c:url value="/resources/js/changeConfirm.js" />"></script>
<script src="<c:url value="/resources/js/saveEditCase.js" />"></script>

</head>
<body>
		<!-- Modal -->
		<div id="deleteModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">確認清除病案?</h4>
		      </div>
		      <div class="modal-footer">
		      	<form:form action="./delete" commandName="reportForm" method="post">
		      		<button id="deleteCase" type="button" class="btn btn-success btn-default" onclick="submit();">確認</button>
		      		<form:input type="hidden" id="caseID2" path="caseID"></form:input>
		      	</form:form>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>							        
		      </div>
		    </div>		
		  </div>
		</div>
		<div id="deleteMedicineModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">確認清除所有方劑?</h4>
		      </div>
		      <div class="modal-footer">
	      		<button id="resetMedicine" type="button" class="btn btn-success btn-default" onclick="resetMedicine();$('#deleteMedicineModal').modal('hide');">確認</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>							        
		      </div>
		    </div>		
		  </div>
		</div>		
		<!-- Modal -->
		<div id="attachModal" class="modal fade bd-example-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalTitle">附加文件</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body"></div>
				</div>
			</div>
		</div>	
		
		<!-- Modal -->
		<div id="viewModal" class="modal fade bd-example-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">						
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body"></div>
				</div>
			</div>
		</div>			
		
		<div class="row">
			<div class="col-md-4 narrow">
				<h1>更新病案 (ID: ${caseID} )</h1>				
			</div>
			<div class="col-md-2 narrow">
				<h2>				
				<c:if test="${currentResult.previousId != null || currentResult.nextId != null}">					
				<c:choose>				
					<c:when test="${currentResult.previousId != null}">
						<a href="./edit?id=${currentResult.previousId}" id="previousResult" title="前一個"><span class="glyphicon glyphicon-chevron-left"></span></a>	
					</c:when>
					<c:otherwise>
						<span class="glyphicon glyphicon-chevron-left"></span>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${currentResult.nextId != null}">
						<a href="./edit?id=${currentResult.nextId}" id="previousResult" title="下一個"><span class="glyphicon glyphicon-chevron-right"></span></a>	
					</c:when>
					<c:otherwise>
						<span class="glyphicon glyphicon-chevron-right"></span>
					</c:otherwise>
				</c:choose>
				</c:if>
				</h2>
			</div>		
			<div class="col-md-1 narrow">
				<a href="/web/case/create" class="btn btn-warning btn-md" role="button" target="_blank">新增病案</a>
			</div>						
			<div class="col-md-2 narrow">
				<a href="/web" class="btn btn-success btn-md" role="button">回到主目錄</a>
			</div>
			<div class="col-md-1 narrow">
				<a href="<spring:url value="/access?id="/>${caseID}" target="access" class="btn btn-danger btn-md" role="button">權限</a>
			</div>		
			<div class="col-md-1 narrow">
				<div class="dropdown">
 					 <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
   						報表<span class="caret"></span>
  					</button>
  					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
    					<li>
    						<form:form action="${pageContext.request.contextPath}/report/report" commandName="reportForm" method="post" target="report">
								<button id="report" type="button" class="btn btn-success" onclick="submit();">病案報表</button>								
								<form:input type="hidden" path="caseID" value="${caseID}"></form:input>
							</form:form>
						</li>
    					<li>
							<form:form action="${pageContext.request.contextPath}/report/prescriptionInput" commandName="reportForm" method="post" target="report">
								<button id="report" type="button" class="btn btn-success" onclick="submit();">客戶報表</button>								
								<form:input type="hidden" path="caseID" value="${caseID}"></form:input>
							</form:form>	
    					</li>
    					<li>
							<form:form action="${pageContext.request.contextPath}/report/receiptInput" commandName="reportForm" method="post" target="report">
								<button id="report" type="button" class="btn btn-info" onclick="submit();">到診收據</button>								
								<form:input type="hidden" path="caseID" value="${caseID}"></form:input>
							</form:form>	
    					</li>    					
    					<li>
							<form:form action="${pageContext.request.contextPath}/report/followupInput" commandName="reportForm" method="post" target="report">
								<button id="report" type="button" class="btn btn-info" onclick="submit();">到診紙</button>								
								<form:input type="hidden" path="caseID" value="${caseID}"></form:input>
							</form:form>
    					</li>
    					<li>
							<form:form action="${pageContext.request.contextPath}/report/cert" commandName="reportForm" method="post" target="report">
								<button id="report" type="button" class="btn btn-warning" onclick="submit();">病假證明書</button>								
								<form:input type="hidden" path="caseID" value="${caseID}"></form:input>
							</form:form>	    					
    					</li>
  					</ul>
			   </div>
			</div>
		</div>
		
			<form:form action="${pageContext.request.contextPath}/case/edit" commandName="caseForm">
		<form:input type="hidden" path="caseID"/>
		<form:input type="hidden" path="action"/>
		<div class="container-fluid backorange">
			<div class="row">
				<div class="col-xs-2">
					<form:select path="customerID" class="form-control" onchange="customerSelect();">						
						<form:options items="${customers}" itemValue="customerID" itemLabel="nameWithMobile"/>
					</form:select>
					<form:errors path="customerID" class="alert alert-danger"/>
					<form:input type="hidden" path="customerID"></form:input>
				</div>
				<div class="col-xs-1">
					<button id="viewCustomerLink" type="button" class="btn btn-warning btn-sm" onclick="viewCurrentCustomer(); return false;">客戶</button>	
					<button id="viewSickHistoryLink" type="button" class="btn btn-warning btn-sm" onclick="viewCurrentCustomerHistory(); return false;">病歷</button>	
				
				</div>
				<div class="col-xs-2">
					<label for="date">日期</label>
					<form:input type="text" class="form-control" path="dateStr"
						value="" onchange="setChange();"></form:input>
					<form:errors path="dateStr" class="alert alert-danger"/>
				</div>
				<div class="col-xs-3">
					<label for="problem">主訴</label>
					<form:input type="text" class="form-control backyellow"
						path="problem" onchange="setChange();"></form:input>
					<form:errors path="problem" class="alert alert-danger"/>
				</div>
				<div class="col-xs-4">
					<button id="copyLastHistoryBtn" type="button" class="btn btn-info btn-md" onclick="copyLastHistory();">複製病徵(同病人)</button>			
					<button id="copyLastSameProblemHistoryBtn" type="button" class="btn btn-info btn-md" onclick="copyLastSameProblemHistory();">複製病徵(同病人及主訴)</button>
					<button id="rollbackBtn" type="button" class="btn btn-warning btn-md" onclick="rollbackHistory();" style="display: none;">取消複製病徵</button>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<label for="sweat">汗</label>
					<div>
						<form:input path="sweat" list="sweatList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="sweatList">
							<c:forEach items="${sweatList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<label for="coldHot">寒熱</label>
					<div>
						<form:input path="coldHot" list="coldHotList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="coldHotList">
							<c:forEach items="${coldHotList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<label for="head">頭</label>
					<div>
						<form:input path="head" list="headList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="headList">
							<c:forEach items="${headList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<label for="mouth">口</label>
					<div>
						<form:input path="mouth" list="mouthList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="mouthList">
							<c:forEach items="${mouthList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<div class="input-group">
						<span class="input-group-btn">						
						<input type="text" class="form-control backpink" id="searchName">
						<button type="button" class="btn btn-success2 btn-md" onclick="viewOtherHistory();">搜尋病案(輸入名字)</button>
						</span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<label for="body">身</label>
					<div>
						<form:input path="body" list="bodyList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="bodyList">
							<c:forEach items="${bodyList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<label for="poo">大便</label>
					<div>
						<form:input path="poo" list="pooList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="pooList">
							<c:forEach items="${pooList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<label for="pee">小便</label>
					<div>
						<form:input path="pee" list="peeList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="peeList">
							<c:forEach items="${peeList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<label for="drink">飲</label>
					<div>
						<form:input path="drink" list="drinkList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="drinkList">
							<c:forEach items="${drinkList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<button type="button" class="btn btn-primary btn-lg"
						onclick="saveCase();return false;">儲存病案</button>					
				</div>
				<div class="col-xs-2">
					<button type="button" class="btn btn-purple btn-lg" data-toggle="modal" data-target="#deleteModal">清除病案</button>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<label for="eat">食</label>
					<div>
						<form:input path="eat" list="eatList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="eatList">
							<c:forEach items="${eatList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<label for="abdomen">胸腹</label>
					<div>
						<form:input path="abdomen" list="abdomenList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="abdomenList">
							<c:forEach items="${abdomenList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<label for="hearing">聾聽</label>
					<div>
						<form:input path="hearing" list="hearingList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="hearingList">
							<c:forEach items="${hearingList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<label for="sleep">睡眠</label>
					<div>
						<form:input path="sleep" list="sleepList" class="form-control" onchange="setChange();"></form:input>
						<datalist id="sleepList">
							<c:forEach items="${sleepList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<label for="tongueStatus">舌</label>
					<div>
						<form:input path="tongueStatus" list="tongueStatusList"
							class="form-control" onchange="setChange();"></form:input>
						<datalist id="tongueStatusList">
							<c:forEach items="${tongueStatusList}" var="vo">
								<option value="${vo.description}">${vo.description}</option>
							</c:forEach>
						</datalist>
					</div>
				</div>
				<div class="col-xs-2">
					<button type="button" class="btn btn-success2 btn-lg" onclick="createNewCase();">建立新病案</button>
				</div>				
			</div>

			<div class="row">					
				<div class="col-xs-2">
					<label for="pulse">脈</label>
					<form:input type="text" class="form-control backyellow"
						path="pulse" onchange="setChange();"></form:input>
				</div>
				<div class="col-xs-2">
					<label for="skin">皮膚</label>
					<form:input type="text" class="form-control backyellow"
						path="skin" onchange="setChange();"></form:input>
				</div>
				<div class="col-xs-2">
					<label for="menstruation">經期</label>
					<form:input type="text" class="form-control backyellow"
						path="menstruation" onchange="setChange();"></form:input>
				</div>
				<div class="col-xs-2">
					<label for="sickness">診斷病名</label>
					<form:input type="text" class="form-control backgreen"
						path="sickness" onchange="setChange();"></form:input>
					<button	class="btn btn-warning btn-sm" type="button" onclick="viewSameSickHistory()">檢視病案(同病名)</button>
					<form:errors path="sickness" class="alert alert-danger"/>
				</div>
				<div class="col-xs-2">
					<label for="diagnosis">診斷証型</label>
					<form:input type="text" class="form-control backgreen"
						path="diagnosis" onchange="setChange();"></form:input>
				</div>
				<div class="col-xs-2">
					<label for="theory">治則</label>
					<form:input type="text" class="form-control backgreen"
						path="theory" onchange="setChange();"></form:input>
				</div>					
			</div>				
			
			<div class="row">
				<div class="col-md-8">
					<ul class="nav nav-tabs" style="overflow-y: hidden;">
					  <li class="active"><a data-toggle="tab" href="#medicineTab">處方</a></li>
					  <li><a data-toggle="tab" href="#remarkTab">備註/服法/醫囑</a></li>
					  <li><a data-toggle="tab" href="#additionTab">病案附加資料</a></li>
					  <li><a data-toggle="tab" href="#statisticTab">統計資料</a></li>
					</ul>
					<div class="panel panel-primary" style="overflow-x: hidden;">
					<div class="panel-body" style="overflow-x: hidden;">
					<div class="tab-content">
					
					<div id="medicineTab" class="tab-pane fade in active">
					<div class="row">
						<div class="col-md-6 col-xs-6">							
							<button type="button" class="btn btn-info btn-md" onclick="copyLastMedicine();">複製方劑(同病人)</button>
							<button type="button" class="btn btn-info btn-md" onclick="copyLastSameSicknessHistory()">複製方劑(同病名)</button>
							<button type="button" class="btn btn-info btn-md" onclick="copyLastSameCustomerNSicknessHistory()">複製方劑(同病人及病名)</button>			
						</div>
						<div class="col-md-2 col-xs-2">
							<button type="button" class="btn btn-success2 btn-md" onclick="addRow()">新增方劑</button>
							<button id="rollbackMedicineBtn" type="button" class="btn btn-warning btn-md" onclick="rollbackMedicine();" style="display: none;">取消複製方劑</button>
						</div>
						<div class="col-md-2 col-xs-2">							
							<button type="button" class="btn btn-danger btn-md" data-toggle="modal" data-target="#deleteMedicineModal">清除所有方劑</button>							
						</div>						
						<div class="col-md-2 col-xs-2">
							<label class="checkbox-inline"><form:checkbox path="confirm" onchange="setChange();"></form:checkbox>
							<span class="checkboxfont">方劑已確認</span></label>
							<c:if test="${caseForm.confirm}">
							<span>(${caseForm.confirmUser})</span>
							</c:if>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-12 col-lg-12">
							<table id="medicineTable" class="table table-striped table-bordered" cellspacing="0">
								<thead>
									<tr>
										<th class="normal wide-1"></th>
										<th class="normal wide-1">類別</th>
										<th class="normal wide-2">方藥
										<form:errors path="medicines" class="alert alert-danger"/>
										</th>
										<th class="normal wide-1">數量</th>
										<th class="normal wide-1">單位</th>
										<th class="normal">備註 <a href="#" id="remarktip" data-toggle="tooltip" title="可輸入數字來排序"><span class="glyphicon glyphicon-question-sign"></span></a></th>
									</tr>
								</thead>

								<c:choose>
									<c:when test="${caseForm.medicines.size() >0 }">
										<c:forEach items="${caseForm.medicines}" var="medicine" varStatus="status" >
										<tr>
											<td>												
												<a id="medicines${status.index}.link" href="javascript:loadModal('<c:url value = "/medicine/select"><c:param name = "id" value = "medicines${status.index}"/></c:url>', 'selectModal')" class="openPopup">藥</a>
												<a id="medicines${status.index}.link" href="javascript:loadModal('<c:url value = "/medicine/select2"><c:param name = "id" value = "medicines${status.index}"/></c:url>', 'selectModal')" class="openPopup">方</a>
												<a id="medicines${status.index}.link" href="javascript:loadModal('<c:url value = "/medicine/select3"><c:param name = "id" value = "medicines${status.index}"/></c:url>', 'selectModal')" class="openPopup">針</a>
												<a id="medicines${status.index}.delete" type="button" class="btn btn-danger btn-xs" onclick="deleteRow(${status.index});">清除</a>
											</td>
											<td>
												<form:select class="form-control"
													path="medicines[${status.index}].type" onchange="setChange();">
													<c:forEach items="${medicineTypeList}" var="type">
														<form:option value="${type}">${type}</form:option>												
													</c:forEach>
												</form:select>
											</td>
											<td>
												 <div class="row">
												 	<div class="col-xs-10">
														<form:input type="text" class="form-control" path="medicines[${status.index}].name" onchange="setChange();" 
														onfocusout="updateMedicineAfterType(${status.index});" cssErrorClass="form-control alert alert-danger"></form:input>
														<!-- 
														<form:errors path="medicines[${status.index}].name" class="alert-danger"></form:errors>
														-->
													</div>
													<div class="col-xs-2">
														<a href="#" id="medicines${status.index}.tip" data-toggle="tooltip" title="" style="display:none"><span class="glyphicon glyphicon-question-sign"></span></a>
													</div>
												</div>
											</td>
											<td>											
												<form:input type="number" min="0.00" max="100.00" step="0.5" list="unitList" class="form-control"
												    path="medicines[${status.index}].unit" onchange="setChange();checkOverDosage(${status.index});"></form:input>
												<datalist id="unitList">
													<c:forEach items="${unitList}" var="unit">
														<c:choose>
														<c:when test="${medicine.displayUnit eq unit}">
															<option value="${unit}" selected="selected">${unit}</option>
														</c:when>
														<c:otherwise>													
															<option value="${unit}">${unit}</option>
														</c:otherwise>
														</c:choose>												
													</c:forEach>
												</datalist>													
												<input id="medicines${status.index}.referenceUnit" type="hidden" value=""></input>
											</td>
											<td>
												<form:select type="text" class="form-control" path="medicines[${status.index}].unit2" onchange="setChange();">
													<form:option value="g">g</form:option>
													<form:option value="次數">次數</form:option>
													<form:option value="寸">寸</form:option>
													<form:option value=" "> </form:option>
												</form:select>
											</td>
											<td>
											<form:input type="text" class="form-control" path="medicines[${status.index}].remark"></form:input>
											</td>
										</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td>
												<a id="medicines0.link" href="javascript:loadModal('<c:url value = "/medicine/select"><c:param name = "id" value = "medicines0"/></c:url>', 'selectModal')" class="openPopup">藥</a>
												<a id="medicines02.link" href="javascript:loadModal('<c:url value = "/medicine/select2"><c:param name = "id" value = "medicines0"/></c:url>', 'selectModal')" class="openPopup">方</a>
												<a id="medicines03.link" href="javascript:loadModal('<c:url value = "/medicine/select3"><c:param name = "id" value = "medicines0"/></c:url>', 'selectModal')" class="openPopup">針</a>																					
											</td>										
											<td><form:select class="form-control"
													path="medicines[0].type" onchange="setChange();">
													<c:forEach items="${medicineTypeList}" var="type">
														<form:option value="${type}">${type}</form:option>												
													</c:forEach>
												</form:select></td>
											<td>
											<form:input type="text" class="form-control" path="medicines[0].name" onchange="setChange();" onfocusout="updateMedicineAfterType(0);"></form:input>
											<a href="#" id="medicines0.tip" data-toggle="tooltip" title="" style="display:none"><span class="glyphicon glyphicon-question-sign"></span></a>
											</td>
											<td>			
													
											<form:input type="number" min="0" max="100" step="0.5" list="unitList" class="form-control"
													path="medicines[0].unit" onchange="setChange();checkOverDosage(0);"></form:input>
													<datalist id="unitList">
													<c:forEach items="${unitList}" var="unit">
														<c:choose>
														<c:when test="${medicine.displayUnit eq unit}">
															<option value="${unit}" selected="selected">${unit}</option>
														</c:when>
														<c:otherwise>													
															<option value="${unit}">${unit}</option>
														</c:otherwise>
														</c:choose>												
													</c:forEach>	
													</datalist>

												<input id="medicines0.referenceUnit" type="hidden" value=""></input> 
												
											</td>
											<td>
												<form:select type="text" class="form-control" path="medicines[0].unit2" onchange="setChange();">
													<form:option value="g">g</form:option>
													<form:option value="次數">次數</form:option>
													<form:option value="寸">寸</form:option>
													<form:option value=" "> </form:option>													
												</form:select>
											</td>											
											<td>
											<form:input type="text" class="form-control" path="medicines[0].remark" onchange="setChange();"></form:input>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>					
					</div><!-- medicineTab -->
					
					<div id="remarkTab" class="tab-pane fade" style="overflow-x: hidden;">
							<div class="row">
								<div class="col-xs-8">
									<label for="dosageRemark">處方附註</label> 
    								<form:input type="text"	class="form-control backgreen" path="dosageRemark" onchange="setChange();"></form:input>
    							</div>
    						</div>	
							<div class="row">
								<div class="col-xs-6">
									<label for="dosageMethod">服法</label> <form:input type="text"
										class="form-control backgreen" path="dosageMethod" onchange="setChange();"></form:input>
								</div>					
								<div class="col-xs-6">
									<label for="dosageRecomment">醫囑</label> <form:input type="text"
										class="form-control backgreen" path="dosageRecomment" onchange="setChange();"></form:input>
								</div>							
							</div>   
  							<div class="row"> 							
								<div class="col-xs-6">
									<label for="reportRemark">客戶報表備註</label> 
									<form:input type="text"	class="form-control backpink" path="reportRemark" onchange="setChange();"></form:input>
								</div>
								<div class="col-xs-6">
									<label for="receiptRemark">收據備註</label> 
									<form:input type="text"	class="form-control backpink" path="receiptRemark" onchange="setChange();"></form:input>
								</div> 								
							</div>   
  						  	<div class="row">
  						  		<div class="col-xs-6">
									<label for="followupRemark">到診備註</label> 
						    		<form:input type="text"	class="form-control backpink" path="followupRemark" onchange="setChange();"></form:input>
						    	</div>
  								<div class="col-xs-6">
									<label for="certRemark">病假備註</label> 
						    		<form:input type="text"	class="form-control backpink" path="certRemark" onchange="setChange();"></form:input>						    		
						    	</div>						    	
						    </div>						    					    													
  					</div> <!-- remarkTab -->
  						
					<div id="additionTab" class="tab-pane fade" style="overflow-x: hidden;">  
							<div class="row">		
								<div class="col-xs-6">			
								<label for="病案附加資料">病案附加資料</label>
								</div>
								<div class="col-xs-3">
									<c:if test="${hasAttachment}">
									<a href="javascript:void(0);" data-href="<c:url value = "./viewAttach"><c:param name = "id" value = "${caseID}"/></c:url>" class="openPopup2">檢視文件</a>
									</c:if>		
								</div>
								<div class="col-xs-3">
							
									<a href="javascript:void(0);" data-href="<c:url value = "./attach"><c:param name = "id" value = "${caseID}"/></c:url>" class="openPopup">附加文件</a>
								</div>
							</div>
							<div class="nav">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th class="normal col-xs-3">類別</th>
											<th class="normal">描述</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${caseForm.remarks}" var="remark" varStatus="status" >
										<tr>
											<td><form:input type="text" class="form-control" path="remarks[${status.index}].type"></form:input></td>
											<td><form:input type="text" class="form-control" path="remarks[${status.index}].description"></form:input></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
  					</div><!-- additionTab -->
  					
  					<div id="statisticTab" class="tab-pane fade" style="overflow-x: hidden;">  
							<div class="nav">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th class="normal col-xs-3">類別</th>
											<th class="normal col-xs-3">重新開始</th>
											<th class="normal col-xs-6">效果分數 (-10 to 10)</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${caseForm.statistics}" var="stat" varStatus="status" >
										<tr>
											<td><form:input type="text" class="form-control" path="statistics[${status.index}].type" onchange="setChange();"></form:input></td>
											<form:input type="hidden" path="statistics[${status.index}].caseRemarkKey.caseID" value="${caseID}"></form:input>
											<td>												
												<form:checkbox path="statistics[${status.index}].reset" onchange="onchangeReset(${status.index});"></form:checkbox>	
												<button	class="btn btn-warning btn-sm" type="button" onclick="showEffect(${status.index});">檢視統計</button>									
											</td>
											<td>												
												<form:input type="range" class="custom-range" path="statistics[${status.index}].effect"
												min="-10" max="10" list="rangemarks" onchange="setChange();"></form:input>
												<datalist id="rangemarks">
													<option value="-10" label="-10">
													<option value="-5">
													<option value="0" label="0">
													<option value="5">
													<option value="10" label="10">
												</datalist>																
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
					</div>
					
					</div><!-- tab-content -->
					</div><!-- panel-body -->
					</div><!-- panel -->
				</div>
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-4 col-xs-4">
							<label for="priceSystem">價目系統</label>
						</div>		
						<div class="col-md-6 col-xs-6">
							<form:select class="form-control" path="priceSystem" onchange="setChange();">
							<c:forEach items="${systemList}" var="vo">
								<option value="${vo.name}">${vo.name}</option>
							</c:forEach>							
							</form:select>
						</div>					
					</div>
					<div class="row">							
						<div class="col-md-4 col-xs-4">
							<label for="dosage">劑數</label>
						</div>
						<div class="col-md-4 col-xs-4">
							<form:select class="form-control" path="dosage" onchange="setChange();">
								<form:option value="0">0</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
								<form:option value="4">4</form:option>
								<form:option value="5">5</form:option>
								<form:option value="6">6</form:option>
								<form:option value="7">7</form:option>
								<form:option value="8">8</form:option>
								<form:option value="9">9</form:option>
								<form:option value="10">10</form:option>
								<form:option value="11">11</form:option>
								<form:option value="12">12</form:option>
								<form:option value="13">13</form:option>
								<form:option value="14">14</form:option>
								<form:option value="15">15</form:option>
								<form:option value="16">16</form:option>
								<form:option value="17">17</form:option>
								<form:option value="18">18</form:option>
								<form:option value="19">19</form:option>
								<form:option value="20">20</form:option>
								<form:option value="21">21</form:option>
								<form:option value="22">22</form:option>
								<form:option value="23">23</form:option>
								<form:option value="24">24</form:option>
								<form:option value="25">25</form:option>
								<form:option value="26">26</form:option>
								<form:option value="27">27</form:option>
								<form:option value="28">28</form:option>
								<form:option value="29">29</form:option>
								<form:option value="30">30</form:option>
							</form:select>
						</div>
						<div class="col-md-3 col-xs-3">
							<label class="checkbox-inline"><form:checkbox path="consultationFee" onchange="setChange();"></form:checkbox><span
								class="checkboxfont">診金</span></label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-xs-4">
							<label for="dosePrice">每劑收費</label>
							<form:input type="text" class="form-control" path="dosePrice" onchange="setChange();"></form:input>
						</div>
						<div class="col-md-6 col-xs-6">
							<label for="price">費用</label>				
							<button type="button" class="btn btn-success2 btn-md" onclick="calculate();">計算</button>			
							<form:input type="text" class="form-control" path="price" onchange="setChange();"></form:input>
							
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<label for="expirydate">有效日期</label>
							<form:input type="text" class="form-control" path="expiryDateStr" onchange="setChange();"></form:input>
						</div>
						<div class="col-xs-6">
							<label for="redispense">重配次數</label>
							<form:select class="form-control" path="redispense" onchange="setChange();">
								<form:option value="0" selected="true">0</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
								<form:option value="4">4</form:option>
								<form:option value="5">5</form:option>
								<form:option value="6">6</form:option>
								<form:option value="7">7</form:option>
								<form:option value="8">8</form:option>
								<form:option value="9">9</form:option>
								<form:option value="10">10</form:option>
								<form:option value="11">11</form:option>
								<form:option value="12">12</form:option>
								<form:option value="13">13</form:option>
								<form:option value="14">14</form:option>
								<form:option value="15">15</form:option>
								<form:option value="16">16</form:option>
								<form:option value="17">17</form:option>
								<form:option value="18">18</form:option>
								<form:option value="19">19</form:option>
								<form:option value="20">20</form:option>
								<form:option value="21">21</form:option>
								<form:option value="22">22</form:option>
								<form:option value="23">23</form:option>
								<form:option value="24">24</form:option>
								<form:option value="25">25</form:option>
								<form:option value="26">26</form:option>
								<form:option value="27">27</form:option>
								<form:option value="28">28</form:option>
								<form:option value="29">29</form:option>
								<form:option value="30">30</form:option>
							</form:select>
						</div>
					</div>
				</div>
			</div>
		</div>

	</form:form>

	<!-- Modal -->
	<div id="selectModal" class="modal fade bd-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">選擇方藥</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>	
	
	<script>
		function loadModal(dataURL, modal){
			$('#'+modal+' .modal-body').load(dataURL,function(){
				$('#'+modal).modal({show:true});
			});
		}
		
		function closeModal(){			
			$('#selectModal').modal('hide');
		}
	
		var id = $("#customerID").val();		
		if(id != null && id.length > 0){
			$("#viewCustomerLink").attr("href","../customer/view?id=" + id);
			$("#viewSickHistoryLink").attr("href","./history?customerID=" + id);			
			$("#customerName").addClass("backgreen");			
		}
		else{			
			$("#viewCustomerLink").attr("disabled", true);
			$("#viewSickHistoryLink").attr("disabled", true);
		}		
		
		initMedicineAuto();
				
		$(document).ready(function(){
		    $('.openPopup').on('click',function(){
		        var dataURL = $(this).attr('data-href');
		        $('.modal-body').load(dataURL,function(){
		            $('#attachModal').modal({show:true});
		        });
		    }); 
		    $('.openPopup2').on('click',function(){
		        var dataURL = $(this).attr('data-href');
		        $('.modal-body').load(dataURL,function(){
		            $('#viewModal').modal({show:true});
		        });
		    });
		});
		
		function showEffect(rowNo){
			var id= "#statistics"+rowNo+"\\.type";
			var type = $(id).val();

			if(type == null || type.trim().length == 0){
				alert("請先輸入類別!");				
			}
			else{
				var custId = $("#customerID").val();
				var url = "<c:url value = '/stat/effect'></c:url>"+"?custId="+custId+"&type="+type;
				var win = window.open(url,"stat");		        
			}
		}
		
	</script>
</body>
</html>