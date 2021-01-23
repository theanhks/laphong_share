<?php
/************************************************************************* properties
Edit Category module
---------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/categories.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
$templateFile = "manageeditcategory.temp.html";
$categories = new Categories();

$gallery = ROOT_PATH."gallery/avatar_upload/";
$gallery_new = $gallery."category/";
$gallery_storage = $gallery_new."storage/";
$gallery_avatar = $gallery_new."avatar/";
$cId = $request->element("oId");
$sp = $categories->getRecord($cId);
$properties = $request->element('home','0');
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
if ($cId && $sp != ''){
# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);
	
# Generate category combobox for Search form
	$listCategories = $categories->optionAllCategories('id','vn_name',$request->element('pId'));
	$template->assign("listCategories",$listCategories);
	
# Get all category object and pass to template
	$categoryItems = $categories->getObject($cId);
	$template->assign("listObject",$categoryItems);
	
	if($_POST) {
		//$editslug = $request->element('slug','');
		$status = $request->element('status',0);
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		$vn_sapo = $request->element('vn_sapo','');
		$en_sapo = $request->element('en_sapo','');
		$vn_details = $request->element('vn_details','');
		$en_details = $request->element('en_details','');
		$pId = $request->element('pId');
		$page = $request->element('page',1);
		$position = $request->element('position',0);
		$news_avatar =$request->element('news_avatar','');
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
			//$files['tmp_name']='';
			if ($files['tmp_name']!='') {	
				// xoa hinh cu
				unlink(ROOT_PATH."gallery/avatar_upload/category/storage/".$news_avatar);
				unlink(ROOT_PATH."gallery/avatar_upload/category/avatar/".$news_avatar);
				$upload = new Upload($files);
				$copy = $upload->moveFile($gallery_storage);
				$file_name = $upload->getNameFile();
				if ($upload->isImage($file_name))
				$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,300,300);
				
			}else $file_name=$news_avatar;
			$slug=removeSign($vn_name);
			$category = new Categoryinfo($pId,$slug,$vn_name,$en_name,$vn_sapo,$en_sapo,$vn_details,$en_details,$file_name, $status,$position,$properties);
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
	
			
			$categories->updateData($fields, $cId);
			$infoText = $amessages['item_edit_ok'];
			
			$templateFile = "managelistcategory.temp.html";
			$act = 'list';
			$template->assign("act",$act);
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
			$template->assign("categories",$categories);
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
			$template->assign("categories",$categories);
			$template->assign("pId",$pId);
			$template->assign("vn_name",$vn_name);
			$template->assign("en_name",$en_name);
			$template->assign("vn_sapo",$vn_sapo);
			$template->assign("en_sapo",$en_sapo);
			$template->assign("vn_details",$vn_details);
			$template->assign("en_details",$en_details);
			$template->assign("status",$status);
			$template->assign("position",$position);
		}
	}
}else{
# Thong bao Khong Ton Tai ID Category
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "errorText";
	$templateFile = "managelistcategory.temp.html";
	$pages = $categories->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
if($page > $pages) $page = $pages;
	# Get all category object and pass to template
	$categoryItems = $categories->getObjects();
	$template->assign("listObjects",$categoryItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=category&amp;act=list&amp;page=%s",$pages,$page);
	$act = 'list';
	$template->assign("act",$act);
	$template->assign("adminPager",$listPage);
	$template->assign("categories",$categories);
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
	//$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));	
	#$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));	
	return $infoText;
}
?>