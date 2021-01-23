 
/*--------------------MENU_TOGGLE--------------------*/
 
$(document).ready(function(){ 
	$(".box-menu").show(); 
	$(".box-menu").addClass("hide-menu");
    $(".menu-button").click(function(){ 
        $(".box-menu").toggle(); 
    });
});
   
 /*--------------------UP-TOP-BUTTON--------------------*/
$(document).ready(function () {
      $().UItoTop();
  });  
   
   
/*--------------------BANNER--------------------*/
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
		$(window).load(function(){
			h_wr = $('.wrapper').height();
			self.resize_height();
		})
		$(window).resize(function(){
			self.resize_height();
		})
	};
   
}
Page = new Page();
$(function(){
	Page.init();
});

 
 $(document).ready(function() {
      $('#owl-demo').owlCarousel({
        autoPlay: 70000,
        items :1,
		navigationText:["",""],
		navigation: true,
		slideSpeed: 10000,
		singleItem:true,
		stopOnHover: true,
   		mouseDrag: true,			
		touchDrag: true,	
      });

    });
	
	

/*--------------------SHOW-HIDE-MENU--------------------*/ 
function luxFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}



 
 
/*--------------------STICKY-MENU-HEADER--------------------*/
 
 // When the user scrolls the page, execute myFunction 
window.onscroll = function() {myFunction()};
var navbar = document.getElementById("navbar");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}

 

 

/*SLIDE IMAGE PRODUCT*/

jQuery(window).load(function() {
	jQuery("#slider-carousel").flexslider({
		animation: "slide",
		controlNav: false, 
		itemWidth: 120, 
		itemMargin: 5,
		animationLoop: false,
		slideshow: true, 
		slideshowSpeed:2000, // slider show speed
		controlsContainer: "#slider-carousel .flex-nav-container",
		asNavFor: "#slider-1",  // slider ID                                         
		prevText: "←", 
		nextText: "→"  
	});

	jQuery("#slider-1").flexslider({
		animation: "slide",
		controlNav: false,
		animationLoop: false,
		slideshowSpeed:8000, // carousel show speed
		slideshow: true,
		smoothHeight: true,
		directionNav: false,
		sync: "#slider-carousel", // carousel ID - thumbnail holder div
	}); 
});  

 

 
	
/*-----------------TOGGLE_MENU-------------------*/				
			 
(function(jQuery){
     jQuery.fn.extend({  
         accordion: function() {       
            return this.each(function() { 
            });
        } 
    }); 
})(jQuery);
 
   
$(document).ready(function() {		
jQuery("#menu-icon").on("click", function(){	
  jQuery(".sf-menu-phone").slideToggle();
  jQuery(this).toggleClass("active");
 });
    
  jQuery('.sf-menu-phone').find('li.parent').append('<i class="fa fa-chevron-down"></i>');
  jQuery('.sf-menu-phone li.parent i').on("click", function(){
   if (jQuery(this).hasClass('icon-angle-up')) { jQuery(this).removeClass('icon-angle-up').parent('li.parent').find('> ul').slideToggle(); } 
    else {
     jQuery(this).addClass('icon-angle-up').parent('li.parent').find('> ul').slideToggle();
    }
  }); 
});

 
 
 
 
 
 	 

  
		
/*-----------------CUSTOMER-SLIDE--------------------*/				
 $(document).ready(function() {
  $('.logo-slider .owl-carousel-1').owlCarousel({
	loop: true,
	margin: 0,
	nav: false,
	dots: false,
	autoplay:5,				
	autoplaySpeed:500,
	responsiveClass: true,
	responsive: {
	  0:{items: 2},
	  500:{items: 4},
	  1000:{items: 5},
	  1200:{items: 6}
	}
  })
})

	 
	 
 

// Get the elements with class="column"
var elements = document.getElementsByClassName("column-list");

// Declare a loop variable
var i;

// List View
function listView() {
  for (i = 0; i < elements.length; i++) {
    elements[i].className = "column-list listview";
  }
}

// Grid View
function gridView() {
  for (i = 0; i < elements.length; i++) {
    elements[i].className = "column-list gridview";
  }
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
		
/*-----------------TANG-GIAM SO LUONG SP--------------------*/	

$('.btn-number').click(function(e){
    e.preventDefault();
    
    fieldName = $(this).attr('data-field');
    type      = $(this).attr('data-type');
    var input = $("input[name='"+fieldName+"']");
    var currentVal = parseInt(input.val());
    if (!isNaN(currentVal)) {
        if(type == 'minus') {
            
            if(currentVal > input.attr('min')) {
                input.val(currentVal - 1).change();
            } 
            if(parseInt(input.val()) == input.attr('min')) {
                $(this).attr('disabled', true);
            }

        } else if(type == 'plus') {

            if(currentVal < input.attr('max')) {
                input.val(currentVal + 1).change();
            }
            if(parseInt(input.val()) == input.attr('max')) {
                $(this).attr('disabled', true);
            }

        }
    } else {
        input.val(0);
    }
});
$('.input-number').focusin(function(){
   $(this).data('oldValue', $(this).val());
});
$('.input-number').change(function() {
    
    minValue =  parseInt($(this).attr('min'));
    maxValue =  parseInt($(this).attr('max'));
    valueCurrent = parseInt($(this).val());
    
    name = $(this).attr('name');
    if(valueCurrent >= minValue) {
        $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    if(valueCurrent <= maxValue) {
        $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the maximum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    
    
});
 