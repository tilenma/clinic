//Edit page buttons
//Save
function saveCase(){
	window.onbeforeunload = null;
	$("#caseForm").submit();
}

//Calculate
function calculate(){
	$("#action").val("calculate");
	window.onbeforeunload = null;
	$("#caseForm").submit();
}

function createNewCase(){
	var id = $("#customerID").val();
	var thisCaseId = $('#caseID').val();
	
	if(thisCaseId==null){
		alert("請先儲存病案!");
	}
	else if(id == null || id == ""){
		alert("請先選擇客戶名稱!");
	}
	else{
		var url = "./create";		
		var win = window.open(url);		
		win.focus();		
		
		setTimeout(function (){
			if(typeof win.customerSet == 'function'){
				win.customerSet(id);
				win.copyHistory(thisCaseId);
			}
			else{
				setTimeout(function (){
					win.customerSet(id);
					win.copyHistory(thisCaseId);
				},3000);
			}
		   },2000			
		)
	}	
}

function viewOtherHistory(){
	var name = $("#searchName").val();
	
	if(name == null || name == ""){
		alert("請先輸入名稱!");
	}
	else{
		var url = "./history2?customer="+name;
		var win = window.open(url,"viewOtherHistory");
	}	
}

function viewCurrentCustomerHistory(){
	var id = $("#customerID").val();

	if(id == null || id == ""){
		alert("請先選擇客戶名稱!");
	}
	else{
		var url = "./history"+"?customerID=" + id;
		var win = window.open(url,"viewOtherHistory");
	}
}

function viewCurrentCustomer(){
	var id = $("#customerID").val();

	if(id == null || id == ""){
		alert("請先選擇客戶名稱!");
	}
	else{
		var url = "../customer/view"+"?id=" + id;
		var win = window.open(url,"viewCustomer");
	}
}

function viewSameSickHistory(){
	var name = $("#sickness").val();
	
	if(name == null || name == ""){
		alert("請先輸入病名!");
	}
	else{
		var url = "./history3?sick="+name;
		var win = window.open(url,"viewOtherHistory");
	}	
}

//Customer
function customerSet(customerID){
	var id = customerID;
	if(id != ""){
		$("#customerID").val(customerID).change();
		$("#viewCustomerLink").attr("onclick","viewCurrentCustomer();return false;");
		$("#viewCustomerLink").attr("disabled", false);
		$("#viewSickHistoryLink").attr("onclick","viewCurrentCustomerHistory();return false;");
		$("#viewSickHistoryLink").attr("disabled", false);
	}
	else{
		removeSelect();
	}
	$("#customerName").val("");
	
	setChange();
}

function customerSelect(){
	var id = $("#customerID").val();
	if(id != ""){
		$("#viewCustomerLink").attr("onclick","viewCurrentCustomer();return false;");
		$("#viewCustomerLink").attr("disabled", false);
		$("#viewSickHistoryLink").attr("onclick","viewCurrentCustomerHistory();return false;");
		$("#viewSickHistoryLink").attr("disabled", false);
	}
	else{
		removeSelect();
	}
	$("#customerName").val("");
	
	setChange();
}

function removeSelect() {	
	$("#customerID").val("");
	$("#viewCustomerLink").attr("onlick", "return false;");
	$("#viewCustomerLink").attr("disabled", true);
	$("#viewSickHistoryLink").attr("onlick","return false;");	
	$("#viewSickHistoryLink").attr("disabled", true);
}

//For medicineTab
//Auto Complete function
function addMedicineAuto(id){
	$('#'+id+'\\.name').autocomplete(
			{
				source : function(request, response) {
					$.ajax({
						dataType : 'json',
						type : 'GET',
						contentType : "application/json; charset=utf-8",
						url : '../medicine/tag',
						data : {
							tagName : $('#'+id+'\\.name').val(),
						},
						success : function(data) {
							response($.map(data, function(item) {
								return {
									label : item.name,
									value : item.name,
									id : item.type,
									code : item.code
								}

							}));
						}
					});
				},
				minLength : 1,
				select : function(event, ui) {						
					var type = ui.item.id;
					$("#"+id+"\\.type option[value="+type+"]").prop("selected","selected");					
					var code = ui.item.code;					
					setMedicInfo(code, id);					
				}
	});
}

