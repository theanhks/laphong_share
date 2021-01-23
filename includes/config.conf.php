<?php
/*************************************************************************
**************************************************************************/
# Please change to your server 
$config["db_pconnect"] = "0";
$config["db_type"] = "mysql";
$config["db_server"] = "27.0.12.102";
$config["db_user"] = "theanh";
$config["db_pwd"] = "Abc123!#";
$config["db_name"] = "admin_laphong";
/*$config["db_server"] = "localhost";
$config["db_user"] = "root";
$config["db_pwd"] = "";
$config["db_name"] = "laphong";*/
$languages = array("vn","en");
#----- Please do not edit from this line -----
# Allowed front-end operations	
	$op = array(
		"splash",					# Show splash page
		"index",					# Show index page
		"login",					# Login
		"logout",					# Log out
		"authimg",					# Authimage
		"static",					# Static pages
		"news",						# News module
		"newsdetail",				# News detail
		"sale",						# Sale module
		"saledetail",				# Sale detail		
		"booking",					# Booking
		"branch",					# Branch
		"register",					# Register
		"changepassword",			# Member change password
		"profile",					# Profile
		"addon",
		"menu",		
		"menudetail",	
		"galleryalbum",
		"ordermenus",
		"listmenu",
		"contactform",
		"listorder",
		"order",
		"changpass",
		"questions",
		"galleryalbum",
		"galleryresource",
		"registerclass"
	);
?>