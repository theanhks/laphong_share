<?php
/*************************************************************************
Search module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                               
Last updated: 26/12/2008
**************************************************************************/
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH.'includes/functions.php');
$products = new Products();
$infoText = '';
$infoClass = 'infoText';
#$products_per_page = $siteConfigs->getProperty('products_per_page');
$products_per_page='';
$templateFile = "test.tpl.html";
$keyword = $request->element('term','');
$str=mysql_real_escape_string($keyword);
$pid= $request->element('thuonghieu','-1');
$giatu= $request->element('giatu','-1');
$giaden = $request->element('giaden','-1');
$page = $request->element('page','1');
$lang = $request->element('lang','vn');
# Build search condition
$searchCond = "1>0";			# For other cases, you can set this to "(1>0)"
$searchCond .= " AND (status=1 AND vn_name LIKE '%".$str."%')";
$proItems = $products->getObjects(1, $searchCond, array('date_published'=>'DESC'),10);
$template->assign("proItems",$proItems);
 if($proItems){
	 foreach($proItems as $proItem){		
		$proItem->getName("vn").'",';		
		$newone = "" ;
		#$newone["id"] = $proItem->getId() ;
		#$newone["name"] = $proItem->getName("vn");
		$newone=$proItem->getName("vn");
		$new[] = $newone ;
	}	
	echo json_encode($new);
}
?>