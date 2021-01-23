<?php
/*************************************************************************
Add category
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen                                  
Last updated: 4/12/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/storecategories.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "storeeditcategory.temp.html";
$storecat = new storeCate();
$pcId = $request->element("oId");
$sp = $storecat->getRecord($pcId);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
if ($pcId && $sp != ''){
# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);
	
# Get all category object and pass to template
	$storecatItems = $storecat->getObject($pcId);
	$template->assign("listObject",$storecatItems);
	
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$slug = $request->element('slug','');
		$status = $request->element('status');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		$num_products = $request->element('num_products','');
		$page = $request->element('page',1);
		$position = $request->element('position','');
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$procateinfo = new storeCateInfo($slug,$vn_name,$en_name,$position,$status);
			$fields = array('slug'=>$procateinfo->getSlug(),
							'vn_name'=>$procateinfo->getName('vn'),
							'en_name'=>$procateinfo->getName('en'),
							'status'=>$procateinfo->getStatus(),
							'position'=>$procateinfo->getPosition()
							);
			$storecat->updateData($fields, $pcId);
			$infoText = $amessages['item_edit_ok'];
			
			$templateFile = "storelistcategory.temp.html";
			$act = 'list';
			$template->assign("act",$act);
			$pages = $storecat->getNumItems('id');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$storecatItem = $storecat->getObjects($page,"1=1", array('position'=>'ASC'));
			$template->assign("listObjects",$storecatItem);	
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=productcategory&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("storecat",$storecat);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
			$template->assign("rows",$rows);
			$template->assign("pages",$pages);
			$template->assign("page",$page);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
		} else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("storecat",$storecat);
		}
	}
}else{
# Thong bao Khong Ton Tai ID Category
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "errorText";
	$templateFile = "storelistcategory.temp.html";
	$pages = $storecat->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
if($page > $pages) $page = $pages;
	# Get all category object and pass to template
	$storecatItem = $storecat->getObjects();
	$template->assign("listObjects",$storecatItem);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=store&amp;part=category&amp;act=list&amp;page=%s",$pages,$page);
	$act = 'list';
	$template->assign("act",$act);
	$template->assign("adminPager",$listPage);
	$template->assign("storecat",$storecat);
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
	$infoText .= $validate->validStatus($amessages['position'],$request->element('position',0));
	$infoText .= $validate->validString($amessages['slug'],$request->element('slug'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	return $infoText;
}
?>