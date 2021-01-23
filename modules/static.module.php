<?php

/*************************************************************************
Module static
----------------------------------------------------------------
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                   
Last updated: 08/03/2011
**************************************************************************/
//ini_set('display_errors','1'); ini_set('display_startup_errors','1');
$item_news_per_row = $siteConfigs->getProperty('item_news_per_row');
include_once(ROOT_PATH."classes/dao/static.class.php");
$static = new StaticPage();
$templateFile = "static.tpl.html";
$slug = $request->element('slug','');
$template->assign("slug",$slug);
$id = $request->element('id','');
$page        = $request->element('page', 1);
$staticItem = $static->getStaticPageFromId($id,$lang);
if($staticItem){		
	$pageName=$staticItem->getName($lang);
	$template->assign("pageName",$pageName);
	$template->assign("static",$static);
	$template->assign("staticItem",$staticItem);
	$staticItems = $static->getObjects($page,"status=1 AND properties=$id",array('position'=>'ASC'),$item_news_per_row);
	$pages = $static->getNumItems('id', "`status` = 1 AND properties=$id",$item_news_per_row);
	$rows = $pages['rows'];
    $pages = $pages['pages'];
	if (!$pages)
        $pages = 1;
    if ($page > $pages)
        $page = $pages;
	$listPage = linkPager1_dimoda($staticItem->getUrlTemplate($lang, 1), $pages, $page);
	$template->assign("pager", $listPage);
    $template->assign("pages", $pages);
	$template->assign('staticItems',$staticItems);
}
 /************* dung chung ******/
 include_once(ROOT_PATH."modules/framework.module.php");
 $active=$slug;
 $template->assign('active',$active);

?>