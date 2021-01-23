<?php
/*************************************************************************
Admin Sessions manager
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 15/07/2008
Author: Mai Minh (http://maiminh.vnweblogs.com)
**************************************************************************/
/* Edit log:
- 30/09/2009 00:34 - Mai Minh: Initialize
*/

# Set to 9 if you want to debug
error_reporting(9);

include_once(ROOT_PATH.'classes/dao/users.class.php');
$users = new Users;

# Start session
session_start();							# Need to be re-coded here. We need a class

# If there is a session varibale 'userId', assign a global UserInfo object named 'authUser'
if(isset($_SESSION['userId']) && $_SESSION['userId']) {
	$userId = $_SESSION['userId'];
	$userInfo = $users->getUserInfo($userId);
	$template->assign('authUser',$userInfo);
} else {
	$op = 'login';
	$template->assign('amessages',$amessages);	
	include_once(ADMIN_ROOT_PATH.'modules/login.module.php');
}
?>