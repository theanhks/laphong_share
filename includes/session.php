<?php
/*************************************************************************
Session manager
----------------------------------------------------------------
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/

# Set to 9 if you want to debug
error_reporting(9);

# Autodetect current root folder
if (!defined('ROOT_PATH')) {
	define('ROOT_PATH', dirname(__FILE__).'/');
}

include_once(ROOT_PATH.'classes/dao/members.class.php');
$members = new Members();
# Start session
session_start();		
# Need to be re-coded here. We need a class
# If there is a session varibale 'userId', assign a global UserInfo object named 'authUser'
if(isset($_SESSION['memberId'])) {
	$userInfo = $members->getObject($_SESSION['memberId']);
	$template->assign('authUser',$userInfo);							
}
?>