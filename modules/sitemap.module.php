<?php
/*************************************************************************
Category module
----------------------------------------------------------------
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/entries.class.php");
include_once(ROOT_PATH."classes/dao/categories.class.php");
include_once(ROOT_PATH."includes/functions.php");
$categories = new Categories();
$entries = new Entries();
$templateFile = "sitemap.tpl.html";
$slug = $request->element('slug','');

#menu 
include_once(ROOT_PATH."classes/dao/categories.class.php");
$categories = new Categories();
$menulefItems = $categories->getObjects(1,"pid = 0 AND status=1",array('position'=>'ASC'),'');
$template->assign('menulefItems',$menulefItems);
$template->assign('categories',$categories);
include_once(ROOT_PATH."classes/dao/procategories.class.php");
$procategories = new ProductCategories();
$proleftItems = $procategories->getObjects(1,"pid = 0 AND status=1",array('position'=>'ASC'),'');
$template->assign('proleftItems',$proleftItems);
$template->assign('procategories',$procategories);
#end menu
#support
include_once(ROOT_PATH."classes/dao/parts.class.php");
$parts = new Parts();
$partItems = $parts->getObjects(1,"status =1",array('id'=>'ASC'),'');
$template->assign('partItems',$partItems);
$template->assign('parts',$parts);
#end support

?>