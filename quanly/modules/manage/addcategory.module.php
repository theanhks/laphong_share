<?php
/*************************************************************************
Add category
----------------------------------------------------------------
AvaCMS Project
Company: Ava Co., Ltd                                  
Name: Tran Thi Kim Que                                  
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/categories.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/upload.class.php");
$templateFile = "manageaddcategory.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;

$categories = new Categories();
$infoClass = 'infoText';

$gallery = ROOT_PATH."gallery/avatar_upload/";
$gallery_new = $gallery."category/";
$gallery_storage = $gallery_new."storage/";
$gallery_avatar = $gallery_new."avatar/";

$searchStatus = $request->element('searchStatus','-1');
$searchTerms=$request->element('searchTerms','');
$pId = $request->element('pId');
$page= $request->element('page',1);
$vn_name = $request->element('vn_name',NULL);
$en_name = $request->element('en_name',NULL);
$vn_sapo = $request->element('vn_sapo',NULL);
$en_sapo = $request->element('en_sapo',NULL);
$slug = $request->element('slug',NULL);
$vn_details = $request->element('vn_details',NULL);
$en_details = $request->element('en_details',NULL);
$status = $request->element('status',0);
$position = $request->element('position',0);
$properties = $request->element('home','0');
if($_POST) {
	$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
	$upload = new Upload($files);
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	 $validate = validateData($request);
	 //$files['tmp_name']='';
	if($validate == '') {
		if ($files['tmp_name']!='') {
		$copy = $upload->moveFile($gallery_storage);
		$file_name = $upload->getNameFile();
		if ($upload->isImage($file_name))
		$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,300,300);
		}else $file_name='';
		$slug=removeSign($vn_name);
		//$category = new Categoryinfo($pId,$slug,$vn_name,$en_name,$vn_sapo,$en_sapo,$vn_details,$en_details,$file_name, $status,$position,$properties);
		$category = new Categoryinfo($pId,$slug,$vn_name,$en_name,$vn_sapo,$en_sapo,$vn_details,$en_details,$file_name,$status,$position,$properties);
		$fields = array('pid'=>$category->getPId(),
					'slug'=>$category->getSlug(),
					'vn_name'=>$category->getName('vn'),
					'en_name'=>$category->getName('en'),
					'vn_sapo'=>$category->getSapo('vn'),
					'en_sapo'=>$category->getSapo('en'),
					'vn_details'=>$category->getDetails('vn'),
					'en_details'=>$category->getDetails('en'),
					'avatar'=>$category->getAvatar(),
					'status'=>$category->getStatus(),
					'position'=>$category->getPosition(),
					'properties'=>$category->getProperties()
					);
		
		$categories->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		$act = 'list';
		$template->assign("act",$act);
		$templateFile = "managelistcategory.temp.html";
		
		$pages = $categories->getNumItems('id',"pid=$pId");
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$categoryItems = $categories->getObjects($page,"pid=$pId", array('position'=>'ASC'));
		$template->assign("listObjects",$categoryItems);	
		# Generate and pass link pager to template
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=category&amp;act=list&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$template->assign('listObjects',$categoryItems);
		$template->assign('categories',$categories);
		$template->assign('pId',$pId);
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
		$template->assign('pId',$pId);
		$template->assign('status',$status);
		//$template->assign('slug',$slug);
		$template->assign('position',$position);
		$template->assign('vn_name',$vn_name);
		$template->assign('en_name',$en_name);
		$template->assign('vn_sapo',$vn_sapo);
		$template->assign('en_sapo',$en_sapo);
		$template->assign('vn_details',$vn_details);
		$template->assign('en_details',$en_details);
	}
}
$listStatus = optionStatus($request->element('searchStatus','-1'),DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);
$listCategories = $categories->optionAllCategories('id','vn_name',$pId);

$template->assign("listCategories",$listCategories);

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	//$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	/*
	$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));
	$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));*/
	return $infoText;
}
?>