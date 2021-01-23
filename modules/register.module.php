<?php
/*************************************************************************
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/

error_reporting(E_ALL) ;
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH."plugins/authimg/authimg.php");
include_once(ROOT_PATH."includes/functions.php");
include_once(ROOT_PATH."classes/dao/members.class.php");
include_once("class.phpmailer.php");
include_once("class.smtp.php");
include_once(ROOT_PATH."classes/dao/configs.class.php");
include_once(ROOT_PATH."modules/framework.module.php");
$configs = new Configs();
$members = new Members();
$templateFile = (isset($lang) && $lang == 'en') ?"register-en.tpl.html" : "register.tpl.html";
$username =$request->element('username','');
$password =$request->element('password','');
$fullname =$request->element('fullname','');
$birthday=$request->element('birthday','');
$email = $request->element('email','');
$country = $request->element('country','');
$website = $siteConfigs->getProperty('website');
$company = $request->element('company','');
$tinh = $request->element('city','');
$phai = $request->element('gender','');
$address = $request->element('address','');
$tel = $request->element('tel','');
$fax = $request->element('fax','');
$cel = $request->element('cel','');
$chk_service= $request->element('chk_service');
$chk_product= $request->element('chk_product');
$chk_visistor= $request->element('chk_visistor');
$chk_project= $request->element('chk_project');
$chk_isvietcons= $request->element('chk_isvietcons');
$chk_ispartner= $request->element('chk_ispartner');
$lang = $request->element('lang','vn');

$pageName = $lang == 'en' ? "Register" : "Đăng ký";
$template->assign('pageName',$pageName);
$property=array('chk_service'=>$chk_service,'chk_product'=>$chk_product,'chk_visistor'=>$chk_visistor,'chk_project'=>$chk_project,'chk_isvietcons'=>$chk_isvietcons,'chk_ispartner'=>$chk_ispartner);
$properties= serialize($property);
$comment="Đăng ký tài khoản thành công";

if($_POST){
    $lang = $request->element('lang','vn');
		 $validate = validateData($request);
		 if($validate == '') {
			 $passmd5 = md5($password);
				$member = new MemberInfo($username,$passmd5,0,$fullname,$birthday,"",$email,$country,$tinh,$company,$phai,$address,$tel,$fax,$cel,date("Y-m-d H:i:s"),date("Y-m-d H:i:s"),$status = 1,$properties,'');
				
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
				$admin_mail = ADMIN_EMAIL;
				$ip = $_SERVER["REMOTE_ADDR"];
			$user_agent = $_SERVER['HTTP_USER_AGENT'];
			$response="\n$comment\nEmail: $email\nPassword: $password\nName: $fullname\nAddress: $address\n";
			//mail("info@mypapit.net","Contact form fakapster",$response, $headers);

             $mail = new PHPmailer();

             $mail->IsSMTP(); // set mailer to use SMTP

             $mail->Host =SMTP_HOST; // specify main and backup server
             $mail->Port = SMTP_PORT; // set the port to use
             $mail->SMTPAuth = true; // turn on SMTP authentication
             $mail->SMTPSecure = SMTP_SECURE;
             //     $mail->Port = 587;
             //$mail->SMTPSecure = SMTP_SECURE;
             $mail->Username = SMTP_USER; // your SMTP username or your gmail username
             $mail->Password = SMTP_PASSWORD; // your SMTP password or your gmail password

             $mail->From = $admin_mail;
             $mail->FromName = DOMAIN;

             $mail->Subject = "Thông tin đăng ký thành viên từ hệ thống website ".$website;
             $mail->Body = $response;
             $mail->AddAddress($email,$email);
             $mail->AddReplyTo($email,$fullname);
             $mail->Send();
             $mail->ClearAddresses();
             $mail->ClearAttachments();
             $error = $messages["register_ok"];
			$template->assign("error",$error);
			$template->assign("infoClass","info");
             header("location: /".$lang.'/login.html');
	}else{
		$error = $messages["register_error"]."<br />".$validate;
		$template->assign("error",$error);
		$template->assign("infoClass","info");
		$template->assign("username",$username);
		$template->assign("address",$address);	
		$template->assign("tel",$tel);
		$template->assign("email",$email);			
	}
}

$typePage = 'dang-ky';
$template->assign('typePage',$typePage);
function validateData($request) {
	global $messages;
	$members = new Members();
	$error = '';
		if($members->checkDuplicate($request->element('username'),"username"))
			$error .= $messages['duplicate_username'];
		if($members->checkDuplicate($request->element('email'),"email"))
			$error .= $messages['duplicate_email'];
	return $error;
}

$plus = $request->element('plus','');
if ($plus == 'apply'){ 
	 $addon = $request->element('addon','');
	$templateFile = "registerapply.temp.html";
	$user = $members->getRecordFromU($addon);
	if ($user){
		$id = $user->getId();
		$members->changeStatus($id ,1);
	}
}
?>