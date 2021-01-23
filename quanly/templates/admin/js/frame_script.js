$(document).ready(function(){
	
	///// Check do phan giai /////
	function fun_check_resize(){
		$win_width=$(window).width();
		if($win_width>768){
			
			// fload-menu //
			$(function () {
				$('.floating-widget, .filter-prod, .ss-product').floatingWidget();
			});
			// fload-menu //
			
			$(document).ready(function() {
				$(".btn-ssp1").click(function(e) {
					$(".click-show-ss").css("display","block");
				});	
				$(".close-csss").click(function(e) {
					$(".click-show-ss").css("display","none");
				});	
			});
			
			$(document).ready(function(){
				$('.txt-cmm').autosize();
			});
			
			$(document).ready(function(){
				$(".btn-sH").click(function(e) {
					$(".ipt-sH").css("display","block");
				});
			});
			
			var mySwiperadv1 = new Swiper('.swiper-adv1',{
				paginationClickable: true,
				mode: 'vertical',
				loop: true,
				grabCursor: true,
				speed: 1000,
				autoplay: 3000
			})
			var mySwiperadv2 = new Swiper('.swiper-adv2',{
				paginationClickable: true,
				mode: 'vertical',
				loop: true,
				grabCursor: true,
				speed: 1000,
				autoplay: 4000
			})
			var mySwiperadv3 = new Swiper('.swiper-adv3',{
				paginationClickable: true,
				mode: 'vertical',
				loop: true,
				grabCursor: true,
				speed: 1000,
				autoplay: 3000
			})
			var mySwiperadv4 = new Swiper('.swiper-adv4',{
				paginationClickable: true,
				mode: 'vertical',
				loop: true,
				grabCursor: true,
				speed: 1000,
				autoplay: 4000
			})
			var mySwiperadv5 = new Swiper('.swiper-adv5',{
				paginationClickable: true,
				mode: 'vertical',
				loop: true,
				grabCursor: true,
				speed: 1000,
				autoplay: 3000
			})
			var mySwiperadv6 = new Swiper('.swiper-adv6',{
				paginationClickable: true,
				mode: 'vertical',
				loop: true,
				grabCursor: true,
				speed: 1000,
				autoplay: 4000
			})
			var mySwiperadv7 = new Swiper('.swiper-adv7',{
				paginationClickable: true,
				mode: 'vertical',
				loop: true,
				grabCursor: true,
				speed: 1000,
				autoplay: 3000
			})
			var mySwiperadv8 = new Swiper('.swiper-adv8',{
				paginationClickable: true,
				mode: 'vertical',
				loop: true,
				grabCursor: true,
				speed: 1000,
				autoplay: 4000
			})
							
		}
	}

	$(window).resize(function() {
		fun_check_resize();
	});
	fun_check_resize();
	///// Check do phan giai /////
	
	///// Check do phan giai /////
	function fun_check_resize2(){
		$win_width=$(window).width();
		if($win_width<481){
			
			$(document).ready(function(){
				$(".btn-sH").click(function(e) {
					$(".ipt-sH").css("display","block");
					$(".sH2").css("width","200px");
					$(".sH2 .btn-sH").css("width","41px");
				});
			});
							
		}
	}

	$(window).resize(function() {
		fun_check_resize2();
	});
	fun_check_resize2();
	///// Check do phan giai /////	
	
	
	///// click chi tiet /////
	$('.close-adv-tl').click(function(){
		$(".adv-tl").css({'display':'none'});
	});	
	$(document).ready(function() {
		$(".click-1-D").click(function(e) {
			$(".i1-cpd").css("display","block");
			$(".click-2-D").css("display","inline-block");
			$(".click-1-D").css("display","none");
		});
		$(".click-2-D").click(function(e) {
			$(".i1-cpd").css("display","none");
			$(".click-2-D").css("display","none");
			$(".click-1-D").css("display","inline-block");
		});	
		$(".click-3-D").click(function(e) {
			$(".i3-cpd").css("display","block");
			$(".click-4-D").css("display","inline-block");
			$(".click-3-D").css("display","none");
		});	
		$(".click-4-D").click(function(e) {
			$(".i3-cpd").css("display","none");
			$(".click-4-D").css("display","none");
			$(".click-3-D").css("display","inline-block");
		});	
	});
	///// click chi tiet /////
	
	///// slider swiper /////
	var mySwiper1 = new Swiper('.swiper-container',{
		pagination: '.pagination',
		loop: false,
		grabCursor: true,
		autoplay: 5000,
		speed: 1000,
		paginationClickable: true
	})
	var mySwiper2 = new Swiper('.swiper-container2',{
		paginationClickable: true,
		mode: 'vertical',
		loop: false,
		grabCursor: true,
		speed: 1000,
		autoplay: 2000
	})
	var mySwiper3 = new Swiper('.swiper-container3',{
		paginationClickable: true,
		loop: false,
		slidesPerView: 'auto',
		grabCursor: true
	})
	var mySwiper4 = new Swiper('.swiper-container4',{
		loop: false,
		grabCursor: true,
		autoplay: 3000,
		paginationClickable: true
	})
	$('.arrow-left').on('click', function(e){
		e.preventDefault()
		mySwiper4.swipePrev()
	})
	$('.arrow-right').on('click', function(e){
		e.preventDefault()
		mySwiper4.swipeNext()
	})
	///// slider swiper /////
	
	///// click dang nhap /////
	
	$(".btn-dn").click(function(e) {
		$(".m-dn").toggle();
	});
	
	///// click dang nhap /////
	
	$(".menu_toggler, .icon-menu-mobile").click(function(e) {
		$(".mobile_menu_wrapper").slideToggle(300);
	});
	
});