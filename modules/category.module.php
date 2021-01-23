<?php

$slug = $request->element('slug', '');
$template->assign("slug", $slug);
if($slug=='lien-he' || $slug=='ho-tro-ky-thuat' || $slug=='dat-ban' ){
//	include_once(ROOT_PATH . "modules/contactform.module.php");
}


include_once(ROOT_PATH . "classes/dao/categories.class.php");
include_once(ROOT_PATH . "classes/dao/entries.class.php");
include_once(ROOT_PATH . "classes/dao/resources.class.php");
include_once(ROOT_PATH . "includes/functions.php");
include_once(ROOT_PATH."classes/dao/imgproductinfo.class.php");
include_once(ROOT_PATH."classes/dao/imgproducts.class.php");

$resources = new Resource();
$object_banggia = $resources->getObject(90);
$template->assign('object_banggia',$object_banggia->getFileName());

$imgProducts = new imgProducts();
$template->assign('imgProducts',$imgProducts);
$listFile = $imgProducts->getObjects(1,"status =1",array('id'=>'DESC'),'');
$template->assign("listFile",$listFile);


/****** dung chung *****/
 include_once(ROOT_PATH."modules/framework.module.php");

 #end tin tuc left
 $active='anh-cong-trinh';
  $template->assign('active',$active);


$categories   = new Categories();
$entries      = new Entries();
$templateFile = "category.tpl.html";
$id           = $request->element('id', '');
$template->assign("id", $id);
$page = $request->element('page', 1);
$template->assign("page", $page);
$catslugItem = $categories->getCategoryFromId($id);
if ($catslugItem)
    $parentid = $catslugItem->getPId();
else
    exit;
$template->assign("catslugItem", $catslugItem);
$template->assign("parentid", $parentid);
$item_news_per_row = $siteConfigs->getProperty('item_news_per_row');
$template->assign("item_news_per_row", $item_news_per_row);
if ($catslugItem) {
    $cid             = $catslugItem->getId();
    $pathParentItems = $categories->getPathParrent($cid);
	
    $template->assign('pathParentItems', $pathParentItems);
    $current  = $pathParentItems[0]->GetId();
    $subItems = $categories->getObjects(1, "status=1 AND pid=$current", array(
        'position' => 'ASC'
    ), '');
    $template->assign('subItems', $subItems);
    $subcat = $categories->getSubCategory1($cid);
    $pages  = $entries->getNumItems('id', "`status` = 1 AND cid in($subcat)", $item_news_per_row);
    $rows   = $pages['rows'];
    $pages  = $pages['pages'];
    if (!$pages)
        $pages = 1;
    if ($page > $pages)
        $page = $pages;
	
    $entriesItems = $entries->getObjects($page, "status=1 AND cid in ($subcat)", array(
        'date_created' => 'DESC'
    ), $item_news_per_row);
    $listPage     = linkPager1_dimoda($catslugItem->getUrlTemplate($lang, 1), $pages, $page);
    $template->assign("pager", $listPage);
    $template->assign("pages", $pages);
    
    $pageName = $catslugItem->getName($lang);
    $template->assign('pageName', $pageName);
    $template->assign('entriesItems', $entriesItems);
}
$parentslug = $categories->getParentSlug($parentid);
$template->assign('parentslug', $parentslug);
#end tin tuc left
$active = ($parentid != '0') ? $parentslug : $slug;
$template->assign('active', $active);
#print_r(parseToXML("<nguyễn thành nhựt>"));
?>