<?php
/*************************************************************************
Module contact
----------------------------------------------------------------
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                   
Last updated: 08/03/2011
**************************************************************************/
//ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH."includes/functions.php");
include_once(ROOT_PATH."plugins/authimg/authimg.php");
include_once(ROOT_PATH."classes/dao/systems.class.php");
include_once("class.phpmailer.php");
include_once("class.smtp.php");
$templateFile = "hoptac.tpl.html";
 $slug = $request->element('slug','');
$template->assign("slug",$slug);
# hop tac
$company_name = $request->element('company_name','');
$address = $request->element('address','');
$city = $request->element('city','');
$website = $request->element('website','');
#thong tin lien lạc
$full_name = $request->element('full_name','');
$chucdanh = $request->element('chucdanh','');
$email = $request->element('email','');
$tel = $request->element('tel','');
#gia phap dich vu
$solution = $request->element('solution','');
$giaphap_dichvu=$messages['solution1'][1];

#noi dung
$message = $request->element('message','');

$title = "Quan hệ hợp tác";
$admin_mail = $siteConfigs->getProperty('admin_mail');
$company = $siteConfigs->getProperty('company');
$template->assign("admin_mail",$admin_mail);
$website = $siteConfigs->getProperty('website');
$template->assign("website",$website);

$pageName = 'Hợp tác';
$template->assign("pageName",$pageName);
if($_POST) {
			include_once(ROOT_PATH."classes/data/validate1.class.php");
			$listerror = validateData($request);
			$check = checkvalidate($listerror);
			if($check == 0)	{
			$response ="Chào bạn, bạn nhận được một email liên hệ hợp tác từ website ".$website." với nội dung như sau: <br/>";
			$response .="<b>Thông tin công ty</b>"."<br/>";
			$response .="Tên công ty : $company_name"."<br/>";
			$response .="Địa chỉ : $address"."<br/>";
			$response .="Thành phố : $city"."<br/>";
			$response .="Website: $website"."<br/>";
			$response .="<b>Thông tin liên hệ</b>"."<br/>";
			$response .="Họ tên: $full_name"."<br/>";
			$response .="Chức danh : $chucdanh"."<br/>";
			$response .="Email : $email"."<br/>";
			$response .="Điện thoại : $tel"."<br/>";
			$response .="<b>Giải pháp, dịch vụ:</b> $giaphap_dichvu"."<br/>";
			$response .="<b>Nội dung hợp tác: </b>"."<br/>";
			$response .="$message"."<br/>";
			
			$mail = new PHPMailer();
			$mail->IsSMTP(); // set mailer to use SMTP
			$mail->Host =SMTP_HOST; // specify main and backup server
			$mail->Port = SMTP_PORT; // set the port to use
			$mail->SMTPAuth = true; // turn on SMTP authentication
			$mail->SMTPSecure = 'ssl';
			$mail->Username = SMTP_USER; // your SMTP username or your gmail username
			$mail->Password = SMTP_PASSWORD; // your SMTP password or your gmail password
			$from = SMTP_USER; // Reply to this email
			$to=$admin_mail; // Recipients email ID
			$name=$company; // Recipient's name
			$mail->header = 'Content-Type: text/html; charset=utf-8'."\r\n";
			$mail->From = $from;
			$mail->FromName = $full_name; // Name to indicate where the email came from when the recepient received
			$mail->AddAddress($admin_mail,$admin_mail);
			$mail->AddReplyTo($email,$full_name);
			$mail->WordWrap = 50; // set word wrap
			$mail->IsHTML(true); // send as HTML
			$mail->Subject =$title;
			$mail->Body = $response; //HTML Body
			//$mail->AltBody = "Mail nay duoc goi bang phpmailer class. - bloghoctap.com"; //Text Body
			//$mail->SMTPDebug = 2;
			if(!$mail->Send())
				{
					$error = $messages['error_ok'].'<br />';
				}
				else
				{
					$error = $messages['hoptac_ok'].'<br />';
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
 #chuyen muc sp
 include_once(ROOT_PATH."classes/dao/procategories.class.php");
$productcategories = new ProductCategories();
$productcatItems = $productcategories->getObjects(1,"status =1 AND pid=0",array('position'=>'ASC'),'');
$listProductCat = $productcategories->optionAllCategories('id',$lang.'_name','');
$template->assign("listProductCat",$listProductCat);
$template->assign('productcatItems',$productcatItems);
$template->assign('productcategories',$productcategories);
 #chuyen muc sp
 #supprot
 include_once(ROOT_PATH."classes/dao/parts.class.php");
$parts = new Parts();
$partItems = $parts->getObjects(1,"status =1",array('id'=>'ASC'),'');
$template->assign('partItems',$partItems);
$template->assign('parts',$parts);
 #end support
 #chuyen muc
 include_once(ROOT_PATH."classes/dao/categories.class.php");
$categories = new Categories();
$categoryItems = $categories->getObjects(1,"status =1 AND pid=4",array('position'=>'ASC'),'');
$template->assign('categoryItems',$categoryItems);
$template->assign('categories',$categories);
 #chuyen muc
  #tin tuc noi bat
 include_once(ROOT_PATH."classes/dao/entries.class.php");
$entries = new Entries();
$hotnewsItems = $entries->getObjects(1,"status =1 AND cid=4 AND lang='$lang'",array('date_created'=>'DESC'),2);
$template->assign('hotnewsItems',$hotnewsItems);
$template->assign('entries',$entries);
 #end tin tuc noi bat
  #tim tuc left
 include_once(ROOT_PATH."classes/dao/weblinks.class.php");
$weblinks = new Weblinks();
$leftweblinks = $weblinks->getObjects(1,"status =1",array('position'=>'ASC'),'');
$template->assign('leftweblinks',$leftweblinks);
$template->assign('weblinks',$weblinks);

?>