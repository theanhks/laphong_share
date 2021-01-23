
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

include_once(ROOT_PATH."classes/dao/imgbanners.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/upload.class.php");
$templateFile = "manageeditimgbanner.temp.html";
$gallery = ROOT_PATH."gallery/avatar_upload/banners";
$gallery_avatar =  $gallery."/avatar/";
$gallery_storage = $gallery."/storage/";
$imgbanners = new Imgbanners();
$aId = $request->element("oId");
$sp = $imgbanners->getRecord($aId);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$page = $request->element('page','1');
if ($aId && $sp != ''){
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$status = $request->element('status','-1');
		$logo = $request->element('logo','');
		$url = $request->element('url','');
		$position = $request->element('position','');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		$vn_details = $request->element('vn_details','');
		$en_details = $request->element('en_details','');
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$files = isset($_FILES['logo_url'])?$_FILES['logo_url']:'';
			if ($files['tmp_name']){
			/* xoa hinh cu upload hinh moi */
			unlink(ROOT_PATH."gallery/avatar_upload/banners/avatar/".$logo);
			unlink(ROOT_PATH."gallery/avatar_upload/banners/storage/".$logo);
				$upload = new Upload($files);
				$copy = $upload->moveFile($gallery_storage);
				$file_name = $upload->getNameFile();
				$logo_url =$file_name;
				if ($upload->isImage($file_name)){
					$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,173,143);
				}
			}else $logo_url=$logo;
				$adsinfo = new ImgbannerInfo($logo_url,$url,$vn_name,$en_name,$vn_details,$en_details,$position,$status);
				$fields = array(
								'logo_url'=>$adsinfo->getLogoUrl(),
								'url'=>$adsinfo->getUrl(),
								'vn_name'=>$adsinfo->getName('vn'),
								'en_name'=>$adsinfo->getName('en'),
								'vn_details'=>$adsinfo->getDetails('vn'),
								'en_details'=>$adsinfo->getDetails('en'),
								'position'=>$adsinfo->getPosition(),
								'status'=>$adsinfo->getStatus()
								);
			$imgbanners->updateData($fields, $aId);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$templateFile = "managelistimgbanner.temp.html";
			$pages = $imgbanners->getNumItems('id', "1=1");
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all Ads object and pass to template
			$adsItems = $imgbanners->getObjects($page,'1=1', array('id'=>'DESC'));
			$template->assign("listObjects",$adsItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=ads&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("imgbanners",$imgbanners);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
			$template->assign("rows",$rows);
			$template->assign("pages",$pages);
			$template->assign("page",$page);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("imgbanners",$imgbanners);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
			$template->assign("searchGroupAds",$searchGroupAds);
			$template->assign("logo",$logo);
			$template->assign("url",$url);
			$template->assign("vn_name",$vn_name);
			$template->assign("en_name",$en_name);
			$template->assign("vn_details",$vn_details);
			$template->assign("en_details",$en_details);
			$template->assign("position",$position);
		}
	}
	# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);
	# Get all Ads object and pass to template
	$adsItem = $imgbanners->getObject($aId);
	$template->assign("listObject",$adsItem);
}else{
# Thong bao Khong Ton Tai ID Category
	$infoText = $amessages['invalid_id'];
	$infoClass = "infoText";
	$act = 'list';
	$template->assign("act",$act);
	$templateFile = "managelistimgbanner.temp.html";
	$pages = $imgbanners->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all Ads object and pass to template
	$adsItems = $imgbanners->getObjects($page,'1=1', array('position'=>'ASC'));
	#var_dump($adsItems);
	$template->assign("listObjects",$adsItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=imgbanner&amp;act=list&amp;page=%s",$pages,$page);
	$template->assign("adminPager",$listPage);
	$template->assign("imgbanners",$imgbanners);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);	
	$template->assign("rows",$rows);
	$template->assign("pages",$pages);
	$template->assign("page",$page);
	$template->assign("start",($page - 1) * $items_per_pages);
	$template->assign("searchTerms",$searchTerms);
	$template->assign("searchStatus",$searchStatus);
}

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('searchStatus'));
	$infoText .= $validate->validString($amessages['name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	/*$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));
	$infoText .= $validate->validString($amessages['en_details'],$request->element('en_details'));	*/
	return $infoText;
}
?>