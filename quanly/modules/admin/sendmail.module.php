<?php 
include_once(ROOT_PATH.'classes/dao/smtp.class.php');
include_once(ROOT_PATH."classes/dao/phpmailer.class.php");
include_once(ROOT_PATH.'classes/dao/sendmail.class.php');
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ROOT_PATH."classes/dao/email.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "adminsendmail.temp.html";

$mail = new sendMail();
$savedb = new SaveEmail();
$to = $request->element('mail_to','');
$cc = $request->element('mail_cc','');
$subject = $request->element('subject','');
$mailcontent = $request->element('mailcontent','');
$save = $request->element('save','');
$status = $request->element('status','1');
$infoText = '';
$infoClass = 'infoText';
if($_POST){
	$send = $mail->sendEmail($to,$cc,$subject,$mailcontent);// var_dump($send);
 	$validate = validateData($request);
	if($validate == '') {
		if(!$save){
			if (!$send){
				$infoText = $amessages['send_mail_error']."<br />".$validate;
				$template->assign("infoText",$infoText);
				$template->assign("infoClass",$infoClass);
				$templateFile = "adminsendmail.temp.html";			
			}else{		
				$infoText = $amessages['send_mail_ok'];
				$infoClass = "infoText";
				$template->assign("infoText",$infoText);
				$template->assign("infoClass",$infoClass);
				$templateFile = "adminsendmail.temp.html";

			}
		}else{
			if (!$send){
				$data = new Emailinfo($to,$cc,'',$subject,$mailcontent,2,date("Y-m-d H:i:s"));
				$fields = array ('to' => $data->getTo(),
							 'cc' => $data->getCC(),
							 'subject' => $data->getSubject(),
							 'content' => $data->getMailcontent(),
							 'date_created'=>$data->getDateCreated(),
							 'attach' => '', 
	 						 'status'=>$data->getStatus());
				$savedb->addData(&$fields);
				$infoText = $amessages['item_save_ok']."<br />";
				$infoText .= $amessages['send_mail_error']."<br />".$validate;
				$template->assign("infoText",$infoText);
				$template->assign("infoClass",$infoClass);
				$templateFile = "adminsendmail.temp.html";
			}else{
				$data = new Emailinfo($to,$cc,'', $subject,$mailcontent,1,date("Y-m-d H:i:s"));
				$fields = array ('to' => $data->getTo(),
							 'cc' => $data->getCC(),
							 'subject' => $data->getSubject(),
							 'content' => $data->getMailcontent(),
							 'date_created'=>$data->getDateCreated(),
							 'attach' => '',
	 						 'status'=>$data->getStatus());
				$savedb->addData(&$fields);
				$infoText = $amessages['item_inserted_ok']."<br />";
				$infoText .= $amessages['send_mail_ok'];
				echo $infoText;
				$template->assign("infoText",$infoText);
				$template->assign("infoClass",$infoClass);
				$templateFile = "adminsendmail.temp.html";
			}
		}		
	}else {
		$infoText = $validate;
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign('mailcontent',$mailcontent);
		$template->assign('subject',$subject);
		$template->assign('mail_cc',$cc);
		$template->assign('mail_to',$to);
	}
}

	function validateData($request) {
		global $amessages;
		$validate = new Validate();
		$infoText = '';
		$infoText .= $validate->validString($amessages['send_content'],$request->element('mailcontent'));
		$infoText .= $validate->validString($amessages['subject'],$request->element('subject'));
		$infoText .= $validate->validString($amessages['mail_to'],$request->element('mail_to'));
		return $infoText;
	}

?>