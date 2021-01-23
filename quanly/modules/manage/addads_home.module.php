<?php
/*************************************************************************
Add Ads
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/adsgroups_home.class.php");
include_once(ROOT_PATH."classes/dao/ads_home.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH."classes/dao/images.class.php");
$templateFile = "manageaddads_home.temp.html";
$gallery = ROOT_PATH."gallery/avatar_upload/ads/";
$gallery_storage = $gallery."/storage/";
$gallery_avatar = $gallery."/avatar/";
$ads = new Ads_home();
$groupads = new AdsGroups_home();
$status = $request->element('status',0);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$gId = $request->element('gId',-1);
$url = $request->element('url','');
$position= $request->element('position',0);
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
			$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,150,150);
			}else $file_name='';
			$logo_url = $file_name;
			$ad = new AdsInfo($gId, $logo_url, $url, $position, $status);
			$fields = array('gId'=>$ad->getGroup(),
							'logo_url'=>$ad->getLogoUrl(),
							'url'=>$ad->getUrl(),
							'position'=>$ad->getPosition(),
							'status'=>$ad->getStatus()
							);
			$ads->addData(&$fields);
			$infoText = $amessages['item_inserted_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$templateFile = "managelistads_home.temp.html";
			$pages = $ads->getNumItems('id');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;	
			
			
			# Get all entries object and pass to template
			$adsItems = $ads->getObjects('',"1=1", array('position'=>'ASC'));
			$template->assign("listObjects",$adsItems);	
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=ads_home&amp;act=list&amp;page=%s",$pages,$page);
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
			$template->assign("gId",$gId);
			$template->assign("url",$url);
			$template->assign("position",$position);
			$template->assign("status",$status);
		}
	}
$listStatus = optionStatus($searchStatus ,DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);
$listGroupads = $groupads->comboListObjects();
$template->assign("listGroupads",$listGroupads);
$template->assign('groupads',$groupads);

function validateData($request) {
	global $amessages;
	$validate = new Validate();
	$infoText = '';
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validStatus($amessages['gId'],$request->element('gId'));
	return $infoText;
}
?>