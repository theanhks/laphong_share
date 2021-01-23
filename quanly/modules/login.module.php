<?php
/*************************************************************************
Login module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 02/07/2008
**************************************************************************/

$templateFile = "login.temp.html";
$error ='';
if($_POST) {
	$username = trim($request->element("username"));
	$password = trim($request->element("password"));
	$userId = $users->authenticateUser($username,$password);
	if($userId) {
		$_SESSION['userId'] = $userId;
		header('location: '.ADMIN_SCRIPT.'?op=index');
	} else {
		$_SESSION['userId'] = 0;
		$error = $amessages['invalid_user_password'];
	}
	$template->assign('error',$error);	
}
?>