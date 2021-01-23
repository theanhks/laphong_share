<?php
/*************************************************************************
Search module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                               
Last updated: 26/12/2008
**************************************************************************/
include_once(ROOT_PATH."classes/dao/entries.class.php");
include_once(ROOT_PATH.'includes/functions.php');
$entries = new Entries();
$infoText = '';
$infoClass = 'infoText';
$items_per_pages = $siteConfigs->getProperty('item_per_row');;
$templateFile = "searchnews.tpl.html";
$keyword = $request->element('txttukhoa','');
$str=mysql_real_escape_string($keyword);
$page = $request->element('page','1');
$lang = $request->element('lang','vn');
# Build search condition
$searchCond = "status =1 ";
$pageName = $messages['kqsearch'];
$template->assign('pageName',$pageName);			# For other cases, you can set this to "(1>0)"
if($keyword!="Nhập vào từ khóa"){
$searchCond .= " AND ( title LIKE '%".$str."%' OR details LIKE '%".$str."%' OR sapo LIKE '%".$str."%')";
	
	//echo $searchCond;
# Get all entries object and pass to template
$searchItems = $entries->getObjects($page, $searchCond, array('date_created'=>'DESC'),$items_per_pages);
$template->assign("searchItems",$searchItems);
# Get number of rows, pagesa
$pages = $entries->getNumItems('id', $searchCond,$items_per_pages);
$rows = $pages['rows'];
$pages = $pages['pages'];
if($page > $pages) $page = $pages;
# Generate and pass link pager to template
$listPage = linkPager1_en(ROOTPATH."/index.php?op=searchnews&amp;txttukhoa=".$keyword."&amp;lang=$lang&amp;page=%s",$pages,$page);
$template->assign("pager",$listPage);
# Pass some variables to template
$template->assign("keyword",$keyword);
$template->assign("rows",$rows);
$template->assign("page",$page);
$template->assign("pages",$pages);
}
#supprot
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
 
# active
 $active='sanpham';
 $template->assign('active',$active);
?>