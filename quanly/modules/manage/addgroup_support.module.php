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
include_once(ROOT_PATH."classes/dao/parts.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageaddgroup_support.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$parts = new Parts();
$searchTerms=$request->element('searchTerms','-1');
$searchStatus=$request->element('searchStatus','-1');
$vn_name = $request->element('vn_name','0');
$en_name = $request->element('en_name','0');
$status = $request->element('status',-1);
$page = $request->element('page',1);
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	 $validate = validateData($request);
	if($validate == '') {
	$partsinfo = new PartsInfo($vn_name,$en_name,$status);
	$fields = array('vn_name'=>$partsinfo->getName('vn'),
					'en_name'=>$partsinfo->getName('en'),
					'status'=>$partsinfo->getStatus()
					);
		$parts->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "infoText";
		$templateFile = "managelistgroup_support.temp.html";
		$act = 'list';
		$template->assign("act",$act);
		$pages=$parts->getNumItems();
		$page = $pages['pages'];
		$rows = $pages['rows'];
		if($page > $pages) $page = $pages;
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&part=group_support&act=list&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$partsItems = $parts->getObjects($page,'1=1');
		$template->assign('listObjects',$partsItems);
		$template->assign('parts',$parts);
		$template->assign("rows",$rows);
		$template->assign("pages",$page);
		
	}else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
		$infoClass = "errorText";	
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
	}
}
$listStatus = optionStatus($searchStatus,DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);

function validateData($request) {
	global $amessages;
	$validate = new Validate();
	$infoText = '';
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	return $infoText;
}
?>