<?php
/*************************************************************************
Login module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 02/07/2008
**************************************************************************/
#login
include_once(ROOT_PATH."classes/dao/members.class.php");
include_once(ROOT_PATH."includes/functions.php");
$members = new Members();
$templateFile = "login.tpl.html";
$error ='';
$infoClass = "infoText";
$template->assign('infoClass',$infoClass);
	$op= $request->element('op','');
	$template->assign('op',$op);
	$pageName = "Đăng nhập";
$template->assign('pageName',$pageName);
if($_POST) {
	$username = trim($request->element("username",''));
	$password = trim($request->element("password",''));
	$userId = 0;
			$error='';
			$userId = $members->authenticateUser($username,$password);
			if($userId) {
				 $_SESSION['memberId'] = $userId;
				//	$error = "Chúc mừng bạn đã đăng nhập thành công";
					header("location:/mc2/index.php");
				} else {
					$_SESSION['memberId'] = '';
					$error = "Tên đăng nhập hoặc mật khẩu không đúng";
					$infoClass = "error";
					$template->assign('infoClass',$infoClass);
			}
			$template->assign('error',$error);
			$template->assign('members',$members);
}

 #supprot
 include_once(ROOT_PATH."classes/dao/procategories.class.php");
$productcategories = new ProductCategories();
$productcatItems = $productcategories->getObjects(1,"status =1 AND pid=0",array('position'=>'ASC'),'');
$template->assign('productcatItems',$productcatItems);
$template->assign('productcategories',$productcategories);
 #end support
 #supprot
 include_once(ROOT_PATH."classes/dao/parts.class.php");
$parts = new Parts();
$partItems = $parts->getObjects(1,"status =1",array('id'=>'ASC'),1);
$template->assign('partItems',$partItems);
$template->assign('parts',$parts);
 #end support
 #chuyen muc
 include_once(ROOT_PATH."classes/dao/categories.class.php");
$categories = new Categories();
$categoryItems = $categories->getObjects(1,"status =1 AND pid=0",array('position'=>'ASC'),'');
$template->assign('categoryItems',$categoryItems);
$template->assign('categories',$categories);
 #chuyen muc
  #tim tuc left
 include_once(ROOT_PATH."classes/dao/entries.class.php");
$entries = new Entries();
$leftEntriesItems = $entries->getObjects(1,"status =1 AND cid=1",array('date_created'=>'DESC'),3);
$template->assign('leftEntriesItems',$leftEntriesItems);
$template->assign('entries',$entries);
 #end tin tuc left


?>