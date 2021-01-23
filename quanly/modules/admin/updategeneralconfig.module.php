<?php
/*************************************************************************
Manage update config module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                  
Last updated: 8/01/2010
**************************************************************************/
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH."classes/dao/configs.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "adminupdategeneralConfig.temp.html";
$infoText = '';
$infoClass = "InfoText";
$configs = new Configs();
#print_r($config);
$config = $configs->getObject("general");
if($_POST) {
	# Validation
	include_once(ROOT_PATH."classes/data/validate.class.php");
	 $validate = validateData($request);
	if($validate == '') {
		$config->setProperty('item_news_index',$request->element('item_news_index'));
		$config->setProperty('facebook',$request->element('facebook'));
		$config->setProperty('youtube',$request->element('youtube'));
		$config->setProperty('google',$request->element('google'));
		$config->setProperty('zingme',$request->element('zingme'));
		$config->setProperty('twitter',$request->element('twitter'));
		$config->setProperty('item_news_per_row',$request->element('item_news_per_row'));
		$config->setProperty('related_news_per_page',$request->element('related_news_per_page'));
		$config->setProperty('related_product_per_page',$request->element('related_product_per_page'));	
		$config->setProperty('products_per_page',$request->element('products_per_page'));
		$config->setProperty('products_spmoi_per_page',$request->element('products_spmoi_per_page'));	
		$config->setProperty('products_spkhuyenmai_per_page',$request->element('products_spkhuyenmai_per_page'));
		$config->setProperty('products_spgiasocmoingay_per_page',$request->element('products_spgiasocmoingay_per_page'));	
		$config->setProperty('products_spnoibat_per_page',$request->element('products_spnoibat_per_page'));	
		$config->setProperty('image_row_items',$request->element('image_row_items'));
		$config->setProperty('admin_mail',$request->element('admin_mail'));
		$config->setProperty('popup_home',$request->element('popup_home'));
		$config->setProperty('sprice_active',$request->element('sprice_active'));
		$config->setProperty('banner_active',$request->element('banner_active'));
		$config->setProperty('tel',$request->element('tel'));
		$config->setProperty('hotline1',$request->element('hotline1'));	
		$config->setProperty('hotline2',$request->element('hotline2'));	
		$config->setProperty('hotline3',$request->element('hotline3'));	
		$config->setProperty('fax',$request->element('fax'));
		$config->setProperty('tax',$request->element('tax'));
		$config->setProperty('keywords',$request->element('keywords'));
		$config->setProperty('description',$request->element('description'));
		$config->setProperty('address_vn',$request->element('address_vn'));
		$config->setProperty('address_en',$request->element('address_en'));
		$config->setProperty('nguoidaidien_vn',$request->element('nguoidaidien_vn'));
		$config->setProperty('nguoidaidien_en',$request->element('nguoidaidien_en'));
		$config->setProperty('chucvu_vn',$request->element('chucvu_vn'));
		$config->setProperty('chucvu_en',$request->element('chucvu_en'));
		$config->setProperty('company_vn',$request->element('company_vn'));
		$config->setProperty('company_en',$request->element('company_en'));
		$config->setProperty('account',$request->element('account'));
		$config->setProperty('website',$request->element('website'));
		$config->setProperty('marquee',$request->element('marquee'));
		$config->setProperty('uptime_vn',$request->element('uptime_vn'));
		$config->setProperty('uptime_en',$request->element('uptime_en'));
		$config->setProperty('youtube',$request->element('youtube'));
		$config->setProperty('twitter',$request->element('twitter'));
		$config->setProperty('map',$request->element('map'));
		$config->setProperty('products_category_per_page',$request->element('products_category_per_page'));
		$config->setProperty('price_promotion',$request->element('price_promotion'));
		$config->setProperty('price_free_ship',$request->element('price_free_ship'));
		$config->setProperty('promotion_time_start',$request->element('promotion_time_start'));
		$config->setProperty('promotion_time_end',$request->element('promotion_time_end'));
		$config->setProperty('uudai_per_page',$request->element('uudai_per_page'));
		$config->setProperty('tuyendung_per_page',$request->element('tuyendung_per_page'));
		$config->setProperty('products_menu_per_page',$request->element('products_menu_per_page'));
		$config->setProperty('products_spbanchay_per_page',$request->element('products_spbanchay_per_page'));
		$config->setProperty('products_menu_home_per_page',$request->element('products_menu_home_per_page'));
		//echo '<pre>';var_dump($config->getProperties());die;
		if($configs->updateData($config)) {
			$infoText = $amessages['update_config_ok'];
			
			$template->assign("InfoText",$infoText);
			$template->assign("infoClass",$infoClass);
		} else {
			$infoText = $amessages['update_config_error'];
			$infoClass = "infoText";
			$template->assign("InfoText",$infoText);
			$template->assign("infoClass",$infoClass);
		}
	}
	else {
		$infoText = $amessages['update_config_error'];
		$infoClass = "infoText";	
		$template->assign("InfoText",$infoText);				
	}
}
$facebook = $config->getProperty('facebook'); 
$template->assign("facebook",$facebook);
$youtube = $config->getProperty('youtube'); 
$template->assign("youtube",$youtube);
$google = $config->getProperty('google'); 
$template->assign("google",$google);
$zingme = $config->getProperty('zingme'); 
$template->assign("zingme",$zingme);
$twitter = $config->getProperty('twitter'); 
$template->assign("twitter",$twitter);

