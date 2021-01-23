<?php
/*************************************************************************
Shopping bag module
----------------------------------------------------------------
Vnnavi CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 06/06/2008
**************************************************************************/

include_once(ROOT_PATH."classes/dao/products.class.php");
$products = new Products();
$template->assign("products",$products);
include_once(ROOT_PATH."classes/dao/cartitems.class.php");
$carts = new CartItems();

$templateFile = "shopping.tpl.html";

$plus = isset($_REQUEST['plus'])?$_REQUEST['plus']:'';

$error = '';

$session_1 = session_id();

/*if($plus =='quickCart'){
			$id = $request->element('id','');
				$product = $products->getObject($id);
				//print_r($product);
				if($product){
					$name = $product->getName($lang);
					$avatar = $product->getAvatar();
					$code = $product->getNumProduct();
					if($product->getSPrice()!=0)
					$price = $product->getSPrice();
					else
					$price = $product->getPrice();
					//$price = $product->getPrice();					
					$cartItem = new CartItemInfo($session_1, $product->getId(), $product->getSlug(), $name, $code, 1, $price, $avatar, date("Y-m-d H:s"));
					$field = array('sid'=>$cartItem->getSId(), 
									'pid'=>$cartItem->getPId(),
									'slug'=>$cartItem->getSlug(),
									'product_name'=>$cartItem->getProductName(),
									'product_code'=>$cartItem->getProductCode(),
									'quantity'=>$cartItem->getQuantity(),
									'price'=>$cartItem->getPrice(),
									'avatar'=>$cartItem->getAvatar(),
									'time_stamp'=>$cartItem->getTimeStamp()
									);
					$carts->addData(&$field);
					$countItem = $carts->getSumQuantity($session_1);
					$template->assign("count_item",$countItem);
					$template->assign("product",$product);
				}	
}*/
/*
if($plus=='addToCart'){
			$id = $request->element('id',0);
			$quantity = $request->element('quantity',1);
			$pageName = $messages['order'];
			$template->assign('pageName',$pageName);
			if($slug) {
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
									$carts->update(array('quantity'=>$sl),"pid=$pId and sid ='$session_1'");
									$countItem = $carts->getSumQuantity($session_1);
									$template->assign("count_item",$countItem);
								
							}else{
								$name = $product->getName($lang);
								if($product->getSPrice()!=0)
									$price = $product->getSPrice();
								else
								$price = $product->getPrice();
								
								$avatar=$product->getAvatar();
								$cartItem = new CartItemInfo($session_1, $product->getId(), $product->getSlug(), $name, $code,$quantity, $price, $avatar,date("Y-m-d H:s"));
								$field = array('sid'=>$cartItem->getSId(), 
												'pid'=>$cartItem->getPId(),
												'slug'=>$cartItem->getSlug(),
												'product_name'=>$cartItem->getProductName(),
												'product_code'=>$cartItem->getProductCode(),
												'quantity'=>$cartItem->getQuantity(),
												'price'=>$cartItem->getPrice(),
												'avatar'=>$cartItem->getAvatar(),
												'time_stamp'=>$cartItem->getTimeStamp()
												);
								$carts->addData(&$field);
								$countItem = $carts->getSumQuantity($session_1);
								$template->assign("count_item",$countItem);
								$template->assign("product",$product);
							}		
				
					
				}
			}
}*/
if($_POST) {
	switch ($plus) {
	//
	case 'updateoneCart':
		if(isset($_REQUEST['cId'])) {
				$cId = $_REQUEST['cId'];
				if(!$_REQUEST['quantityEdit'] || $_REQUEST['quantityEdit'] == 0) {
                    $carts->deleteData($cId);
                } else {
                    $quantity = round($_REQUEST['quantityEdit']);
					$items = $carts->getObject($cId);
					$proId = $products->getObject($items->getPId());
					$carts->updateCartItemQuantity(array('quantity'=>$quantity), $cId);
					$countItem = $carts->getSumQuantity($session_1);
					$template->assign("count_item",$countItem);
					$error = $messages['update_product'];
					$template->assign("error",$error);
				}
			}
	//			
	case 'deleteoneCart':
		if(isset($_REQUEST['dId'])) {
			$dId = $_REQUEST['dId'];
			$carts->delete("id ='$dId'");
			$countItem = $carts->getSumQuantity($session_1);
			$template->assign("count_item",$countItem);
		}
	//	
	case 'updateCart':
	$pageName = $messages['order'];
	$template->assign('pageName',$pageName);
		if(isset($_REQUEST['dIds'])) {
			$dIds = $_REQUEST['dIds'];
			foreach ($dIds as $dId) {
				$carts->delete("id ='$dId'");
				$countItem = $carts->getSumQuantity($session_1);
				$template->assign("count_item",$countItem);
			}		
		} else {
			if(isset($_REQUEST['cIds'])) {
				$cIds = $_REQUEST['cIds'];
				$i = 0;
				foreach ($cIds as $cId) {
					$quantity = round($_REQUEST['quantity'][$i]);
					if(!$_REQUEST['quantity'][$i]) $carts->deleteData($cId);
					else {
						$items = $carts->getObject($cId);
						$proId = $products->getObject($items->getPId());
							$carts->updateCartItemQuantity(array('quantity'=>$quantity), $cId);
							$i++;
							$countItem = $carts->getSumQuantity($session_1);
							$template->assign("count_item",$countItem);
							$error = $messages['update_product'];
							$template->assign("error",$error);
							
						
					}
				}
			}
		}	
		break;		
		case 'addToCart':
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
		break;
	}
}

