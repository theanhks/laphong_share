<?php 
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once("class.phpmailer.php");
include_once("class.smtp.php");
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH.'classes/dao/customers.class.php');
include_once(ROOT_PATH."classes/dao/configs.class.php");
include_once(ROOT_PATH.'classes/dao/email.class.php');
$templateFile = "managesendemail.temp.html";
$configs = new Configs();
$config = $configs->getObject("general");
$customers= new Customers();
$savemail= new SaveEmail();
$subject = $request->element('subject','');
$mailcontent = $request->element('mailcontent','');
$action = $request->element('plus','');
$save = $request->element('save','');
$status = $request->element('status',0);
$infoText = '';
$infoClass = 'infoText';
$mail_bcc = $request->element('mail_bcc','');
$adminmail = $config->getProperty('admin_mail');
$company = $config->getProperty('company');
if($_POST){
	//echo 'phan nay la lưu email ne';
	 $validate = validateData($request);
	if($validate == '') {
		if($action=='send'){
			$listSendemailItems = $customers->getObjects(1,"status=1",'','');
			//print_r($listSendemailItems);
			$count= count($listSendemailItems);
			$listemail='';
				if ($listSendemailItems){
						for($i=0;$i<$count;$i++){
							$mailItem=$listSendemailItems[$i];
							$email= $mailItem->getEmail();
							$code=$mailItem->getNhom();
							$listemail .=$email;	
							$listemail .=';';
							$titleEmail=$subject;
							$response=$mailcontent;
							$response .="Để ngưng không nhận email, vui lòng ";
							$link="<a href=".ROOTPATH."index.php?op=deletecustomer&email=$email&lang=vn&code=$code'>click vào đây</a>";
							$response .=$link;
							$listemailItems=array();
							$listemailItems[]=$email;
							$Body=$response;
							
							$mail = new PHPMailer();
							$mail->IsSMTP(); // set mailer to use SMTP
							$mail->Host =SMTP_HOST; // specify main and backup server
							$mail->Port = SMTP_PORT; // set the port to use
							$mail->SMTPAuth = true; // turn on SMTP authentication
							$mail->SMTPSecure = 'ssl';
							$mail->Username = SMTP_USER; // your SMTP username or your gmail username
							$mail->Password = SMTP_PASSWORD; // your SMTP password or your gmail password
							$from = SMTP_USER; // Reply to this email
							$to=$email; // Recipients email ID
							$name=$company; // Recipient's name
							$mail->header = 'Content-Type: text/html; charset=utf-8'."\r\n";
							$mail->From = $from;
							$mail->FromName = $company; // Name to indicate where the email came from when the recepient received
							$mail->AddAddress($email,$email);
							$mail->AddReplyTo($adminmail,$adminmail);
							$mail->WordWrap = 50; // set word wrap
							$mail->IsHTML(true); // send as HTML
							$mail->Subject =$subject;
							$mail->Body = $response; //HTML Body
							//$mail->AltBody = "Mail nay duoc goi bang phpmailer class. - bloghoctap.com"; //Text Body
							//$mail->SMTPDebug = 2;
							if(!$mail->Send())
								{
									$error = $messages['error_ok'].'<br />';
								}
						}
				}
			$sendmailok=1;
			$infoText = 'Chúc mừng bạn. Email của bạn đã được gửi thành công.';
			$infoClass = "infoText";
			$template->assign("sendmailok",$sendmailok);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign('gId',$gId);	
			//echo $listemail;
			//print_r($listemailItems);
			# lưu lại email đã gửi
			//$listemail=implode(";",$listemailItems);
			$data = new EmailInfo($listemail, $mail_bcc, '', $subject, $mailcontent, 1, date("Y-m-d H:i:s"));
			$fields = array ('to'=>$data->getTo(),
							'cc'=>$data->getCc(),
							'subject'=>$data->getSubject(), 
							'attach'=>$data->getAttach(),
							'content'=>$data->getMailcontent(),
							'status'=>$data->getStatus(), 
							'date_created'=>$data->getDateCreated()
							);
		$savemail->addData(&$fields);
		}
		
	if($action=='save'){
		$listSendemailItems = $customers->getObjects(1,"status=1",'','');
		$listemail=array();
		for($i=0; $i<sizeof($listSendemailItems);$i++)
			$listemailItems[]=$listSendemailItems[$i]->getEmail();
		$listemail=implode(";",$listemailItems);
		$data = new EmailInfo($listemail, $mail_bcc, '', $subject, $mailcontent, 1, date("Y-m-d H:i:s"));
		$fields = array ('to'=>$data->getTo(),
		 				'cc'=>$data->getCc(),
						'subject'=>$data->getSubject(), 
						'attach'=>$data->getAttach(),
						'content'=>$data->getMailcontent(),
						'status'=>$data->getStatus(), 
						'date_created'=>$data->getDateCreated()
						);
		$savemail->addData(&$fields);
		$infoText = 'Bạn đã save email thành công.';
		$infoClass = "infoText";
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign('gId',$gId);	
	}
	
	}else{
		$infoText ="Email Error"."<br />".$validate;
		$infoClass = "errorText";	
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign("gId",$gId);
		$template->assign("subject",$subject);
		$template->assign("mail_bcc",$mail_bcc);
		$template->assign("mailcontent",$mailcontent);
		
	}
}
$template->assign('customers',$customers);
function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validString("Subject",$request->element('subject'));
	$infoText .= $validate->validString("Mail contents",$request->element('mailcontent'));
	return $infoText;
}
?>