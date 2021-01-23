<?php
/*************************************************************************
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/

error_reporting  (E_ALL) ;
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH."modules/framework.module.php");
include_once(ROOT_PATH."includes/functions.php");
include_once(ROOT_PATH."classes/dao/members.class.php");
include_once("class.phpmailer.php");
include_once("class.smtp.php");
$members = new Members();
$templateFile = "forgotpass.tpl.html";
$email = $request->element('email','');
$username = $request->element('username','');
$pageName = isset($lang) && $lang == 'en'? 'Forgot pass':"Quên mật khẩu";
$template->assign('pageName',$pageName);
if($_POST){
        $result = 0;
        if(trim($email) != ''){
            $result= $members->checkDuplicate($email,"email");
        }

		#$result1= $members->checkDuplicate($username,"username");
		if($result==1)
		{
			$userItem= $members->getRecordFromEmail($email);
			$userId = $userItem->getId();
			$new_pass=rand();
			$passmd5= md5($new_pass);
			$fields =array('password'=>$passmd5);
			$members->updateData($fields,$userId,'id');
			$comment=$messages["forgot_pass"];
			$admin_mail = $siteConfigs->getProperty('admin_mail');
			$ip = $_SERVER["REMOTE_ADDR"];
			$user_agent = $_SERVER['HTTP_USER_AGENT'];
			$response="\n$comment\nPassword: $new_pass\n";
			

			$mail = new PHPmailer();
			$mail->IsSMTP(); // set mailer to use SMTP
			
			$mail->Host =SMTP_HOST; // specify main and backup server
			$mail->Port = SMTP_PORT; // set the port to use
			$mail->SMTPAuth = true; // turn on SMTP authentication
            $mail->SMTPSecure = SMTP_SECURE;
			$mail->Username = SMTP_USER; // your SMTP username or your gmail username
			$mail->Password = SMTP_PASSWORD; // your SMTP password or your gmail password
			
			$mail->From = $admin_mail;
			$mail->FromName = DOMAIN;
			
			$website = $siteConfigs->getProperty('website');
			$mail->Subject = "Thông tin thay đổi mật khẩu từ hệ thống website ".$website;
			$mail->Body = $response;
			$mail->AddAddress($email,$email);
			#$mail->AddReplyTo($email,$fullname);
			$mail->Send(); 	
			$mail->ClearAddresses();
			$mail->ClearAttachments();
			if($mail->Send()){
                $error = $messages["forgot_ok"];
                $template->assign("error",$error);
            }

		}
		else
		{
			$error = "Email này chưa được đăng ký trong hệ thống";
			$template->assign("error",$error);
		}
}
?>