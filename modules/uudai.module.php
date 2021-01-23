<?php

include_once(ROOT_PATH . "classes/dao/categories.class.php");
include_once(ROOT_PATH . "classes/dao/entries.class.php");
include_once(ROOT_PATH . "classes/dao/resources.class.php");
include_once(ROOT_PATH . "includes/functions.php");
include_once(ROOT_PATH."classes/dao/imgproductinfo.class.php");
include_once(ROOT_PATH."classes/dao/imgproducts.class.php");
/****** dung chung *****/
include_once(ROOT_PATH."modules/framework.module.php");
$uudai_per_page = $siteConfigs->getProperty('uudai_per_page');
#end tin tuc left
$active='anh-cong-trinh';
$template->assign('active',$active);
$lang    = $request->element('lang', 'vn');
$pageName = $lang == 'en' ? 'Promotion' : 'Ưu đãi';
$template->assign('pageName',$pageName);


$categories   = new Categories();
$entries      = new Entries();
$templateFile = "uudai.tpl.html";
$id           = $request->element('id', '');
$template->assign("id", $id);
$page = $request->element('page', 1);
$template->assign("page", $page);
$entries      = new Entries();
$uudaiSub = $entries->getObjects($page,"cid=41",array('id'=>'DESC'),$uudai_per_page);
$pages = $entries->getNumItems('id',"cid=41",$uudai_per_page);
$rows = $pages['rows'];
$pages = $pages['pages'];

$listPage = linkPager1_dimoda(ROOTPATH."/$lang/uu-dai/page-%s.html",$pages,$page);
if($page > $pages) $page = $pages;
$template->assign("pager",$listPage);
$template->assign("pages",$pages);
$template->assign("rows",$rows);
$template->assign('uudaiSub',$uudaiSub);
