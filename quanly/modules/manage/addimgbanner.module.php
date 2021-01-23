<?php
/*************************************************************************
Add Ads
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/imgbanners.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH."classes/data/validate.class.php");
$templateFile = "manageaddimgbanner.temp.html";
$gallery = ROOT_PATH."gallery/avatar_upload/banners/";
$gallery_storage = $gallery."/storage/";
$gallery_avatar = $gallery."/avatar/";
$imgbanners = new Imgbanners();
$status = $request->element('status',0);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$url = $request->element('url','');
$position=  $request->element('position','');
$vn_name=  $request->element('vn_name','');
$en_name=  $request->element('en_name','');
$vn_details=  $request->element('vn_details','');
$en_details=  $request->element('en_details','');
$page = $request->element('page',1);
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
if($_POST) {
		# Validation
		$validate = validateData($request);
		if($validate == '') {
		$files = isset($_FILES['logo_url'])?$_FILES['logo_url']:'';
			if ($files['tmp_name']!='') {
			$upload = new Upload($files);
			$copy = $upload->moveFile($gallery_storage);
			$file_name = $upload->getNameFile();
			if ($upload->isImage($file_name))
			$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,173,143);
			}else $file_name='';
			$logo_url = $file_name;
			$ad = new ImgbannerInfo($logo_url, $url, $vn_name,$vn_name,$vn_details,$en_details,$position, $status);
			$fields = array(
							'logo_url'=>$ad->getLogoUrl(),
							'url'=>$ad->getUrl(),
							'vn_name'=>$ad->getName('vn'),
							'en_name'=>$ad->getName('en'),
							'vn_details'=>$ad->getDetails('vn'),
							'en_details'=>$ad->getDetails('en'),
							'position'=>$ad->getPosition(),
							'status'=>$ad->getStatus()
							);
			$imgbanners->addData(&$fields);
			$infoText = $amessages['item_inserted_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$templateFile = "managelistimgbanner.temp.html";
			$pages = $imgbanners->getNumItems('id');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$adsItems = $imgbanners->getObjects('',"1=1", array('id'=>'DESC'));
			$template->assign("listObjects",$adsItems);	
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=imgbanner&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("rows",$rows);
			$template->assign("pages",$page);
			$template->assign("start",($page - 1) * $items_per_pages);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
		}else {
			$infoText = $amessages['item_inserted_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("url",$url);
			$template->assign("position",$position);
			$template->assign("status",$status);
			$template->assign("name",$name);
		}
	}
$listStatus = optionStatus($searchStatus ,DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);

function validateData($request) {
	global $amessages;
	$files = isset($_FILES['logo_url'])?$_FILES['logo_url']:'';
	$upload = new Upload($files);
	$validate = new Validate();
	$infoText = '';
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validString($amessages['name'],$request->element('vn_name'));
/*	$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));
	$infoText .= $validate->validString($amessages['en_details'],$request->element('en_details'));*/
	#$infoText .= $validate->validCheckType("Logo",$upload->checkType());
	return $infoText;
}
?>