<?php
/*************************************************************************
Search module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 06/06/2008
**************************************************************************/
include_once(ROOT_PATH."includes/constants.php");
include_once(ROOT_PATH."includes/functions.php");
include_once(ROOT_PATH."classes/dao/order.class.php");
include_once(ROOT_PATH."classes/dao/orderitem.class.php");
//include_once(ROOT_PATH."classes/dao/ordernotes.class.php");
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH."plugins/authimg/authimg.php");
include_once(ROOT_PATH."classes/dao/systems.class.php");
$templateFile = "orderinfo.temp.html";
$orders = new Order();
$orderItems = new OrderItem();

//$orderNotes = new OrderNotes();
$products = new Products();
$plus = isset($_REQUEST['plus'])?$_REQUEST['plus']:'';
$orderCode = $request->element('orderCode');
$cell = $request->element('cell');
if(!session_id()) session_start();
$error = '';
$template->assign("pageTitle",$messages['title_order_info']);
switch ($plus) {
	case 'viewOrder':
		if($_POST) {
			include_once(ROOT_PATH."classes/data/validate1.class.php");
			$validate = validateData($request);
			if($validate == '') {
				$orderItem = $orders->getOrderSearch($orderCode,$cell);
				if($orderItem) {
				
					$templateFile = "vieworder.temp.html";
					$template->assign("orderId",$orderItem->getId());
					$template->assign("orderCode",$orderItem->getCode());
					$template->assign("orderDate",$orderItem->getDateCreated());
					$template->assign("name",$orderItem->getName());
					$template->assign("email",$orderItem->getEmail());
					$template->assign("address",$orderItem->getAddress());
					$template->assign("tel",$orderItem->getTel());
					$template->assign("oId",$orderItem->getId());
					$template->assign("cell",$orderItem->getCell());
					$template->assign("provinceName",$orderItem->getProvince());
					$template->assign("deposited",$orderItem->getDeposited());
					$os = $orderItem->getStatus();
					$status = array(1=>$messages['order_pending'],
									2=>$messages['order_payment_pending'],
									3=>$messages['order_deposited'],
									4=>$messages['order_finish_payment_pending'],
									5=>$messages['order_good_pending'],
									6=>$messages['order_packaging'],
									7=>$messages['order_shipping'],
									8=>$messages['order_delivering'],
									9=>$messages['order_finished'],
									10=>$messages['order_out_stock'],
									11=>$messages['order_refunded'],
									12=>$messages['order_deleted'],
									0=>$messages['order_disabled']);
					$orderStatus = $status[$os];
					$template->assign("orderStatus",$orderStatus);
					$template->assign("orderStatusCode",$os);
					# Get order items
					$orderListItems = $orderItems->getOrderItemFromOId($orderItem->getId());
					$template->assign("orderListItems",$orderListItems);
				}else {
					$error = $messages['no_search_error'];
					$template->assign("error",$error);
				}
			}else {
				$error = $messages['search_error'].'<br />'.$validate;
				$template->assign("orderCode",$orderCode);
				$template->assign("error",$error);
			}
		}		
	break ;
}
unset($_SESSION['rand_code']);

$boundary1   =rand(0,9)."-"
.rand(10000000000,9999999999)."-"
.rand(10000000000,9999999999)."=:"
.rand(10000,99999);
$boundary2   =rand(0,9)."-".rand(10000000000,9999999999)."-"
.rand(10000000000,9999999999)."=:"
.rand(10000,99999);
$pageName = $messages['status_order'];
$template->assign('pageName',$pageName);
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
  include_once(ROOT_PATH."modules/framework.module.php");
  $active='sanpham';
 $template->assign('active',$active);
function validateData($request) {
	global $messages;
	$error = '';
	$validate = new Validate();
	$code = strtolower($request->element('code'));	
	$error .= $validate->validString($messages['code_order1'],$request->element('orderCode'));
	$error .= $validate->validString($messages['code_pass'],$request->element('cell'));	
	if(!isset($_SESSION['rand_code']) || $code != strtolower($_SESSION['rand_code'])) $error .= $messages["invalid_security_code"].'<br />';
	return $error;
}
?>