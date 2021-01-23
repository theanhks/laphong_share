<?php 
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH.'classes/dao/customers.class.php');
include_once(ROOT_PATH.'classes/dao/email.class.php');
include_once(ROOT_PATH."classes/dao/class.phpmailer.php");
include_once(ROOT_PATH."classes/dao/class.smtp.php");
include_once(ROOT_PATH."classes/dao/configs.class.php");
$templateFile = "managesendmail.temp.html";
$configs = new Configs();
$config = $configs->getObject("general");
$customers= new Customers();
$savemail= new SaveEmail();
$subject = $request->element('subject','');
$mail_to = $request->element('mail_to','');
$mail_bcc = $request->element('mail_bcc','');
$id = $request->element('oId','');
$mailcontent = $request->element('mailcontent','');
$save = $request->element('save','');
$status = $request->element('status',0);
$action = $request->element('plus','');
$infoText = '';
$infoClass = 'infoText';
$adminmail = $config->getProperty('admin_mail');
$company = $config->getProperty('company');
$mailItem = $savemail->getObject($id);
if($id!==''&&$mailItem){
if($_POST){
 	$validate = validateData($request);
	if($validate == '') {
		if($action=='send'){
			
			$array_to= split(";",$mail_to);
			for($i=0;$i<sizeof($array_to);$i++){
				$email=$array_to[$i];
				$response=$mailcontent;
			$code=$customers->getCode($email);
				$response .="Để ngưng không nhận email, vui lòng ";
				$link="<a href='http://www.hopthanhthinh.com/index.php?op=deletecustomer&email=$email&lang=vn&code=$code'>click vào đây</a>";
				$response .=$link ;
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
						$error = "Bạn gặp sự cố khi gửi mail. Xin vui lòng gửi lại. Cám ơn bạn".'<br />';
					}
			}
			$array_cc=split(";",$mail_bcc);
			for($i=0;$i<sizeof($array_cc);$i++){
				$email=$array_cc[$i];
				$response=$mailcontent;
				$mail = new PHPMailer();
				$mail->IsSMTP(); // set mailer to use SMTP
				$mail->Host =SMTP_HOST; // specify main and backup server
				$mail->Port = SMTP_PORT; // set the port to use
				$mail->SMTPAuth = true; // turn on SMTP authentication
				$mail->SMTPSecure = SMTP_SECURE;
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
						$error = "Bạn gặp sự cố khi gửi mail. Xin vui lòng gửi lại. Cám ơn bạn.".'<br />';
					}
			}
		
		$sendmailok=1;
		$infoText = 'Chúc mừng bạn. Email của bạn đã được gửi thành công.';
		$infoClass = "infoText";
		$template->assign("sendmailok",$sendmailok);
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
	}
	}else {
		$infoText = $validate.' Error send Email';
		$infoClass = "errorText";
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign('mailcontent',$mailcontent);
		$template->assign('subject',$subject);
	}
	if($action=='save'){
		$data = new EmailInfo($mail_to, $mail_bcc, '', $subject, $mailcontent, 1, date("Y-m-d H:i:s"));
		$fields = array ('to'=>$data->getTo(),
		 				'cc'=>$data->getCc(),
						'subject'=>$data->getSubject(), 
						'attach'=>$data->getAttach(),
						'content'=>$data->getMailcontent(),
						'status'=>$data->getStatus(), 
						'date_created'=>$data->getDateCreated()
						);
		$id=$mailItem->getId();
		$sendmailok=1;
		$savemail->updateData(&$fields,$id);
		$infoText = 'Chúc mừng bạn. Bạn đã lưu email thành công';
		$infoClass = "infoText";
		$template->assign("sendmailok",$sendmailok);
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		
			
	}
}
}
$mailItem = $savemail->getObject($id);
$template->assign('customers',$customers);
$template->assign('listObject',$mailItem);
	function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validString("Subject",$request->element('subject'));
	$infoText .= $validate->validString("Mail contents",$request->element('mailcontent'));
	$infoText .= $validate->validString("Mail To",$request->element('mail_to'));
	return $infoText;
}

?>