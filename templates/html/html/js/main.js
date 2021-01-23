	var owl_me;
	var h_wr = $('.wrapper').height();
	var h_ = $(window).height();
function Page(){
	var self = this;
	
	this.init = function(){
		self.popup();
	// toggle chat box
		$('#chatbox .chat-top').click(function() {
			$('#chatbox').stop().toggleClass('ac');
		});

	// 
	
		if($('.banner-slider').length>0 && $('.owl-slider .item').length>1){
			owl_me = $('.owl-slider');
			owl_me.on('initialized.owl.carousel', function(event) {
				$('.banner-slider .owl-carousel').addClass('load-cl');
			})
			owl_me.owlCarousel({
				autoplay: true,
				smartSpeed: 500,
				items: 1,
				loop:true,
				margin:0,
				nav: true,
				callbacks: true
			});
		}
		$('.banner-slider .owl-prev').click(function() {
			owl_me.trigger('prev.owl.carousel', [300]);
		})
		$('.banner-slider .owl-next').click(function() {
			owl_me.trigger('next.owl.carousel');
		})


		$(window).load(function(){
			h_wr = $('.wrapper').height();
			self.resize_height();
		})
		$(window).resize(function(){
			self.resize_height();
		})
	};
	this.bmi = function(){
		$('.radio').uniform();
		/*$(document).on('click','html,body',function(e){ 
			if ( $(e.target).is('.bmi_height') ) { 
				return;
			}else{
				bmi_weight=$('.bmi_weight').val();
				bmi_height=$('.bmi_height').val();
				console.log(bmi_height);
				if(bmi_weight!='' && bmi_height!=''){
					sex=$("input[name='sex']:checked").val();
					bmi_index=Math.round(bmi_weight / (bmi_height * bmi_height));
					$('.bmi_index p').html(bmi_index);
					if(lang=='vi'){
						if(bmi_index < 16 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị gầy độ III!'); }
						if(bmi_index >= 16 && bmi_index < 17 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị gầy độ II!'); }
						if(bmi_index >= 17 && bmi_index < 18.5 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị gầy độ I!'); }
						if(bmi_index >= 18.5 && bmi_index < 25){ $('.judge p').html('Chúc mừng bạn! Bạn có chỉ số BMI bình thường!'); }
						if(bmi_index >= 25 && bmi_index < 30 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị thừa cân!'); }
						if(bmi_index >= 30 && bmi_index < 35 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị béo phì độ I'); }
						if(bmi_index >= 35 && bmi_index <= 40 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị béo phì độ II'); }
						if(bmi_index > 40 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị béo phì độ III'); }
					}else{
						if(bmi_index < 16 ){ $('.judge p').html('The BMI above indicates that you are thin - grade III'); }
						if(bmi_index >= 16 && bmi_index < 17 ){ $('.judge p').html('The BMI above indicates that you are thin - grade II'); }
						if(bmi_index >= 17 && bmi_index < 18.5 ){ $('.judge p').html('The BMI above indicates that you are thin - grade I'); }
						if(bmi_index >= 18.5 && bmi_index < 25){ $('.judge p').html('Congratulation! You have normal BMI score!'); }
						if(bmi_index >= 25 && bmi_index < 30 ){ $('.judge p').html('The BMI above indicates that you are overweight'); }
						if(bmi_index >= 30 && bmi_index < 35 ){ $('.judge p').html('The BMI above indicates that you are obese - grade I'); }
						if(bmi_index >= 35 && bmi_index <= 40 ){ $('.judge p').html('The BMI above indicates that you are obese - grade II'); }
						if(bmi_index > 40 ){ $('.judge p').html('The BMI above indicates that you are obese - grade III'); }
					}
				}
				
			} 
		});*/
		$(document).on('focusout','.bmi_height',function(){
			bmi_weight=$('.bmi_weight').val();
			bmi_height=$('.bmi_height').val();
			sex=$("input[name='sex']:checked").val();
			bmi_index=Math.round(bmi_weight / (bmi_height * bmi_height));
			$('.bmi_index p').html(bmi_index);
			if(lang=='vi'){
				if(bmi_index < 16 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị gầy độ III!'); }
				if(bmi_index >= 16 && bmi_index < 17 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị gầy độ II!'); }
				if(bmi_index >= 17 && bmi_index < 18.5 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị gầy độ I!'); }
				if(bmi_index >= 18.5 && bmi_index < 25){ $('.judge p').html('Chúc mừng bạn! Bạn có chỉ số BMI bình thường!'); }
				if(bmi_index >= 25 && bmi_index < 30 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị thừa cân!'); }
				if(bmi_index >= 30 && bmi_index < 35 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị béo phì độ I'); }
				if(bmi_index >= 35 && bmi_index <= 40 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị béo phì độ II'); }
				if(bmi_index > 40 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị béo phì độ III'); }
			}else{
				if(bmi_index < 16 ){ $('.judge p').html('The BMI above indicates that you are thin - grade III'); }
				if(bmi_index >= 16 && bmi_index < 17 ){ $('.judge p').html('The BMI above indicates that you are thin - grade II'); }
				if(bmi_index >= 17 && bmi_index < 18.5 ){ $('.judge p').html('The BMI above indicates that you are thin - grade I'); }
				if(bmi_index >= 18.5 && bmi_index < 25){ $('.judge p').html('Congratulation! You have normal BMI score!'); }
				if(bmi_index >= 25 && bmi_index < 30 ){ $('.judge p').html('The BMI above indicates that you are overweight'); }
				if(bmi_index >= 30 && bmi_index < 35 ){ $('.judge p').html('The BMI above indicates that you are obese - grade I'); }
				if(bmi_index >= 35 && bmi_index <= 40 ){ $('.judge p').html('The BMI above indicates that you are obese - grade II'); }
				if(bmi_index > 40 ){ $('.judge p').html('The BMI above indicates that you are obese - grade III'); }
			}
			
			return false;
		});
		$(document).on('keyup','.bmi_height',function(event){
			if(event.which == 13){
				bmi_weight=$('.bmi_weight').val();
				bmi_height=$('.bmi_height').val();
				sex=$("input[name='sex']:checked").val();
				bmi_index=Math.round(bmi_weight / (bmi_height * bmi_height));
				$('.bmi_index p').html(bmi_index);
				if(lang=='vi'){
					if(bmi_index < 16 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị gầy độ III!'); }
					if(bmi_index >= 16 && bmi_index < 17 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị gầy độ II!'); }
					if(bmi_index >= 17 && bmi_index < 18.5 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị gầy độ I!'); }
					if(bmi_index >= 18.5 && bmi_index < 25){ $('.judge p').html('Chúc mừng bạn! Bạn có chỉ số BMI bình thường!'); }
					if(bmi_index >= 25 && bmi_index < 30 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị thừa cân!'); }
					if(bmi_index >= 30 && bmi_index < 35 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị béo phì độ I'); }
					if(bmi_index >= 35 && bmi_index <= 40 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị béo phì độ II'); }
					if(bmi_index > 40 ){ $('.judge p').html('Chỉ số BMI ở trên cho thấy bạn bị béo phì độ III'); }
				}else{
					if(bmi_index < 16 ){ $('.judge p').html('The BMI above indicates that you are thin - grade III'); }
					if(bmi_index >= 16 && bmi_index < 17 ){ $('.judge p').html('The BMI above indicates that you are thin - grade II'); }
					if(bmi_index >= 17 && bmi_index < 18.5 ){ $('.judge p').html('The BMI above indicates that you are thin - grade I'); }
					if(bmi_index >= 18.5 && bmi_index < 25){ $('.judge p').html('Congratulation! You have normal BMI score!'); }
					if(bmi_index >= 25 && bmi_index < 30 ){ $('.judge p').html('The BMI above indicates that you are overweight'); }
					if(bmi_index >= 30 && bmi_index < 35 ){ $('.judge p').html('The BMI above indicates that you are obese - grade I'); }
					if(bmi_index >= 35 && bmi_index <= 40 ){ $('.judge p').html('The BMI above indicates that you are obese - grade II'); }
					if(bmi_index > 40 ){ $('.judge p').html('The BMI above indicates that you are obese - grade III'); }
				}
			}
			return false;
		});
	}
	this.resize_height = function(){
		h_ = $(window).height();
		if($('.loading-face').length==0){
			if(h_ > h_wr){
				var h_ovr =  h_ - h_wr;
				$('.footer').css({'margin-top': h_ovr+0});
			}else{
				$('.footer').css({'margin-top': 0});
			}
		}

	}

	this.login_openid = function(){
		$('.login_openid').click(function(){
			var title = $(this).attr('data-title');
			var url = $(this).attr('data-url');
			self.window_open(title, url);
		});
	}
	
	this.window_open = function(title, url){
		var left = (screen.width/2)-(650/2);
		var top = (screen.height/2)-(450/2);

		window.open(url, title,'menubar=0,resizable=1,width=600,height=500,status=no,toolbar=no,menubar=no,location=no, top='+top+', left='+left);
	};
	this.news = function(){
	

	//input search
		$(document).on('keyup', 'input[name="email"]', function(event){
			var $this= $(this);
			$this.removeClass('error');
		});
		$(document).on('keyup', 'input[name="k"]', function(event){
			var $this= $(this);
			if ( event.which == 13 ) {
				var keywords= $('input[name="k"]').val();
				window.location= current_url + '?k=' + keywords;
			}
		});
		$('.box .search button').click(function() {
			var keywords= $('input[name="k"]').val();
			window.location= current_url + '?k=' + keywords;
		});
	//fancybox function
		function fancyConfirm(msg) {
		    $.fancybox({
				closeClick  : true,
				minWidth : 250,
				maxHeight : 130,
				autoCenter : true,
		        content : msg,
		        helpers : { 
					overlay : {closeClick: true}
				}
		    });
		}
	//input email
		$(document).on('keypress', 'input[name="email"]', function(event){
			if ( event.which == 13 ) {
				$('.get_news').trigger('click');
				return false;
			}
		});
		$(document).on('keyup', 'input[name="email"]', function(event){
			if ( event.which == 13 ) {
				$('.get_news').trigger('click');
				return false;
			}
		});

		$(document).on('click','.get_news',function(){
			$('.loading').css('display','block');
			email=$('.input_email').val();
			$.post(
				base_url_lang + 'news/ajax_send_mail', 
				{
					token	: 	token,
					email	:	email
				},
				function(data){
					if(data.status == 'success'){
						// alert(data.txt);
						fancyConfirm(data.txt);
						//window.location.reload();
						$('input[name="email"]').removeClass('error');
						$('input[name="email"]').val('');
						$('.loading').css('display','none');
						setTimeout(function(){ window.location.reload(); },3000);
					}else{
						var i=1
						$.each(data.error, function(index, value){
							if(i==1){ 
								$('input[name="'+value.field+'"]').addClass('error');
								txt=value.txt;
							}
							i++;
						});	
						// alert(txt);
						fancyConfirm(txt);
						$('.loading').css('display','none');
					}
				},'json'
			);
		});
		$(document).on('click','.get_news_mobile',function(){
			$('.loading').css('display','block');
			email=$('.input_email_mobile').val();
			$.post(
				base_url_lang + 'news/ajax_send_mail', 
				{
					token	: 	token,
					email	:	email
				},
				function(data){
					if(data.status == 'success'){
						// alert(data.txt);
						fancyConfirm(data.txt);
						//window.location.reload();
						$('input[name="email"]').removeClass('error');
						$('input[name="email"]').val('');
						$('.loading').css('display','none');
						setTimeout(function(){ window.location.reload(); },3000);
					}else{
						var i=1
						$.each(data.error, function(index, value){
							if(i==1){ 
								$('input[name="'+value.field+'"]').addClass('error');
								txt=value.txt;
							}
							i++;
						});	
						// alert(txt);
						fancyConfirm(txt);
						$('.loading').css('display','none');
					}
				},'json'
			);
		});
	};
	this.popup = function(){
		$(document).on('keyup', '.chat-content input', function(event){
			var $this= $(this);
			$(this).removeClass('error');
		});
		$(document).on('keyup', '.chat-content textarea', function(event){
			var $this= $(this);
			$(this).removeClass('error');
		});

	//fancybox function
		function fancyConfirm2(msg) {
		    $.fancybox({
				closeClick  : true,
				minWidth : 250,
				maxHeight : 130,
				autoCenter : true,
		        content : msg,
		        helpers : { 
					overlay : {closeClick: true}
				}
		    });
		}

		$(document).on('click','.chat-send',function(){
			$('.loading').css('display','block');
			name=$('#name_popup').val();
			email=$('#email_popup').val();
			content=$('#content_popup').val();
			$.post(
				base_url_lang + 'contact/ajax_send_mail_popup', 
				{
					token	: 	token,
					name	:	name,
					email	:	email,
					content	:	content
				},
				function(data){
					if(data.status == 'success'){
						// alert(data.txt);
						fancyConfirm2(data.txt);
						//window.location.reload();
						$('.form').trigger("reset");
						$('.chat-content input').removeClass('error');
						$('.chat-content textarea').removeClass('error');
						//$('.div_error').html('');
						$('.loading').css('display','none');
					}else{
						i=1;
						$.each(data.error, function(index, value){
							if(i==1){ 
								txt=value.txt; 
								$('input[name="'+value.field+'"]').focus(); 
								$('input[name="'+value.field+'"]').addClass('error');
								if(value.field=='content'){ 
									$('textarea[name="'+value.field+'"]').focus(); 
									$('textarea[name="'+value.field+'"]').addClass('error');
								}
								//$('.div_error').html(txt);
							}
							i++;
						});	
						$('.loading').css('display','none');
					}
				},'json'
			);
			
			return false;
		});
	};
	this.contact = function(){
		$(document).on('keyup', 'input', function(event){
			var $this= $(this);
			$(this).removeClass('error');
		});
		$(document).on('keyup', 'textarea', function(event){
			var $this= $(this);
			$(this).removeClass('error');
		});

	//fancybox function
		function fancyConfirm2(msg) {
		    $.fancybox({
				closeClick  : true,
				minWidth : 250,
				maxHeight : 130,
				autoCenter : true,
		        content : msg,
		        helpers : { 
					overlay : {closeClick: true}
				}
		    });
		}

		$(document).on('click','.send_mail',function(){
			$('.loading').css('display','block');
			name=$('.input_name').val();
			email=$('.input_email').val();
			title=$('.input_title').val();
			content=$('.input_content').val();
			$.post(
				base_url_lang + 'contact/ajax_send_mail', 
				{
					token	: 	token,
					name	:	name,
					email	:	email,
					title	:	title,
					content	:	content
				},
				function(data){
					if(data.status == 'success'){
						// alert(data.txt);
						fancyConfirm2(data.txt);
						//window.location.reload();
						$('.form').trigger("reset");
						$('input').removeClass('error');
						$('textarea').removeClass('error');
						$('.div_error').html('');
						$('.loading').css('display','none');
						setTimeout(function(){ window.location.reload(); },3000);
					}else{
						i=1;
						$.each(data.error, function(index, value){
							if(i==1){ 
								txt=value.txt; 
								$('input[name="'+value.field+'"]').focus(); 
								$('input[name="'+value.field+'"]').addClass('error');
								if(value.field=='content'){ 
									$('textarea[name="'+value.field+'"]').focus(); 
									$('textarea[name="'+value.field+'"]').addClass('error');
								}
								$('.div_error').html(txt);
							}
							i++;
						});	
						$('.loading').css('display','none');
					}
				},'json'
			);
			
			return false;
		});
	};
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Bat dau phan js cua Bao
	this.faq = function(){

	//set min-height faq-container

	var wHei = $(window).height() - 179;
	$('.faq-wrapper').css({'min-height': wHei});

	//chosen input

	$('select').chosen();

	//update url as select box's changed 

		$(document).on('change', 'select[name="select-view"]', function(){
			var $this= $(this);
			var pid= $this.val();
			var keywords= $('input[name="k"]').val();
			if(keywords=='Nhập từ khóa'){
				keywords='';
			}
			window.location= current_url + '?pid=' + pid + "&k=" + keywords;
		});
		$(document).on('keyup', 'input[name="k"]', function(event){
			var $this= $(this);
			if ( event.which == 13 ) {
				var pid= $('select[name="select-view"]').val();
				var keywords= $('input[name="k"]').val();
				window.location= current_url + '?pid=' + pid + "&k=" + keywords;
			}
		});
		$(document).on('click', 'button[type="submit"]', function(){
			var pid= $('select[name="select-view"]').val();
			var keywords= $('input[name="k"]').val();
			window.location= current_url + '?pid=' + pid + "&k=" + keywords;
		});

	//toggle show/hide answers when click button

		$('.question > .text , .question > .button').click(function() {
			var $this = $(this);
			if($this.parent().parent().hasClass('faq-active')){
				$('.answer').stop().slideUp();
				$this.parent().parent().removeClass('faq-active');
			}
			else{
				$('.answer').stop().slideUp();
				$('*').removeClass('faq-active');
				$this.parent().parent().addClass('faq-active');
				$this.parent().next().stop().slideDown();
			}
		});

	};

	this.stores = function(){

	//chosen input

		$('select').chosen()
		$(window).resize(function(event) {
			$('select').chosen()
		});
		$(document).on('change', 'select[name="select-view"]', function(){
			var $this= $(this);
			var pid= $this.val();
			window.location= current_url + '?pid=' + pid;
		});
		$(document).on('change', 'select[name="district-view"]', function(){
			var $this= $(this);
			var pid= $('select[name="select-view"]').val();
			var mid= $this.val();
			window.location= current_url + '?pid=' + pid + '&mid=' + mid;
		});
	// custom scroll bar

		$(".table").mCustomScrollbar();

	};
	
	this.products = function(){
// count pc slide
		var lth = $('.prd-banner .item').length;
		if(lth > 1){
			var owl = $('.prd-banner');
			owl.owlCarousel({
			    items:1,
			    loop:true,
			    margin:0,
			    autoplay:false,
			    autoplayTimeout:1500,
			    autoplaySpeed: 500,
			    autoplayHoverPause:true,
			    mouseDrag:true,
			    dots:true,
			    dotsEach:true,
			    nav:true,
			    navText:[],
			});
		}
		
// count mobile slide

		var lth2 = $('.prd-banner2 .item').length;
		if(lth2 > 1){
			var owl2 = $('.prd-banner2');
			owl2.owlCarousel({
			    items:1,
			    loop:true,
			    margin:0,
			    autoplay:false,
			    autoplayTimeout:1500,
			    autoplaySpeed: 500,
			    autoplayHoverPause:true,
			    mouseDrag:true,
			    dots:true,
			    dotsEach:true,
			    nav:true,
			    navText:[],
			});
		}
		
// chose pc or mobile version
	
	// function chosenOne(){
	// 	var wW = $(window).width();
	// 	console.log(wW);
	// 		if( wW < 641){
	// 			$('.prd-banner').css({'display':'none'});
	// 			$('.prd-banner2').css({'display':'block'});
	// 		}else{
	// 			$('.prd-banner').css({'display':'block'});
	// 			$('.prd-banner2').css({'display':'none'});
	// 		}
	// 		$('.prd-banner .item').css({'background-position': 'center top'});
	// 		$('.prd-banner2 .item').css({'background-position': 'center top'});
	// };

	// $(window).load(function(){
	// 	chosenOne();
	// });

	// $(window).resize(function(){
	// 	chosenOne();
	// });

	};
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Ket thuc phan js cua Bao
	
}
Page = new Page();
$(function(){
	Page.init();
});

	$(document).ready(function(){
	// HOVER BUTTON GỞI LIÊN HỆ	
		$('.changeImg').hover(
			function () {
				TweenMax.to($(this).find('img'), 0.4, {scaleX:1.1, scaleY:1.1, ease:Circ.easeOut});
			},
			function () {
				TweenMax.to($(this).find('img'), 0.2, {scaleX:1, scaleY:1, ease:Circ.easeOut});
			}
		);
		
	// CLICK BUTTON GỞI LIÊN HỆ	(HIỆU ỨNG)
		$('.contact-wrap .e-field button').on({
			mouseover: function(){
				$(this).css({'background': '#fff', 'border': '1px solid #4870ae', 'color': '#4870ae'});
			},
			mouseleave: function(){
				$(this).css({'background': '#4870ae', 'border': '1px solid #4870ae', 'color': '#fff'});
			},
			click: function(){
				$(this).css({'background': '#fff', 'border': '1px solid #4870ae', 'color': '#4870ae'});
			}
		});


	// CLICK THAY HINH (PRODUCT DETAIL)
		$("#zoom_me").bind("click", function(e) {  
			if ($(window).width() > 905) {
				var ez = $('#gallary_zoom').data('elevateZoom');	
				$.fancybox(ez.getGalleryList());
				return false;
			} 
		});

		$('.changeImg').on({
			'click': function(){
				var $url = $(this).find('img').attr('src');
				if($(window).width() < 905) {
					$('.prdt-img-wrap').find('img').attr('src', $url);
				}
			}
		});

	// HOVER ZOOM IMAGES
		if ($(window).width() > 905) {
			zoom_me();
		}

	// MOBILE MENU ON/OFF
		$('.click-me').click(function(){
			var $this = $(this);
			$('.mobile-menu-drop').slideToggle('fast');
			on_off($this);
		});

	// RESIZE WINDOWS CLOSE SUBMENU
		$(window).resize(function(){
			if ($('.click-me').hasClass('off')) {
				$('.click-me').removeClass('off');
				$('.click-me').addClass('on');
				$('.mobile-menu-drop').slideUp('fast');
			}
		});
	});

	// HOVER ZOOM IMAGES
	// if($(".present-img-wrap img").length < 0){
	// 	$('.present-img p').css({'display': 'none'});
	// }
	function zoom_me() {
		$("#zoom_me").elevateZoom({
			zoomWindowFadeIn : 400,
			zoomWindowFadeOut : 400,
			LensFadeIn: 400,
			LensFadeOut: 400,
			lensOpacity: 0.3,
			// lensSize: 450,
			scrollZoom : true,
			//tint: true,
			//tintColour: #333,
			zoomTintFadeIn: 400,
			zoomTintFadeOut: 400,
			easing : true,
			imageCrossfade: true, 
			gallery:'gallary_zoom', 
			cursor: 'pointer', 
			galleryActiveClass: 'active',
			loadingIcon: 'images/bx_loader.gif'
		});
	}

	// THAY DOI ICON SUB MENU
	function on_off($this_click) {
		if ($this_click.hasClass('on')) {
			$this_click.removeClass('on');
			$this_click.addClass('off');
		} else {
			$this_click.removeClass('off');
			$this_click.addClass('on');
		}
	}