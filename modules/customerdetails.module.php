<?php
/*************************************************************************
Module News
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                  
Last updated: 23/11/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/imgbanners.class.php");
$imgbanners = new Imgbanners();
$templateFile = "customerdetail.tpl.html";
$id = $request->element('id',0);
$page = $request->element('page',1);
$detailItem = $imgbanners->getObject($id);
//print_r($detailItem);
if($detailItem) {
	$id   = $detailItem->getId();
	$otherItems = $imgbanners->getObjects(1,"status=1 AND  id!=$id",array('id'=>'DESC'),6);
	$template->assign("detailItem",$detailItem);	
	$template->assign("otherItems",$otherItems);
	$template->assign("slug",$slug);
	$pageName = $detailItem->getName($lang);
	$template->assign('pageName',$pageName);
}else{

$pageName = $messages["customer"];
$template->assign('pageName',$pageName);
}
  #chuyen muc sp
 include_once(ROOT_PATH."classes/dao/procategories.class.php");
$productcategories = new ProductCategories();
$productcatItems = $productcategories->getObjects(1,"status =1 AND pid=0",array('position'=>'ASC'),'');
$listProductCat = $productcategories->optionAllCategories('id',$lang.'_name','');
$template->assign("listProductCat",$listProductCat);
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
$categoryItems = $categories->getObjects(1,"status =1 AND pid=4",array('position'=>'ASC'),'');
$template->assign('categoryItems',$categoryItems);
$template->assign('categories',$categories);
 #chuyen muc
  #tin tuc noi bat
 include_once(ROOT_PATH."classes/dao/entries.class.php");
$entries = new Entries();
$hotnewsItems = $entries->getObjects(1,"status =1 AND cid=4 AND lang='$lang'",array('date_created'=>'DESC'),2);
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
#active
 // $active='tin-tuc';
 //$template->assign('active',$active);

?>