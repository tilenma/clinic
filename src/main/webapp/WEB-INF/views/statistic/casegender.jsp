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
					<form:form action="./casegender" commandName="selectStatisticForm" method="post">
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
    chart: {
        type: 'column'
    },
    credits: {
        enabled: false
    },     
    title: {
        text: '主治人次統計'
    },
    subtitle:{
    	text: '男女分佈'
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
        }
    },
    legend: {
        enabled: true
    },
    tooltip: {
        //pointFormat: '週人次: <b>{point.y:.0f} </b>'
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.0f} </b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true        
    },
    series: [{
        name: '男',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.male}],
        	</c:forEach>            
        ],
        dataLabels: {
            enabled: true,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            format: '{point.y:.0f}', // one decimal
            y: 10, // 10 pixels down from the top
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    },{
        name: '女',
        data: [
            <c:forEach items="${statList}" var="stat" varStatus="status">
        	['${stat.displayInterval}',${stat.female}],
        	</c:forEach>            
        ],
        dataLabels: {
            enabled: true,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            format: '{point.y:.0f}', // one decimal
            y: 10, // 10 pixels down from the top
            style: {
                fontSize: '13px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    }]
});
</c:if>

initDatePicker("startDateStr");
initDatePicker("endDateStr");
</script>
</body>
</html>
