<?php
/*************************************************************************
Add category
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                  
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/galleries.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = "manageaddgallery.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$gallery = new Gallery();
$infoClass = 'infoText';

$page= $request->element('page',1);
$pId = $request->element('pId',0);
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
$vn_description = $request->element('vn_description','');
$en_description = $request->element('en_description','');
$slug = $request->element('slug','');
$position = $request->element('position',0);
$status = $request->element('status',-1);
$date_created = date("Y-m-d H:i:s");
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');
$file_name='';

if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	
	 $validate = validateData($request);
	if($validate == '') {
		$slug=removeSign($vn_name);
		$galleryInfo = new GalleryInfo($slug, $pId,  $vn_name, $en_name, '', $vn_description, $vn_description, '', $private='', $status, $date_created, $resource='', $children='', $file_name, $position);
		
		$fields = array('slug'=>$galleryInfo->getSlug(),
						'pid'=>$galleryInfo->getPId(),					
						'vn_name'=>$galleryInfo->getName('vn'),
						'en_name'=>$galleryInfo->getName('en'),
						'cn_name'=>$galleryInfo->getName('cn'),
						'vn_description'=>$galleryInfo->getDescription('vn'),
						'en_description'=>$galleryInfo->getDescription('en'),
						'cn_description'=>$galleryInfo->getDescription('cn'),
						'private'=>0,
						'status'=>$galleryInfo->getStatus(),
						'date_created'=>$galleryInfo->getDateCreated(),
						'resources'=>0,'children'=>0,
						'avatar_id'=>$galleryInfo->getAvatarId(),
						'position'=>$galleryInfo->getPosition()
						);
		$gallery->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		$act = 'list';
		$template->assign("act",$act);

		$templateFile = "managelistgallery.temp.html";
		$pages=$gallery->getNumItems();
		$rows = $pages['rows'];
		$pages = $pages['pages'];

		if($page > $pages) $page = $pages;
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=gallery&amp;act=list&amp;page=%s",$page);
		$template->assign("adminPager",$listPage);		
		$galleryItems = $gallery->getObjects($page, '1=1 AND pid=0', array($orderBy => $orderDir));
		$template->assign('listObjects',$galleryItems);
		$template->assign('gallery',$gallery);
		$template->assign('pId',$pId);
		$template->assign("rows",$rows);
		$template->assign("pages",$page);

	}else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
		$infoClass = "errorText";	
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign('pId',$pId);
		$template->assign('status',$status);
		$template->assign('slug',$slug);
		$template->assign('position',$position);
		$template->assign('vn_name',$vn_name);
		$template->assign('en_name',$en_name);
		$template->assign('vn_description',$vn_description);
		$template->assign('en_description',$en_description);
	}
}
$listStatus = optionStatus($status,DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);
$listGallery = $gallery->optionAllGallery('id','vn_name','1=1');
$template->assign("listGallery",$listGallery);

function validateData($request) {
	global $amessages;
	$validate = new Validate();
	$infoText = '';
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validStatus($amessages['pId'],$request->element('pId'));
	//$infoText .= $validate->validString($amessages['slug'],$request->element('slug'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	//$infoText .= $validate->validString($amessages['vn_description'],$request->element('vn_description'));
	//$infoText .= $validate->validString($amessages['en_description'],$request->element('en_description'));
	return $infoText;
}
?>