/*check khuyến mãi*/
$timeFrom = $siteConfigs->getProperty("promotion_time_start");
$timeEnd = $siteConfigs->getProperty("promotion_time_end");
$promotionPrice = $siteConfigs->getProperty("price_promotion");
$typePromotion = 0; //Khuyễn mãi tiền
// Kiểm tra loại khuyến mãi
if(strpos($promotionPrice, '%')!=false){
    $typePromotion = 1; //Khuyễn mãi %
    $promotionPrice = str_replace( '%', '', $promotionPrice );
}
if($typePromotion == 0){
    //Ex: thay 200k = 200 000
    if(strpos($promotionPrice, 'k')!=false || strpos($promotionPrice, 'K')!=false){
        $promotionPrice = str_replace( 'k', '000', $promotionPrice );
        $promotionPrice = str_replace( 'K', '000', $promotionPrice );
    }
}

//Kiếm tra thời hạn khuyến mãi
$timeNow = date('H:i');
//format 9:30-->09:30
$date = new DateTime($timeFrom);
$timeFrom = $date->format('H:i');
$date = new DateTime($timeEnd);
$timeEnd = $date->format('H:i');

if($timeNow <  $timeFrom || $timeNow > $timeEnd){
    //Ngoài thời gian km giảm giá = 0;
    $promotionPrice = 0;
}
$template->assign("typePromotion",$typePromotion);
$template->assign("promotionPrice",$promotionPrice);
/*end check khuyến mãi*/
$cartItems = $carts->getObjects(1,"sid='$session_1'", array('time_stamp'=>'DESC'),50);
$template->assign("cartItems",$cartItems);

$sum_price = $carts->getSumPrice($session_1);
$template->assign("sum_price",$sum_price);
$template->assign("slug",$slug);
$template->assign("pageTitle",$messages['cart']);
#CartItems
$count_item = $carts->getSumQuantity($session_1);
$cart1Items = $carts->getObjects(1,"sid='$session_1'",array('quantity'=>'ASC'));
$template->assign("count_item",$count_item);
$template->assign("carts",$carts);

 # active
  include_once(ROOT_PATH."modules/framework.module.php");
 $pageName =$messages['cart'];
$template->assign('pageName',$pageName);
 $active='gio-hang';
 $template->assign('active',$active);
 $typePage = 'gio-hang';
$template->assign('typePage',$typePage);
?>