$item_news_index = $config->getProperty('item_news_index'); 
$template->assign("item_news_index",$item_news_index);

$item_news_per_row = $config->getProperty('item_news_per_row'); 
$template->assign("item_news_per_row",$item_news_per_row);


$related_news_per_page = $config->getProperty('related_news_per_page'); 
$template->assign("related_news_per_page",$related_news_per_page);

$related_product_per_page = $config->getProperty('related_product_per_page'); 
$template->assign("related_product_per_page",$related_product_per_page);

$products_per_page = $config->getProperty('products_per_page'); 
$template->assign("products_per_page",$products_per_page);

$products_spmoi_per_page = $config->getProperty('products_spmoi_per_page'); 
$template->assign("products_spmoi_per_page",$products_spmoi_per_page);

$products_spkhuyenmai_per_page = $config->getProperty('products_spkhuyenmai_per_page'); 
$template->assign("products_spkhuyenmai_per_page",$products_spkhuyenmai_per_page);

$products_spgiasocmoingay_per_page = $config->getProperty('products_spgiasocmoingay_per_page'); 
$template->assign("products_spgiasocmoingay_per_page",$products_spgiasocmoingay_per_page);

$products_spnoibat_per_page = $config->getProperty('products_spnoibat_per_page'); 
$template->assign("products_spnoibat_per_page",$products_spnoibat_per_page);

$image_row_items = $config->getProperty('image_row_items'); 
$template->assign("image_row_items",$image_row_items);

$admin_mail = $config->getProperty('admin_mail'); 
$template->assign("admin_mail",$admin_mail);

$popup_home = $config->getProperty('popup_home'); 
$template->assign("popup_home",$popup_home);

$banner_active = $config->getProperty('banner_active'); 
$template->assign("banner_active",$banner_active);

$company_vn = $config->getProperty('company_vn'); 
$template->assign("company_vn",$company_vn);

$company_en = $config->getProperty('company_en'); 
$template->assign("company_en",$company_en);

$account = $config->getProperty('account');
$template->assign("account",$account);

$sprice_active = $config->getProperty('sprice_active'); 
$template->assign("sprice_active",$sprice_active);

$hotline1 = $config->getProperty('hotline1'); 
$template->assign("hotline1",$hotline1);

$hotline2 = $config->getProperty('hotline2'); 
$template->assign("hotline2",$hotline2);

$hotline3 = $config->getProperty('hotline3'); 
$template->assign("hotline3",$hotline3);

$tel = $config->getProperty('tel'); 
$template->assign("tel",$tel);


$fax = $config->getProperty('fax'); 
$template->assign("fax",$fax);

