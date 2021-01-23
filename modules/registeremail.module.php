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
include_once(ROOT_PATH."classes/dao/customers.class.php");
$customers = new Customers();
 $templateFile = "registeremail.tpl.html";
 $email = $request->element('email','');
 $full_name = $request->element('first_name','');
$email = strtolower($request->element('email',''));
$address = $request->element('address','');
$tel = $request->element('tel','');
$act = $request->element('act','');
if($_POST && $act=='register_customer') {
	$nhomid=rand();
		$customer = new CustomerInfo($nhomid,0,0, $full_name, $address, $email, $tel, 1);
		$fields = array('nhomid'=>$customer->getNhom(),
						'ngonnguid'=>$customer->getNgonngu(),
						'dotuoiid'=>$customer->getDotuoi(),
						'name'=>$customer->getName(),
						'address'=>$customer->getAddress(),
						'email'=>$customer->getEmail(),
						'tel'=>$customer->getTel(),
						'status'=>$customer->getStatus()
						);
		$customers->addData($fields);
		$error = $messages['register_sendmail_ok'].'<br />';
		$template->assign("error",$error);
	
}
$template->assign("email",$email);
 #chuyen muc sp
 include_once(ROOT_PATH."classes/dao/procategories.class.php");
$productcategories = new ProductCategories();
$productcatItems = $productcategories->getObjects(1,"status =1 AND pid=0",array('position'=>'ASC'),'');
$listProductCat = $productcategories->optionAllCategories('id',$lang.'_name','');
$template->assign("listProductCat",$listProductCat);
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
$hotnewsItems = $entries->getObjects(1,"status =1 AND cid=4 AND lang='$lang'",array('date_created'=>'DESC'),2);
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
  
$pageName = $messages['home'];
$active='home';
$template->assign('pageName',$pageName);
$template->assign('active',$active);
?>