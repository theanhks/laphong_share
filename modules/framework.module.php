<?php
error_reporting(E_ALL);
ini_set('display_errors','1'); ini_set('display_startup_errors','1');
$orderASC= array("position"=>"ASC");
$template->assign('orderASC',$orderASC);

include_once(ROOT_PATH."classes/dao/procategories.class.php");
include_once(ROOT_PATH."classes/dao/categories.class.php");
//include_once(ROOT_PATH."modules/counter.php");
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH."classes/dao/cartitems.class.php");
include_once(ROOT_PATH . "classes/dao/weblinks.class.php");
include_once(ROOT_PATH . "classes/dao/support.class.php");
include_once(ROOT_PATH . "classes/dao/entries.class.php");
$weblinks      = new Weblinks();
$cartitems      = new CartItems();
$support      = new Support();
$products      = new Products();
$catagory      = new Categories();
$entries      = new Entries();



include_once(ROOT_PATH . "classes/dao/static.class.php");

$static      = new StaticPage();

#get object du an
$footer_static =  $static->getObject(1);
$template->assign('footer_static',$footer_static);


/*$template->assign('online',$online);
$template->assign('day_value',$day_value);
$template->assign('yesterday_value',$yesterday_value);
$template->assign('week_value',$week_value);
$template->assign('month_value',$month_value);
$template->assign('all_value',$all_value);*/

$template->assign('products_items',$products);


# count cart
$session_1 = session_id();
$template->assign('session_1',$session_1);
$caritems_count = $cartitems->getCartItemsNumber($session_1);
$caritems_total = $cartitems->getSumPrice($session_1);
$template->assign('caritems_count',$caritems_count);
$template->assign('caritems_total',$caritems_total);

$productcategories = new ProductCategories();
$productcatItems = $productcategories->getObjects(1,"status =1 AND pid=0",array('position'=>'ASC'),'');
$template->assign('productcatItems',$productcatItems);
$template->assign('productcategories',$productcategories);

$productcatdatphong = $productcategories->getObjects(1,"status =1 AND pid=1687",array('position'=>'ASC'),'');
$template->assign('productcatdatphong',$productcatdatphong);

#get object cho thue
$object_chothue =  $productcategories->getObject(1670);
$template->assign('object_chothue',$object_chothue);



#get object du an
$object_duan =  $productcategories->getObject(1671);
$template->assign('object_duan',$object_duan);

#get object dat phong
$object_datphong =  $productcategories->getObject(1687);
$template->assign('object_datphong',$object_datphong);

#get sub tin tuc
$suvCond_datphong="status=1 and pid = 1687";
$sub_datphong =  $productcategories->getObjects(1,$suvCond_datphong, array('position'=>'ASC'),100);
$template->assign('sub_datphong',$sub_datphong);


#San Pham Cho thue moi nhat
$listsub_chothue= $productcategories->getSubCategory1(1);

$template->assign('listsub_chothue',$listsub_chothue);
$products_per_page = $siteConfigs->getProperty('products_per_page');
$proCond_spmoi="status=1 and category in($listsub_chothue)";
$indexspmoiItems = $products->getObjects(1,$proCond_spmoi, array('position'=>'ASC'),$products_per_page);
$template->assign('indexspmoiItems',$indexspmoiItems);
// San pham menu
$products_menu_home_per_page = $siteConfigs->getProperty('products_menu_home_per_page');
$listsub_menu= $productcategories->getSubCategory1(1691);
$proCond_menu = "status=1 and category in($listsub_menu)";
$productMenu = $products->getObjects(1,$proCond_menu, array('position'=>'ASC'),$products_menu_home_per_page);
$template->assign('productMenu',$productMenu);

#Du an moi nhat
$listsub_duan= $productcategories->getSubCategory1(1671);
$template->assign('listsub_duan',$listsub_duan);
//var_dump($listsub_duan);
$proCond_duan="status=1 and category in($listsub_duan)";
$indexsduan = $products->getObjects(1,$proCond_duan, array('position'=>'ASC'),$products_per_page);
$template->assign('indexsduan',$indexsduan);


#Danh sach dat phong
$listsub_datphong= $productcategories->getSubCategory1(1687);
$template->assign('listsub_datphong',$listsub_datphong);

$proCond_datphong="status=1 and category in($listsub_datphong)";
$indexsdatphong = $products->getObjects(1,$proCond_datphong, array('position'=>'ASC'),$products_per_page);
$template->assign('indexsdatphong',$indexsdatphong);



