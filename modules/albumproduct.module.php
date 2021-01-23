<?php 
include_once(ROOT_PATH."classes/dao/imgproducts.class.php");
$imgproducts = new imgProducts();
include_once(ROOT_PATH."classes/dao/albumproducts.class.php");
$albumproducts = new albumProducts();
include_once(ROOT_PATH."classes/dao/procategories.class.php");
$procategories = new ProductCategories();
#product
include_once(ROOT_PATH."classes/dao/products.class.php");
$products = new Products();
$templateFile = "albumproduct.tpl.html";
$slug = $request->element('slug','');
$idpro = $request->element('idpro','');
if ($slug){
$albumItem = $albumproducts->getProCateFromSlug($slug);
	if ($albumItem) {
		$idalpro =$albumItem->getId();
		$productItem= $products->getObject($idpro);
		$cat= $productItem->getCategory();
		$template->assign('productItem',$productItem);
		$imagesItems = $imgproducts->getObjects(1,"status =1 AND idpro=$idpro AND idalpro=$idalpro",array('id'=>'DESC'),'');
		$template->assign('imagesItems',$imagesItems);
		$proCatItem= $procategories->getObject($cat);
		$pageName = $proCatItem->getName($lang);
		$template->assign('pageName',$pageName);
		$template->assign('proCatItem',$proCatItem);
		$template->assign('productItem',$productItem);
		#### alum product ##########
		$albumproItems = $albumproducts->getObjects(1,"status",array('position'=>'ASC'),'');
		$imgpro =$imgproducts->getObjects(1,"status=1 AND idpro=310 AND idalpro=4",'',1);
		$template->assign('albumproItems',$albumproItems);
		$template->assign('idpro',$idpro);
	
	}
}
$order=array('id'=>'DESC');
$template->assign('products',$products);
$template->assign('order',$order);
$template->assign('imgproducts',$imgproducts);
$template->assign('albumproducts',$albumproducts);
#end product

#menu 
include_once(ROOT_PATH."classes/dao/categories.class.php");
$categories = new Categories();
$menulefItems = $categories->getObjects(1,"pid = 0 AND status=1",array('position'=>'ASC'),'');
$template->assign('menulefItems',$menulefItems);
$template->assign('categories',$categories);
include_once(ROOT_PATH."classes/dao/procategories.class.php");
$procategories = new ProductCategories();
$proleftItems = $procategories->getObjects(1,"pid = 0 AND status=1",array('position'=>'ASC'),'');
$template->assign('proleftItems',$proleftItems);
$template->assign('procategories',$procategories);
#end menu
#support
include_once(ROOT_PATH."classes/dao/parts.class.php");
$parts = new Parts();
$partItems = $parts->getObjects(1,"status =1",array('id'=>'ASC'),'');
$template->assign('partItems',$partItems);
$template->assign('parts',$parts);
#end support
?>