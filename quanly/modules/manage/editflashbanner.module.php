
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
include_once(ROOT_PATH."classes/dao/flashbanners.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/upload.class.php");
$templateFile = "manageeditflashbanner.temp.html";
$gallery = ROOT_PATH."gallery/avatar_upload/flash";
$gallery_avatar =  $gallery."/avatar/";
$gallery_storage = $gallery."/storage/";
$flashbanners = new Flashbanners();
$aId = $request->element("oId");
$sp = $flashbanners->getRecord($aId);
$searchStatus = $request->element('searchStatus','-1');
$page = $request->element('page','1');
if ($aId && $sp != ''){
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$status = $request->element('status','-1');
		$logo = $request->element('logo','');

		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$files = isset($_FILES['logo_url'])?$_FILES['logo_url']:'';
			if ($files['tmp_name']){
			/* xoa hinh cu upload hinh moi */
			unlink(ROOT_PATH."gallery/avatar_upload/flash/storage/".$logo);
				$upload = new Upload($files);
				$copy = $upload->moveFile($gallery_storage);
				$file_name = $upload->getNameFile();
				$logo_url =$file_name;
				
			}else $logo_url=$logo;
				$adsinfo = new FlashInfo($logo_url,$status);
				$fields = array(
								'logo_url'=>$adsinfo->getLogoUrl(),
								'status'=>$adsinfo->getStatus(),
								);
			$flashbanners->updateData($fields, $aId);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$templateFile = "managelistflashbanner.temp.html";
			$pages = $flashbanners->getNumItems('id', "1=1");
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all Ads object and pass to template
			$adsItems = $flashbanners->getObjects($page,'1=1', array('id'=>'DESC'));
			$template->assign("listObjects",$adsItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=flashbanner&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("flashbanners",$flashbanners);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
			$template->assign("rows",$rows);
			$template->assign("pages",$pages);
			$template->assign("page",$page);
			$template->assign("searchStatus",$searchStatus);
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("flashbanners",$flashbanners);
			$template->assign("searchStatus",$searchStatus);
			$template->assign("logo",$logo);
		}
	}
	# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);
	# Get all Ads object and pass to template
	$adsItem = $flashbanners->getObject($aId);
	$template->assign("listObject",$adsItem);
}else{
# Thong bao Khong Ton Tai ID Category
	$infoText = $amessages['invalid_id'];
	$infoClass = "infoText";
	$act = 'list';
	$template->assign("act",$act);
	$templateFile = "managelistflashbanner.temp.html";
	$pages = $flashbanners->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all Ads object and pass to template
	$adsItems = $flashbanners->getObjects($page,'1=1', array('position'=>'ASC'));
	#var_dump($adsItems);
	$template->assign("listObjects",$adsItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=flashbanner&amp;act=list&amp;page=%s",$pages,$page);
	$template->assign("adminPager",$listPage);
	$template->assign("flashbanners",$flashbanners);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);	
	$template->assign("rows",$rows);
	$template->assign("pages",$pages);
	$template->assign("page",$page);
	$template->assign("start",($page - 1) * $items_per_pages);
	$template->assign("searchStatus",$searchStatus);
}

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