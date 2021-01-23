<?php 
include_once(ROOT_PATH."classes/dao/imgbanners.class.php");
$imgbanners = new Imgbanners();

#product
$templateFile = "download.tpl.html";
$slug = $request->element('slug','download-bang-bao-gia');
	if ($slug){
			$resourceItems = $imgbanners->getObjects(1,"status =1",array('position'=>'DESC'),1);
			$template->assign('resourceItems',$resourceItems);
			//print_r($resourceItems);
	}
	
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
$categoryItems = $categories->getObjects(1,"status =1 AND pid=4",array('position'=>'ASC'),'');
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
 # active
 $pageName=$messages['download'];
  $template->assign('pageName',$pageName);
 $active='san-pham';
 $template->assign('active',$active);
?>