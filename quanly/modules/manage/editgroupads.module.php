<?php
/*************************************************************************
Edit GroupAds module
---------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/adsgroups.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageeditgroupads.temp.html";
$adsgroups = new AdsGroups();
$agId = $request->element("oId");
$sp = $adsgroups->getRecord($agId);
$page = $request->element('page',1);
if ($agId && $sp != ''){
# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);

# Get all GroupAds object and pass to template
	$adsgroupItem = $adsgroups->getObject($agId);
	$template->assign("listObject",$adsgroupItem);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$status = $request->element('status','-1');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$adsgroupinfo = new AdsGroupInfo($vn_name,$en_name,$status);
			$fields = array('vn_name'=>$adsgroupinfo->getName('vn'),
							'en_name'=>$adsgroupinfo->getName('en'),
							'status'=>$adsgroupinfo->getStatus()
							);
			$adsgroups->updateData($fields, $agId);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'listGroup';
			$template->assign("act",$act);
			$templateFile = "managelistgroupads.temp.html";
			$pages = $adsgroups->getNumItems();
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all GroupAds object and pass to template
			$adsgroupItems = $adsgroups->getObjects($page,'1=1');
			$template->assign("listObjects",$adsgroupItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=ads&amp;act=listGroup&amp;page=%s",$pages, $page);
			$template->assign("adminPager",$listPage);
			$template->assign("adsgroups",$adsgroups);
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
			$template->assign("adsgroups",$adsgroups);
			$template->assign("en_name",$en_name);
			$template->assign("vn_name",$vn_name);
			
		}
	}
}else{
# Thong bao Khong Ton Tai ID GroupAds
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "infoText";
	$act = 'listGroup';
	$template->assign("act",$act);
	$templateFile = "managelistgroupads.temp.html";
	$pages = $adsgroups->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all GroupAds object and pass to template
	$adsgroupItems = $adsgroups->getObjects($page,'1=1');
	$template->assign("listObjects",$adsgroupItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=ads&amp;act=listGroup&amp;page=%s",$page);
	$template->assign("adminPager",$listPage);
	$template->assign("adsgroups",$adsgroups);
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
	//$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));	
	return $infoText;
}
?>