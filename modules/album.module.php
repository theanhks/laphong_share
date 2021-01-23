<?php
/*************************************************************************
Index module
----------------------------------------------------------------
Vnnavi CMS Project
Company: Ava Co., Ltd                                  
Email: kimque@ava.vn                                    
Last updated: 08/03/201
**************************************************************************/
$order1=array('position'=>'ASC');
$template->assign('order1',$order1);
include_once(ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/galleries.class.php");
include_once(ROOT_PATH."classes/dao/resources.class.php");
$templateFile = "album.tpl.html";
$page = $request->element('page',1);
$slug = $request->element('slug','');
$id = $request->element('id','');
$template->assign('id',$id);
#print_r($id);
#print_r($slug);
#album
$gallery = new Resource();
$album = new Gallery();
$albumItems = $album->getObjects(1,"status =1 AND pid=0",array('position'=>'ASC'),'');
$template->assign('album',$album);
$template->assign('gallery',$gallery);
$template->assign('albumItems',$albumItems);
if($id)
	{
		$listsubalbum= $album->getSubCategory1($id);		
		$albumDetailItem = $album->getObject($id);		
		$template->assign("albumDetailItem",$albumDetailItem);		
		$proCondalbum="status=1 and aid in($listsubalbum)";
		$galleryItems = $gallery->getObjects(1,$proCondalbum,array('position'=>'ASC'),'');
	}
else{
		$galleryItems = $gallery->getObjects(1,'status=1',array('date_created'=>'ASC'),'');
	}
#print_r(count($galleryItems));
$template->assign("galleryItems",$galleryItems);	
# dung chung
include_once(ROOT_PATH."modules/framework.module.php");
$active='hinh-anh';
$template->assign("active",$active);
$pageName = $messages['hinhanh'];
$template->assign('pageName',$pageName);
?>