<?php
$templateFile = "sitemaps.temp.html";
$pageName = "Sơ đồ website";
$template->assign('pageName',$pageName);
#menu hearder
include_once(ROOT_PATH."classes/dao/menus.class.php");
$menus = new Menus();
$menuItems = $menus->getObjects(1,"status =1 AND mgid=12 AND pid=0",array('position'=>'ASC'),'');
$template->assign('menuItems',$menuItems);
$menufooterItems = $menus->getObjects(1,"status =1 AND mgid=18 AND pid=0",array('position'=>'ASC'),'');
$template->assign('menufooterItems',$menufooterItems);
$template->assign('menus',$menus);
#end menu
#banner 
include_once(ROOT_PATH."classes/dao/galleries.class.php");
include_once(ROOT_PATH."classes/dao/resources.class.php");
#Album
$gallery = new Gallery();
$template->assign("gallery",$gallery);

#Resource
$resource = new Resource();
$template->assign("resource",$resource);
#end banner

#support 
include_once(ROOT_PATH."classes/dao/support.class.php");
$support = new Support();
$supportItems = $support->getFrontSuport('status =1');
$template->assign('supportItems',$supportItems);
$template->assign('support',$support);
#end support

#news index
include_once(ROOT_PATH."classes/dao/entries.class.php");
$entries = new Entries();
$item_news_index = $siteConfigs->getProperty('item_news_index');
$newIndexItems = $entries ->getObjects(1,"status =1 AND home =1 AND lang= '$lang'", array('position'=>'ASC'),3);
$newIndex = $entries ->getObjects(1,"status =1 AND lang= '$lang'", array('popup'=>'DESC'),3);
$template->assign('entries',$entries);
$template->assign('newIndexItems',$newIndexItems);
$template->assign('newIndex',$newIndex);
#end news index

#proucts category
include_once(ROOT_PATH."classes/dao/procategories.class.php");
$procategories = new ProductCategories();
$currentId=1;
$procategoryItems = $procategories ->getProductCategory("0");
$template->assign('procategoryItems',$procategoryItems);
$template->assign('procategories',$procategories);
$template->assign('currentId',$currentId);
#end prouct category
# gioi thieu
include_once(ROOT_PATH."classes/dao/static.class.php");
$static = new StaticPage();
$staticAbout =$static->getStaticPageFromSlug("gioi-thieu-cong-ty");
$template->assign("staticAbout",$staticAbout);
# end gioi thieu
#san pham moi
include_once(ROOT_PATH."classes/dao/products.class.php");
$products = new Products();
$template->assign("products",$products);
$product_right_item = $siteConfigs->getProperty('product_right_item');
$productNews= $products->getObjects(1,"status = 1",array('date_published'=>'DESC'),10);
$template->assign("productNews",$productNews);
#end san pham ban chay
?>