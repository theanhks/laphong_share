/*tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		plugins : "emotions",
		elements : 'abshosturls',
		theme_advanced_buttons1 : "bold,italic,underline,separator,justifyleft,bullist,numlist,link,unlink,emotions",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		relative_urls : false,
		remove_script_host : false,
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		//theme_advanced_statusbar_location : "bottom",
		editor_selector : "mceSimple"
	});	*/
$(document).ready(function () {
	$('a[rel*=leanModal]').leanModal({
        closeButton: ".modal_close"
    });
    //comment
    $(".post-cmm .submit-comment-user").click(function () {
        var idproduct = $(".post-cmm .idproduct").attr("value");
		var comment = $(".post-cmm textarea#comment-user").val();
		//var comment = tinyMCE.activeEditor.getContent();
        if (comment == '') {
            alert(messages['nhapbinhluan']);	
			$(".post-cmm textarea#comment-user").focus();		
            return false;
        }
		else if((comment.length)>500){alert("Nội dung không quá 500 ký tự..!");}        
        var email = $(".post-cmm #email-user").val();
        if (email == '') {
            alert(messages['nhapemail']);
			$(".dangnhap-ajax-cmm").click();
			$(".post-cmm #email-user").focus();
            return false;
        }	
		else {
                if (email.indexOf("@") < 0 || email.indexOf(".") < 0) {
                    alert(messages['emailkhonghople']);
					$(".dangnhap-ajax-cmm").click();
                    $(".post-cmm #email-user").focus();
                    return false;
                }
            }
		var name = $(".post-cmm #name-user").val();
        if (name == '') {
            alert(messages['nhapten']);
			$(".dangnhap-ajax-cmm").click();
			$(".post-cmm #name-user").focus();
            return false;
        }
        $.ajax({
            url: base_dir + 'index.php',
            data: {
                op: "vote",
                idproduct: idproduct,
                name: name,
                email: email,
                comment: comment
            },
            type: "POST",
            dataType: "json",
            success: function (data) {
                    alert(messages['binhchonthanhcong']);
					window.location.href = window.location.href;
            }
        });
    });
    //.commnent
});