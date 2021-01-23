<?php
/*************************************************************************
Add category
----------------------------------------------------------------
Ava CMS Project
Company: Ava Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated:08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/albumproducts.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageaddalbumproduct.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$albumproducts = new albumProducts();
$infoClass = 'infoText';

$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');
$page= $request->element('page',1);
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
$pId = $request->element('pId');
$status = $request->element('status','-1');
$position = $request->element('position',0);
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	 $validate = validateData($request);
	if($validate == '') {
		$slug=removeSign($vn_name);
		$procateinfo = new albumProduct($slug,0,$vn_name,$en_name,$position,$status);
		$fields = array('slug'=>$procateinfo->getSlug(),
						'vn_name'=>$procateinfo->getName('vn'),
						'en_name'=>$procateinfo->getName('en'),
						'idpro'=>$procateinfo->getIdPro(),
						'status'=>$procateinfo->getStatus(),
						'position'=>$procateinfo->getPosition()
						);
		$albumproducts->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		
		$templateFile = "managelistalbumproduct.temp.html";
		$act = 'list';
		$template->assign("act",$act);
		$pages = $albumproducts->getNumItems('id');
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$pro_cateItems = $albumproducts->getObjects($page,"1>0", array('position'=>'ASC'));
		$template->assign("listObjects",$pro_cateItems);	
		# Generate and pass link pager to template
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=albumproduct&amp;act=list&amp;searchTerms=".$searchTerms."&amp;searchStatus=".$searchStatus."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$template->assign('listObjects',$pro_cateItems);
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
		$template->assign('position',$position);
		$template->assign('vn_name',$vn_name);
		$template->assign('en_name',$en_name);
		$template->assign('pId',$pId);
	}
}
$listStatus = optionStatus($status,DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	return $infoText;
}
?>