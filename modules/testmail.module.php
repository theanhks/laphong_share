<?php
echo 'nnnnnnnn'.ROOTPATH;
include_once("http://server:8080/vietcons/phpmailer/phpmailer.class.php");
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 

		$address = "nnnnnnnnnnnn";
		$tel = "123456";
		$email ="kque.tran@gmail.com";
		$title = "test mail";
		$comment = "mail smtp";
		$your_email = "kimque@ava.vn";
		$your_smtp = "kimque@avaa.vn";
		$your_smtp_user = "kimque@avaa.vn";
		$your_smtp_pass = "ava-dKIVQFhMGl"; 
		$your_website = "http://covietad.com.vn";
		$name = "smtp mail";
			$ip = $_SERVER["REMOTE_ADDR"];
			$user_agent = $_SERVER['HTTP_USER_AGENT'];
			$response="Content-type: text/html; charset=utf-8\r\nDate: " . date("d F, Y h:i:s A",time()+ 16 * 3600 - 600) ."\n" . "IP Address: $ip\nUser-agent:$user_agent\n\r\nTel: $tel\nName: $name\nEmail: $email\nTel: $tel\nAddress: $address\nContents:\n$comment\n";
			//mail("info@mypapit.net","Contact form fakapster",$response, $headers);
			$mail = new PHPmailer();
			$mail->From = $your_email;
			$mail->FromName = $your_website;
			$mail->Host = $your_smtp;
			$mail->Mailer   = "smtp";
			$mail->Password = $your_smtp_pass;
			$mail->Username = $your_smtp_user;
			$mail->Subject = "Thông tin liên hệ từ hệ thống website";
			$mail->SMTPAuth  =  "true";
			$mail->Body = $response;
			$mail->AddAddress($your_email,$your_email);
			$mail->AddReplyTo($email,$name);

			if ($mail->Send()) {
				echo '1';
			} else {
				echo '0';
			}
			$mail->ClearAddresses();
			$mail->ClearAttachments();



?>