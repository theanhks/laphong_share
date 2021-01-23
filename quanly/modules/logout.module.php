<?php
/*************************************************************************
Admin Logout module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 02/07/2008
**************************************************************************/
$_SESSION['userId'] = 0;
$_SESSION['userName'] = '';
$_SESSION['userType'] = 0;
			
if(isset($_SESSION['adminId'])) {
	
	$_SESSION['userId'] = $_SESSION['adminId'];
	$_SESSION['adminId'] = '';
	header('location: '.ADMIN_SCRIPT.'?op=login');
} else {
	header('location: '.ADMIN_SCRIPT);
}
?>