#get object gioi thieu
$object_gioithieu =  $catagory->getObject(1);
$template->assign('object_gioithieu',$object_gioithieu);


#get object khuyen mai
$object_khuyenmai =  $catagory->getObject(13);
$template->assign('object_khuyenmai',$object_khuyenmai);

#get sub gioi thieu
$suvCond_gioithieu="status=1 and pid = 1";
$sub_gioithieu =  $catagory->getObjects(1,$suvCond_gioithieu, array('position'=>'ASC'),100);
$template->assign('sub_gioithieu',$sub_gioithieu);

#get sub dich vu
$suvCond_dichvu="status=1 and pid = 30";
$sub_dichvu =  $catagory->getObjects(1,$suvCond_dichvu, array('position'=>'ASC'),100);
$template->assign('sub_dichvu',$sub_dichvu);

#get sub bang gia
$suvCond_banggia="status=1 and pid = 15";
$sub_banggia =  $catagory->getObjects(1,$suvCond_banggia, array('position'=>'ASC'),100);
$template->assign('sub_banggia',$sub_banggia);

#get object bang gia 
$object_banggia1 =  $catagory->getObject(15);
$template->assign('object_banggia1',$object_banggia1);

#get sub tin tuc
$suvCond_tintuc="status=1 and pid = 13";
$sub_tintuc =  $catagory->getObjects(1,$suvCond_tintuc, array('position'=>'ASC'),100);
$template->assign('sub_tintuc',$sub_tintuc);

#get object tin tức  
$object_tintuc =  $catagory->getObject(13);
$template->assign('object_tintuc',$object_tintuc);


#get object Hướng dẫn mua hàng  
$object_muahang =  $catagory->getObject(15);
$template->assign('object_muahang',$object_muahang);

#get sub Hướng dẫn mua hàng 
$suvCond_muahang="status=1 and pid = 15";
$sub_muahang =  $catagory->getObjects(1,$suvCond_muahang, array('position'=>'ASC'),100);
$template->assign('sub_muahang',$sub_muahang);

#get object giải pháp 
$object_giaiphap =  $catagory->getObject(13);
$template->assign('object_giaiphap',$object_giaiphap);

#get object lien he
$object_lienhe =  $catagory->getObject(26);
$template->assign('object_lienhe',$object_lienhe);

#get sub giải pháp 
$suvCond_giaiphap="status=1 and pid = 13";
$sub_giaiphap =  $catagory->getObjects(1,$suvCond_giaiphap, array('position'=>'ASC'),100);
$template->assign('sub_giaiphap',$sub_giaiphap);

#get object dai ly
$object_daily =  $catagory->getObject(14);
$template->assign('object_daily',$object_daily);

#get sub giải pháp 
$suvCond_daily="status=1 and pid = 14";
$sub_daily =  $catagory->getObjects(1,$suvCond_daily, array('position'=>'ASC'),100);
$template->assign('sub_daily',$sub_daily);



#get object giải pháp 
$object_lienhe =  $catagory->getObject(26);
$template->assign('object_lienhe',$object_lienhe);

#support
$proCond_support="status=1";
$index_support= $support->getObjects(1,$proCond_support, array('position'=>'DESC'),100);
$template->assign('index_support',$index_support);

#web link
$proCond_weblink="status=1";
$index_weblink= $weblinks->getObjects(1,$proCond_weblink, array('position'=>'DESC'),100);
$template->assign('index_weblink',$index_weblink);

#tin tuc 
$item_news_per_row = $siteConfigs->getProperty('item_news_per_row'); 

#tin tuc 

$entriesItems1= $entries->getObjects(1, "status=1 and cid = 2", array(
        'date_created' => 'DESC'
    ), $item_news_per_row);
$template->assign('entriesItems1', $entriesItems1);


#Dich vụ 

$entriesItemsDichvu= $entries->getObjects(1, "status=1 and cid = 30", array(
        'date_created' => 'DESC'
    ), 100);
$template->assign('entriesItemsDichvu', $entriesItemsDichvu);

include_once(ROOT_PATH."classes/dao/products.class.php");
$products = new Products();
$template->assign('products',$products);

