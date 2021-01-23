<?php
/*ini_set('display_errors','1'); ini_set('display_startup_errors','1'); */
/*************************************************************************
Index module
----------------------------------------------------------------
Vnnavi CMS Project
Company: Ava Co., Ltd                                  
Email: kimque@ava.vn                                    
Last updated: 08/03/201
**************************************************************************/
 include_once(ROOT_PATH."classes/dao/imgbanners.class.php");
$customer = new Imgbanners();
$templateFile = "doitac.tpl.html";
$page = $request->element('page',1);
 if($slug == 'doi-tac'){
	 $customerItems= $customer->getObjects($page,"status=1",array('id'=>'DESC'),12);
	 $template->assign('customerItems',$customerItems);
	 $template->assign('customer',$customer);
	 $pages = $customer->getNumItems('id',"status=1",12);
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;	
		if(URL_TYPE==1)
		$listPage = linkPager1_en(ROOTPATH."/index.php?op=customer&amp;lang=$lang&amp;&amp;slug=$slug&amp;page=%s",$pages,$page);
	else
		$listPage = linkPager1_en(ROOTPATH."/$lang/$slug/page-%s.html",$pages,$page);
	$template->assign("pager",$listPage);
	$template->assign("pages",$pages);
	$template->assign("rows",$rows);
 }
/****** dung chung *****/
 include_once(ROOT_PATH."modules/framework.module.php");
 
$pageName = $messages['customer'];
$active='doi-tac';
$template->assign('pageName',$pageName);
$template->assign('active',$active);
?>