<?php
/*************************************************************************
Add user
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                 
Last updated: 27/10/2009
**************************************************************************/

include_once(ROOT_PATH."modules/framework.module.php");
include_once(ROOT_PATH."classes/dao/order.class.php");
include_once(ROOT_PATH."classes/dao/orderitem.class.php");
include_once(ROOT_PATH."plugins/authimg/authimg.php");
include_once(ROOT_PATH."classes/dao/cartitems.class.php");
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH."classes/data/validate1.class.php");
include_once(ROOT_PATH."includes/functions.php");
include_once("class.phpmailer.php");
include_once("class.smtp.php");
error_reporting(0);
include_once(ROOT_PATH . "classes/dao/categories.class.php");
$categories   = new Categories();
$PTTTItem = $categories->getObject(8); //NK Mart Footer
$template->assign('PTTTItem',$PTTTItem);

$products = new Products();
$carts = new CartItems();
$templateFile = "finishorder.tpl.html";
$orders = new Order();
$orderItems = new OrderItem();
$template->assign("carts",$carts);
$plus = isset($_REQUEST['plus'])?$_REQUEST['plus']:'';
$session_1 = session_id();
# Date
$daycombo = date("d");
$monthcombo = date("m");
$yearcombo = date("Y");
$listyear=listYear(2050,$yearcombo,$yearcombo);
$template->assign("listyear",$listyear);
//$listmonth=listMonth($monthcombo);
if($lang=='vn')
			$listmonth=listMonth_vn($monthcombo);
		else
			$listmonth=listMonth($monthcombo);
$template->assign("listmonth",$listmonth);
$listDays=listDays($daycombo);
$template->assign("listDays",$listDays);
//$listgender=listGender();

