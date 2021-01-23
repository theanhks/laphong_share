<?php
/*************************************************************************
Add category
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/customers.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageaddcustomer.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$customers = new Customers();
$infoClass = 'infoText';
$searchStatus = $request->element('searchStatus','-1');
$searchTerms=$request->element('searchTerms','');
$gcId = $request->element('gcId','-1');
$page= $request->element('page',1);
$name = $request->element('name','');
$tel = $request->element('tel','');
$email = $request->element('email','');
$address = $request->element('address','');
$status = $request->element('status',0);
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	 $validate = validateData($request);
	if($validate == '') {
		$nhomid=rand();
		$customer = new CustomerInfo($nhomid,0,0, $name, $address, $email, $tel, $status);
		$fields = array('nhomid'=>$customer->getNhom(),
						'ngonnguid'=>$customer->getNgonngu(),
						'dotuoiid'=>$customer->getDotuoi(),
						'name'=>$customer->getName(),
						'address'=>$customer->getAddress(),
						'email'=>$customer->getEmail(),
						'tel'=>$customer->getTel(),
						'status'=>$customer->getStatus()
						);
		$customers->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		//$sql="INSERT INTO `n_cus_email` (`id` ,`gcId` ,`email` ,`status`) VALUES (NULL , $gcId, '$email', '1')";
		//$ok = mysql_query($sql);
		$templateFile = "managelistcustomer.temp.html";
		$act = 'list';
		$template->assign("act",$act);
		$pages = $customers->getNumItems('id',"1=1");
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$supportItems = $customers->getObjects($page,"1=1", array('id'=>'DESC'));
		$template->assign("listObjects",$supportItems);	
		# Generate and pass link pager to template
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=customer&amp;act=list&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$template->assign('support',$support);
		$template->assign('paId',$paId);
		$template->assign("rows",$rows);
		$template->assign("page",$page);
		$template->assign("pages",$pages);
		$template->assign("start",($page - 1) * $items_per_pages);
		$template->assign("searchTerms",$searchTerms);
		$template->assign("searchStatus",$searchStatus);
	}else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
		$infoClass = "errorText";	
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign('gcId',$gcId);
		$template->assign('name',$name);
		$template->assign('tel',$tel);
		$template->assign('address',$address);
		$template->assign('email',$email);
		$template->assign('status',$status);

	}
}
$listStatus = optionStatus($request->element('searchStatus','-1'),DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validString($amessages['name'],$request->element('name'));
	$infoText .= $validate->validString($amessages['email'],$request->element('email'));
	#$infoText .= $validate->validString($amessages['tel'],$request->element('tel'));
	#$infoText .= $validate->validString($amessages['address'],$request->element('address'));
	return $infoText;
}
?>