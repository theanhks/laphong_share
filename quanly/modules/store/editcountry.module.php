<?php
/*************************************************************************
Add category
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen                                  
Last updated: 4/12/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/storecountries.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = "storeeditcountry.temp.html";
$country = new Countries();
$pcId = $request->element("oId");
$sp = $country->getRecord($pcId);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');

if ($pcId && $sp != ''){
# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);
	
# Get all category object and pass to template
	$countryItems = $country->getObject($pcId);
	$template->assign("listObject",$countryItems);
	
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$slug = $request->element('slug','');
		$status = $request->element('status');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		$page = $request->element('page',1);
		$position = $request->element('position','');
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$countryinfo = new CountryInfo($slug,$vn_name,$en_name,$position,$status);
			$fields = array('slug'=>$countryinfo->getSlug(),
							'vn_name'=>$countryinfo->getName('vn'),
							'en_name'=>$countryinfo->getName('en'),
							'status'=>$countryinfo->getStatus(),
							'position'=>$countryinfo->getPosition()
							);
			$country->updateData($fields, $pcId);
			$infoText = $amessages['item_edit_ok'];
			
			$templateFile = "storelistcountry.temp.html";
			$act = 'list';
			$template->assign("act",$act);
			$pages = $country->getNumItems('id');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$countryItem = $country->getObjects($page,"1=1", array('position'=>'ASC'));
			$template->assign("listObjects",$countryItem);	
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=store&amp;part=country&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("country",$country);
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
			$template->assign("country",$country);
		}
	}
}else{
# Thong bao Khong Ton Tai ID Category
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "errorText";
	$templateFile = "storelistcountry.temp.html";
	$pages = $country->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
if($page > $pages) $page = $pages;
	# Get all category object and pass to template
	$countryItem = $country->getObjects();
	$template->assign("listObjects",$countryItem);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=store&amp;part=country&amp;act=list&amp;page=%s",$pages,$page);
	$act = 'list';
	$template->assign("act",$act);
	$template->assign("adminPager",$listPage);
	$template->assign("country",$country);
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