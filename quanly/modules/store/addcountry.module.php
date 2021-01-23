<?php
/*************************************************************************
Add category
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen                                  
Last updated: 4/12/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/storecountries.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = "storeaddcountry.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$country = new Countries();
$infoClass = 'infoText';

$searchStatus = $request->element('searchStatus','-1');
$searchTerms=$request->element('searchTerms','');
$page= $request->element('page',1);
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
$slug = $request->element('slug',0);
$status = $request->element('status','');
$position = $request->element('position','');

if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	 $validate = validateData($request);
	if($validate == '') {
		$slug=TextFilter::urlize($request->element('slug'),false,'-');
		$countryinfo = new CountryInfo($slug,$vn_name,$en_name,$position,$status);
		$fields = array('slug'=>$countryinfo->getSlug(),
						'vn_name'=>$countryinfo->getName('vn'),
						'en_name'=>$countryinfo->getName('en'),
						'status'=>$countryinfo->getStatus(),
						'position'=>$countryinfo->getPosition()
						);
		$country->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		
		$templateFile = "storelistcountry.temp.html";
		$act = 'list';
		$template->assign("act",$act);
		$pages = $country->getNumItems('id');
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$countryItems = $country->getObjects($page,"1=1", array('position'=>'ASC'));
		$template->assign("listObjects",$countryItems);	
		# Generate and pass link pager to template
		$listPage = linkPager(ADMIN_SCRIPT."?op=store&amp;part=country&amp;act=list&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$template->assign('listObjects',$countryItems);
		$template->assign('country',$country);
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
		$template->assign('status',$status);
		$template->assign('slug',$slug);
		$template->assign('position',$position);
		$template->assign('vn_name',$vn_name);
		$template->assign('en_name',$en_name);
	}
}
$listStatus = optionStatus($request->element('searchStatus','-1'),DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validString($amessages['slug'],$request->element('slug'));
	$infoText .= $validate->validString($amessages['position'],$request->element('position',0));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	return $infoText;
}
?>