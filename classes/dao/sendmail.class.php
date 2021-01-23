<?php
/*************************************************************************
Class Categories
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 15/07/2008
**************************************************************************/
include_once(ROOT_PATH."classes/dao/phpmailer.class.php");
include_once(ROOT_PATH."classes/dao/smtp.class.php");
class sendMail extends PHPMailer {
	function validateEmailAddress($mail) {
		if (!preg_match("/[a-z0-9_-]+(\.[a-z0-9_-]+)*@([0-9a-z][0-9a-z-]*[0-9a-z]\.)+([a-z]{2,4})/i",$mail)) return false;
		return true;
	}

	function sendEmail($to,$cc,$subject,$body,$from){
		$mailarr_to = explode(';',$to);
		$mailarr_cc = explode(';',$cc);
		$email_cc = '';
		$email_to = '';
		foreach ($mailarr_to as $mail_to) {
			if ($this->validateEmailAddress($mail_to)) {
				$this->AddAddress($mail_to);	
			}
		}
		foreach ($mailarr_cc as $mail_cc) {
			if ($this->validateEmailAddress($mail_cc)) {
				$this->AddCC($mail_cc);
			}
		}
		$this->Body = $body;
		$this->Subject = $subject;
		$result = $this->Send();
		if ($result) return 1;
		return '';
	}
	function notMail($email){
		$mailarr = explode(';',$email);
		$notMail = '';
		foreach ($mailarr as $data){
			if (!$this->validateEmailAddress($data)){
				$notMail .= $data.';'; 
			}
		}
		return $notMail;
	}




}
?>	