function initMedicineAuto(){
	var rowCount = $("#medicineTable tr").length-1; //ignore header tr
	
	for(var i=0;i<rowCount;i++){
		var id = 'medicines'+i;
		addMedicineAuto(id);
		
		var type = $("#"+id+"\\.type").val();	
		
		if(type=='藥' || type=='方'){
			var name = $("#"+id+"\\.name").val();		
			if(name != null && name.length > 0){
				setMedicInfoByName(name,id);			
			}
		}
	}			
}

function updateMedicineAfterType(rowNo){	
	var thisId = "medicines"+rowNo;	
	var aName = $("#"+thisId+"\\.name").val();
	console.log("updateMedicineAfterType for "+aName);
	setMedicInfoByName(aName,thisId);
}

function addRow(){
	var table = $("#medicineTable");
	var rowCount = $("#medicineTable tr").length-1; //ignore header tr
	
	var tableBody = $("#medicineTable").find("tbody");
	var trFirst = tableBody.find("tr:first");
	var trLast = tableBody.find("tr:last");
	var trNew = trFirst.clone(); //Clone the first row	
	
	changeRowId(trNew,0,rowCount);
	clearRow(trNew);
	
	trLast.after(trNew); //Add new row after last row
	
	//Set auto complete
	addMedicineAuto('medicines'+rowCount);
}

function clearRow(trNew){
	trNew.find(':text,select,a,input').each(function(){
		if($(this).attr("id")!=null){
			var attrName = $(this).attr("id").split(".")[1];
						
			if('name'==attrName ||'remark'==attrName || 'unit'==attrName || 'referenceUnit'==attrName){
				$(this).val("");
			}			
			if('tip'==attrName){
				$(this).attr('style',"display:none");
			}
		}
	});
}

function changeRowId(trNew, oldRowNo, newRowNo){	
	trNew.find(':text,select,a,input').each(function(){
		if($(this).attr("id")!=null){
			var attrName = $(this).attr("id").split(".")[1];
			$(this).attr('id','medicines'+newRowNo+"."+attrName);
			$(this).attr('name','medicines['+newRowNo+"]."+attrName);
			
			if('name'==attrName ||'remark'==attrName || 'unit'==attrName || 'referenceUnit'==attrName){				
				if('unit'==attrName){
					var onchangeText = $(this).attr('onchange');
					var replacedLink = onchangeText.replace("checkOverDosage("+oldRowNo+")","checkOverDosage("+newRowNo+")");
					$(this).attr('onchange',replacedLink);
				}
				
				if('name'==attrName){
					var onchangeText = $(this).attr('onfocusout');
					var replacedLink = onchangeText.replace("updateMedicineAfterType("+oldRowNo+")","updateMedicineAfterType("+newRowNo+")");
					$(this).attr('onfocusout',replacedLink);
				}
			}
			if('link'==attrName){
				var linkText = $(this).attr('href');
				var replacedLink = linkText.replace("medicines"+oldRowNo,"medicines"+newRowNo);
				$(this).attr('href',replacedLink);
			}
		}
	});
}

function resetMedicine(){
	var totalRowCount = $("#medicineTable tr").length-1; //ignore header tr
	//delete rows and left one
	for(var i=0;i<totalRowCount-1;i++){
		console.log("delete last row");
		deleteLastRow();
	}
	//reset the remaining row
	var table = $("#medicineTable");
	var tableBody = $("#medicineTable").find("tbody");
	var trFirst = tableBody.find("tr:first");
	rowCount = 0;
	
	clearRow(trFirst);
	setChange();
}

function deleteRow(rowNo){
	$("#medicineTable > tbody > tr").each(function(index, thisTr){
		if(index < rowNo){
			//do nothing
		}
		else if(index == rowNo){
			//Remove
			thisTr.remove();
		}
		else{			
			//Reset id
			changeRowId($(thisTr),index,index-1);
		}
	}
	);
}

function deleteLastRow(){
	var table = $("#medicineTable");
	var rowCount = $("#medicineTable tr").length-1; //ignore header tr
	
	var tableBody = $("#medicineTable").find("tbody");
	var trLast = tableBody.find("tr:last");
	
	trLast.remove();	
}	

