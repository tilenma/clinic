<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>統計資料</title>
<meta charset="utf-8">
<jsp:include page="../common.jsp" />

<script src="<spring:url value="/resources/js/highcharts.js"/>" charset="UTF-8"></script>
<script src="<spring:url value="/resources/js/exporting.js"/>" charset="UTF-8"></script>
<script src="<spring:url value="/resources/js/export-data.js"/>" charset="UTF-8"></script>

</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-1 col-md-1 col-xs-1"></div>		
		<div class="col-md-8 narrow">
			<h1>統計資料</h1>
		</div>
		<div class="col-md-2 narrow">
			<button type="button" class="btn btn-success btn-lg hidden-print" onclick="window.close();">關閉</button>	
		</div>	
	</div>
	<div class="row">
		<div class="col-lg-1 col-md-1 col-xs-1"></div>					
		<div class="col-md-10 narrow">			
			<div class="menutitlecontainer">
				<div class="container-fluid backorange">
					<form:form action="./caseage" commandName="selectStatisticForm" method="post">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-xs-3">
							<label for="date">開始</label>
							<form:input type="text" class="form-control" path="startDateStr" onchange="submit();"></form:input>							
							<form:errors path="startDateStr" class="alert alert-danger"/>
						</div>
						<div class="col-lg-3 col-md-3 col-xs-3">
							<label for="date">結束</label>
							<form:input type="text" class="form-control" path="endDateStr" onchange="submit();"></form:input>
							<form:errors path="endDateStr" class="alert alert-danger"/>
						</div>	
						<div class="col-lg-1 col-md-1 col-xs-1">
							<label for="interval">分組</label>
						</div>
						<div class="col-lg-1 col-md-1 col-xs-1">
							<form:radiobutton class="form-control" path="interval" value="2" onchange="submit();"/>每月
						</div>
						<div class="col-lg-1 col-md-1 col-xs-1">
							<form:radiobutton class="form-control" path="interval" value="3" onchange="submit();"/>每星期 
						</div>	
						<div class="col-lg-1 col-md-1 col-xs-1">
							<form:radiobutton class="form-control" path="interval" value="6" onchange="submit();"/>每日 
						</div>													
					</div>					
					</form:form>
				</div>
			</div>
		</div>
	</div>	
	<div class="row">
		<div class="col-lg-1 col-md-1 col-xs-1"></div>					
		<div class="col-md-10 narrow">
			<div class="menutitlecontainer">
			<div id="container" style="min-width: 300px; height: 400px; margin: 0 auto"></div>
			</div>
		</div>
	</div>	
</div>

<script>
<c:if test="${not noresult}">
Highcharts.chart('container', {
    credits: {
        enabled: false
    },     
    chart: {
        type: 'column'
    },    
    title: {
        text: '主治人次統計'
    },
    subtitle:{
    	text: '年齡分佈'
    },
    xAxis: {
        type: 'category',
        labels: {
            rotation: -45,
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: '每週人次'
        },
	    stackLabels: {
	        enabled: true,
	        style: {
	            fontWeight: 'bold',
	            color: ( // theme
	                Highcharts.defaultOptions.title.style &&
	                Highcharts.defaultOptions.title.style.color
	            ) || 'gray'
	        }
	    }
    },
    legend: {
    	layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },
    plotOptions: {
        column: {
            stacking: 'normal',
            dataLabels: {
                enabled: true
            }
        }
    },
    series: [{
        name: '0-5',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(0)}],
        	</c:forEach>            
        ]
    },{
        name: '6-10',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(1)}],
        	</c:forEach>            
        ]
    },{
        name: '11-15',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(2)}],
        	</c:forEach>            
        ]   
    },{
        name: '16-20',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(3)}],
        	</c:forEach>            
        ]  
    },{
        name: '21-25',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(4)}],
        	</c:forEach>            
        ]
    },{
        name: '26-30',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(5)}],
        	</c:forEach>            
        ]
    },{
        name: '31-35',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(6)}],
        	</c:forEach>            
        ]    
    },{
        name: '36-40',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(7)}],
        	</c:forEach>            
        ]
    },{
        name: '41-45',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(8)}],
        	</c:forEach>            
        ]  
    },{
        name: '46-50',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(9)}],
        	</c:forEach>            
        ] 
    },{
        name: '51-55',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(10)}],
        	</c:forEach>            
        ]
    },{
        name: '56-60',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(11)}],
        	</c:forEach>            
        ] 
    },{
        name: '61-65',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(12)}],
        	</c:forEach>            
        ]   
    },{
        name: '66+',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.ageCountList.get(13)}],
        	</c:forEach>            
        ]     
    }]
});
</c:if>

initDatePicker("startDateStr");
initDatePicker("endDateStr");
</script>
</body>
</html>
