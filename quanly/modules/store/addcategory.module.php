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
include_once(ROOT_PATH.'classes/dao/storecategories.class.php');
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "storeaddcategory.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$storeCate = new storeCate();
$infoClass = 'infoText';


$pId = $request->element('pId');
$searchStatus = $request->element('searchStatus','-1');
$searchTerms=$request->element('searchTerms','');
$page= $request->element('page',1);
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
$slug = $request->element('slug',0);
$num_products = $request->element('num_products','');

$status = $request->element('status','');
$position = $request->element('position','');
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	 $validate = validateData($request);
	if($validate == '') {
		$slug=TextFilter::urlize($request->element('slug'),false,'-');
		$procateinfo = new storeCateInfo($pId,$slug,$vn_name,$en_name,$position,$num_products,$status);
		$fields = array('pid'=>$procateinfo->getPId(),
						'slug'=>$procateinfo->getSlug(),
						'vn_name'=>$procateinfo->getName('vn'),
						'en_name'=>$procateinfo->getName('en'),
						'num_products'=>$procateinfo->getNumProducts(),
						'status'=>$procateinfo->getStatus(),
						'position'=>$procateinfo->getPosition()
						);
		$storeCate->addData($fields);
		#echo "AAAAAAAAAAAAAA";

		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		
		$templateFile = "storelistcategory.temp.html";
		$act = 'list';
		$template->assign("act",$act);
		$pages = $storeCate->getNumItems('id');
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$storeCateItems = $storeCate->getObjects($page,"1=1", array('position'=>'ASC'));
		$template->assign("listObjects",$storeCateItems);	
		# Generate and pass link pager to template
$listPage = linkPager(ADMIN_SCRIPT."?op=store&amp;part=category&amp;act=list&amp;searchTerms=".$searchTerms."&amp;status=".$searchStatus."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$template->assign('listObjects',$storeCateItems);
		$template->assign('storeCate',$storeCate);
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
		$template->assign('num_products',$num_products);
	}
}
$listStatus = optionStatus($request->element('searchStatus','-1'),DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);
$listCategories = $storeCate->optionAllCategories('id','vn_name',$pId);
$template->assign("listCategories",$listCategories);
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