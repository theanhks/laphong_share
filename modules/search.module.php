<?php
/*************************************************************************
Search module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                               
Last updated: 26/12/2008
**************************************************************************/
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH.'includes/functions.php');
$products = new Products();
$infoText = '';
$infoClass = 'infoText';
#$products_per_page = $siteConfigs->getProperty('products_per_page');
$products_per_page='';
$templateFile = "products.tpl.html";
$keyword = $request->element('keywords','');
$str=mysql_real_escape_string($keyword);
$pid= $request->element('pid','-1');
$giatu= $request->element('giatu','-1');
$giaden = $request->element('giaden','-1');
$page = $request->element('page','1');
$lang = $request->element('lang','vn');
# Build search condition
$searchCond = "1>0";			# For other cases, you can set this to "(1>0)"
if($keyword!="..." && $lang =='vn'){
	 $searchCond .= " AND (status =1 AND vn_name LIKE '%".$str."%' OR vn_details LIKE '%".$str."%' OR en_name LIKE '%".$str."%')";
}
if($keyword!="..." && $lang =='en'){
	$searchCond .= " AND (status =1 AND en_name LIKE '%".$str."%' OR en_details LIKE '%".$str."%' OR vn_nsx LIKE '%".$str."%')";
}
#if($pid!=-1) $searchCond .= " AND (category=$pid)";
#if($giatu!=-1) $searchCond .= " AND (price >=$giatu)";
#if($giaden!=-1) $searchCond .= " AND (price <$giaden)";
	
# Get all entries object and pass to template
$products_per_page = $siteConfigs->getProperty('products_per_page');

# Get number of rows, pagesa
$pages = $products->getNumItems('id', $searchCond,$products_per_page);
$rows = $pages['rows'];
$pages = $pages['pages'];
if($page > $pages) $page = $pages;

$proItems = $products->getObjects($page, $searchCond, array('date_published'=>'DESC'),$products_per_page);
#print_r($proItems);
$template->assign("proItems",$proItems);

# Generate and pass link pager to template
$listPage = linkPager1_dimoda(ROOTPATH."/index.php?op=search&amp;keywords=".$keyword."&amp;lang=$lang&amp;page=%s",$pages,$page);
/*$listPage = linkPager1_dimoda(ROOTPATH."/index.php?op=search&amp;keywords=".$keyword."&amp;thuonghieu=".$pid."&amp;giatu=".$giatu."&amp;giaden=".$giaden."&amp;lang=$lang&amp;page=%s",$pages,$page);*/
$template->assign("pager",$listPage);
$pageName = $messages["timkiem"]."&nbsp;'".$str."'";
if($str){
	$template->assign("keyword",$str);
}
$template->assign('pageName',$pageName);
# Pass some variables to template
$template->assign("keyword",$keyword);
$template->assign("rows",$rows);
$template->assign("page",$page);
$template->assign("pages",$pages);
#supprot
# dung chung
 include_once(ROOT_PATH."modules/framework.module.php");
 
# active
 $active='sanpham';
 $template->assign('active',$active);
?>