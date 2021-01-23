<?php
$templateFile = "maps.temp.html";
$pageName = 'Liên hệ';
$template->assign("pageName",$pageName);
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
$template->assign('entries',$entries);
$template->assign('newIndexItems',$newIndexItems);
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

#contact
$address_vn = $siteConfigs->getProperty('address');
$address_eng = $siteConfigs->getProperty('address_eng');
$tel_cp = $siteConfigs->getProperty('tel');
$fax = $siteConfigs->getProperty('fax');
$admin_mail = $siteConfigs->getProperty('admin_mail');
$website = $siteConfigs->getProperty('website');
$template->assign("address_vn",$address_vn);
$template->assign("address_eng",$address_eng);
$template->assign("tel_cp",$tel_cp);
$template->assign("fax",$fax);
$template->assign("admin_mail",$admin_mail);
$template->assign("website",$website);
//$admin_mail='xuyen.tran@derasoft.com';
?>