#support online
include_once(ROOT_PATH.'classes/dao/parts.class.php');
$parts = new Parts();
$template->assign('parts',$parts);
$partsItems = $parts->getObjects(1,"status=1",array('id'=>'ASC'),'');
$template->assign('partsItems',$partsItems);
include_once(ROOT_PATH.'classes/dao/support.class.php');
$support = new Support();
$template->assign('support',$support);
 
/* 
#tin tuc noi bat
include_once(ROOT_PATH."classes/dao/entries.class.php");
$entries = new Entries();
$template->assign('entries',$entries);
$hotnewsItems = $entries->getObjects(1,"status=1",array('id'=>'DESC'),8);
$template->assign('hotnewsItems',$hotnewsItems);
*/
 
/*#weblinks
include_once(ROOT_PATH."classes/dao/weblinks.class.php");
$weblinks = new Weblinks();
$leftweblinks = $weblinks->getObjects(1,"status =1",array('position'=>'ASC'),'');
$template->assign('leftweblinks',$leftweblinks);
$template->assign('weblinks',$weblinks);*/

/*#end tin tuc left
include_once(ROOT_PATH . "classes/dao/entries.class.php");
$entries      = new Entries();
#tin nong
##$cid=91; //tin tuc category id
#$subcat = $categories->getSubCategory1($cid);
$subcat_tintucsukien=23;
$item_news_index = $siteConfigs->getProperty('item_news_index');
$tinnongItems = $entries->getObjects(1, "status=1 AND cid in($subcat_tintucsukien)", array('date_created' => 'DESC'), $item_news_index);
$template->assign('tinnongItems',$tinnongItems);*/

#chuyen muc
include_once(ROOT_PATH."classes/dao/categories.class.php");
$categories = new Categories();
$template->assign('categories',$categories);
$categoryItems = $categories->getObjects(1,"status=1 AND pid=0",array('position'=>'ASC'),'');
$template->assign('categoryItems',$categoryItems);
#bai gioi thieu

#quang cao
include_once(ROOT_PATH.'classes/dao/ads.class.php');
$ads = new Ads();
$template->assign('ads',$ads);




/*
#quang cao home
include_once(ROOT_PATH.'classes/dao/ads_home.class.php');
$ads_home = new Ads_home();
$template->assign('ads_home',$ads_home);

include_once(ROOT_PATH.'classes/dao/adsgroups_home.class.php');
$AdsGroups_home = new AdsGroups_home();
$template->assign('AdsGroups_home',$AdsGroups_home);
$adsHomeItems = $ads_home->getObjects(1,"status=1",array('gid'=>'ASC'),8);
$template->assign('adsHomeItems',$adsHomeItems);
#print_r($adsHomeItems);*/



#support online
/*
include_once(ROOT_PATH.'classes/dao/parts.class.php');
$parts = new Parts();
$template->assign('parts',$parts);
$partsItems = $parts->getObjects(1,"status=1",array('position'=>'ASC'),'');
$template->assign('partsItems',$partsItems);*/
include_once(ROOT_PATH.'classes/dao/support.class.php');
$support = new Support();
$template->assign('support',$support);
$supportItems = $support->getObjects(1,"status=1",array('position'=>'ASC'),'');
$template->assign('supportItems',$supportItems);

/*
include_once(ROOT_PATH.'classes/dao/tamgia.class.php');
$tamgia = new TamGia();
$template->assign('tamgia',$tamgia);
$tamgiaItems = $tamgia->getObjects(1, '1=1','', '');
$template->assign('tamgiaItems',$tamgiaItems);
*/

$FooterItem = $categories->getObject(5); //NK Mart Footer
$template->assign('FooterItem',$FooterItem);


#trang chu , home ,index
$content_home1 =  $catagory->getObject(34);
$template->assign('content_home1',$content_home1);
$content_home2 =  $catagory->getObject(35);
$template->assign('content_home2',$content_home2);

#GHTN
$content_ghtn1 = $catagory->getObject(38);
$template->assign('content_ghtn1',$content_ghtn1);

#get chuyen muc khach hang
$con_khachhang="status=1 and pid = 29";
$sub_khachhang =  $catagory->getObjects(1,$con_khachhang, array('position'=>'ASC'),100);
$template->assign('sub_khachhang',$sub_khachhang);

//Set page not show menu mobile
$not_show_menu_mobile = array('giao-hang-tan-noi','gio-hang','dang-nhap','dang-ky');
$template->assign('not_show_menu_mobile',$not_show_menu_mobile);
?>