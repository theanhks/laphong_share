<?php
/*************************************************************************
Change Password
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd
Name: Nguyen Anh Ngoc                                
Last updated: 28/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/users.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = "systemchangepassword.temp.html";
$users = new Users();
$infoClass = 'infoText';

$old_pass = $request->element("old_pass",'');
$current = md5($old_pass);
$pass = $request->element("pass",'');
$newpass = md5($pass);
$Id = $_SESSION['userId'];
$userItem = $users->getObject($Id);
$template->assign("listObject",$userItem);
$oldPass = $userItem->getPassword();
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	$validate = validateData($request);
	if($validate == '') {
		if($current == $oldPass) {
			$users->changePassword($Id, $newpass);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "InfoText";
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
		}else {
			$infoText = $amessages['current_pass_failed']."<br />".$validate;
			$infoClass = "infoText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
		}
	}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "infoText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("old_pass",$old_pass);
			$template->assign("pass",$pass);
			$template->assign("confirm",$confirm);
	}
	
}
function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validPassword($amessages['current_pass'],$request->element('old_pass'));
	$infoText .= $validate->validPassword($amessages['password'],$request->element('pass'));
	$infoText .= $validate->validTestPass($amessages['testpass'],$request->element('pass'),$request->element('confirm'));
	return $infoText;
}
?>