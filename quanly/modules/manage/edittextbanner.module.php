<?php
/*************************************************************************
Edit GroupAds module
---------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/textbanners.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageedittextbanner.temp.html";
$textbanners = new Textbanners();
$agId = $request->element("oId");
$sp = $textbanners->getRecord($agId);
$page = $request->element('page',1);
if ($agId && $sp != ''){
# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);

# Get all GroupAds object and pass to template
	$adsgroupItem = $textbanners->getObject($agId);
	$template->assign("listObject",$adsgroupItem);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$status = $request->element('status','-1');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		$url = $request->element('url','');
		$position = $request->element('position','');
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$adsgroupinfo = new TextbannerInfo($vn_name,$en_name,$url,$position,$status);
			$fields = array('vn_name'=>$adsgroupinfo->getName('vn'),
							'en_name'=>$adsgroupinfo->getName('en'),
							'url'=>$adsgroupinfo->getUrl(),
							'position'=>$adsgroupinfo->getPosition('en'),
							'status'=>$adsgroupinfo->getStatus()
							);
			$textbanners->updateData($fields, $agId);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'listGroup';
			$template->assign("act",$act);
			$templateFile = "managelisttextbanner.temp.html";
			$pages = $textbanners->getNumItems();
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all GroupAds object and pass to template
			$adsgroupItems = $textbanners->getObjects($page,'1=1');
			$template->assign("listObjects",$adsgroupItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=textbanner&amp;act=list&amp;page=%s",$pages, $page);
			$template->assign("adminPager",$listPage);
			$template->assign("textbanners",$textbanners);
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
			$template->assign("position",$position);
			$template->assign("en_name",$en_name);
			$template->assign("vn_name",$vn_name);
			$template->assign("url",$url);
		}
	}
}else{
# Thong bao Khong Ton Tai ID GroupAds
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "infoText";
	$act = 'list';
	$template->assign("act",$act);
	$templateFile = "managelisttextbanner.temp.html";
	$pages = $textbanners->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all GroupAds object and pass to template
	$adsgroupItems = $textbanners->getObjects($page,'1=1');
	$template->assign("listObjects",$adsgroupItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=textbanner&amp;act=list&amp;page=%s",$page);
	$template->assign("adminPager",$listPage);
	$template->assign("textbanners",$textbanners);
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
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('position'));
	$infoText .= $validate->validString($amessages['en_name'],$request->element('url'));	
	$infoText .= $validate->validString("Nội dung tiếng Việt",$request->element('vn_name'));	
	$infoText .= $validate->validString("Nội dung tiếng Anh",$request->element('en_name'));	
	return $infoText;
}
?>