<?php
/*************************************************************************
Module News
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                  
Last updated: 23/11/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/questions.class.php");
$questions = new Questions();
$templateFile = "questiondetail.tpl.html";
$slug = $request->element('slug');
$id = $request->element('id','');
$questionItem = $questions->getObject($id);
if($questionItem) {
	$related_news_per_page = $siteConfigs->getProperty('related_news_per_page');
	$otherFaqItems = $questions->getObjects(1,"status=1 AND  id!=$id AND lang='$lang'",array('date_created'=>'DESC'),10);
	$template->assign("questionItem",$questionItem);	
	$template->assign("otherFaqItems",$otherFaqItems);
	$template->assign("slug",$slug);
	$pageName = $questionItem->getSlug();
	$template->assign('pageName',$pageName);
}else{

$pageName = "Hỏi đáp";
$template->assign('pageName',$pageName);
}
 /************* dung chung ******/
 include_once(ROOT_PATH."modules/framework.module.php");
 
 #end tin tuc left
 $active='hoi-dap';
 $template->assign('active',$active);
?>