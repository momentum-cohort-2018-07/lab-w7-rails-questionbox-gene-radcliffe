function isInputValid(field){
    var control = $('#' + field)
    if (control.val() == " ") {
        return false;
    }else{
        return true;
    }

}