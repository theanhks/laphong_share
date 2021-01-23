$(function() {

  $(".numbers-row").append('<div class="inc button">+</div><div class="dec button">-</div>');

  $(".button").on("click", function() {

    var $button = $(this);
    var oldValue = $button.parent().find("input").val();

    if ($button.text() == "+") {
  	  var newVal = parseFloat(oldValue) + 1;
  	} else {
	   // Don't allow decrementing below zero
      if (oldValue > 0) {
        var newVal = parseFloat(oldValue) - 1;
	    } else {
        newVal = 0;
      }
	  }

    $button.parent().find("input").attr('value', newVal);
    var new_img = '/templates/html/img/icon-check-cart.jpg';
    $button.closest(".ghtn-preview" ).find('.add-to-cart').find('img').attr('src',new_img);
    $button.closest(".ghtn-preview" ).find('.add-to-cart').removeClass('disable');
  });

});