$(document).ready(function () {
    $('.toggle-password').on('mousedown', function(event) {

        $(this).prev( "input" ).attr( "type", "text" );
    });
    $('.toggle-password').on('mouseup', function(event) {

        $(this).prev( "input" ).attr( "type", "password" );

    });

});