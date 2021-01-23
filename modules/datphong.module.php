<?php
include_once(ROOT_PATH."includes/functions.php");
include_once(ROOT_PATH."plugins/authimg/authimg.php");

include_once(ROOT_PATH."classes/dao/systems.class.php");

include_once("class.phpmailer.php");
include_once("class.smtp.php");

$templateFile = "datphongthanhcong.tpl.html";




$slug = $request->element('slug','');
$template->assign("slug",$slug);
$idget = $request->element('idget','');
# contact form
$full_name = $request->element('first_name'.$idget,'');

$chucdanh = $request->element('chucdanh','');
$email = strtolower($request->element('email'.$idget,''));
$cty = $request->element('cty','');
$address = $request->element('address','');
$tel = $request->element('tel'.$idget,'');
$fax = $request->element('fax','');
$ngayden = $request->element('ngayden'.$idget,'');
$ngaydi = $request->element('ngaydi'.$idget,'');

$date1 = new DateTime($ngayden);
$date2 = new DateTime($ngaydi);

$ngayden1 =  date_format($date1,"d/m/Y");
$ngaydi1 =  date_format($date2,"d/m/Y");

$province = $request->element('province','');
$country = $request->element('country','');
$postcode = $request->element('postcode','');
$message = $request->element('message'.$idget,'');
$title = $request->element('title','');
$chude = $request->element('chude','');
$admin_mail = $siteConfigs->getProperty('admin_mail');
$company = $siteConfigs->getProperty('company');
$website = $siteConfigs->getProperty('website');
$template->assign("fax",$fax);
$template->assign("admin_mail",$admin_mail);
$pageName = 'Đặt phòng';
$template->assign("pageName",$pageName);
//var_dump($email); die();


if($_POST) {
	include_once(ROOT_PATH."classes/data/validate1.class.php");
	$listerror = validateData($request);
	$check = checkvalidate($listerror);
			if($check == 1)	{
			$response ="Chào bạn, bạn nhận được một email đặt phòng từ website ".$website." với nội dung như sau: <br/>";
			
			$response .="Tiêu đề: $title"."<br/>";
			$response .="Họ tên: $full_name"."<br/>";
			
			
			$response .="Điện thoại: $tel"."<br/>";
			$response .="Email: $email"."<br/>";
			$response .="Ngày đến: $ngayden1"."<br/>";
			$response .="Ngày đi: $ngaydi1"."<br/>";
			/*if($chude){$response .="Chủ đề: $chude"."<br/>";}*/
			
			$response .="<br/>Nội dung liên hệ: $message"."<br/>";
			//mail("info@mypapit.net","Contact form fakapster",$response, $headers);

			$mail = new PHPMailer();
			$mail->IsSMTP(); // set mailer to use SMTP
			$mail->Host =SMTP_HOST; // specify main and backup server
			$mail->Port = SMTP_PORT; // set the port to use
			$mail->SMTPAuth = true; // turn on SMTP authentication
			#$mail->SMTPSecure = 'ssl';
			$mail->Username = SMTP_USER; // your SMTP username or your gmail username
			$mail->Password = SMTP_PASSWORD; // your SMTP password or your gmail password
			$from = SMTP_USER; // Reply to this email
			$to=$admin_mail; // Recipients email ID
			//$to=$email; // Recipients email ID
			$name=$company; // Recipient's name
			$mail->header = 'Content-Type: text/html; charset=utf-8'."\r\n";
			$mail->From = $from;
			$mail->FromName = $full_name; // Name to indicate where the email came from when the recepient received
			$mail->AddAddress($admin_mail);
			$mail->AddAddress($email);
			$mail->AddReplyTo($email,$full_name);
	
	
			
			$mail->WordWrap = 50; // set word wrap
			$mail->IsHTML(true); // send as HTML
			$mail->Subject =$title;
			$mail->Body = $response; //HTML Body
			//$mail->AltBody = "Mail nay duoc goi bang phpmailer class. - bloghoctap.com"; //Text Body
			$mail->SMTPDebug = false;
			if(!$mail->Send())
				{
					
					$error = $messages['error_ok'].'<br />';
				}
				else
				{	
					///sleep(8);
					
					  //$mail->ClearAllRecipients(); 
					  //$mail->AddAddress($email); //some another email
					$error = $messages['contact_ok'].'<br />';
					$template->assign("error",$error);
					unset($_SESSION['rand_code']);
				}
			}else{
				$template->assign("listerror",$listerror);
			}
}
function checkvalidate($validate){
	foreach($validate as $check){
		if($check != NULL)
			return 1;
	}
	return 0;
}
function validateData($request) {
	global $messages;
	$error = array();
	$validate = new Validate();
	$code = strtolower($request->element('code'));
	$error['3']= $validate->validString($messages['security'],$request->element('code'));	

	if(!isset($_SESSION['rand_code']) || $code != strtolower($_SESSION['rand_code'])) $error['3']= $messages["invalid_security_code"].'<br />';
	return $error;
}

 /************* dung chung ******/
 include_once(ROOT_PATH."modules/framework.module.php"); 
  //include_once(ROOT_PATH."modules/index.module.php"); 
 $active='lien-he';
 $template->assign('active',$active);
?>