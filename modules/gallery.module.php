<?php

/*************************************************************************
Module static
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi KIm Que                                   
Last updated: 07/01/2009
**************************************************************************/

#end company
include_once(ROOT_PATH."classes/dao/resources.class.php");
include_once(ROOT_PATH."classes/dao/galleries.class.php");
include_once(ROOT_PATH."includes/functions.php");
$templateFile = "download.tpl.html";
$gallery = new Gallery();
$resource = new Resource();
$template->assign('gallery',$gallery);
$listAlbum = $gallery->optionAllGallery();
$template->assign("listAlbum",$listAlbum);
$idpar = $request->element('idpar',0);
$slug = $request->element('slug','');
if($idpar){
	$resourceItems = $resource->getObjects(1,"status =1 AND aid=$idpar",array('id'=>'DESC'),'');
	$template->assign('resourceItems',$resourceItems);
}
$pageName="Download";
$template->assign("pageName",$pageName);

/****** dung chung *****/
 include_once(ROOT_PATH."modules/framework.module.php");

 #end tin tuc left
 $active='anh-cong-trinh';
  $template->assign('active',$active);
?>