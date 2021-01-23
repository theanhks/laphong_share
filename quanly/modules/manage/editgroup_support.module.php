<?php
/*************************************************************************
Edit GroupAds module
---------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/parts.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageeditgroup_support.temp.html";
$parts = new Parts();
$Id = $request->element("oId");
$sp = $parts->getRecord($Id);
$page = $request->element('page',1);
$searchStatus = $request->element('searchStatus','-1');
if($searchStatus == -1) $searchStatus = $request->element('status','-1');
if ($Id && $sp != ''){
# Get all GroupAds object and pass to template
	$partsItem = $parts->getObject($Id);
	$template->assign("listObject",$partsItem);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$status = $request->element('status','-1');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$partsinfo = new PartsInfo($vn_name,$en_name,$status);
			$fields = array('vn_name'=>$partsinfo->getName('vn'),
							'en_name'=>$partsinfo->getName('en'),
							'status'=>$partsinfo->getStatus()
							);
			$parts->updateData($fields, $Id);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$searchStatus = -1;
			$templateFile = "managelistgroup_support.temp.html";
			$pages = $parts->getNumItems();
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all GroupAds object and pass to template
			$partsItems = $parts->getObjects($page,'1=1');
			$template->assign("listObjects",$partsItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=group_support&amp;act=list&amp;page=%s",$pages, $page);
			$template->assign("adminPager",$listPage);
			$template->assign("parts",$parts);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
			$template->assign("rows",$rows);
			$template->assign("pages",$pages);
			$template->assign("page",$page);
		} else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("parts",$parts);
		}
	}
	# Generate status combobox for Search form
	$listStatus = optionStatus($searchStatus);
	$template->assign("listStatus",$listStatus);
}else{
# Thong bao Khong Ton Tai ID GroupAds
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "infoText";
	$act = 'list';
	$template->assign("act",$act);
	$templateFile = "managelistgroup_support.temp.html";
	$pages = $parts->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all GroupAds object and pass to template
	$partsItems = $parts->getObjects($page,'1=1');
	$template->assign("listObjects",$partsItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=group_support&amp;act=list&amp;page=%s", $pages, $page);
	$template->assign("adminPager",$listPage);
	$template->assign("parts",$parts);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);	
	$template->assign("rows",$rows);
	$template->assign("pages",$page);
}

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));	
	return $infoText;
}
?>