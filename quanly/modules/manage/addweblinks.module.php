<?php
/*************************************************************************
Module Menu
----------------------------------------------------------------
Ava CMS Project
Company: Ava Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated:08/03/2011
**************************************************************************/
include_once(ROOT_PATH.'classes/data/textfilter.class.php');
include_once(ROOT_PATH.'classes/dao/weblinks.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/upload.class.php");
$templateFile = 'manageaddweblinks.temp.html';
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;

$gallery = ROOT_PATH."gallery/avatar_upload/";
$gallery_new = $gallery."weblinks/";
$gallery_storage = $gallery_new."/storage/";
$gallery_avatar = $gallery_new."/avatar";
$weblink = new Weblinks();
$infoClass = 'infoText';
$pId = $request->element('pId',0);
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
$cn_name = $request->element('cn_name','');
$vn_sapo = $request->element('vn_sapo','');
$en_sapo = $request->element('en_sapo','');
$cn_sapo = $request->element('cn_sapo','');
$url = $request->element('url','');
$position = $request->element('position',0);
$status = $request->element('status');
$page = $request->element('page',1);
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');

if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	$validate = validateData($request);
	if($validate == '') {
		$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
		$files['tmp_name']='';
		if($files['tmp_name']){ 
			$upload = new Upload($files);
			$copy = $upload->moveFile($gallery_storage);
			$file_name = $upload->getNameFile();
			if ($upload->isImage($file_name)){
			$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,148,98,0);
			}
		}else $file_name='';		
		$linkInfo = new WeblinksInfo($pId,$url, $vn_name, $en_name,$cn_name,$vn_sapo,$en_sapo,$cn_sapo,$file_name, $position, $status );
		$fields = array('pid'=>$linkInfo->getPId(),
			'url'=>$linkInfo->getURL(),
			'vn_name'=>$linkInfo->getName('vn'),
			'en_name'=>$linkInfo->getName('en'),
			'cn_name'=>$linkInfo->getName('cn'), 
			'vn_sapo'=>$linkInfo->getSapo('vn'),
			'en_sapo'=>$linkInfo->getSapo('en'),
			'cn_sapo'=>$linkInfo->getSapo('cn'),
			'avatar'=>$linkInfo->getAvatar(),
			'position'=>$linkInfo->getPosition(),
			'status'=>$linkInfo->getStatus()
		   );
		   
		$weblink->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = 'InfoText';
		$act = 'list';
		$template->assign("act",$act);
		$templateFile = 'managelistweblinks.temp.html';
		$pages = $weblink->getNumItems('id', "1=1");
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=weblinks&amp;act=list&amp;page=%s",$pages,$page);
		
		$weblinkItems = $weblink->getObjects($page,"1=1", array($orderBy => $orderDir));
		
		$template->assign('listObjects',$weblinkItems);
		$template->assign('adminPager',$listPage);
		$template->assign('weblink',$weblink);
		$template->assign('rows',$rows);
		$template->assign('start',($page - 1) * $items_per_pages);
		$template->assign('page',$page);
		$template->assign('pages',$pages);
	}else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
		$infoClass = 'errorText';	
		$template->assign('infoText',$infoText);
		$template->assign('infoClass',$infoClass);
		$template->assign('vn_name',$vn_name);
		$template->assign('en_name',$en_name);
		$template->assign('vn_sapo',$vn_sapo);
		$template->assign('en_sapo',$en_sapo);
		$template->assign('cn_sapo',$cn_sapo);
		$template->assign('url',$url);
		$template->assign('position',$position);
		$template->assign('status',$status);
		
	}
}
$listStatus = optionStatus($request->element('searchStatus','-1'));
$template->assign("listStatus",$listStatus);
$listLinks= $weblink->comboListObjects('id','vn_name',$pId,"pid=0");
$template->assign("listLinks",$listLinks);

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