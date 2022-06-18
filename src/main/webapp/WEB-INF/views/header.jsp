<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="container-fluid">  
		<nav class="navbar navbar-default">
		    <div class="container-fluid">		    	
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#pulldown1">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href=".">主頁</a>
			    </div>
			    <div class="collapse navbar-collapse" id="pulldown1">
			      <ul class="nav navbar-nav">
			        <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">客戶管理<span class="caret"></span></a>
			          <ul class="dropdown-menu" role="menu">
			            <li><a class="dropdown-item" href="<c:url value = "/customer/create"/>">新增客戶</a> </li>
			            <li><a class="dropdown-item" href="<c:url value = "/customer/latest"/>" target="customer">最新客戶</a></li>
			            <li><a class="dropdown-item" href="<c:url value = "/weekOfCustomer"/>">本週客戶</a></li>
			            <li class="divider"></li>
			            <li><a class="dropdown-item" href="<c:url value = "/customer"/>">搜尋客戶</a></li>            
			            <li><a class="dropdown-item" href="<c:url value = "/customer/keyword"/>">關鍵字搜尋</a></li>
			          </ul>
			        </li>
			        <c:if test="${showAdvanced}">
			        <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">病案管理<span class="caret"></span></a>
			          <ul class="dropdown-menu" role="menu">
			            <li><a class="dropdown-item" href="<c:url value = "/case/create"/>">新增病案</a></li>
			            <li><a class="dropdown-item" href="<c:url value = "/case/latest"/>">最新病案</a></li>
			            <li><a class="dropdown-item" href="<c:url value = "/weekOfCase"/>">本週病案</a></li>
			            <li class="divider"></li>
			            <li><a class="dropdown-item" href="<c:url value = "/case"/>">搜尋病案</a></li>            
			            <li><a class="dropdown-item" href="<c:url value = "/case/medicine"/>">搜尋病案(藥方)</a></li>						
			          </ul>
			        </li>			        
			        </c:if>
			        <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">報表管理<span class="caret"></span></a>
			          <ul class="dropdown-menu" role="menu">
			            <li><a class="dropdown-item" href="<c:url value = "/report/checkLatest"/>" target="report">確認最新病案處方</a> </li>
			            <li><a class="dropdown-item" href="<c:url value = "/report/checklist"/>" target="report">確認病案處方列</a> </li>
			            <li class="divider"></li>
			            <li><a class="dropdown-item" href="<c:url value = "/report/report"/>" target="report">最新病案報表</a></li>
			            <li><a class="dropdown-item" href="<c:url value = "/report/prescription"/>" target="report">最新客戶報表</a></li>
			            <li class="divider"></li>
			            <li><a class="dropdown-item" href="<c:url value = "/report/weekOfReport"/>" target="report">本週報表</a></li>            
			            <li><a class="dropdown-item" href="<c:url value = "/report/search"/>" target="report">搜尋報表</a></li>
			          </ul>
			        </li>
			        <c:if test="${showAdmin}">
			        <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">方藥管理<span class="caret"></span></a>
			          <ul class="dropdown-menu" role="menu">
			            <li><a class="dropdown-item" href="<c:url value = "/medicine/new"/>">新增方藥</a></li>
			            <li class="divider"></li>
			            <li><a class="dropdown-item" href="<c:url value = "/medicine"/>">搜尋方藥</a></li>
			          </ul>
			        </li>	
			        <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">統計<span class="caret"></span></a>
			          <ul class="dropdown-menu" role="menu">
			          	<li><a class="dropdown-item" href="<c:url value = "/stat/case"/>" target="stat">到診人次</a></li>
			          	<li><a class="dropdown-item" href="<c:url value = "/stat/casegender"/>" target="stat">到診人次(男女分佈)</a></li>
			          	<li><a class="dropdown-item" href="<c:url value = "/stat/caseage"/>" target="stat">到診人次(年齡分佈)</a></li>
			            <li><a class="dropdown-item" href="<c:url value = "/stat/medic?type=藥"/>" target="stat">十大藥方</a></li>
			            <li><a class="dropdown-item" href="<c:url value = "/stat/gender"/>" target="stat">男女比例</a></li>
			            <li><a class="dropdown-item" href="<c:url value = "/stat/price"/>" target="stat">診金收入</a></li>
			          </ul>
			        </li>				        		        
			        </c:if>
			       </ul>      
			    </div>    
		    </div>
		</nav>
	 </div>	