$tax = $config->getProperty('tax'); 
$template->assign("tax",$tax);

$website = $config->getProperty('website'); 
$template->assign("website",$website);

$marquee = $config->getProperty('marquee'); 
$template->assign("marquee",$marquee);

$keywords = $config->getProperty('keywords'); 
$template->assign("keywords",$keywords);

$description = $config->getProperty('description'); 
$template->assign("description",$description);

$address = $config->getProperty('address'); 
$template->assign("address",$address);


$tel = $config->getProperty('tel'); 
$template->assign("tel",$tel);
$user_login = $config->getProperty('user_login'); 
$template->assign("user_login",$user_login);

$address_vn = $config->getProperty('address_vn'); 
$template->assign("address_vn",$address_vn);
$address_en = $config->getProperty('address_en'); 
$template->assign("address_en",$address_en); 

$nguoidaidien_vn = $config->getProperty('nguoidaidien_vn'); 
$template->assign("nguoidaidien_vn",$nguoidaidien_vn);
$nguoidaidien_en = $config->getProperty('nguoidaidien_en'); 
$template->assign("nguoidaidien_en",$nguoidaidien_en);
$chucvu_vn = $config->getProperty('chucvu_vn'); 
$template->assign("chucvu_vn",$chucvu_vn);
$chucvu_en = $config->getProperty('chucvu_en'); 
$template->assign("chucvu_en",$chucvu_en);

$products_spbanchay_per_page = $config->getProperty('products_spbanchay_per_page');
$template->assign("products_spbanchay_per_page",$products_spbanchay_per_page);
$uptime_vn = $config->getProperty('uptime_vn');
$template->assign("uptime_vn",$uptime_vn);
$uptime_en = $config->getProperty('uptime_en');
$template->assign("uptime_en",$uptime_en);
$youtube = $config->getProperty('youtube');
$template->assign("youtube",$youtube);
$twitter = $config->getProperty('twitter');
$template->assign("twitter",$twitter);
$map = $config->getProperty('map');
$template->assign("map",$map);
$products_category_per_page = $config->getProperty('products_category_per_page');
$template->assign("products_category_per_page",$products_category_per_page);
$price_promotion = $config->getProperty('price_promotion');
$template->assign("price_promotion",$price_promotion);
$price_free_ship = $config->getProperty('price_free_ship');
$template->assign("price_free_ship",$price_free_ship);
$promotion_time_start = $config->getProperty('promotion_time_start');
$template->assign("promotion_time_start",$promotion_time_start);
$promotion_time_end = $config->getProperty('promotion_time_end');
$template->assign("promotion_time_end",$promotion_time_end);
$uudai_per_page = $config->getProperty('uudai_per_page');
$template->assign("uudai_per_page",$uudai_per_page);
$tuyendung_per_page = $config->getProperty('tuyendung_per_page');
$template->assign("tuyendung_per_page",$tuyendung_per_page);
$products_menu_per_page = $config->getProperty('products_menu_per_page');
$template->assign("products_menu_per_page",$products_menu_per_page);
$products_menu_home_per_page = $config->getProperty('products_menu_home_per_page');
$template->assign("products_menu_home_per_page",$products_menu_home_per_page);

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validInteger($amessages['item_news_index'],$request->element('item_news_index'));
	$infoText .= $validate->validInteger($amessages['item_news_per_row'],$request->element('item_news_per_row'));
	$infoText .= $validate->validInteger($amessages['related_news_per_page'],$request->element('related_news_per_page'));
	$infoText .= $validate->validString($amessages['products_per_page'],$request->element('products_per_page'));
	$infoText .= $validate->validString($amessages['image_row_items'],$request->element('image_row_items'));
	//$infoText .= $validate->validString($amessages['tel'],$request->element('tel'));
	//$infoText .= $validate->validString($amessages['hotline'],$request->element('hotline'));
	//$infoText .= $validate->validString($amessages['fax'],$request->element('fax'));
	//$infoText .= $validate->validString($amessages['address'],$request->element('address'));
	return '';
}
?>