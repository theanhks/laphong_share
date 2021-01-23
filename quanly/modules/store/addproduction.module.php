<?php
/*************************************************************************
Add category
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen                                  
Last updated: 4/12/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/storeproduction.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH."classes/dao/images.class.php");

$templateFile = "storeaddproduction.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$production = new Production();
$infoClass = 'infoText';
$gallery = ROOT_PATH."gallery/album/";
$gallery_storage = $gallery."storage/";
$gallery_upload = ROOT_PATH."gallery/avatar_upload/product/";

$searchStatus = $request->element('searchStatus','-1');
$searchTerms=$request->element('searchTerms','');
$page= $request->element('page',1);

if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	$vn_name = $request->element('vn_name','');
	$en_name = $request->element('en_name','');
	$slug = $request->element('slug',0);
	$num_products = $request->element('num_products','');
	$status = $request->element('status','');
	$position = $request->element('position','');
	$files = isset($_FILES['logo'])?$_FILES['logo']:'';
	$upload = new Upload($files);
	$img =  new Images();
	if($files) {
		# Validation
		 $validate = validateData($request);
		if($validate == '') {
			$copy = $upload->moveFile($gallery_storage);
			$file_name = $upload->getNameFile();
			$copy_img = $img->resize($gallery_storage,$gallery_upload, $file_name, $file_name, 150,true);
			$slug=TextFilter::urlize($request->element('slug'),false,'-');
			$productioninfo = new ProductionInfo($slug,$vn_name,$en_name,$position,$num_products,$file_name,$status);
			$fields = array('slug'=>$productioninfo->getSlug(),
							'vn_name'=>$productioninfo->getName('vn'),
							'en_name'=>$productioninfo->getName('en'),
							'num_products'=>$productioninfo->getNumProducts(),
							'logo'=>$productioninfo->getLogo(),
							'status'=>$productioninfo->getStatus(),
							'position'=>$productioninfo->getPosition()
							);
			$production->addData($fields);
			$infoText = $amessages['item_inserted_ok'];
			$infoClass = "InfoText";
			
			$templateFile = "managelistproduction.temp.html";
			$act = 'list';
			$template->assign("act",$act);
			$pages = $production->getNumItems('id');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$productionItems = $production->getObjects($page,"1=1", array('position'=>'ASC'));
			$template->assign("listObjects",$productionItems);	
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=production&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign('listObjects',$productionItems);
			$template->assign('production',$production);
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
	$infoText .= $validate->validString($amessages['num_products'],$request->element('num_products'));
	return $infoText;
}
?>