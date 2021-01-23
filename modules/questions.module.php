
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
include_once(ROOT_PATH."classes/dao/questions.class.php");
$questions = new Questions();
$templateFile = "questions.tpl.html";
$slug = $request->element('slug','hoi-dap');
$page = $request->element('page','1');
if($slug=='hoi-dap'){
$questionsItems = $questions->getObjects($page,"status=1 AND lang='$lang'",array('position'=>'ASC'),6);
//print_r($questionsItems);
$template->assign("questionsItems",$questionsItems);
$pages = $questions->getNumItems('id', "`status` = 1",6);
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if(!$pages) $pages=1;
	if($page>$pages) $page=$pages;	
	if(URL_TYPE==1)
		$listPage = linkPager1(ROOTPATH."/index.php?op=questions&amp;&amp;slug=$slug&amp;page=%s",$pages,$page);
	else
		$listPage = linkPager1(ROOTPATH."/$lang/giai-dap-ky-thuat/page-%s.html",$pages,$page);
	$template->assign("pager",$listPage);
	$template->assign("pages",$pages);
$template->assign("slug",$slug);
}
$template->assign("questions",$questions);	
 /************* dung chung ******/
 include_once(ROOT_PATH."modules/framework.module.php");
 
 #end tin tuc left
  $pageName =$messages['hoidap'];
$template->assign('pageName',$pageName);
 $active='hoi-dap';
 $template->assign('active',$active);

?>
