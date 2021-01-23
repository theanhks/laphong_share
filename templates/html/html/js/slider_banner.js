	var owl_me;
	var h_wr = $('.wrapper').height();
	var h_ = $(window).height();
function Page(){
	var self = this;
	
	this.init = function(){ 
	
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
	};  
	this.products = function(){  
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
 

	};
 
	
}
Page = new Page();
$(function(){
	Page.init();
});

	 
	 