function setMedicInfoByName(name,id){
	var wsUrl = '../ws/medic2?name='+name;
		
	$.getJSON(wsUrl, function(json){		
		console.log("get medic info for name:"+name);
		
		if(json != null && json.code !=null){			
			var info = json.code+" : "+json.name;
			
			if(json.referenceUnit){
				info = info+"\n參考用量:"+json.referenceUnit+"錢";				
				$("#"+id+"\\.referenceUnit").val(json.referenceUnit); //Set hidden value
			}
			if(json.taste){
				info = info+"\n性味:"+json.taste;
			}
			if(json.meridian){
				info = info+"\n歸經:"+json.meridian;
			}
			if(json.effect){
				info = info+"\n功效:"+json.effect;
			}
			if(json.usage){
				info = info+"\n用法:"+json.usage;
			}
			if(json.detailCH){
				info = info+"\n實際:"+json.detailCH;
			}				
			if(json.content){
				info = info+"\n古籍:"+json.content;
			}	
			if(json.contraint){
				info = info+"\n禁忌:"+json.contraint;
			}			
			
			$("#"+id+"\\.tip").prop("title",info);
			$("#"+id+"\\.tip").show();
			
			//Set type also			
			$("#"+id+"\\.type").val(json.type);
		}
		else{
			$("#"+id+"\\.tip").hide();
		}
	}).fail(function() {
	    //no matched medic
		$("#"+id+"\\.tip").hide();
	});
	
	return "";
}

function setMedicInfo(code,id){
	var wsUrl = '../ws/medic?code='+code;
		
	$.getJSON(wsUrl, function(json){
		console.log("get medic info for code:"+code);
		
		if(json != null){			
			var info = json.code+" : "+json.name;
			
			if(json.referenceUnit){
				info = info+"\n參考用量:"+json.referenceUnit+"g";				
				$("#"+id+"\\.referenceUnit").val(json.referenceUnit); //Set hidden value
			}
			if(json.taste){
				info = info+"\n性味:"+json.taste;
			}
			if(json.meridian){
				info = info+"\n歸經:"+json.meridian;
			}
			if(json.effect){
				info = info+"\n功效:"+json.effect;
			}
			if(json.usage){
				info = info+"\n用法:"+json.usage;
			}
			if(json.detailCH){
				info = info+"\n實際:"+json.detailCH;
			}				
			if(json.content){
				info = info+"\n古籍:"+json.content;
			}	
			if(json.contraint){
				info = info+"\n禁忌:"+json.contraint;
			}			
			
			$("#"+id+"\\.tip").prop("title",info);
			$("#"+id+"\\.tip").show();
		}
	})	
	
	return "";
}

function checkOverDosage(index){
	var limit = $("#medicines"+index+"\\.referenceUnit").val();
	
	if(limit != null && limit.length > 0){
		limit = limit*3.25; //Change to g
		limit = parseFloat(limit);
		var limit2 = parseFloat(limit*2);
		var selectedUnit = $("#medicines"+index+"\\.unit").val();
		selectedUnit = parseFloat(selectedUnit);
				
		if(selectedUnit > limit2){
			console.log("row"+index+" with dose exceeds limit X2 :"+limit2.toFixed(2)+"g");
			alert("份量超過參考用量2倍:"+limit2.toFixed(2)+"g");
			$("#medicines"+index+"\\.unit").removeClass("alert-warning");
			$("#medicines"+index+"\\.unit").addClass("alert alert-danger");
		}
		else if(selectedUnit > limit){
			console.log("row"+index+" with dose exceeds limit :"+limit.toFixed(2)+"g");
			$("#medicines"+index+"\\.unit").removeClass("alert-danger");
			$("#medicines"+index+"\\.unit").addClass("alert alert-warning");
		}
		else{
			$("#medicines"+index+"\\.unit").removeClass("alert alert-warning alert-danger");
		}
	}	
}

