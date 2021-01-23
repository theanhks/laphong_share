<?php
/*************************************************************************
**************************************************************************/
include_once(ROOT_PATH."classes/dao/entries.class.php");
include_once(ROOT_PATH."classes/dao/categories.class.php");
$entries = new Entries();
$categories = new Categories();
$templateFile = "newsdetail.tpl.html";
$id = $request->element('id');
$page = $request->element('page',1);
$detailItem = $entries->getEntryFromId($id);
#print_r($detailItem );
if($detailItem) {
	$id   = $detailItem->getId();
	$Cid   = $detailItem->getCId();
	$pathParentItems = $categories->getPathParrent($Cid);
	$template->assign('pathParentItems',$pathParentItems);
	$related_news_per_page = $siteConfigs->getProperty('related_news_per_page');
	$otherNewsItems = $entries->getObjects(1,"status=1 AND id!=$id AND cid=$Cid",array('date_created'=>'DESC'),$related_news_per_page);
	$template->assign("catslugItem",$detailItem);	
	$template->assign("entriesItems",$otherNewsItems);
	#echo 'orthernews:';print_r(count($otherNewsItems));
	$template->assign("slug",$slug);
	$template->assign("page",$page);
	if($Cid==41){
        $pageName = $lang == 'en' ? 'Promotion' : 'Ưu Đãi';
    }elseif ($Cid==42){
        $pageName = $lang == 'en' ? 'Recruitment' : 'Tuyển dụng';
    }else{
        $pageName = $detailItem->getName($lang);
    }

	$template->assign('pageName',$pageName);	
	
	$description = $detailItem->getDetails($lang);
		$template->assign('description',$description);
		$keyword = $detailItem->getName($lang);
		$template->assign('keyword',$keyword);
		$template->assign('pageName',$pageName);
		$template->assign('Cid',$Cid);

}else{
$pageName = $messages["news"];
$template->assign('pageName',$pageName);
}
   /************* dung chung ******/
 include_once(ROOT_PATH."modules/framework.module.php");
#active
 $active='';
 $template->assign('active',$active);

?>