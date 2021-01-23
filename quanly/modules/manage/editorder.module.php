<?php
/*************************************************************************
Add category
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                  
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/order.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = 'manageeditorder.temp.html';
$order = new Order();
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$infoText = '';
$infoClass = 'infoText';

$Id = $request->element('oId');
$sp = $order->getRecord($Id);
$page= $request->element('page',1);
$searchStatus = $request->element('searchStatus','-1');
if($searchStatus==-1) $searchStatus = $request->element('status','-1');
$template->assign('Id',$Id);
$orderBy = $request->element('orderBy','date_created');
$orderDir = $request->element('orderDir','ASC');

if($Id && $sp != '') {
	$orderItem = $order->getObject($Id);
	$template->assign("listObject",$orderItem);
	
	$name = $request->element('name','');
	$tel = $request->element('tel','');
	$status = $request->element('status','');
	$address = $request->element('address','');
	$province = $request->element('province','');
	$email = $request->element('email','');
	$comment = $request->element('comment','');
	$deposited = $request->element('deposited','');
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$orderinfo = new OrderInfo('','',$name,$email,$address,$province,$tel, $tel,'','',0,'','','',0,$comment,'',date("Y-m-d H:s"), $status, '', $deposited);
			$fields = array('name'=>$orderinfo->getName(),
							'email'=>$orderinfo->getEmail(),
							'address'=>$orderinfo->getAddress(),
							'province'=>$orderinfo->getProvince(),
							'tel'=>$orderinfo->getTel(),
							'cell'=>$orderinfo->getCell(),
							'comment'=>$orderinfo->getComment(),
							'last_updated'=>$orderinfo->getLastUpdated(),
							'status'=>$orderinfo->getStatus()
							);
			$order->updateData($fields, $Id);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "InfoText";
			$searchStatus =-1 ;
			$searchParts =-1;
			$templateFile = "managelistorder.temp.html";
			$act = 'list';
			$template->assign("act",$act);
			$pages = $order->getNumItems('id',"1=1");
			$rows = $pages['rows'];
			$pages = $pages['pages'];			
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$orderItems = $order->getObjects($page,"1=1", array('date_created'=>'ASC'));
			$template->assign("listObjects",$orderItems);				
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=order&amp;act=list&amp;searchTerms=".$searchTerms."&amp;searchStatus=".$searchStatus."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign('order',$order);
			$template->assign("rows",$rows);
			$template->assign("page",$page);
			$template->assign("pages",$pages);
			$template->assign("start",($page - 1) * $items_per_pages);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign('name',$name);
			$template->assign('comment',$comment);
			$template->assign('tel',$tel);
			$template->assign('province',$province);
			$template->assign('email',$email);
			$template->assign('status',$status);
			$template->assign('deposited',$deposited);
			$template->assign('address',$address);
		}
	}
	$listStatus = optionStatus($searchStatus,DEFAULT_ADMIN_LANGUAGE);
	$template->assign("listStatus",$listStatus);
}
function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$error .= $validate->validString($messages['fullname'],$request->element('name'));
	$error .= $validate->validString($messages['email'],$request->element('email'));
	$error .= $validate->validEmail($messages['email'],$request->element('email'));
	$error .= $validate->validString($messages['tel'],$request->element('tel'));
	return $infoText;
}
?>