<?php
/*************************************************************************
**************************************************************************/
include_once(ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH."classes/dao/procategories.class.php");
include_once(ROOT_PATH."modules/framework.module.php");
$sort_price_op =$request->element('sort_price_op','');
$template->assign("sort_price_op",$sort_price_op);

$sort_price_cate =$request->element('sort_price_cate','');	
$template->assign("sort_price_cate",$sort_price_cate);
$proCond=" status=1 ";
$order= array('date_published'=>'DESC');
if($_POST){
	if(isset($_POST['sort_price_cate'])){	
		#$arraygia = explode('-',$sort_price_cate);	
		#$giatu = (isset($arraygia[0]))?$arraygia[0]:0 ;	
		#$giaden = (isset($arraygia[1]))?$arraygia[1]:0;
		if($sort_price_cate!=-1){
			$giaItem=$tamgia->getTamgiabyId($sort_price_cate);
			$giatu=$giaItem->getPricefrom();
			$giaden=$giaItem->getPriceto();
			if($giatu!=-1) $proCond .= " AND (price >=$giatu)";
			if($giaden!=-1) $proCond .= " AND (price <$giaden)";
		}
	}
	/**/
	if(isset($_POST['sort_price_op']))
	{
		$order=array('price'=>'ASC');
		if($sort_price_op =='1')
			$order=array('price'=>'DESC'); //gia tang
		else
		{
			if($sort_price_op=='2')
				$order=array('price'=>'ASC'); //gia giam
			/*else			
				$order= array('date_published'=>'DESC');*/
		}
	}
	else{
		$order= array('date_published'=>'DESC');
	}
	$template->assign("order",$order);		
}
$products = new Products();
$procategories = new ProductCategories();
$templateFile = "products.tpl.html";
#echo $templateFile;
$page = $request->element('page',1);
$template->assign("page", $page);
$slug = $request->element('slug','');
$id = $request->element('id','');
$template->assign("id",$id);
$products_per_page = $siteConfigs->getProperty('products_per_page');
	$pcItem = $procategories->getObject($id);
	$template->assign("pcItem",$pcItem);	
	if($pcItem){
	    $parent_cat_id = $pcItem->getPPCId();
		$pcId = $pcItem->getId();

		$slug = $pcItem->getSlug();
		$pathParentItems = $procategories->getPathParrent($pcId);
		$template->assign('pathParentItems',$pathParentItems);
		$activeItems=$procategories->getParentAllFromCid($pcId);	

		$listsub_parent= $procategories->getSubProCategory($pcId);
		$template->assign('listsub_parent',$listsub_parent);
		$activeleft=$activeItems[0];
		$listsub= $procategories->getSubCategory1($pcId);

		if($parent_cat_id == 1691 || $pcId == 1691){
            $products_per_page = $siteConfigs->getProperty('products_menu_per_page');
        }
        if($parent_cat_id == 1691){
            //Nếu là thực đơn chỉ lấy đúng sản phẩm của category id
            $proCond.=" and category = $pcId ";

        }else{
            // Lấy cả những con liên quan
            $proCond.=" and category in($listsub) ";
        }
		$pageName = $pcItem->getName($lang);
		$template->assign('pageName',$pageName);
		
		$description = $pcItem->getDetails($lang);
		$template->assign('description',$description);
		$keyword = $pcItem->getName($lang);
		$template->assign('keyword',$keyword);
		
	}else{
		if($slug =='san-pham'){
			$pageName = "Sản phẩm";
			$proCond.=" ";
		}
		if($slug =='khuyen-mai'){
			$pageName = "Sản phẩm khuyến mãi";
			$proCond.="and payment=1 ";
		}
		
		
		if($slug =='san-pham-moi'){
			$proCond.=" and home=1 ";			
			$pageName = "Sản phẩm mới";
		}
		if($slug =='san-pham-khuyen-mai'){
			$proCond.=" and payment=1 ";
			$pageName = "Sản phẩm khuyến mãi";
		}
		if($slug =='gia-soc-moi-ngay'){
			$pageName = "Giá sốc mỗi ngày";
			$proCond.=" and viewed=1 ";
		}
	}
		#print_r($proCond);
		$pages = $products->getNumItems('id',$proCond,$products_per_page);
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;
		# Get all entries object and pass to template
		$proItems = $products->getObjects($page,$proCond,$order,$products_per_page);
		#print_r(count($proItems));
		$template->assign("proItems",$proItems);
		
		#print_r($proItems);
	# Generate and pass link pager to template
	$template->assign("slug",$slug);
	if(URL_TYPE==1)
		$listPage = linkPager1_dimoda(ROOTPATH."/index.php?op=products&amp;lang=$lang&amp;&amp;slug=$slug&amp;page=%s.html",$pages,$page);
	else
		if($id!='')
			$listPage = linkPager1_dimoda(ROOTPATH."/$lang/p$id/$slug/page-%s.html",$pages,$page);
		else
			$listPage = linkPager1_dimoda(ROOTPATH."/$lang/$slug/page-%s",$pages,$page);			
		$template->assign("pager",$listPage);
		$template->assign("pages",$pages);
		$template->assign("rows",$rows);
		$template->assign("activeleft",$activeleft);
		$template->assign("slug",$slug);
		$template->assign("pcId",$pcId);
		$template->assign("ppcId",$parent_cat_id);
 /************* dung chung *************/
 //Dùng để check khi bấm logo quay về giao hàng tận nơi hoặc về trang chủ
 $typePage = ($pcId != 1691 && $parent_cat_id !=1691) ? 'giao-hang-tan-noi' : '';

 $template->assign("activepro",isset($pcId)?$pcId:'');
 $active='san-pham';
 $template->assign("active",$active);
 if(isset($pageName))
 $template->assign('pageName',$pageName);
 $template->assign('procategories',$procategories);
  $template->assign('products',$products);
  $template->assign('slug',$slug);
  $template->assign('typePage',$typePage);
?>