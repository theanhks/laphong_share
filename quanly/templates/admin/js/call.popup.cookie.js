var popupStatus = 0;
//loading popup with jQuery magic!
function loadPopup() {
    //loads popup only if it is disabled
    if (popupStatus == 0) {
		$('#click-popup').trigger('click');
        popupStatus = 1;
    }
}
//disabling popup with jQuery magic!
function disablePopup() {
    //disables popup only if it is enabled
    if (popupStatus == 1) {
        popupStatus = 0;
    }
}
//edit cookie
var date = new Date();
date.setTime(date.getTime() + (60 * 60 * 1000));
//CONTROLLING EVENTS IN jQuery
$(document).ready(function () {
    if ($.cookie("cookieID") != 1) {
        //load popup
        setTimeout("loadPopup()", 0);
    }
    //CLOSING POPUP
    //Click the x event!
    $(".modal_close,#lean_overlay,#popup a.modal_close").click(function () {
        disablePopup();
        $.cookie("cookieID", "1", {
            expires: date
        });
    });
    //Press Escape event!
    $(document).keypress(function (e) {
        if (e.keyCode == 27 && popupStatus == 1) {
            disablePopup();
            $.cookie("cookieID", "1", {
                expires: date
            });
        }
    });
});