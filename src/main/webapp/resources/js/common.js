function loadModal(dataURL, modal){
	$('#'+modal+' .modal-body').load(dataURL,function(){
		$('#'+modal).modal({show:true});
	});
}