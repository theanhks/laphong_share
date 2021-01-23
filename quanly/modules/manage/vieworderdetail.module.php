<?php
/*************************************************************************
List categories
----------------------------------------------------------------
Company: Universal Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 10/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/order.class.php");
include_once(ROOT_PATH."classes/dao/orderitem.class.php");
include_once(ROOT_PATH."classes/dao/members.class.php");
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = 'managevieworderdetail.temp.html';


$order = new Order();
$orderitem = new OrderItem();
$products = new Products();
$members = new Members;

$mId = $request->element('mId');
$oId = $request->element('oId');

$infoMember = $members->getObject($mId);
$template->assign("infoMember", $infoMember);

$infoOrder = $order->getObject($oId);
$template->assign("infoOrder", $infoOrder);

$infoOrderItem = $orderitem->getOrderItemFromOId($oId);
$template->assign("infoOrderItem", $infoOrderItem);

$template->assign("products", $products);

?>