//for statisticTab
function onchangeReset(rowNo){	
	var thisId = "#statistics"+rowNo+"\\.reset1";
	
	//uncheck to link to previous effect
	if($(thisId).prop('checked')==false){
		var thisCaseId = $('#caseID').val();
		var customerId = $('#customerID').val();	
		var id= "#statistics"+rowNo+"\\.type";
		var type = $(id).val();
		var date= $('#dateStr').val();

		if(type == null || type.trim().length == 0){
			alert("請先輸入類別!");
			$(thisId).prop("checked",true);		
			return;
		}
		
		if(thisCaseId==null || date==null || date == ""){
			$(thisId).prop("checked",true);		
			return;
		}
			
		if(customerId == null || customerId == ""){
			alert("請先選擇客戶!");
			$(thisId).prop("checked",true);
			return;
		}
		var wsUrl = '../ws/effect_date?custID='+customerId+'&type='+type+'&date='+date;	
		$.getJSON(wsUrl, function(json){		
			//get result
			var date = json.startDateStr;
			if(date != null && date.length > 0){
				console.log("getGroupEffectStartdate(): " + json.startDateStr);		
				alert("類別由"+date+"開始");
				setChange();
			}
			else{			
				alert("沒有過往效果!");
				console.log( "Unable to find previous effect result! custID=" + customerId+" ,type="+type+" ,date="+date);			
				$(thisId).prop("checked",true);
			}
		}).fail(function(jqxhr, status, error) {
			console.log( "error :" + error );		
			$(thisId).prop("checked",true);		
		});	
	}
	else{
		//set reset
		setChange();
	}
}

//For copy
function updateMedicine(id,aType, aName){
	$("#"+id+"\\.type").val(aType);
	$("#"+id+"\\.name").val(aName);	
	
	setMedicInfoByName(aName,id);
}

function copyLastHistory(){
	var thisCaseId = $('#caseID').val();
	var customerId = $('#customerID').val();
		
	if(thisCaseId==null){
		thisCaseId = 0;
	}
		
	if(customerId == null || customerId == ""){
		alert("請先選擇客戶!");
	}
	else{
		var wsUrl = '../ws/case/last?caseId='+thisCaseId+'&customerId='+customerId;
			
		$.getJSON(wsUrl, function(json){
			//get result
			if(json != null && json > 0){
				console.log("last history with case id: " + json);
				copyHistory(json);			
				showRollbackBtn();
			}
			else{
				alert("沒有找到病案!");
			}
		});
	}
}

function copyLastSameProblemHistory(){	
		var thisCaseId = $('#caseID').val();
		var customerId = $('#customerID').val();
		var thisProblem = $('#problem').val();
		
		if(thisCaseId==null){
			thisCaseId = 0;
		}
		
		if(customerId == null || customerId == ""){
			alert("請先選擇客戶!");
		}
		else if(thisProblem == null || thisProblem == ""){
			alert("請先輸入主訴!");
		}
		else{
			var wsUrl = '../ws/case/last2?caseId='+thisCaseId+'&customerId='+customerId+'&problem='+thisProblem;
			
			$.getJSON(wsUrl, function(json){
				//get result
				if(json != null && json > 0){
					console.log("last history with case id: " + json);
					copyHistory(json);
					showRollbackBtn();
				}
				else{
					alert("沒有找到病案!");
				}
			});
		}	
}

function copyHistory(id){
	var wsUrl = '../ws/case?id='+id;

	$.getJSON(wsUrl, function(json){
		console.log("copy history from case id: " + id);
		
		//get result
		if(json != null){
			backupHistory();
			
			$('#sweat').val(json.sweat);
			$('#coldHot').val(json.coldHot);
			$('#head').val(json.head);
			$('#mouth').val(json.mouth);
			$('#body').val(json.body);
			$('#poo').val(json.poo);
			$('#pee').val(json.pee);
			$('#drink').val(json.drink);
			$('#eat').val(json.eat);
			$('#abdomen').val(json.abdomen);
			$('#hearing').val(json.hearing);
			$('#sleep').val(json.sleep);
			//$('#tongueColor').val(json.tongueColor);
			//$('#tongueShape').val(json.tongueShape);
			$('#tongueStatus').val(json.tongueStatus);
			//$('#tongueLayer').val(json.tongueLayer);
			$('#pulse').val(json.pulse);
			$('#skin').val(json.skin);
			$('#menstruation').val(json.menstruation);
			
			setChange();
		}
		
		else{
			alert("沒有找到病案!");
		}
	});
}

