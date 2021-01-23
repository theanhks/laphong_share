<?php
/*************************************************************************
Edit Album
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim QUe                                 
Last updated: 24/10/2009
**************************************************************************/
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/galleries.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = "manageeditgallery.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$gallery = new Gallery();
$infoClass = 'infoText';
$orderBy = $request->element('orderBy','id');
$orderDir = $request->element('orderDir','ASC');
$Id = $request->element("oId");
$page = $request->element('page',1);
$setwatermark = $request->element('setwatermark');
if($Id) {
	$galleryItems = $gallery->getObject($Id);
	$template->assign("listObject",$galleryItems);

	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);
	
	$listAlbum = $gallery->optionAllGallery('id', 'vn_name', $galleryItems->getPId());
	$template->assign("listAlbum",$listAlbum);

	if($_POST) {
		$pId = $request->element('pId');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		$vn_description = $request->element('vn_description','');
		$en_description = $request->element('en_description','');
		$position = $request->element('position');
		$status = $request->element('status',-1);
		$news_avatar = $request->element('news_avatar','');
		$date_created = date("Y-m-d H:i:s");
		include_once(ROOT_PATH."classes/data/validate.class.php");
		# Validation
		
		
	
		 $validate = validateData($request);
		if($validate == '') {
			$slug=removeSign($vn_name);
			$galleryInfo = new GalleryInfo($slug, $pId,  $vn_name, $en_name, '',$vn_description, $vn_description, '', $private='', $status, $date_created, $resource='', $children='', '',$position);
			$fields = array('slug'=>$galleryInfo->getSlug(),
							'pid'=>$galleryInfo->getPId(),					
							'vn_name'=>$galleryInfo->getName('vn'),
							'en_name'=>$galleryInfo->getName('en'),
							'cn_name'=>$galleryInfo->getName('cn'),
							'position'=>$galleryInfo->getPosition(),
							'vn_description'=>$galleryInfo->getDescription('vn'),
							'en_description'=>$galleryInfo->getDescription('en'),
							'cn_description'=>$galleryInfo->getDescription('cn'),
							'private'=>0,
							'status'=>$galleryInfo->getStatus(),
							'date_created'=>$galleryInfo->getDateCreated(),
							'resources'=>0,
							'children'=>0,
							'avatar_id'=>$galleryInfo->getAvatarId()
							);
			$gallery->updateData($fields, $Id);

			$infoText = $amessages['item_inserted_ok'];
			$infoClass = "InfoText";	

			$templateFile = "managelistgallery.temp.html";
			$act = 'list';
			$template->assign("act",$act);

			$pages = $gallery->getNumItems('id',"pid=$pId",$items_per_pages);
			$rows = $pages['rows'];
			$pages = $pages['pages'];

			if($page > $pages) $page = $pages;
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=gallery&amp;act=list&amp;page=%s",$pages, $page);
			$template->assign("adminPager",$listPage);
			$galleryItems = $gallery->getObjects($page, "pid=$pId", array($orderBy => $orderDir),$items_per_pages);
			$template->assign('listObjects',$galleryItems);
			$template->assign('gallery',$gallery);
			$template->assign("rows",$rows);
			$template->assign("pages",$pages);
			$template->assign("page",$page);
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
}else{
# Thong bao Khong Ton Tai ID Category
	$infoText = $amessages['invalid_id'];
	$infoClass = "infoText";
	$act = 'list';
	$template->assign("act",$act);
	$templateFile = "managelistgallery.temp.html";
	$pages = $gallery->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all Ads object and pass to template
	$adsItems = $gallery->getObjects($page,'1=1 AND pid=$pId', array('id'=>'ASC'));
	#var_dump($adsItems);
	$template->assign("listObjects",$adsItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=gallery&amp;act=list&amp;page=%s",$pages,$page);
	$template->assign("adminPager",$listPage);
	$template->assign("gallery",$gallery);
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