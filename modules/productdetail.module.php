<?php  
$type = $request->element('type',"");

$related_product_per_page = $siteConfigs->getProperty('related_product_per_page');
$templateFile = ($type=="pro")?"productdetail.tpl.html":"productdetail.tpl.html";
include_once(ROOT_PATH."classes/dao/procategories.class.php");
include_once(ROOT_PATH."classes/dao/cartitems.class.php");
$plus = isset($_REQUEST['plus'])?$_REQUEST['plus']:'';



$carts = new CartItems();
$procategories = new ProductCategories();
#product
include_once(ROOT_PATH."classes/dao/products.class.php");
$products = new Products();
$id = $request->element('id',0);
if ($id){
$productItem = $products->getObject($id);
	if ($productItem) {
		$cat = $productItem->getCategory();
		$parentItem=$procategories->getParentAllFromCid($cat);
		$activeleft=$parentItem[0];
		#$template->assign('active',$cat);
		$template->assign('productItem',$productItem);
		$template->assign('activeleft',$activeleft);
		$id=$productItem->getId();
		$code=$productItem->getNumProduct();
		$template->assign('id',$id);
		$template->assign('code',$code);
		$ortherproducItems = $products->getObjects(1,"status =1 AND category=$cat AND id!=$id",array('position'=>'ASC'),$related_product_per_page);
		$template->assign('proItems',$ortherproducItems);
		$proCatItem= $procategories->getObject($cat);
		$pageName = $productItem->getName($lang);
		$template->assign('pageName',$pageName);
		$template->assign('proCatItem',$proCatItem);
		include_once(ROOT_PATH."classes/dao/vote.class.php");
		$vote = new Vote();
		$template->assign('vote',$vote);
		$voteItems= $vote->getObjects(1," status =1 AND idproduct=$id ",array('date_created'=>'DESC'));	
		$template->assign('voteItems',$voteItems);	
		$patParentItems = $procategories->getPathParrent($cat);
		$template->assign('pathParentItems',$patParentItems);
		
		$description = $productItem->getDetails($lang);
		$template->assign('description',$description);
		$keyword = $productItem->getName($lang);
		$template->assign('keyword',$keyword);
		#print_r($patParentItems);
	}
}
$order=array('id'=>'DESC');
$template->assign('products',$products);
$template->assign('order',$order);
#end product
 /************* dung chung ******/
 include_once(ROOT_PATH."modules/framework.module.php");
# active
#validata
$active='san-pham';
$template->assign('active',$active);



if($plus =='addToCart'){
			$slug = $request->element('slug','');
			$id = $request->element('id','');
			$quantity = $request->element('quantity',1);
			$pageName = $messages['order'];
			$template->assign('pageName',$pageName);
			if($id) {
				$product = $products->getObject($id);
				if ($product){
					$procatId = $product->getCategory();
					$template->assign('procatId',$procatId);
				}
				if($product){
					$pId = $product->getId();
					$category = $product->getCategory();
					$template->assign('category',$category);
						 	$test = $carts->getTestPId($pId, $session_1);
							if($test){
								$cartItem = $carts->getCartItem($pId, $session_1);
								$sl =  $cartItem->getQuantity()+$quantity;
								$size = $request->element('productsize');
	
								$kt = $cartItem->getProductSize().','.$size;								
								$carts->update(array('quantity'=>$sl,'product_size'=>$kt),"pid=$pId and sid ='$session_1'");
								$countItem = $carts->getSumQuantity($session_1);
								$template->assign("count_item",$countItem);								
							}else{
								$name = $product->getName($lang);
								//if($product->getSPrice()!=0)
									$s_price = $product->getSPrice();
								//else
									$price = $product->getPrice();
								$code = $product->getNumProduct();
								$size = $request->element('productsize');
								$color = $request->element('productcolor');
								$avatar=$product->getAvatar();
								function CartItemInfo($sId, $pId, $slug, $product_name, $product_code, $product_size,$product_color, $quantity, $price, $s_price, $avatar, $time_stamp, $iId = 0){}
								$cartItem = new CartItemInfo($session_1, $product->getId(), $product->getSlug(), $name, $code, $size,$color, $quantity, $price, $s_price, $avatar,date("Y-m-d H:s"));
								
	
								$field = array('sid'=>$cartItem->getSId(), 
												'pid'=>$cartItem->getPId(),
												'slug'=>$cartItem->getSlug(),
												'product_name'=>$cartItem->getProductName(),
												'product_code'=>$cartItem->getProductCode(),
												'product_size'=>$cartItem->getProductSize(),
												'product_color'=>$color,
												'quantity'=>$cartItem->getQuantity(),
												'price'=>$cartItem->getPrice(),
												's_price'=>$cartItem->getSPrice(),
												'avatar'=>$cartItem->getAvatar(),
												'time_stamp'=>$cartItem->getTimeStamp());
								$carts->addData($field);
								$countItem = $carts->getSumQuantity($session_1);
								$template->assign("count_item",$countItem);
								$template->assign("product",$product);
							}
				}
			}
			
			header("Refresh:0");
}

?>