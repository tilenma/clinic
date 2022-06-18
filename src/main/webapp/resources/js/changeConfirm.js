var change = false;
function setChange(){
	if(!change){
		change = true;
		var newTitle = "*"+$(document).attr("title");
		$(document).attr("title",newTitle);
	}
}

function resetChange(){
	change = false;
}

function confirmChange() {
	if(change){
        var Ans = confirm("Are you sure you want to exit without saving?");
        if(Ans==true)
            return true;
        else
            return false;
	}
}

window.onbeforeunload = confirmChange;