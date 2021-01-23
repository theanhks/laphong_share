<?php
/*************************************************************************
Add GroupAds
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/textbanners.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageaddtextbanner.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$textbanners = new Textbanners();
$searchTerms = $request->element('searchTerms','-1');
$searchStatus = $request->element('searchStatus','-1');
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
$position = $request->element('position','');
$url = $request->element('url','');
$status = $request->element('status',-1);
$page = $request->element('page',1);
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	 $validate = validateData($request);
	if($validate == '') {
	$adsgroupinfo = new TextbannerInfo($vn_name,$en_name,$url,$position,$status);
	$fields = array('vn_name'=>$adsgroupinfo->getName('vn'),
					'en_name'=>$adsgroupinfo->getName('en'),
					'url'=>$adsgroupinfo->getUrl(),
					'position'=>$adsgroupinfo->getPosition(),
					'status'=>$adsgroupinfo->getStatus()
					
					);
		$textbanners->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "infoText";
		$templateFile = "managelisttextbanner.temp.html";
		$act = 'list';
		$template->assign("act",$act);
		$pages = $textbanners->getNumItems();
		$rows = $pages['rows'];
		$pages = $pages['pages'];		
		if($page > $pages) $page = $pages;
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&part=textbanner&act=list&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$groupadsItems = $textbanners->getObjects($page,'1=1');
		$template->assign('listObjects',$groupadsItems);
		$template->assign('textbanners',$textbanners);
		$template->assign("rows",$rows);
		$template->assign("pages",$page);
		
	}else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
		$infoClass = "errorText";	
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign("vn_name",$vn_name);
		$template->assign("en_name",$en_name);
		$template->assign("position",$position);
	}
}
$listStatus = optionStatus($searchStatus,DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);

function validateData($request) {
	global $amessages;
	$validate = new Validate();
	$infoText = '';
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('position'));
	$infoText .= $validate->validString($amessages['en_name'],$request->element('url'));	
	$infoText .= $validate->validString("Nội dung tiếng Việt",$request->element('vn_name'));	
	$infoText .= $validate->validString("Nội dung tiếng Anh",$request->element('en_name'));	
	return $infoText;
}
?>