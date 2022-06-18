<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<title>新增病案</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />
<script src="<c:url value="/resources/js/changeConfirm.js" />"></script>
<script src="<c:url value="/resources/js/saveEditCase.js" />"></script>
</head>

<body>
	<form:form action="./create" commandName="caseForm">
		<div class="row">
			<div class="col-md-4 narrow">
				<h1>新增病案</h1>
			</div>
			<div class="col-md-4 narrow">
				<a href="/web/case/create" class="btn btn-warning btn-md" role="button" target="_blank">新增病案</a>
			</div>			
			<div class="col-md-4 narrow">
				<a href="/web" class="btn btn-success btn-md" role="button">回到主目錄</a>
			</div>
		</div>
		<div class="container-fluid backorange">
			<div class="row">
				<div class="col-md-2 col-xs-2">
 
					<div class="row">
						<div class="col-md-6 col-xs-6">
							<label for="customerName">客戶名字</label>
						</div>
						<div class="col-md-6 col-xs-6">	
							<input type="text" class="form-control input-sm" id="customerName"/>
						</div>
					</div>

					<form:select path="customerID" class="form-control" onchange="customerSelect();">
						<option value="">--請選擇--</option>
						<form:options items="${customers}" itemValue="customerID" itemLabel="nameWithMobile"/>
					</form:select>					
					<form:errors path="customerID" class="alert alert-danger"/>
				</div>
				<div class="col-xs-1">				
					<button id="viewCustomerLink" type="button" class="btn btn-warning btn-sm" onclick="return false;">客戶</button>	
					<button id="viewSickHistoryLink" type="button" class="btn btn-warning btn-sm" onclick="return false;">病歷</button>	
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
					<button type="button" class="btn btn-info btn-md" onclick="copyLastHistory();">複製病徵(同病人)</button>			
					<button type="button" class="btn btn-info btn-md" onclick="copyLastSameProblemHistory();">複製病徵(同病人及主訴)</button>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<label for="sweat">汗</label>
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('sweat','汗',1);" >...</button>		
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('coldHot','寒熱',1);">...</button>
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('head','頭',1);">...</button>
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('mouth','口',1);">...</button>
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('body','身',1);">...</button>
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('poo','大便',1);">...</button>
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('pee','小便',1);">...</button>
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('drink','飲食',1);">...</button>
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
					<button type="button" class="btn btn-primary btn-lg" onclick="saveCase();return false;">儲存病案</button>
				</div>
				<div class="col-xs-2">
					<button type="button" class="btn btn-purple btn-lg" disabled>清除病案</button>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-2">
					<label for="eat">食</label>
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('eat','飲食',1);">...</button>
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('abdomen','胸腹',1);">...</button>
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('hearing','耳目',1);">...</button>
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('sleep','睡眠',1);">...</button>
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
					<button type="button" class="btn btn-warning btn-xs" onclick="openSelectSymptiom('tongueStatus','舌',1);">...</button>
					<div>
					<form:input path="tongueStatus" list="tongueStatusList" class="form-control" onchange="setChange();"></form:input>
					<datalist id="tongueStatusList">
						<c:forEach items="${tongueStatusList}" var="vo">
							<option value="${vo.description}">${vo.description}</option>
						</c:forEach>
					</datalist>
					</div>									
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
					  <li class="disabled disabledTab"><a data-toggle="tab" href="#medicineTab">處方</a></li>
					  <li class="active"><a data-toggle="tab" href="#remarkTab">備註/服法/醫囑</a></li>					  
					  <li class="disabled disabledTab"><a data-toggle="tab" href="#additionTab">病案附加資料</a></li>

					</ul>
					<div class="panel panel-primary" style="overflow-x: hidden;">
					<div class="panel-body" style="overflow-x: hidden;">
					<div class="tab-content">
						<div id="remarkTab" class="tab-pane in active" style="overflow-x: hidden;">
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
					</div><!-- tab-content -->
					</div><!-- panel-body -->
					</div><!-- panel -->
				</div>
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-2 col-xs-2">
							<label for="priceSystem">價目系統</label>
						</div>		
						<div class="col-md-3 col-xs-4">
							<form:select class="form-control" path="priceSystem" onchange="setChange();">
							<c:forEach items="${systemList}" var="vo">
								<option value="${vo.name}">${vo.name}</option>
							</c:forEach>							
							</form:select>
						</div>									
						<div class="col-md-2 col-xs-2">
							<label for="dosage">劑數</label>
						</div>
						<div class="col-md-2 col-xs-3">
							<form:select class="form-control" path="dosage" onchange="setChange();">
								<form:option value="0">0</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2" selected="true">2</form:option>
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
						<div class="col-xs-3">
							<label class="checkbox-inline"><form:checkbox 
								checked="true" path="consultationFee" onchange="setChange();"></form:checkbox><span class="checkboxfont">診金</span></label>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<label for="dosePrice">每劑收費</label>
							<form:input type="text" class="form-control" path="dosePrice" onchange="setChange();"></form:input>
						</div>
						<div class="col-xs-6">
							<label for="price">費用</label>
							<button type="button" class="btn btn-success2 btn-md" onclick="calculate();" disabled>計算</button>
							<form:input type="text" class="form-control" path="price" onchange="setChange();"></form:input>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<label for="expirydate">有效日期</label>
							<form:input type="text" class="form-control" path="expiryDateStr" onchange="setChange();"></form:input>
						</div>
						<div class="col-xs-4">
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

	<script>		
		$("#viewCustomerLink").attr("disabled",true);
		$("#viewSickHistoryLink").attr("disabled",true);		
	</script>
</body>
</html>