<?php
/*************************************************************************
Edit Category module
---------------------------------------------------------------
Ava CMS Project
Company: Ava Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated:08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/albumproducts.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/textfilter.class.php");
$templateFile = "manageeditalbumproduct.temp.html";
$albumproducts = new albumproducts();
$pcId = $request->element("oId");
$sp = $albumproducts->getRecord($pcId);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
if($searchStatus == -1) $searchStatus = $request->element('status','-1');
$pId = $request->element('pId','-1');
$template->assign('pId',$pId);
$template->assign('pcId',$pcId);
$template->assign('searchStatus',$searchStatus);
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');
if ($pcId && $sp != ''){
# Get all category object and pass to template
	$pro_cateItems = $albumproducts->getObject($pcId);
	$template->assign("listObject",$pro_cateItems);
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
			$slug=removeSign($vn_name);
			$procateinfo = new albumProduct($slug,0,$vn_name,$en_name,$position,$status);
			$fields = array('slug'=>$procateinfo->getSlug(),
							'vn_name'=>$procateinfo->getName('vn'),
							'en_name'=>$procateinfo->getName('en'),
							'idpro'=>$procateinfo->getIdPro(),
							'status'=>$procateinfo->getStatus(),
							'position'=>$procateinfo->getPosition()
							);
			$albumproducts->updateData($fields, $pcId);
			$infoText = $amessages['item_edit_ok'];
			$searchStatus = -1;
			$templateFile = "managelistalbumproduct.temp.html";
			$act = 'list';
			$template->assign("act",$act);
			$pages = $albumproducts->getNumItems('id');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$pro_cateItem = $albumproducts->getObjects($page,"1>0", array('position'=>'ASC'));
			$template->assign("listObjects",$pro_cateItem);	
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=albumproduct&amp;act=list&amp;searchTerms=".$searchTerms."&amp;searchStatus=".$searchStatus."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("pro_cate",$pro_cate);
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
			$template->assign("albumproducts",$albumproducts);
			$template->assign('status',$status);
			$template->assign('position',$position);
			$template->assign('vn_name',$vn_name);
			$template->assign('en_name',$en_name);
			$template->assign('pId',$pId);
		}
	}
	# Generate status combobox for Search status
	$listStatus = optionStatus($searchStatus);
	$template->assign("listStatus",$listStatus);
	
}else{
# Thong bao Khong Ton Tai ID Category
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "errorText";
	$templateFile = "managelistalbumproduct.temp.html";
	$pages = $albumproducts->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
if($page > $pages) $page = $pages;
	# Get all category object and pass to template
	$pro_cateItem = $albumproducts->getObjects();
	$template->assign("listObjects",$pro_cateItem);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=productcategory&amp;act=list&amp;searchTerms=".$searchTerms."&amp;searchStatus=".$searchStatus."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
	$act = 'list';
	$template->assign("act",$act);
	$template->assign("adminPager",$listPage);
	$template->assign("pro_cate",$pro_cate);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);	
	$template->assign("rows",$rows);
	$template->assign("pages",$page);
}

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));		
	return $infoText;
}
?>