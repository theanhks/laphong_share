<?php
include_once(ROOT_PATH."includes/functions.php");
include_once(ROOT_PATH."plugins/authimg/authimg.php");

include_once(ROOT_PATH."classes/dao/systems.class.php");
include_once(ROOT_PATH . "classes/dao/categories.class.php");
include_once(ROOT_PATH . "classes/dao/entries.class.php");
include_once(ROOT_PATH . "classes/dao/resources.class.php");
include_once(ROOT_PATH . "classes/dao/book.class.php");
include_once(ROOT_PATH . "includes/functions.php");
include_once(ROOT_PATH."classes/dao/imgproductinfo.class.php");
include_once(ROOT_PATH."classes/dao/imgproducts.class.php");

include_once("class.phpmailer.php");
include_once("class.smtp.php");


$slug = $request->element('slug','');
$template->assign("slug",$slug);

$templateFile = "contact.tpl.html";
if($slug == 'lien-he'){
    if($lang=='vn'){
        $templateFile = "contact.tpl.html";
    }else{
        $templateFile = "contact-en.tpl.html";
    }
}else
if($slug=='dat-ban'){
    if($lang=='vn'){
        $templateFile = "datban.tpl.html";
    }else{
        $templateFile = "datban-en.tpl.html";
    }
}

# contact form
$full_name = $request->element('first_name','');
$chucdanh = $request->element('chucdanh','');
$email = strtolower($request->element('email',''));
$cty = $request->element('cty','');
$address = $request->element('address','');
$tel = $request->element('tel','');
$fax = $request->element('fax','');
$province = $request->element('province','');
$country = $request->element('country','');
$postcode = $request->element('postcode','');
$message = $request->element('message','');
$title = $request->element('title','');
$chude = $request->element('chude','');
$type = $request->element('type','');
$date = $request->element('date','');
$time = $request->element('time','');
$quantity = $request->element('quantity','');
$admin_mail = $siteConfigs->getProperty('admin_mail');
$company = $siteConfigs->getProperty('company');
$website = $siteConfigs->getProperty('website');
$template->assign("fax",$fax);
$template->assign("admin_mail",$admin_mail);
$pageName = 'Liên Hệ';
$template->assign("pageName",$pageName);
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate1.class.php");
	$listerror = validateData($request);
	$check = checkvalidate($listerror);
			if($check == 1)	{
                $response ="Chào bạn, bạn nhận được một email liên hệ từ website ".$website." với nội dung như sau: <br/>";
                $response .="Họ tên: $full_name"."<br/>";
                $response .="Điện thoại: $tel"."<br/>";
                $response .="Email: $email"."<br/>";
			    if($type=='datban'){

			        saveBook($request);
                    $subject = 'Đặt Bàn';
                    $response .="Tiêu đề: Đặt Bàn "."<br/>";
                    $response .="<br/>Ngày : $date"."<br/>";
                    $response .="<br/>Vào lúc : $time"."<br/>";
                    $response .="<br/>Số lượng người : $quantity"."<br/>";
                    $response .="<br/>Ghi chú : $message"."<br/>";
                }else{
                    $subject = 'Liên Hệ';
                   // $response .="Tiêu đề: $title"."<br/>";
                    $response .="<br/>Nội dung liên hệ: $message"."<br/>";
                }

			//mail("info@mypapit.net","Contact form fakapster",$response, $headers);

                $mail = new PHPMailer();
                $mail->IsSMTP(); // set mailer to use SMTP
                $mail->Host =SMTP_HOST; // specify main and backup server
                $mail->Port = SMTP_PORT; // set the port to use
                $mail->SMTPAuth = true; // turn on SMTP authentication
                $mail->SMTPSecure = SMTP_SECURE;
                $mail->Username = SMTP_USER; // your SMTP username or your gmail username
                $mail->Password = SMTP_PASSWORD; // your SMTP password or your gmail password
                $from = SMTP_USER; // Reply to this email
              //  $mail->SetLanguage("en", 'includes/phpMailer/language/');

                $mail->SetLanguage( 'en', 'phpmailer/language/' );
                $to=$admin_mail; // Recipients email ID
                $name=$company; // Recipient's name
                $mail->header = 'Content-Type: text/html; charset=utf-8'."\r\n";
                $mail->From = $from;
                $mail->FromName = $full_name; // Name to indicate where the email came from when the recepient received
                $mail->AddAddress($admin_mail);
                $mail->AddReplyTo($email,$full_name);
                $mail->WordWrap = 50; // set word wrap
                $mail->IsHTML(true); // send as HTML
                $mail->Subject =$subject;
                $mail->Body = $response; //HTML Body
                //$mail->AltBody = "Mail nay duoc goi bang phpmailer class. - bloghoctap.com"; //Text Body
                $mail->SMTPDebug = false;
			if(!$mail->Send())
				{
					$error = $messages['error_ok'].'<br />';
				}
				else
				{
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

function saveBook($request){

    $book = new Book();
    $full_name = $request->element('first_name','');
    $email = strtolower($request->element('email',''));
    $tel = $request->element('tel','');
    $message = $request->element('message','');
    $date = $request->element('date','');
    $time = $request->element('time','');
    $quantity = $request->element('quantity','');
  //  var_dump()
    $bookInfo = new BookInfor($full_name,
        $email,
        $tel,
        $date,
        $time,
        $message,
        $quantity
    );
    $fields = array('name'=>$bookInfo->getName(),
        'email'=>$bookInfo->getEmail(),
        'tel'=>$bookInfo->getTel(),
        'date'=>$bookInfo->getDate(),
        'time'=>$bookInfo->getTime(),
        'note'=>$bookInfo->getNote(),
        'quantity'=>$bookInfo->getQuantity(),
    );
    //print_r($fields);
    $book->addData($fields);
}
 /************* dung chung ******/
 include_once(ROOT_PATH."modules/framework.module.php"); 
  //include_once(ROOT_PATH."modules/index.module.php"); 
 $active='lien-he';
 $template->assign('active',$active);
?>