<?php 
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
//include_once(ROOT_PATH."classes/dao/phpmailer.class.php");
#include_once(ROOT_PATH."classes/dao/smtp.class.php");
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH.'classes/dao/customers.class.php');
include_once(ROOT_PATH.'classes/dao/agelang.class.php');
include_once(ROOT_PATH.'classes/dao/email.class.php');
include_once(ROOT_PATH."classes/dao/configs.class.php");
$configs = new Configs();
$config = $configs->getObject("general");
$templateFile = "managesendemail.temp.html";
$customers= new Customers();
$agelang=new Agelang();
$savemail= new SaveEmail();
$subject = $request->element('subject','');
$mailcontent = $request->element('mailcontent','');
$gId = $request->element('agId','');
$status = $request->element('status',0);
$infoText = '';
$infoClass = 'infoText';
$mail_bcc = $request->element('mail_bcc','');
$adminmail = $config->getProperty('admin_mail');
if($_POST){
	 $validate = validateData($request);
	if($validate == '') {
		$gId = $request->element('gId','');
		$nhomemail= $agelang->getObjects(1,"nhomid=$gId AND status=1",'','');
		for($j=0;$j<count($nhomemail);$j++){
			$ngonngudotuoiItem=$nhomemail[$j];
			$condition="status =1";
			$listlang=$ngonngudotuoiItem->getNgonngu();
			$listage=$ngonngudotuoiItem->getDotuoi();
			if($listage!='') $condition .=" AND dotuoiid in($listage)";
			if($listlang!='') $condition .=" AND ngonnguid in($listlang)";
			$listSendemailItems = $customers->getObjects(1,$condition,'','');
			$count= count($listSendemailItems);
			$listemail='';
			if ($listSendemailItems){
				for($i=0;$i<$count;$i++){
					$mailItem=$listSendemailItems[$i];
					$email= $mailItem->getEmail();
					$listemail .=$email;	
					$listemail .=';';
				}
			}
	
		}
		$data = new EmailInfo($listemail, $mail_bcc, '', $subject, $mailcontent, 1, date("Y-m-d H:i:s"));
		print_r($data);
		$fields = array ('to'=>$data->getTo(),
		 				'cc'=>$data->getCc(),
						'subject'=>$data->getSubject(), 
						'attach'=>$data->getAttach(),
						'content'=>$data->getMailcontent(),
						'status'=>$data->getStatus(), 
						'date_created'=>$data->getDateCreated()
						);
		print_r($fields);	
		$savemail->addData(&$fields);
		$infoText = 'Email template was saved successful to database.';
		$infoClass = "infoText";
		$template->assign("sendmailok",$sendmailok);
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign('gId',$gId);	
	
	}else{
		$infoText ="Save Email Error"."<br />".$validate;
		$infoClass = "errorText";	
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign("gId",$gId);
		$template->assign("subject",$subject);
		$template->assign("mailcontent",$mailcontent);
		
	}
}
$template->assign('customers',$customers);
$template->assign('gId',$gId);	
function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validString("Subject",$request->element('subject'));
	$infoText .= $validate->validString("Mail contents",$request->element('mailcontent'));
	$infoText .= $validate->validString("Group Age Language",$request->element('gId'));
	return $infoText;
}
?>