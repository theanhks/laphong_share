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
	 
 
	 
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Ket thuc phan js cua Bao
	
}
Page = new Page();
$(function(){
	Page.init();
});
 
 