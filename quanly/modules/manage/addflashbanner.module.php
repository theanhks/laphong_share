<?php
/*************************************************************************
Add Ads
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/flashbanners.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
$templateFile = "manageaddflashbanner.temp.html";
$gallery = ROOT_PATH."gallery/avatar_upload/flash/";
$gallery_storage = $gallery."/storage/";
$flashbaners = new Flashbanners();
$status = $request->element('status',0);
$searchStatus = $request->element('searchStatus','-1');
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
			}else $file_name='';
			$logo_url = $file_name;
			$ad = new FlashInfo($logo_url, $status);
			$fields = array(
							'logo_url'=>$ad->getLogoUrl(),
							'status'=>$ad->getStatus()
							);
			$flashbaners->addData(&$fields);
			$infoText = $amessages['item_inserted_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$templateFile = "managelistflashbanner.temp.html";
			$pages = $flashbaners->getNumItems('id');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$adsItems = $flashbaners->getObjects('',"1=1", array('id'=>'DESC'));
			$template->assign("listObjects",$adsItems);	
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=flashbaner&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("rows",$rows);
			$template->assign("pages",$page);
			$template->assign("start",($page - 1) * $items_per_pages);
			$template->assign("searchStatus",$searchStatus);
		}else {
			$infoText = $amessages['item_inserted_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);

			$template->assign("status",$status);
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
	$infoText .= $validate->validCheckType("Banner",$upload->checkType());
	return $infoText;
}
?>