<?php
/*************************************************************************
Module product
----------------------------------------------------------------
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH."classes/dao/procategories.class.php");
$products = new Products();
$procategories = new ProductCategories();
$templateFile = "products.tpl.html";
$page = $request->element('page',1);
$slug = $request->element('slug','');
$id = $request->element('id','');
$products_per_page = $siteConfigs->getProperty('products_per_page');
	$pcItem = $procategories->getObject($id);
	//print_r($pcItem);
	$template->assign("pcItem",$pcItem);
	if($pcItem){
		$pcId = $pcItem->getId();
		$activeItems=$procategories->getParentAllFromCid($pcId);
		$activeleft=$activeItems[0];
		$parentItem=$procategories->getParentObject($pcItem->getPPCId());
		$listsub= $procategories->getSubCategory1($pcId);
		$pages = $products->getNumItems('id',"status=1 and category in($listsub)",$products_per_page);
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$proItems = $products->getObjects($page,"status=1 and category in($listsub)", array('date_published'=>'DESC'),$products_per_page);
		$pageName = $pcItem->getName($lang);
		$template->assign('pageName',$pageName);
		$template->assign("proItems",$proItems);
		$template->assign("parentItem",$parentItem);
	# Generate and pass link pager to template
	if(URL_TYPE==1)
		$listPage = linkPager1_en(ROOTPATH."/index.php?op=products&amp;lang=$lang&amp;&amp;slug=$slug&amp;page=%s",$pages,$page);
	else
		$listPage = linkPager1_en(ROOTPATH."/products/$slug-$id/page-%s.html",$pages,$page);
	$template->assign("pager",$listPage);
	$template->assign("pages",$pages);
	$template->assign("rows",$rows);
	$template->assign("activeleft",$activeleft);
}else{
	if($slug =='khuyen-mai'){
	$pages = $products->getNumItems('id',"status=1 AND s_price!='0'",$products_per_page);
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$proItems = $products->getObjects($page,"status=1 AND s_price!='0' ", array('date_published'=>'DESC'),$products_per_page);
		$pageName = $messages["sale"];
		$template->assign('pageName',$pageName);
		$template->assign("proItems",$proItems);
	# Generate and pass link pager to template
	if(URL_TYPE==1)
		$listPage = linkPager1_en(ROOTPATH."/index.php?op=products&amp;lang=$lang&amp;slug=$slug&amp;page=%s",$pages,$page);
	else
		$listPage = linkPager1_en(ROOTPATH."/$lang/$slug/page-%s.html",$pages,$page);
	$template->assign("pager",$listPage);
	$template->assign("pages",$pages);
	$template->assign("rows",$rows);
	}else{
	$pages = $products->getNumItems('id',"status=1",$products_per_page);
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$proItems = $products->getObjects($page,"status=1", array('date_published'=>'DESC'),$products_per_page);
		$pageName = $messages["product"];
		$template->assign('pageName',$pageName);
		$template->assign("proItems",$proItems);
	# Generate and pass link pager to template
	if(URL_TYPE==1)
		$listPage = linkPager1_en(ROOTPATH."/index.php?op=products&amp;lang=$lang&amp;slug=$slug&amp;page=%s",$pages,$page);
	else
		$listPage = linkPager1_en(ROOTPATH."/$lang/$slug/page-%s.html",$pages,$page);
	$template->assign("pager",$listPage);
	$template->assign("pages",$pages);
	$template->assign("rows",$rows);
	}
}


 /************* dung chung *************/
 include_once(ROOT_PATH."modules/framework.module.php");
 # active
 $active='san-pham';
 $template->assign('active',$active);
?>