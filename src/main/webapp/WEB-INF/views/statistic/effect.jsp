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
			<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
			</div>
		</div>
	</div>	
</div>

<script>

Highcharts.chart('container', {
    chart: {
        type: 'spline'
    },
    title: {
        text: '效果統計'
    },
    subtitle: {
        text: '客戶編號:${custId} 類別：${type}'
    },
    xAxis: {
        type: 'datetime',
        dateTimeLabelFormats: {
        	day: '%d %b %y'
        },
        title: {
            text: '日期'
        }
    },
    yAxis: {
        title: {
            text: '效果分數'
        },
        min: -10
    },
    credits: {
        enabled: false
    },    
    tooltip: {
        headerFormat: '<b>{series.name}</b><br>',
        pointFormat: '{point.x:%d %b %Y}: {point.y:.0f}'
    },

    plotOptions: {
        spline: {
            marker: {
                enabled: true
            }
        }
    },    
    colors: [
        '#50B432', 
        '#ED561B', 
        '#DDDF00', 
        '#24CBE5', 
        '#64E572', 
        '#FF9655', 
        '#FFF263', 
        '#6AF9C4'
    ],

    series: [    	
        <c:forEach items="${effectList}" var="thisList" varStatus="status">
    	{
    		name: "第${status.count}組",
    		data: [
    			<c:forEach items="${thisList}" var="thisEffect" varStatus="status2">
    			[Date.UTC(${thisEffect.displayDate}), ${thisEffect.effect}],
    			</c:forEach>   
    		]
    	},    	
    	</c:forEach>
    ]
});
</script>
</body>
</html>
