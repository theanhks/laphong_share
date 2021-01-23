<?php
/*************************************************************************
Module contact
----------------------------------------------------------------
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                   
Last updated: 08/03/2011
**************************************************************************/
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH."includes/functions.php");
include_once(ROOT_PATH."classes/dao/categories.class.php");
include_once(ROOT_PATH."classes/dao/customers.class.php");
$customers = new Customers();
$categories = new Categories();
$templateFile = "deletecustomer.tpl.html";
# contact form
$code = $request->element('code','');
$email = strtolower($request->element('email',''));
$template->assign("code",$code);
$template->assign("email",$email);
	if($_POST) {
		$code = $request->element('code','');
		$email = $request->element('email','');
		$customerItems=$customers->checkExists($code,$email);
		
		if($customerItems=='1'){
			$sql ="DELETE FROM `n_customers` WHERE `email` = '$email'";
			mysql_query($sql);
			$infoText = $messages['item_delete_ok'];
			$template->assign("error",$infoText);
		}else{
			$infoText = $messages['item_delete_error'];
			$template->assign("error",$infoText);
		}
	}
//$admin_mail='kimque@ava.vn';
$pageName = 'Đăng ký nhận Email';
$template->assign("pageName",$pageName);
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
$hotnewsItems = $entries->getObjects(1,"status =1 AND cid=4 AND home=1 AND lang='$lang'",array('date_created'=>'DESC'),4);
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

?>