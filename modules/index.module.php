<?php
$templateFile = "index.tpl.html";
# dung chung
include_once(ROOT_PATH."modules/framework.module.php");
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH . "classes/dao/entries.class.php");

$products = new Products();
$entries      = new Entries();

$order= array('date_published'=>'DESC');
$page = $request->element('page',1);

# show san pham muc cha
include_once(ROOT_PATH."classes/dao/procategories.class.php");
$procategories = new ProductCategories();
$listsub_parent= $procategories->getSubProCategory(0);
$template->assign('listsub_parent',$listsub_parent);



#San Pham Cho thue moi nhat
/*$listsub_chothue= $procategories->getSubCategory1(1670);
$template->assign('listsub_chothue',$listsub_chothue);
$products_per_page = $siteConfigs->getProperty('products_per_page'); 
$proCond_spmoi="status=1 and category in($listsub_chothue)";
$indexspmoiItems = $products->getObjects(1,$proCond_spmoi, array('date_published'=>'DESC'),$products_per_page);
$template->assign('indexspmoiItems',$indexspmoiItems);*/

#Du an moi nhat
/*$listsub_duan= $procategories->getSubCategory1(1671);
$template->assign('listsub_duan',$listsub_duan);
$proCond_duan="status=1 and category in($listsub_duan)";
$indexsduan = $products->getObjects(1,$proCond_duan, array('date_published'=>'DESC'),$products_per_page);
$template->assign('indexsduan',$indexsduan);*/



#san pham ban moi
$products_spbanchay_per_page = $siteConfigs->getProperty('products_spgiasocmoingay_per_page'); 
$proCond_spgiasocmoingay="status=1";
$indexspbanchayItems = $products->getObjects(1,$proCond_spgiasocmoingay, array('date_published'=>'DESC'),$products_per_page);
$template->assign('indexspbanchayItems',$indexspbanchayItems);

$pages = $products->getNumItems('id',$proCond_spgiasocmoingay,$products_per_page);
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$proItems = $products->getObjects($page,$proCond_spgiasocmoingay,$order,$products_per_page);
		#print_r(count($proItems));
		$template->assign("proItems",$proItems);
		
		#print_r($proItems);
	# Generate and pass link pager to template
	$template->assign("slug",$slug);
	if(URL_TYPE==1)
		$listPage = linkPager1_dimoda(ROOTPATH."/index.php?op=products&amp;lang=$lang&amp;&amp;slug=san-pham&amp;page=%s",$pages,$page);
	else
		if($id!='')
			$listPage = linkPager1_dimoda(ROOTPATH."/san-pham-p$id/page-%s.html",$pages,$page);
		else
			$listPage = linkPager1_dimoda(ROOTPATH."/san-pham-p/page-%s.html",$pages,$page);			
		$template->assign("pager",$listPage);
		$template->assign("pages",$pages);


#tin tuc 
$entriesItems = $entries->getObjects(1, "status=1", array(
        'date_created' => 'DESC'
    ), $products_spbanchay_per_page);
$template->assign('entriesItems', $entriesItems);

#tin lien quan 
$entriesItemsLienQuan = $entries->getObjects(1, "status=1 and home <> 1", array(
        'date_created' => 'DESC'
    ), $products_spbanchay_per_page);
$template->assign('entriesItemsLienQuan', $entriesItemsLienQuan);

/*$slug='gia-soc-moi-ngay';
$template->assign('slug',$slug);*/
$pageName = '';
$active='home';
$template->assign('active',$active);
$template->assign('pageName',$pageName);







$template->assign('procategories',$procategories);
$template->assign('products',$products);
?>