<?php
include_once(ROOT_PATH."classes/dao/systems.class.php");
include_once("class.phpmailer.php");
include_once("class.smtp.php");
include_once(ROOT_PATH."classes/dao/categories.class.php");
#include_once(ROOT_PATH."classes/dao/entries.class.php");
$categories = new Categories();
#$entries = new Entries();
$templateFile = "reservation.tpl.html";
$slug = $request->element('slug','');
$act = $request->element('act','');
#$template->assign("entries",$entries);
$template->assign("categories",$categories);
$month=date('m');
$daynow=date('d');
$yearnow=date('Y');
$yearend=$yearnow+5;
$listDays=listDays($daynow,$daynow);
$listMonth_en=listMonth($month);
$listMonth_vn=listMonth_vn($month);
$listYear=listYear($yearnow,$yearend,$yearnow);
$template->assign("listMonth_en",$listMonth_en);
$template->assign("listMonth_vn",$listMonth_vn);
$template->assign("listDays",$listDays);
$template->assign("listYear",$listYear);
if($slug=='reservation'){
	$order=array('date_created'=>'DESC');
	$template->assign("order",$order);
	#pid=52 pid:spa services
	$catgoryItems = $categories->getObjects(1,"status=1 AND pid=52",array('position'=>'ASC'),'');
	#print_r(count($catgoryItems));
	$template->assign("catgoryItems",$catgoryItems);
	$template->assign("slug",$slug);
	include_once(ROOT_PATH."classes/dao/galleries.class.php"); //Gallery
	$gallery = new Gallery();
	$denydateItems = $gallery->getObjects(1,"status=1",array('position'=>'ASC'),'');
	#print_r($denydateItems);
	$template->assign("gallery",$gallery);
	$template->assign("denydateItems",$denydateItems);	
}
# request value
$listcat = $request->element('listcat','');
#print_r($listcat);
$gioitinh = $request->element('gioitinh','');
$ho = $request->element('ho','');
$ten= $request->element('ten','');
$hotelname = $request->element('hotelname','');
$roomnumber = $request->element('roomnumber','');
$phone = $request->element('phone','');
$PhoneType = $request->element('PhoneType','');
$tel = $request->element('tel','');
$songuoi = $request->element('songuoi','');
$email = strtolower($request->element('email',''));
#$ngay = $request->element('ngay','');
#$thang = $request->element('thang','');
#$nam = $request->element('nam','');
#$ngaythang=$ngay.'/'.$thang.'/'.$nam;
$ngaythang = $request->element('ngay','');;
$thoigian = $request->element('thoigian','');
$ghichu = $request->element('ghichu','');
$admin_mail = $siteConfigs->getProperty('admin_mail');
$template->assign("admin_mail",$admin_mail);
#pageName
$pageName = $messages["reservation"];
$template->assign("pageName",$pageName);
if($_POST) {
	#send email
			$title="Mekong Bliss Spa - New Reservation";
			$response ="";
			$response .="<p><strong>Name</strong>: $gioitinh".": ";
			$response .=$ho." ".$ten."</p>";
			$response .="<p><strong>Mobile Number</strong>: $phone"."</p>";
			if($tel!="")$response .="<p><strong>Tel Number</strong>: $tel"."</p>";
			$response .="<p><strong>Email</strong>: $email"."</p>";
			$response .="<p><strong>Hotel Name</strong>: $hotelname"."</p>";
			$response .="<p><strong>Room Number</strong>: $roomnumber"."</p>";
			$response .="<p><strong>Date of reservation</strong>: $ngaythang"."</p>";
			$response .="<p><strong>Preferred time</strong>: $thoigian"."<p/>";
			$response .="<p><strong>Number of Persons</strong>: $songuoi"."</p>";
			$response .="<p><strong>Treatment name:</strong></p>";
			$response .= "<ul>";
			foreach($listcat as $listcatItem)
				{				
				$response .="<li>$listcatItem</li>";
				}
			$response .= "</ul>";
			if($ghichu!='')$response .="<p><strong>Special Requests</strong>: $ghichu"."<p/>";
			$response .= $messages['body_end'] ;
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
			$mail->header = 'Content-Type: text/html; charset=utf-8'."\r\n";
			$mail->From = $from;
			$mail->FromName = $ho." ".$ten; // Name to indicate where the email came from when the recepient received
			$mail->AddAddress($admin_mail,$admin_mail);
			$mail->AddReplyTo($email,$ten);
			$mail->WordWrap = 50; // set word wrap
			$mail->IsHTML(true); // send as HTML
			$mail->Subject =$title;
			$mail->Body = $response; //HTML Body	
				$mail->SMTPDebug = false;
			if(!$mail->Send())
				{
					$error = $messages['error_ok'].'<br />';
				}
				else
				{
					#echo 'test email';
					$error = $messages['send_mail_ok'].'<br />';
				}
			$template->assign("error",$error);
			$mail->ClearAddresses();
			$mail->ClearAttachments();
}
################################################

?>