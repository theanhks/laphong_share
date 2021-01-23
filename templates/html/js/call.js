 $(window).load(function() {
            $('.nivoSlider').nivoSlider({directionNavHide:true});
        });
$(function () {
    $('a#click-popup').leanModal({
        closeButton: ".modal_close"
    });
});
$(function () {
    $('a[rel*=leanModal]').leanModal({
        closeButton: ".modal_close"
    });
});
$(document).ready(function () {
    $(".live-tile").liveTile();
    $('#mycarousel').jcarousel({
        wrap: "circular",
        vertical: true,
        visible: 4,
        scroll: 4,
        auto: 6,
        animation: 2000
    });
    $(".tra").click(function () {
        proname = ($(".tit").text());
        proprice = ($(".hidden1").text());

        CalMonthPay.show('', proprice, proname)
        return false;
    })
    $(".btnpoll").click(function () {
        var idpoll = $("input[name=idpoll]:checked").attr("value");
        if (typeof idpoll == 'undefined') {
            alert('vui lòng chọn một ý kiến');
            return false;
        } else {
            $.ajax({
                url: base_dir + 'index.php',
                data: {
                    op: "poll",
                    idpoll: idpoll
                },
                type: "POST",
                dataType: "json",
                success: function (data) {}
            });
            alert('bình chọn thành công');
            $('a.viewRServey').trigger('click');
        }
    });
    $(".viewRServey").click(function () {
        $("#SexyAlertBox-BoxContent").load(base_dir + 'poll.html');
    });
    /*-------------------------------*/
    $(".form_button").click(function () {
        var data = $(this).parents(".quick_login").serialize();
        $.ajax({
            url: base_dir + 'index.php',
            data: data,
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.error != "") {
                    $(".form_errorMsg").html(data.error);
                } else {
                    window.location.href = document.location.href;
                }
            }
        });
    });
    /*-------------------------------------*/
    $(".feature-product").fadeOut();
    $('.boxsp').hover(function () {
        $(".info-product", this).stop().animate({
            top: '0'
        }, {
            queue: false,
            duration: 500
        });
        $(".feature-product", this).fadeIn();
    }, function () {
        $(".info-product", this).stop().animate({
            top: '229px'
        }, {
            queue: false,
            duration: 500
        });
        $(".feature-product", this).fadeOut();
    });

    $(".support-fixed").addClass("show_support");
    $height_pop = ($(".support-fixed").height()) - 34;
    $(".support-fixed").attr('style', "bottom:" + (Number($height_pop) - (Number($height_pop) * 2)) + "px");
    $(".title-sf").mouseenter(function () {
        $(".support-fixed").css({
            'bottom': '0'
        });
    });
    $(".support-fixed").mouseleave(function () {
        $(this).attr('style', "bottom:" + (Number($height_pop) - (Number($height_pop) * 2)) + "px");
    });   
});