<?php
/*************************************************************************
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/

//error_reporting  (E_ERROR | E_WARNING | E_PARSE) ;
//ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH."plugins/authimg/authimg.php");
include_once(ROOT_PATH."includes/functions.php");
include_once(ROOT_PATH."classes/dao/members.class.php");
include_once(ROOT_PATH."classes/dao/phpmailer.class.php");
include_once(ROOT_PATH."classes/dao/smtp.class.php");
include_once(ROOT_PATH."classes/dao/configs.class.php");
$configs = new Configs();
$members = new Members();
$templateFile = "profile.tpl.html";
$listyear=listYear(2010,1910);
$template->assign("listyear",$listyear);
$listmonth=listMonth();
$template->assign("listmonth",$listmonth);
$listDays=listDays();
$template->assign("listDays",$listDays);
$listgender=listGender();
$template->assign("listgender",$listgender);
$username =$request->element('username','');
$password =$request->element('password','');
$fullname =$request->element('fullname','');
$day = $request->element('day','');
$month = $request->element('month','');
$year = $request->element('year','');
$birthday=$day."-".$month."-".$year;
$email = $request->element('email','');
$country = $request->element('country','');
$company = $request->element('company','');
$tinh = $request->element('city','');
$phai = $request->element('gender','');
$address = $request->element('address','');
$password_old = $userInfo->getPass();
$tel = $request->element('tel','');
$fax = $request->element('fax','');
$cel = $request->element('cel','');
$chk_service= $request->element('chk_service');
$chk_product= $request->element('chk_product');
$chk_visistor= $request->element('chk_visistor');
$chk_project= $request->element('chk_project');
$chk_isvietcons= $request->element('chk_isvietcons');
$chk_ispartner= $request->element('chk_ispartner');

$property=array('chk_service'=>$chk_service,'chk_product'=>$chk_product,'chk_visistor'=>$chk_visistor,'chk_project'=>$chk_project,'chk_isvietcons'=>$chk_isvietcons,'chk_ispartner'=>$chk_ispartner);
$properties= serialize($property);
$comment=$messages["register_email_body"];
$userId = $_SESSION['memberId'];
if($userId){
	if($_POST){
		 $validate = validateData($request);
		 if($validate == '') {
			 
			 if($password=='')
			 	$password= $password_old;
			$passmd5 = md5($password);
				$member = new MemberInfo($username,$passmd5,0,$fullname,$birthday,"",$email,$country,$tinh,$company,$phai,$address,$tel,$fax,$cel,date("Y-m-d H:i:s"),date("Y-m-d H:i:s"),$status = 1,$properties,'');
				
				$fields = array(
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
				
				$members->updateData($fields,$userId);
				$error = $messages["update_ok"];
				$template->assign("error",$error);
				$template->assign("infoClass","info");
	}else{
		$error = $messages["update_error"]."<br />".$validate;
		$template->assign("error",$error);
		$template->assign("infoClass","info");	
	}
}
}
$propertiesItem= $userInfo->getProperties();
$chk_service_old= $propertiesItem['chk_service'];
$template->assign("chk_service_old",$chk_service_old);
$chk_product= $propertiesItem['chk_product'];
$template->assign("chk_product",$chk_product);
$chk_visistor= $propertiesItem['chk_visistor'];
$template->assign("chk_visistor",$chk_visistor);
$chk_project= $propertiesItem['chk_project'];
$template->assign("chk_project",$chk_project);
$chk_isvietcons= $propertiesItem['chk_isvietcons'];
$template->assign("chk_isvietcons",$chk_isvietcons);
$chk_ispartner= $propertiesItem['chk_ispartner'];
$template->assign("chk_ispartner",$chk_ispartner);

function validateData($request) {
	global $messages;
	$members = new Members();
	$error = '';
		if($members->checkDuplicate($request->element('username'),"username"))
			$error .= $messages['duplicate_username'];
		if($members->checkDuplicate($request->element('email'),"email"))
			$error .= $messages['duplicate_email'];
	return '';
}


#menu 
include_once(ROOT_PATH."classes/dao/categories.class.php");
$categories = new Categories();
$menulefItems = $categories->getObjects(1,"pid = 0 AND status=1",array('position'=>'ASC'),'');
$template->assign('menulefItems',$menulefItems);
$template->assign('categories',$categories);
include_once(ROOT_PATH."classes/dao/procategories.class.php");
$procategories = new ProductCategories();
$proleftItems = $procategories->getObjects(1,"pid = 0 AND status=1",array('position'=>'ASC'),'');
$template->assign('proleftItems',$proleftItems);
$template->assign('procategories',$procategories);
#end menu
#support
include_once(ROOT_PATH."classes/dao/parts.class.php");
$parts = new Parts();
$partItems = $parts->getObjects(1,"status =1",array('id'=>'ASC'),'');
$template->assign('partItems',$partItems);
$template->assign('parts',$parts);
#end support
?>