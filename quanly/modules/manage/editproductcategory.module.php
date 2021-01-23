<?php
/*************************************************************************
Edit Category module
---------------------------------------------------------------
Ava CMS Project
Company: Ava Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated:08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/procategories.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
$templateFile = "manageeditproductcategory.temp.html";
$gallery = ROOT_PATH."gallery/avatar_upload/";
$gallery_new = $gallery."productcat/";
$gallery_storage = $gallery_new."storage/";
$gallery_avatar = $gallery_new."avatar/";
$pro_cate = new ProductCategories();
$pcId = $request->element("oId");
$sp = $pro_cate->getRecord($pcId);
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
	$pro_cateItems = $pro_cate->getObject($pcId);
	$template->assign("listObject",$pro_cateItems);	
	$listParent = $pro_cate->optionAllCategories('id','vn_name',$pId);
	$template->assign("listParent",$listParent);
	$home_old= $pro_cateItems->getDetails("vn");
	$template->assign("home_old",$home_old);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$slug = $request->element('slug','');
		$status = $request->element('status');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		//$vn_details = $request->element('vn_details','');
		#$vn_details = $request->element('home','0');
		$en_details = $request->element('en_details','');
		$page = $request->element('page',1);
		$position = $request->element('position',0);
		$news_avatar = $request->element('news_avatar','');
		# Validation
		$validate = validateData($request);
		if($validate == '') {
		
		
			// avatart tieng viet
			$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
			#$files['tmp_name']='';
			if ($files['tmp_name']!='') {	
				// xoa hinh cu
				unlink(ROOT_PATH."gallery/avatar_upload/productcat/storage/".$news_avatar);
				unlink(ROOT_PATH."gallery/avatar_upload/productcat/avatar/".$news_avatar);
				$upload = new Upload($files);
				$copy = $upload->moveFile($gallery_storage);
				$file_name = $upload->getNameFile();
				if ($upload->isImage($file_name))
				$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_WIDTH,0);
				
			}else $file_name=$news_avatar;
			
			// avatart tieng anh
			$files_en = isset($_FILES['vn_details'])?$_FILES['vn_details']:'';
			if ($files_en['tmp_name']!='') {	
				// xoa hinh cu
				unlink(ROOT_PATH."gallery/avatar_upload/productcat/storage/".$news_avatar_en);
				unlink(ROOT_PATH."gallery/avatar_upload/productcat/avatar/".$news_avatar_en);
				$upload1 = new Upload($files_en);
				$copy = $upload1->moveFile($gallery_storage);
				$file_name_en = $upload1->getNameFile();
				if ($upload1->isImage($file_name))
				$copy_avatar = $upload1->resize($gallery_storage,$gallery_avatar, $file_name_en, $file_name_en,PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_WIDTH,0);
				
			}else $file_name_en=$news_avatar_en;
			
			
			$slug=removeSign($vn_name);
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
			$pro_cate->updateData($fields, $pcId);
			$infoText = $amessages['item_edit_ok'];
			$searchStatus = -1;
			$templateFile = "managelistproductcategory.temp.html";
			$act = 'list';
			$template->assign("act",$act);
			$pages = $pro_cate->getNumItems('id');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$pro_cateItem = $pro_cate->getObjects($page,"pid = $pId", array('position'=>'ASC'));
			$template->assign("listObjects",$pro_cateItem);	
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=productcategory&amp;act=list&amp;searchTerms=".$searchTerms."&amp;searchStatus=".$searchStatus."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
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
			$template->assign("pro_cate",$pro_cate);
			$template->assign('status',$status);
			$template->assign('position',$position);
			$template->assign('vn_name',$vn_name);
			$template->assign('en_name',$en_name);
			$template->assign('vn_details',$vn_details);
			$template->assign('en_details',$en_details);
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
	$templateFile = "managelistproductcategory.temp.html";
	$pages = $pro_cate->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
if($page > $pages) $page = $pages;
	# Get all category object and pass to template
	$pro_cateItem = $pro_cate->getObjects();
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
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));		
	return $infoText;
}
?>