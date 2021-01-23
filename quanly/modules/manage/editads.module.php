
<?php
/*************************************************************************
Edit Ads module
---------------------------------------------------------------
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/

include_once(ROOT_PATH."classes/dao/ads.class.php");
include_once(ROOT_PATH."classes/dao/adsgroups.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/upload.class.php");
$templateFile = "manageeditads.temp.html";
$gallery = ROOT_PATH."gallery/avatar_upload/ads";
$gallery_avatar =  $gallery."/avatar/";
$gallery_storage = $gallery."/storage/";
$ads = new Ads();
$groupads= new AdsGroups();
$aId = $request->element("oId");
$sp = $ads->getRecord($aId);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$page = $request->element('page','1');
$searchGroupAds = $request->element('searchGroupAds','-1');
if ($aId && $sp != ''){
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$status = $request->element('status','-1');
		$group = $request->element('gId');
		$vn_name = $request->element('vn_name',NULL);
		$en_name = $request->element('en_name','');
		$logo = $request->element('logo','');
		$logo_en = $request->element('logo_en','');
		$url = $request->element('url','');
		$position = $request->element('position',1);
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$files = isset($_FILES['logo_url'])?$_FILES['logo_url']:'';
			if ($files['tmp_name']){
			/* xoa hinh cu upload hinh moi */
			unlink(ROOT_PATH."gallery/avatar_upload/ads/avatar/".$logo);
			unlink(ROOT_PATH."gallery/avatar_upload/ads/storage/".$logo);
				$upload = new Upload($files);
				$copy = $upload->moveFile($gallery_storage);
				$file_name = $upload->getNameFile();
				$logo_url =$file_name;
				if ($upload->isImage($file_name)){
					$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,150,150);
				}
			}else $logo_url=$logo;
			
			
			$files_en = isset($_FILES['en_name'])?$_FILES['en_name']:'';
			if ($files_en['tmp_name']){
			/* xoa hinh cu upload hinh moi */
			unlink(ROOT_PATH."gallery/avatar_upload/ads/avatar/".$logo_en);
			unlink(ROOT_PATH."gallery/avatar_upload/ads/storage/".$logo_en);
				$upload1 = new Upload($files_en);
				$copy = $upload1->moveFile($gallery_storage);
				$file_name_en = $upload1->getNameFile();
				$logo_url_en =$file_name_en;
				if ($upload1->isImage($file_name_en)){
					$copy_avatar = $upload1->resize($gallery_storage,$gallery_avatar, $file_name_en, $file_name_en,150,150);
				}
			}else $logo_url_en=$logo_en;
			
			
				$adsinfo = new AdsInfo($group,$vn_name, $logo_url_en, $logo_url,$url,$position,$status);
				$fields = array('gid'=>$adsinfo->getGroup(),
								'vn_name'=>$adsinfo->getName('vn'),
								'en_name'=>$adsinfo->getName('en'),
								'logo_url'=>$adsinfo->getLogoUrl(),
								'url'=>$adsinfo->getUrl(),
								'position'=>$adsinfo->getPosition(),
								'status'=>$adsinfo->getStatus(),
								);
			$ads->updateData($fields, $aId);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$templateFile = "managelistads.temp.html";
			$pages = $ads->getNumItems('id', "1=1");
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all Ads object and pass to template
			$adsItems = $ads->getObjects($page,'1=1', array('position'=>'ASC'));
			$template->assign("listObjects",$adsItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=ads&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("ads",$ads);
			$template->assign("groupads",$groupads);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
			$template->assign("rows",$rows);
			$template->assign("pages",$pages);
			$template->assign("page",$page);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
			$template->assign("searchGroupAds",$searchGroupAds);
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("ads",$ads);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
			$template->assign("searchGroupAds",$searchGroupAds);
			$template->assign("gid",$group);
			$template->assign("vn_name",$vn_name);
			$template->assign("en_name",$en_name);
			$template->assign("logo",$logo);
			$template->assign("url",$url);
			$template->assign("position",$position);
		}
	}
	# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);
	# Generate GroupAds combobox for Search form
	$listGroupads = $groupads->comboListObjects('id','vn_name', $request->element('searchGroupAds'));
	$template->assign("listGroupads",$listGroupads);
	# Get all Ads object and pass to template
	$adsItem = $ads->getObject($aId);
	$template->assign("listObject",$adsItem);
}else{
# Thong bao Khong Ton Tai ID Category
	$infoText = $amessages['invalid_id'];
	$infoClass = "infoText";
	$act = 'list';
	$template->assign("act",$act);
	$templateFile = "managelistads.temp.html";
	$pages = $ads->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all Ads object and pass to template
	$adsItems = $ads->getObjects($page,'1=1', array('position'=>'ASC'));
	#var_dump($adsItems);
	$template->assign("listObjects",$adsItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=ads&amp;act=list&amp;page=%s",$pages,$page);
	$template->assign("adminPager",$listPage);
	$template->assign("ads",$ads);
	$template->assign("groupads",$groupads);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);	
	$template->assign("rows",$rows);
	$template->assign("pages",$pages);
	$template->assign("page",$page);
	$template->assign("start",($page - 1) * $items_per_pages);
	$template->assign("searchTerms",$searchTerms);
	$template->assign("searchStatus",$searchStatus);
	$template->assign("searchGroupAds",$searchGroupAds);
}

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('searchStatus'));
	$infoText .= $validate->validStatus($amessages['gId'],$request->element('gId'));		
	return $infoText;
}
?>