if($_POST) {
	switch ($plus) {
		case 'confirmOrder':
		
		# Confirm the information before creating the order
		$listerror = validateData($request);
		$check = checkvalidate($listerror);
		if($check == 0) {	#Form data is valid, transfer to the order confirm page
			# Assign he template variables
			$products = new Products();
			$template->assign("products",$products);

			# Get items in cart
			$cartItems = $carts->getObjects(1,"`sid` = '$session_1'", $sort = array('time_stamp' => 'desc'), 100);
			if($cartItems) $template->assign("cartItems",$cartItems);
			$templateFile = 'orderinfo.tpl.html';
		} else {
			$template->assign('listerror',$listerror);
			$templateFile = 'order.tpl.html';
		}
		$template->assign('order',$_REQUEST);
		$template->assign('plus',$plus);

		break;
		case 'editOrder':
		# Customer needs to correct the information
		$templateFile = 'order.tpl.html';
		$template->assign('order',$_REQUEST);
		$template->assign('plus',1);
		
		$rdate = $_REQUEST['rdate'];
		list($ryear, $rmonth, $rday) = split('[/.-]', $rdate);
		
		$listyear=listYear(2050,$ryear,$ryear);
		$template->assign("listyear",$listyear);
		if($lang=='vn')
			$listmonth=listMonth_vn($rmonth);
		else
			$listmonth=listMonth($rmonth);
		$template->assign("listmonth",$listmonth);
		$listDays=listDays($rday);
		$template->assign("listDays",$listDays);
		
		break;
		case 'submitOrder':
		if ($_POST){
			$listerror = validateData1($request);
			$check = checkvalidate($listerror);
			if ($check == 0){
				# Get items in cart
				$cartItems = $carts->getObjects(1,"`sid` = '$session_1'", $sort = array('time_stamp' => 'desc'), 100);
				if($cartItems) $template->assign("cartItems",$cartItems);
				if ($cartItems){
					$orderCode = generateOrderCode();
					$template->assign("orderCode",$orderCode);
					if(isset($_SESSION['memberId']))
						$cid=$_SESSION['memberId'];
					else
						$cid =0;
					# OK, create the new order
						$template->assign("name",$request->element('name'));
						$template->assign("address",$request->element('address'));
						$template->assign("phone",$request->element('comment'));
						$template->assign("email",$request->element('email'));
                        $template->assign("note",$request->element('note'));
                        $template->assign("cash",$request->element('cash'));
                        $template->assign("transfer",$request->element('transfer'));
                        $template->assign("invoice",$request->element('invoice'));
                        $template->assign("companyName",$request->element('companyName'));
                        $template->assign("companyAddress",$request->element('companyAddress'));
                        $template->assign("tax",$request->element('tax'));
                        $companyName = $request->element('companyName');
                        $companyAddress = $request->element('companyAddress');
                        $tax = $request->element('tax');

                        if(!$request->element('invoice')){
                            $companyName = $companyAddress = $tax = '';
                        }
					$fields = array('cid'			=> 10,
									'code'			=> $orderCode,
									'name'			=> $request->element('name'),
									'email'			=> $request->element('email'),
									'address'		=> $request->element('address'),
									'province'		=> $request->element('province'),
									'tel'			=> $request->element('phone'),
									'cell'			=> $request->element('cell'),
									'rname'			=> $companyName, // tên công ty
									'raddress'		=> $companyAddress, //địa chỉ công ty
									'rprovince'		=> $tax, // mã số thuế
									'rtel'			=> $request->element('cash'),
									'rcell'			=> $request->element('payment'),
									'rdate'			=> date("Y-m-d H:i:s"),
									'comment'		=> $request->element('note'),
									'date_created'	=> date("Y-m-d H:i:s"),
									'last_updated'	=> date("Y-m-d H:i:s"),									
									'status'		=> 1
									);
					$orders->addData($fields);
					$code = $orders->getIdFromCode($orderCode);
					
					$oId = $code->getId();
					# Insert Order items
					foreach ($cartItems as $cartItem) {
						$oItemInfo = new OrderItemInfo($oId, $cartItem->getPId(), $cartItem->getAvatar(), $cartItem->getProductName(),$cartItem->getProductSize(),$cartItem->getProductColor(), $cartItem->getPrice(), $cartItem->getQuantity(), $cartItem->getTimeStamp());
						
						$list = array('oid'=>$oItemInfo->getOId(),
									'pid'=>$oItemInfo->getPId(),
									'slug'=>$oItemInfo->getSlug(),
									'product_name'=>$oItemInfo->getProductName(),
									'product_size'=>$oItemInfo->getProductSize(),
									'product_color'=>$oItemInfo->getProductColor(),
									'quantity'=>$oItemInfo->getQuantity(),
									'price'=>$oItemInfo->getPrice(),
									'date_created'=>$oItemInfo->getDateCreated()
									);
						
						$orderItems->addData($list);
						$listObject = $products->getObject($cartItem->getPId()); 
						$quality_now = $listObject->getNumProduct();
						$quality_buy = $cartItem->getQuantity();
						$viewed = $listObject->getViewed();
						$num = $quality_now - $quality_buy;
						$products->updateData(array('num_product'=>$num), $cartItem->getPId());
						$products->updateData(array('viewed'=>$viewed+1), $cartItem->getPId());
					}
				
					$adminEmail = $siteConfigs->getProperty('admin_mail');
					$vurl = ROOTPATH."?op=orderinfo&amp;lang=$lang";
					$url_1 = ROOTPATH."/$lang/orderinfo.html";
					$tel = $request->element('tel');
					$url_2 = ROOTPATH."/$lang/orderinfo/$tel/$orderCode.html";
					$template->assign("url_2",$url_2);
					$body = $messages["order_email_body"];
					//$body .= $orderCode;
					$body .=$messages["order_email_body3"];
					//$body .= $tel;
					$body .=$messages["order_email_body4"];
					//$body .=$url_1;
					//$body .=$messages["order_email_body1"];
					//$body .=$url_2;
					//$body .=$messages["order_email_body2"];
					# Send mail	customer
						$from = $adminEmail;
						$to = $adminEmail;
						$email = $request->element('email');
						$subject = $messages["order_email_title"]." ".DOMAIN;
						$admin_mail = $siteConfigs->getProperty('admin_mail');
						$company = $siteConfigs->getProperty('company_vn');
						$ip = $_SERVER["REMOTE_ADDR"];
						$user_agent = $_SERVER['HTTP_USER_AGENT'];
						$noidung="<table class='boxcenter' border='0' cellspacing='0' cellpadding='0'>
						  <tr>
							<td align='center'><h1>Giỏ hàng</h1></td>
						  </tr>
						  <tr>
							<td class='boxcenter_m'>
							<div class='sanpham'>
								   <div class='basketInfo'>
						  <table width='100%' border='1' cellspacing='1' cellpadding='0'>
						  <tr height='25px'>
							<th width='20%'>Tên sản phẩm</th>							
							<th width='20%'>Số lượng</th>
							<th width='20%'>Giá (VND)</th>
							<th width='20%'>Tổng tiền (VND)</th>
						  </tr>";
						  $s = 0;
						  foreach ($cartItems as $cartItem) {
						  $noidung .="
						<tr>
						
						<td align='center'>
						<strong>".
						$cartItem->getProductName()."
						</stong>
						</td>
						<td align='center'>
						<strong>".
						$cartItem->getQuantity()
						."</stong>
						</td>
						<td align='center'>".number_format($cartItem->getPrice())."VNĐ</td>
						<td>".$tong = number_format($cartItem->getPrice()*$cartItem->getQuantity())."VNĐ 
						
						</td>
						</tr>
						
						";
						
						$s = $s+ $cartItem->getPrice()*$cartItem->getQuantity(); 
					}
						 $noidung .="
						 <tr><td colspan='6' align='right'><strong>".number_format($s)." VNĐ</strong>
						 </td></tr>
						</table>
									</div>
								
							</div>
							</td>
						  </tr>
						 
						</table>";
						$body_end=$messages['body_end'];
						$response=$body.$noidung.$body_end;
						//mail("info@mypapit.net","Contact form fakapster",$response, $headers);


						$mail = new PHPMailer();
						$mail->IsSMTP(); // set mailer to use SMTP
						$mail->Host =SMTP_HOST; // specify main and backup server
						$mail->Port = SMTP_PORT; // set the port to use
						$mail->SMTPAuth = true; // turn on SMTP authentication
                        $mail->SMTPSecure = SMTP_SECURE;
						$mail->Username = SMTP_USER; // your SMTP username or your gmail username
						$mail->Password = SMTP_PASSWORD; // your SMTP password or your gmail password
                        $mail->SetLanguage( 'en', 'phpmailer/language/' );
						$from = SMTP_USER; // Reply to this email
						$to=$admin_mail; // Recipients email ID
						$name=$company; // Recipient's name
						$mail->header = 'Content-Type: text/html; charset=utf-8'."\r\n";
						$mail->From = $from;
						$mail->FromName = $company; // Name to indicate where the email came from when the recepient received
						$mail->AddAddress($email,$email);
						$mail->AddReplyTo($admin_mail,$admin_mail);
						$mail->WordWrap = 50; // set word wrap
						$mail->IsHTML(true); // send as HTML
						$mail->Subject =$subject;
						$mail->Body = $response; //HTML Body
                        $mail->SMTPDebug = false;
						//$mail->AltBody = "Mail nay duoc goi bang phpmailer class. - bloghoctap.com"; //Text Body
						//$mail->SMTPDebug = 2;
						$mail->Send();

						
						
					#admin_mail
						$province=$request->element('province');
						$genner=$request->element('genner');
						$province=$request->element('province');
						$name=$request->element('rfullname');
						$address=$request->element('raddress');
						$comment=$request->element('comment');
						$tel=$request->element('rtel');
						$gioitinh = '';
						$thanhtoan ='';
						if($genner == 0){
							$gioitinh .= 'Anh'; 
						}else{
							$gioitinh .= 'Chi'; 
						}
						
						if($province == 0){
							$thanhtoan .= 'Thanh toán qua Internet Banking'; 
						}else{
							$thanhtoan .= 'Thanh toán trực tiếp (COD)'; 
						}

						$response1=$messages["admin_order_email_body"];
						$response1 .= "Họ tên: $gioitinh".": $name"."<br/>"." Email: $email "."<br/>"." Địa chỉ: $address"."<br/>"." Điện thoại: $tel"."<br/>"." Ghi chú: $comment "."</br>"." Hình Thức Thanh Toán: $thanhtoan "."<br/>";
						$response1 .=$noidung;
						$response1 .=$messages["admin_order_email_body_end"]; 
						$mail = new PHPMailer();
						$mail->IsSMTP(); // set mailer to use SMTP
						$mail->Host =SMTP_HOST; // specify main and backup server
						$mail->Port = SMTP_PORT; // set the port to use
						$mail->SMTPAuth = true; // turn on SMTP authentication
                        $mail->SMTPSecure = SMTP_SECURE;
						$mail->Username = SMTP_USER; // your SMTP username or your gmail username
						$mail->Password = SMTP_PASSWORD; // your SMTP password or your gmail password
						$from = SMTP_USER; // Reply to this email
						$to=$admin_mail; // Recipients email ID
						$name=$company; // Recipient's name
						$mail->header = 'Content-Type: text/html; charset=utf-8'."\r\n";
                        $mail->SetLanguage( 'en', 'phpmailer/language/' );
						$mail->From = $from;
						$mail->FromName = $name; // Name to indicate where the email came from when the recepient received
						$mail->AddAddress($admin_mail,$admin_mail);
						$mail->AddReplyTo($email,$email);
						$mail->WordWrap = 50; // set word wrap
						$mail->IsHTML(true); // send as HTML
						$mail->Subject = $subject;
						$mail->Body = $response1; //HTML Body
                        $mail->SMTPDebug = false;
						//$mail->AltBody = "Mail nay duoc goi bang phpmailer class. - bloghoctap.com"; //Text Body
						//$mail->SMTPDebug = 2;
						$mail->Send();

					$carts->delete("sid = '$session_1'");
					$count_item = $carts->getSumQuantity($session_1);
					$template->assign("count_item",$count_item);
					$templateFile = "finishorder.tpl.html";
					$order = $orders->getObject($oId);
					if($order) $template->assign("order",$order);
					$template->assign("oId",$oId);
					$template->assign("pageTitle",$messages['finish_order']);
					if (isset($_SESSION['rand_code'])){
						unset($_SESSION['rand_code']);
					}
				}
			}else{
					$template->assign('order',$_REQUEST);
					$products = new Products();
					$template->assign("products",$products);
					$template->assign("listerror",$listerror);
					$cartItems = $carts->getObjects(1,"`sid` = '$session_1'", $sort = array('time_stamp' => 'desc'), 100);
					if($cartItems) $template->assign("cartItems",$cartItems);
					$templateFile = 'orderinfo.tpl.html';
				}
		}
			break;
	}
} 
$pageName = $messages['checkout'];
$template->assign('pageName',$pageName);

