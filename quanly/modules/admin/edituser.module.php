<?php
/*************************************************************************
Edit user
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/users.class.php");
include_once(ROOT_PATH."classes/dao/usertypes.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = "adminedituser.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$users = new Users();
$usertypes = new UserTypes();
$infoClass = 'infoText';
$Id = $request->element('oId');

$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$searchUserType = $request->element('searchUserType','-1');
$orderBy = $request->element('orderBy','id');
$orderDir = $request->element('orderDir','ASC');
$page= $request->element('page',1);
if($Id) {
	$type = $request->element('type');
	$username = $request->element('username','');
	$fname = $request->element('fname',0);
	$lname = $request->element('lname','');
	$about = $request->element('about','');
	$email = $request->element('email','');
	$company = $request->element('company','');
	$tax = $request->element('tax','');
	$address = $request->element('address','');
	$address2 = $request->element('address2','');
	$tel = $request->element('tel','');
	$fax = $request->element('fax','');
	$cell = $request->element('cell','');
	$status = $request->element('status',-1);
	$date_created = date("Y-m-d H:i:s");
	$last_login = '0000-00-00 00:00:00';
	$editUser = $users->getObject($Id);
	$template->assign("listObject",$editUser);
	$listStatus = optionStatus($searchStatus);
	$template->assign("listStatus",$listStatus);
	$listUserType = $usertypes->comboListObjects('id','vn_type',$searchUserType);
	$template->assign("listUserType",$listUserType);	
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$user = new UserInfo($username, '', $email, $about, $fname, $lname, $company, $tax, $address, $address2, $tel, $fax, $cell, $type, $date_created, $last_login, $status, $properties = '');
			$fields = array('username'=>$user->getUsername(),
							'email'=>$user->getEmail(),
							'about'=>$user->getAbout(),
							'fname'=>$user->getFName(),
							'lname'=>$user->getLName(),
							'company'=>$user->getCompany(),
							'tax'=>$user->getTax(),
							'address'=>$user->getAddress(),
							'address2'=>$user->getAddress2(),
							'tel'=>$user->getTel(),
							'fax'=>$user->getFax(),
							'cell'=>$user->getCell(),
							'type'=>$user->getType(),
							'date_created'=>$user->getDateCreated(),
							'last_login'=>$user->getLastLogin(),
							'status'=>$user->getStatus(),
							'properties'=>''
							);
			$users->updateData($fields, $Id);
			$infoText = $amessages['item_inserted_ok'];
			$infoClass = "InfoText";
			$act = 'list';
			$template->assign("act",$act);
			
			$templateFile = 'adminlistuser.temp.html';
			$pages = $users->getNumItems();
			$pages = $pages['pages'];
			$rows = $pages['rows'];
			if($page > $pages) $page = $pages;
			$usersItems = $users->getObjects($page, 'status!=3', array($orderBy => $orderDir));
			$template->assign('listObjects',$usersItems);
			$listPage = linkPager(ADMIN_SCRIPT."?op=admin&amp;part=user&amp;act=list&amp;page=%s",$pages, $page);
			$template->assign("adminPager",$listPage);
			
			$template->assign('users',$users);
			$template->assign('usertypes',$usertypes);
			$template->assign("rows",$rows);
			$template->assign("pages",$page);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
		}else {
			$infoText = $amessages['item_inserted_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign('status',$status);
			$template->assign('username',$username);
			$template->assign('fname',$fname);
			$template->assign('lname',$lname);
			$template->assign('about',$about);
			$template->assign('email',$email);
			$template->assign('address',$address);
			$template->assign('address2',$address2);
			$template->assign('fax',$fax);
			$template->assign('tax',$tax);
			$template->assign('tel',$tel);
			$template->assign('cell',$cell);
			$template->assign('type',$type);

		}
	}
}
function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validUsername($amessages['user_type'],$request->element('type'));
	$infoText .= $validate->validUsername($amessages['username'],$request->element('username'));
	$infoText .= $validate->validString($amessages['fullname'],$request->element('fname'));
	$infoText .= $validate->validString($amessages['lastname'],$request->element('lname'));
	$infoText .= $validate->validEmail($amessages['email'],$request->element('email'));
	return $infoText;
}
?>