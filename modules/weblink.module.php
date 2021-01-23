<?php
/*************************************************************************
Category module
----------------------------------------------------------------
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/weblinks.class.php");
$weblinks = new Weblinks();
$templateFile = "weblink.tpl.html";
$pid = $request->element('pid',0);
$webLinkItems = $weblinks->getObjects(1,"status=1 AND pid=0",array('position'=>'ASC'),'');
$template->assign('webLinkItems',$webLinkItems);
$template->assign('weblinks',$weblinks);

$template->assign('pid',$pid);
if ($pid!=0){
$websubLinks = $weblinks->getObjects(1,"status=1 AND pid=$pid",array('position'=>'ASC'),'');
$linkItem= $weblinks->getObject($pid);
$linkname= $linkItem->getName($lang);
$template->assign('linkname',$linkname);
$template->assign('websubLinks',$websubLinks);
}


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