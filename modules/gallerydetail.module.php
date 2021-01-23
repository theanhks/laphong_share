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
include_once(ROOT_PATH."includes/functions.php");
$templateFile = "banggia.tpl.html";
$resource = new Resource();
$template->assign('resource',$resource);
$id = $request->element('id','0');
$page = $request->element('page','1');
if($id!='0'){
$resourceItem= $resource->getObject($id);
$template->assign("resourceItem",$resourceItem);
$pageName="Bảng giá";
$template->assign("pageName",$pageName);
}
$template->assign('resource',$resource);
#chuyen muc sp
 include_once(ROOT_PATH."classes/dao/procategories.class.php");
$productcategories = new ProductCategories();
$productcatItems = $productcategories->getObjects(1,"status =1 AND pid=0",array('position'=>'ASC'),'');
$template->assign('productcatItems',$productcatItems);
$template->assign('productcategories',$productcategories);
 #chuyen muc sp
 #supprot
 include_once(ROOT_PATH."classes/dao/parts.class.php");
$parts = new Parts();
$partItems = $parts->getObjects(1,"status =1",array('id'=>'ASC'),'');
$template->assign('partItems',$partItems);
$template->assign('parts',$parts);
 #end support
 #chuyen muc
 include_once(ROOT_PATH."classes/dao/categories.class.php");
$categories = new Categories();
$categoryItems = $categories->getObjects(1,"status =1 AND pid=0",array('position'=>'ASC'),'');
$template->assign('categoryItems',$categoryItems);
$template->assign('categories',$categories);
 #chuyen muc
  #tin tuc noi bat
 include_once(ROOT_PATH."classes/dao/entries.class.php");
$entries = new Entries();
$hotnewsItems = $entries->getObjects(1,"status =1 AND cid=7 AND lang='$lang'",array('date_created'=>'DESC'),4);
$template->assign('hotnewsItems',$hotnewsItems);
$template->assign('entries',$entries);
 #end tin tuc noi bat
  #tim tuc left
 include_once(ROOT_PATH."classes/dao/weblinks.class.php");
$weblinks = new Weblinks();
$leftweblinks = $weblinks->getObjects(1,"status =1",array('position'=>'ASC'),'');
$template->assign('leftweblinks',$leftweblinks);
$template->assign('weblinks',$weblinks);
 #end tin tuc left
   #cong trinh noi bat
 include_once(ROOT_PATH."classes/dao/resources.class.php");
$resources = new Resource();
$resourcesItems = $resources->getObjects(1,"status =1 AND url=1",array('date_created'=>'DESC'),'');
$template->assign('resourcesItems',$resourcesItems);
$template->assign('resources',$resources);
 #end cong trinh noi bat
 $active='anh-cong-trinh';
  $template->assign('active',$active);
?>