function validateData($request) {
	global $messages;
	$error = array();
	$validate = new Validate();
	$error[0] = $validate->validString($messages['fullname'],$request->element('fullname'));
	$error[1] = $validate->validEmail($messages['email'],$request->element('email'));
	$error[3] = $validate->validString($messages['cel'],$request->element('rtel'));
	$error[4] = $validate->validString($messages['rname'],$request->element('rfullname'));
	$error[5] = $validate->validString($messages['raddress'],$request->element('raddress'));
	#$error[6] = $validate->validRDateTime($messages['rdate'],$request->element('year'),$request->element('month'),$request->element('day'));
	return $error;
}
function validateData1($request) {	
	return '';
}
function checkvalidate($validate){
	foreach($validate as $check){
		if($check != NULL)
			return 1;
	}
	return 0;
}

function generateOrderCode($length=6) {
	$str = '';
	for ($i = 0; $i < $length; $i++) {
		$a = rand(1,4);
		switch($a) {
			case 1:
				// this numbers refer to numbers of the ascii table (upper-caps)
				$str .= chr(mt_rand(65, 90));
				break;
			case 2:
				// number
				$str .= mt_rand(1,9);
				break;
			case 3:
				// this numbers refer to numbers of the ascii table (upper-caps)
				$str .= chr(mt_rand(65, 90));
				break;
			case 4:
				// this numbers refer to numbers of the ascii table (upper-caps)
				$str .= chr(mt_rand(65, 90));
				break;
		}
	}
	$find = array('I','O');
	$replace = array(chr(mt_rand(74, 90)),chr(mt_rand(65, 72)));
	$str = str_replace($find,$replace,$str);
	return $str;
}

 # active
 $active='sanpham';
 $template->assign('active',$active);
?>