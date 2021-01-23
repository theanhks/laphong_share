<?php
/*************************************************************************
Add member
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/members.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageaddmember.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$members = new Members();
$infoClass = 'infoText';
$username = $request->element('username','');
$page = $request->element('page',1);
$pass = $request->element('pass','');
$confirm = $request->element('confirm','');
$password = md5($pass);
$fullname = $request->element('fullname','');
$about = $request->element('about','');
$email = $request->element('email','');
$company = $request->element('company','');
$address = $request->element('address','');
$country = $request->element('country','');
$phai = $request->element('phai',1);
$tinh = $request->element('tinh','');
$tel = $request->element('tel','');
$fax = $request->element('fax','');
$status = $request->element('status',-1);
$date_created = date("Y-m-d H:i:s");
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$orderBy = $request->element('orderBy','id');
$orderDir = $request->element('orderDir','ASC');
$chk_service= $request->element('chk_service');
$chk_product= $request->element('chk_product');
$chk_visistor= $request->element('chk_visistor');
$chk_project= $request->element('chk_project');
$chk_isvietcons= $request->element('chk_isvietcons');
$chk_ispartner= $request->element('chk_ispartner');
$property=array('chk_service'=>$chk_service,'chk_product'=>$chk_product,'chk_visistor'=>$chk_visistor,'chk_project'=>$chk_project,'chk_isvietcons'=>$chk_isvietcons,'chk_ispartner'=>$chk_ispartner);
$properties= serialize($property);
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	$validate = validateData($request);
	if($validate == '') {
        $member = new MemberInfo($username,$password,0,$fullname,$birthday,"",$email,$country,$tinh,$company,$phai,$address,$tel,$fax,$cel,date("Y-m-d H:i:s"),date("Y-m-d H:i:s"),$status = 1,$properties,'');

        $fields = array('username'=>$member->getUsername(),
            'password'=>$member->getPass(),
            'fullname'=>$member->getFullname(),
            'type'=>$member->getType(),
            'birthday'=>$member->getBirthday(),
            'about'=>$member->getAbout(),
            'email'=>$member->getEmail(),
            'country'=>$member->getCountry(),
            'tinh'=>$member->getTinh(),
            'company'=>$member->getCompany(),
            'phai'=>$member->getPhai(),
            'address'=>$member->getAddress(),
            'tel'=>$member->getTel(),
            'fax'=>$member->getFax(),
            'cel'=>$member->getCel(),
            'date_created'=>$member->getDateCreted(),
            'last_login'=>$member->getLastLogin(),
            'status'=>$member->getStatus(),
            'properties'=>$member->setProperties()
        );
        //print_r($fields);
        $members->addData($fields);


		///

        ///
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		$act = 'list';
		$template->assign("act",$act);
		
		$templateFile = 'managelistmembers.temp.html';
		$pages = $members->getNumItems();
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		
		if($page > $pages) $page = $pages;
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=member&amp;act=list&amp;page=%s",$pages, $page);
		$template->assign("adminPager",$listPage);
		$membersItems = $members->getObjects($page, '1=1', array($orderBy => $orderDir));
		$template->assign('listObjects',$membersItems);
		$template->assign('categories',$members);
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
		$template->assign('fullname',$fullname);
		$template->assign('about',$about);
		$template->assign('email',$email);
		$template->assign('address',$address);
		$template->assign('company',$company);
		$template->assign('country',$country);
		$template->assign('tinh',$tinh);
		$template->assign('fax',$fax);
		$template->assign('tel',$tel);
		$template->assign('pass',$pass);
		$template->assign('confirm',$confirm);
	}
}
$listStatus = optionStatus($searchStatus,DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);
$listGender = listGender();
$template->assign("listGender",$listGender);
function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$members = new Members();
	//$infoText .= $validate->validUsername($amessages['username'],$request->element('username'));
	$infoText .= $validate->validPassword($amessages['pass'],$request->element('pass'));
	$infoText .= $validate->validTestPass($amessages['testpass'],$request->element('pass'),$request->element('confirm'));
	$infoText .= $validate->validString($amessages['fullname'],$request->element('fullname'));
	$infoText .= $validate->validEmail($amessages['email'],$request->element('email'));
	/*if($members->checkDuplicate($request->element('username'),"username"))
	$infoText .= $amessages['duplicate_username'];*/
	if($members->checkDuplicate($request->element('email'),"email"))
	$infoText .= $amessages['duplicate_email'];
	return $infoText;
}
?>