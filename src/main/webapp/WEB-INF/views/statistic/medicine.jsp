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

<script>
function gotoMedic(){
	//var url = "${path}"+"?type="+type;	
	//$(location).attr('href',url);
	
	//alert("change");
	$("#selectStatisticForm").submit();
}
</script>
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
					<form:form action="./medic" commandName="selectStatisticForm" method="post">
					<div class="row">
						<div class="col-lg-3 col-md-3 col-xs-3">
							<label for="type">類別：</label>							
							<form:radiobutton path="type" value="藥" onclick="submit();"></form:radiobutton>藥
							<form:radiobutton path="type" value="方" onclick="submit();"></form:radiobutton>方
							<form:radiobutton path="type" value="針" onclick="submit();"></form:radiobutton>針
							<form:errors path="type" class="alert alert-danger"/>							
						</div>
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
			<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
			</div>
		</div>
	</div>
</div>

<script>
<c:if test="${not noresult}">
Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    credits: {
        enabled: false
    },     
    title: {
        text: '${title}'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.x} </b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
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
            ]            
        }
    },
    series: [{
        name: '使用次數',
        colorByPoint: true,
        data: [
        	<c:forEach items="${statList}" var="stat" varStatus="status">
        	{
                name: '${stat.name}',
                y: ${stat.count},
            },
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