function copyLastMedicine(){
	var thisCaseId = $('#caseID').val();
	var customerId = $('#customerID').val();
	
	if(customerId == null || customerId == ""){
		alert("請先選擇客戶!");
	}
	else{
		var wsUrl = '../ws/case/last?caseId='+thisCaseId+'&customerId='+customerId;
		
		$.getJSON(wsUrl, function(json){
			//get result
			if(json != null && json > 0){
				console.log("last medicine with case id: " + json);
				copyMedicine(json);
				showRollbackMedicine();
			}
			else{
				alert("沒有找到病案!");
			}
		});
	}
}

function copyLastSameSicknessHistory(){
	var thisCaseId = $('#caseID').val();
	var thisSickness = $('#sickness').val();
	
	if(thisSickness == null || thisSickness == ""){
		alert("請先輸入病名!");
	}
	else{
		var wsUrl = '../ws/case/last3?caseId='+thisCaseId+'&sick='+thisSickness;
		
		$.getJSON(wsUrl, function(json){
			//get result
			if(json != null && json > 0){
				console.log("last medicine with case id: " + json);
				copyMedicine(json);
				showRollbackMedicine();
			}
			else{
				alert("沒有找到病案!");
			}
		});
	}
}

function copyLastSameCustomerNSicknessHistory(){
	var thisCaseId = $('#caseID').val();
	var customerId = $('#customerID').val();
	var thisSickness = $('#sickness').val();
	
	if(customerId == null || customerId == ""){
		alert("請先選擇客戶!");
	}
	else if(thisSickness == null || thisSickness == ""){
		alert("請先輸入病名!");
	}
	else{
		var wsUrl = '../ws/case/last4?caseId='+thisCaseId+'&customerId='+customerId+'&sick='+thisSickness;
		
		$.getJSON(wsUrl, function(json){
			//get result
			if(json != null && json > 0){
				console.log("last medicine with case id: " + json);
				copyMedicine(json);
				showRollbackMedicine();
			}
			else{
				alert("沒有找到病案!");
			}
		});
	}
}

function copyMedicine(id){
	var wsUrl = '../ws/case/medic?caseId='+id;

	$.getJSON(wsUrl, function(json){
		console.log("copy medicines from case id: " + id);
		
		//get result
		if(json != null){
			
			if(json.length == 0){
				alert("病案沒有任何方藥!");
				return;
			}
			
			backupMedicine();
			
			var rowCount = $("#medicineTable tr").length-1; //ignore header tr
			if(json.length < rowCount){
				for(var i=json.length;i<rowCount;i++){
					console.log("delete last row");
					deleteLastRow();
				}
			}
			else if(json.length > rowCount){
				for(var i=rowCount;i<json.length;i++){
					console.log("Add new row");
					addRow();
				}
			}
			
			$.each(json, function(i, obj){				
				console.log(i+":"+obj.caseMedicineKey.type+" "+obj.caseMedicineKey.name+" "+obj.unit+" "+obj.unit2+" "+obj.remark);
					$("#medicines"+i+"\\.type").val(obj.caseMedicineKey.type);
					$("#medicines"+i+"\\.name").val(obj.caseMedicineKey.name);
					if(obj.unit != null){
						$("#medicines"+i+"\\.unit").val(obj.unit.toFixed(2));
					}
					else{
						$("#medicines"+i+"\\.unit").val("");
					}
					$("#medicines"+i+"\\.unit2").val(obj.unit2);
					$("#medicines"+i+"\\.remark").val(obj.remark);			
			});
			
			setChange();
		}		
		else{
			alert("沒有找到病案!");
		}
	});
}

//For backup and rollback copy
var backup = [];
function backupHistory(){
	backup['#sweat'] = $('#sweat').val();
	backup['#coldHot'] = $('#coldHot').val();
	backup['#head'] = $('#head').val();
	backup['#mouth'] = $('#mouth').val();
	backup['#body'] = $('#body').val();
	backup['#poo'] = $('#poo').val();
	backup['#pee'] = $('#pee').val();
	backup['#drink'] = $('#drink').val();
	backup['#eat'] = $('#eat').val();
	backup['#abdomen'] = $('#abdomen').val();
	backup['#hearing'] = $('#hearing').val();
	backup['#sleep'] = $('#sleep').val();
	backup['#tongueStatus'] = $('#tongueStatus').val();
	backup['#pulse'] = $('#pulse').val();
	backup['#skin'] = $('#skin').val();
	backup['#menstruation'] = $('#menstruation').val();
}

