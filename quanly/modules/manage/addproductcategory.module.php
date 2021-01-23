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
include_once(ROOT_PATH."classes/dao/procategories.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageaddproductcategory.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$gallery = ROOT_PATH."gallery/avatar_upload/";
$gallery_new = $gallery."productcat/";
$gallery_storage = $gallery_new."storage/";
$gallery_avatar = $gallery_new."avatar/";
$pro_cate = new ProductCategories();
$infoClass = 'infoText';

$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');
$page= $request->element('page',1);
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
//$vn_details = $request->element('vn_details','');
$en_details = $request->element('en_details','');
$pId = $request->element('pId');
$status = $request->element('status','-1');
$position = $request->element('position',0);

$listParent = $pro_cate->optionAllCategories('id','vn_name',$pId);
$template->assign("listParent",$listParent);
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	 $validate = validateData($request);
	if($validate == '') {
		$slug=removeSign($vn_name);
		
		//avatart tieng viet
		$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
		#$files['tmp_name']='';
		if ($files['tmp_name']!='') {
		$upload = new Upload($files);
		$copy = $upload->moveFile($gallery_storage);
		$file_name = $upload->getNameFile();
		if ($upload->isImage($file_name))
		$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,150,120);
		}else $file_name='';
		
		//avatart tieng anh
		$files_en = isset($_FILES['vn_details'])?$_FILES['vn_details']:'';
		#$files['tmp_name']='';
		if ($files_en['tmp_name']!='') {
		$upload1 = new Upload($files_en);
		$copy = $upload1->moveFile($gallery_storage);
		$file_name_en = $upload1->getNameFile();
		if ($upload1->isImage($file_name_en))
		$copy_avatar = $upload1->resize($gallery_storage,$gallery_avatar, $file_name_en, $file_name_en,150,120);
		}else $file_name_en='';
		
		$procateinfo = new ProCategoryInfo($slug,$pId,$vn_name,$en_name,$file_name_en,$en_details,$file_name,$position,$status);
		$fields = array('slug'=>$procateinfo->getSlug(),
							'vn_name'=>$procateinfo->getName('vn'),
							'en_name'=>$procateinfo->getName('en'),
							'vn_details'=>$procateinfo->getDetails('vn'),
							'en_details'=>$procateinfo->getDetails('en'),
							'avatar'=>$procateinfo->getAvatar(),
							'pid'=>$procateinfo->getPPCId(),
							'status'=>$procateinfo->getStatus(),
							'position'=>$procateinfo->getPosition()
							);
		$pro_cate->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		
		$templateFile = "managelistproductcategory.temp.html";
		$act = 'list';
		$template->assign("act",$act);
		$pages = $pro_cate->getNumItems('id');
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$pro_cateItems = $pro_cate->getObjects($page,"pid = $pId", array('position'=>'ASC'));
		$template->assign("listObjects",$pro_cateItems);	
		# Generate and pass link pager to template
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=productcategory&amp;act=list&amp;searchTerms=".$searchTerms."&amp;searchStatus=".$searchStatus."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
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
		$template->assign('vn_details',$vn_details);
		$template->assign('en_details',$en_details);
		$template->assign('pId',$pId);
	}
}
$listStatus = optionStatus($status,DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);
$template->assign('pro_cate',$pro_cate);

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	return $infoText;
}
?>