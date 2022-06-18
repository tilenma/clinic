function initDatePicker(id) {
	$("#" + id).datepicker({dateFormat: 'dd/mm/yy'});		
}

function setDefaultToday(id){
	$("#" + id).datepicker("setDate", "0");
}