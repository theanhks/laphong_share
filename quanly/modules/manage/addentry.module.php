<?php

/*************************************************************************
List entries
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/entries.class.php');
include_once(ROOT_PATH.'classes/dao/categories.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");

$templateFile = 'manageaddentry.temp.html';
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;

$gallery = ROOT_PATH."gallery/avatar_upload/";
$gallery_new = $gallery."entry/";
$gallery_storage = $gallery_new."/storage/";
$gallery_avatar = $gallery_new."/avatar";
$gallery_thubnail = $gallery_new."/thubnail";

$entries = new Entries();
$infoText = '';
$infoClass = 'infoText';

# Read parameters from request
$lang = $request->element('lang','vn');
$slug = $request->element('slug','');
$status = $request->element('status','1');
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
$vn_sapo = $request->element('vn_sapo','');
$en_sapo = $request->element('en_sapo','');
$vn_details = $request->element('vn_details','');
$en_details = $request->element('en_details','');
$cId = $request->element('cId','-1');
$home = $request->element('frontend',0);
$popup = $request->element('popup','');
$page = $request->element('page',1);
$position = $request->element('position',0);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$searchLang = $request->element('searchLang','-1');
$searchCategory = $request->element('searchCategory','-1');
$keywords = $request->element('keywords','');
# Generate status combobox for Search form
$listStatus = optionStatus($searchStatus);
$template->assign("listStatus",$listStatus);

$categories= new Categories();
$listCategories = $categories->optionAllCategories('id','vn_name',$searchCategory);
$template->assign("listCategories",$listCategories);
# Generate status combobox for Search form
$listLang = optionLang($searchLang);
$template->assign("listLang",$listLang);
/*$setwatermark = $request->element('setwatermark');*/
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	$validate = validateData($request);
	if($validate == '') {
		$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
		if($files['tmp_name']){ 
			$upload = new Upload($files);
			$upload->moveFile($gallery_storage);
			$file_name = $upload->getNameFile();
			if ($upload->isImage($file_name)){
				$upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_HEIGHT,0);
				$upload->resize($gallery_storage,$gallery_thubnail, $file_name,$file_name,PRO_IMAGE_THUMB_WIDTH,PRO_IMAGE_THUMB_HEIGHT,0);
			}
		}else $file_name='';
		$slug=removeSign($vn_name);
			
		$data = new Entryinfo($cId, $slug,$lang,$vn_name,$en_name, $keywords, $vn_sapo,$en_sapo,$vn_details,$en_details,$status,$home,date("Y-m-d H:i:s"),$file_name,$position);
	
		$fields = array ('cid'=>$data->getCId(),
		 				'slug'=>$data->getSlug(),
						'lang'=>$data->getLang(), 
						'vn_name'=>$data->getName('vn'),
						'en_name'=>$data->getName('en'),
						'keywords'=>$data->getKeywords(),
						'vn_sapo'=>$data->getSapo('vn'),
						'en_sapo'=>$data->getSapo('en'),
						'vn_details'=>$data->getDetails('vn'),
						'en_details'=>$data->getDetails('en'),
						'status'=>$data->getStatus(), 
						'date_created'=>$data->getDateCreated(), 
						'avatar'=>$data->getAvatar(),						
						'position'=>$data->getPosition(),
						'home'=>$data->getHome()
						);
		$entries->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		$act = 'list';
		$template->assign("act",$act);
		$templateFile = "managelistentry.temp.html";
		$pages = $entries->getNumItems();
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;
		
		# Get all entries object and pass to template
		$entryItems = $entries->getObjects($page, "1=1", array('date_created'=>'DESC'));
		$template->assign("listObjects",$entryItems);
		
		# Generate and pass link pager to template
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=entry&amp;act=list&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$template->assign("listCategories",$listCategories);
		$template->assign("categories",$categories);
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign("rows",$rows);
		$template->assign("page",$page);
		$template->assign("pages",$pages);
		$template->assign("searchTerms",$searchTerms);
		$template->assign("searchLang",$searchLang);
		$template->assign("searchStatus",$searchStatus);
		$template->assign("searchCategory",$searchCategory);
		
	} else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
		$infoClass = "errorText";
		$template->assign("lang",$lang);
		$template->assign("status",$status);
		$template->assign("cId",$cId);
		$template->assign("vn_name",$vn_name);
		$template->assign("en_name",$en_name);
		$template->assign("vn_sapo",$vn_sapo);
		$template->assign("en_sapo",$en_sapo);
		$template->assign("vn_details",$vn_details);
		$template->assign("en_details",$en_details);
		$template->assign("position",$position);
		$template->assign("home",$home);
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign("categories",$categories);
		$template->assign("entries",$entries);
		$template->assign("popup",$popup);
	}
}
function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['category'],$request->element('cId'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	#$infoText .= $validate->validString($amessages['vn_sapo'],$request->element('vn_sapo'));
	#$infoText .= $validate->validString($amessages['en_sapo'],$request->element('en_sapo'));
	#$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));
	#$infoText .= $validate->validString($amessages['en_details'],$request->element('en_details'));
	return $infoText;
}
?>