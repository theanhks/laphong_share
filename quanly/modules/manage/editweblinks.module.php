<?php
/*************************************************************************
Edit Menu module
---------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/weblinks.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/upload.class.php");
$templateFile = "manageeditweblinks.temp.html";
$weblink = new Weblinks();
$gallery = ROOT_PATH."gallery/avatar_upload/";
$gallery_new = $gallery."weblinks/";
$gallery_storage = $gallery_new."storage/";
$gallery_avatar = $gallery_new."/avatar";

$wId = $request->element("oId");
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');

if($wId) {
	#Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$pId = $request->element('pId','0');
	$template->assign("listStatus",$listStatus);
	$listLinks= $weblink->comboListObjects('id','vn_name',$pId,"pid=0");
	$template->assign("listLinks",$listLinks);
	# Get all entries object and pass to template
	$weblinkItems = $weblink->getObject($wId);
	$template->assign("listObject",$weblinkItems);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$status = $request->element('status','-1');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		$cn_name = $request->element('cn_name','');
		$vn_sapo = $request->element('vn_sapo','');
		$en_sapo = $request->element('en_sapo','');
		$cn_sapo = $request->element('cn_sapo','');
		$url = $request->element('url','');
		$news_avatar = $request->element('news_avatar','');
		$position = $request->element('position',0);
		$page = $request->element('page',1);
		# Validation
		$validate = validateData($request);
		if($validate == '') {
		$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';	
			if($files['tmp_name']){
			/* xoa hinh cu upload hinh moi*/
			unlink(ROOT_PATH."gallery/avatar_upload/entry/storage/".$news_avatar);
			unlink(ROOT_PATH."gallery/avatar_upload/entry/avatar/".$news_avatar);
				$upload = new Upload($files);
				$copy = $upload->moveFile($gallery_storage);
				$file_name = $upload->getNameFile();
				if ($files['tmp_name']){
			$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,148,98,0);
			
			}	
			}else $file_name =$news_avatar;
			
			$webInfo = new WeblinksInfo($pId,$url,$vn_name,$en_name,$cn_name,$vn_sapo,$en_sapo,$cn_sapo,$file_name,$position,$status);
			$fields = array('pid'=>$webInfo->getPId(),
							'url'=>$webInfo->getUrl(),
							'vn_name'=>$webInfo->getName('vn'),
							'en_name'=>$webInfo->getName('en'),
							'cn_name'=>$webInfo->getName('cn'),
							'vn_sapo'=>$webInfo->getSapo('vn'),
							'en_sapo'=>$webInfo->getSapo('en'),
							'cn_sapo'=>$webInfo->getSapo('cn'),
							'avatar'=>$webInfo->getAvatar(),
							'position'=>$webInfo->getPosition(),
							'status'=>$webInfo->getStatus(),
							);
			$weblink->updateData($fields, $wId);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			
			$templateFile = "managelistweblinks.temp.html";
			$pages = $weblink->getNumItems('id','1=1');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all entries object and pass to template
			$weblinkItems = $weblink->getObjects($page, "1=1", array($orderBy => $orderDir));
			$template->assign("listObjects",$weblinkItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=weblinks&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("weblink",$weblink);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
			$template->assign("rows",$rows);
			$template->assign("page",$page);
			$template->assign("pages",$pages);
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("weblink",$weblink);
			$template->assign("url",$url);
			$template->assign("vn_name",$vn_name);
			$template->assign("en_name",$en_name);
			$template->assign("cn_name",$cn_name);
			$template->assign('vn_sapo',$vn_sapo);
			$template->assign('en_sapo',$en_sapo);
			$template->assign('cn_sapo',$cn_sapo);
			$template->assign("position",$position);
		}
	}
}else{
# Thong bao Khong Ton Tai ID Menu
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "errorText";
	$templateFile = "managelistweblink.temp.html";
	$pages = $weblink->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
if($page > $pages) $page = $pages;
	# Get all entries object and pass to template
	$weblinkItems = $weblink->getObjects();
	$template->assign("listObjects",$weblinkItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=weblink&amp;act=list&amp;page=%s",$pages,$page);
	$act = 'list';
	$template->assign("act",$act);
	$template->assign("adminPager",$listPage);
	$template->assign("weblink",$weblink);
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
	#$infoText .= $validate->validString($amessages['vn_sapo'],$request->element('vn_sapo'));
	#$infoText .= $validate->validString($amessages['en_sapo'],$request->element('en_sapo'));
	$infoText .= $validate->validString($amessages['url'],$request->element('url'));		
	return $infoText;
}
?>