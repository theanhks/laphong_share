<?php
/*************************************************************************
Upload Gallery
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd
Name: Tran Thi Kim Que                               
Last updated: 21/10/2009
**************************************************************************/
//ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH."classes/dao/resources.class.php");
include_once(ROOT_PATH."classes/dao/galleries.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = "manageuploadgallery.temp.html";
$gallery = ROOT_PATH."gallery/album/";
$gallery_avatar = $gallery."avatar/";
$gallery_thumb = $gallery."thumb/";
$gallery_medium = $gallery."medium/";
$gallery_storage = $gallery."storage/";
$album = new Gallery();
$resources = new Resource();
$status = $request->element('status',-1);
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','DESC');

$listStatus = optionStatus($request->element('searchStatus',-1));
$template->assign("listStatus",$listStatus);
$listAlbum = $album->optionAllGallery();
$template->assign("listAlbum",$listAlbum);

if($_POST) {	
	$aId = $request->element('aId',0);
	$vn_description = $request->element('vn_description','');
	$en_description = $request->element('en_description','');
	$vn_name = $request->element('vn_name','');
	$en_name = $request->element('en_name','');
	$position = $request->element('position',0);
	$url = $request->element('home',0);
	$date_created = date("Y-m-d H:i:s");
	$page = $request->element('page',1);
		include_once(ROOT_PATH."classes/data/validate.class.php");
		# Validation
		$validate = validateData($request);
		$files = isset($_FILES['files'])?$_FILES['files']:'';
		$upload = new Upload($files);
		if($validate == '') {
			$copy = $upload->moveFile($gallery_storage);
			$file_name = $upload->getNameFile();
			$resource_type = $upload->getType();
			
			/*if($upload->isImage($file_name)){
			$copy_4= $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_HEIGHT,0);
			$copy_4= $upload->resize($gallery_storage,$gallery_thumb, $file_name, $file_name,PRO_IMAGE_THUMB_WIDTH,PRO_IMAGE_THUMB_HEIGHT,0);
			$copy_4= $upload->resize($gallery_storage,$gallery_medium, $file_name, $file_name, PRO_IMAGE_MEDIUM_WIDTH,PRO_IMAGE_MEDIUM_HEIGHT,0);
			}*/
			$slug=removeSign($vn_name);
			$resource =new ResourceInfo($aId, $file_name, $files['size'], $resource_type,$vn_name,$en_name,'',$vn_description, $en_description,'', $date_created, $url, $slug, $status,$position, '');
				$fields = array('aid'=>$resource->getAlbumId(),
								'file_name'=>$resource->getFileName(),
								'file_size'=>$resource->getFileSize(),
								'resource_type'=>$resource->getResourceType(),
								'vn_name'=>$resource->getName('vn'),
								'en_name'=>$resource->getName('en'),
								'cn_name'=>$resource->getName('en'),
								'en_description'=>$resource->getDescription('en'),
								'cn_description'=>$resource->getDescription('cn'),
								'vn_description'=>$resource->getDescription('vn'),
								'date_created'=>$resource->getDateCreated(),
								'url'=>$resource->getUrl(),
								'properties'=>$resource->getProperties(),
								'status'=>$resource->getStatus(),
								'position'=>$resource->getPosition(),
								'thumbnail_format'=>$resource->getResourceType()
								);
			$resources->addData($fields);
			$infoText = $amessages['item_inserted_ok'];
			$templateFile = "managelistresource.temp.html";
			$infoClass = "InfoText";
			$act = 'list';
			$template->assign("act",$act);

			$pages = $resources->getNumItems('id', '1=1');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			$rsItems = $resources->getObjects($page,'1=1', array($orderBy => $orderDir));
			$template->assign('listObjects',$rsItems);
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=resource&amp;act=list&amp;page=%s",$pages,$page);

			$template->assign('adminPager',$listPage);
			$template->assign('listObjects',$rsItems);
			$template->assign('resources',$resources);
			//$template->assign('watermark',$_REQUEST['watermark']);
			$template->assign('album',$album);
			$template->assign('rows',$rows);
			$template->assign('page',$page);
			$template->assign('pages',$pages);
		}else {
			$infoText = $amessages['item_inserted_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign('aId',$aId);
			$template->assign('status',$status);
			$template->assign('position',$position);
			$template->assign('vn_name',$vn_name);
			$template->assign('en_name',$vn_name);
			$template->assign('vn_description',$vn_description);
			$template->assign('en_description',$en_description);
			$template->assign('date_created',$date_created);
			$template->assign('url',$url);
			$template->assign('files',$files);
		}
	}

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$files = isset($_FILES['files'])?$_FILES['files']:'';
	$upload = new Upload($files);
	//$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	#$infoText .= $validate->validStatus($amessages['aId'],$request->element('aId'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	//$infoText .= $validate->validString($amessages['en_description'],$request->element('en_description'));
	#$infoText .= $validate->validCheckType($amessages['avatar'],$upload->checkType());
	return $infoText;
}
?>