function rollbackHistory(){
	$('#sweat').val(backup['#sweat']);
	$('#coldHot').val(backup['#coldHot']);
	$('#head').val(backup['#head']);
	$('#mouth').val(backup['#mouth']);
	$('#body').val(backup['#body']);
	$('#poo').val(backup['#poo']);
	$('#pee').val(backup['#pee']);
	$('#drink').val(backup['#drink']);
	$('#eat').val(backup['#eat']);
	$('#abdomen').val(backup['#abdomen']);
	$('#hearing').val(backup['#hearing']);
	$('#sleep').val(backup['#sleep']);
	$('#tongueStatus').val(backup['#tongueStatus']);
	$('#pulse').val(backup['#pulse']);
	$('#skin').val(backup['#skin']);
	$('#menstruation').val(backup['#menstruation']);
	
	$("#rollbackBtn").hide();
}

var medicBackup;
function backupMedicine(){
	medicBackup = new Array();
	var rowCount = $("#medicineTable tr").length-1; //ignore header tr	
	var i;
	for(i=0; i< rowCount;i++){
		var medic = [$("#medicines"+i+"\\.type").val(),$("#medicines"+i+"\\.name").val(),$("#medicines"+i+"\\.unit").val(),$("#medicines"+i+"\\.remark").val()];
		medicBackup.push(medic);
	}
}

function rollbackMedicine(){
	if(medicBackup != null){
		var rowCount = $("#medicineTable tr").length-1; //ignore header tr
		var backupRowCount = medicBackup.length;
		
		if(backupRowCount < rowCount){
			for(var i=backupRowCount;i<rowCount;i++){
				console.log("delete last row");
				deleteLastRow();
			}
		}
		else if(backupRowCount > rowCount){
			for(var i=rowCount;i<backupRowCount;i++){
				console.log("Add new row");
				addRow();
			}
		}
		
		for(i=0; i< backupRowCount; i++){
			$("#medicines"+i+"\\.type").val(medicBackup[i][0]);
			$("#medicines"+i+"\\.name").val(medicBackup[i][1]);
			$("#medicines"+i+"\\.unit").val(medicBackup[i][2]);
			$("#medicines"+i+"\\.remark").val(medicBackup[i][3]);		
		}
		console.log("Rollback Medicine is done.");
	}
	else{
		console.log("Cannot rollbackMedicine as backup is null!");
	}
	$("#rollbackMedicineBtn").hide();
}

//For create page
//Button
function openSelectSymptiom(id, type,level){
	window.field = id;
	
	var url = "selectSymptom?type="+type+"&level="+level;
	popup = window.open(url, "selectSymptom", "toolbar=no, menubar=no, resizable=yes,directories=no,scrollbars=no,status=no,titlebar=no,width=800,height=400");
	popup.focus();
}

//Common function
function showRollbackBtn(){
	$("#rollbackBtn").show();
}
function showRollbackMedicine(){
	$("#rollbackMedicineBtn").show();
}

//Document ready 
$( document ).ready(function() {

$('#customerName').autocomplete({
	source: function(request, response) {
		 $.ajax({
			 dataType: 'json',
			 type: 'GET',
			 contentType: "application/json; charset=utf-8",
             url: '../customer/tag',
             data:{
            	 tagName: $('#customerName').val(),
             },
			 success: function(data){
				 response($.map(data, function(item){
					return{
						label: item.name,
						value: item.name,
						id: item.id
					}
					 
				 }));
			 }
		 });				 		 		
	},
	minLength: 1,
       select: function (event, ui) {
			var id = ui.item.id;					
			$("#customerID").val(id);
			//$("#customerName").addClass("backgreen");
			customerSelect();
        } 
});				
initDatePicker("dateStr");
initDatePicker("expiryDateStr");

});