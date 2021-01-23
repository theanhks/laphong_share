<?php
/*************************************************************************
Add category
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen                                  
Last updated: 4/12/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/images.class.php");
include_once(ROOT_PATH.'classes/dao/storecategories.class.php');
include_once(ROOT_PATH.'classes/dao/storeproduceinfo.class.php');
include_once(ROOT_PATH.'classes/dao/storeproduces.class.php');
include_once(ROOT_PATH.'classes/dao/storecountries.class.php');
include_once(ROOT_PATH.'classes/dao/storeproduction.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");

$templateFile = "storeeditproduce.temp.html";
$gallery = ROOT_PATH."gallery/album/";
$gallery_storage = $gallery."storage/";
$gallery_upload = ROOT_PATH."gallery/avatar_upload/product/";
$product = new Products();
$storeCate = new storeCate();
$countries = new Countries();
$production = new Production();

$Id = $request->element("oId");
echo $sp = $product->getRecord($Id);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$page = $request->element('page','1');
$page = $request->element('page','1');
$template->assign("production",$production);
if ($Id) {
	$listCountry = $countries->comboListObjects('id','vn_name',$request->element('searchCountry','-1'));
	$template->assign("listCountry",$listCountry);	
	$listProduction = $production->comboListObjects('id','vn_name', $request->element('searchProduction','-1'));
	$template->assign("listProduction",$listProduction);	
	$listCategory = $storeCate->comboListObjects('id','vn_name', $request->element('searchCategory','-1'));
	$template->assign("listCategory",$listCategory);	
	$productItem = $product->getObject($Id);
	$template->assign("listObject",$productItem);
	#die ('AAAAAAAAAAAAAAAAAAAAAAAAAA');

	$slug= $request->element('slug','');
	$vn_name = $request->element('vn_name');
	$vn_sapo= $request->element('vn_sapo','');
	$vn_details = $request->element('vn_details');
	$price= $request->element('price','');
	$s_price = $request->element('s_price');
	$en_name= $request->element('en_name','');
	$en_sapo = $request->element('en_sapo');
	$en_details= $request->element('en_details','');
	$position= $request->element('position','');
	$date_published = date("Y-m-d H:i:s");
	$production= $request->element('production','');
	$category = $request->element('category');
	$country= $request->element('country','');
	$status = $request->element('status');
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$slug=TextFilter::urlize($request->element('slug'),false,'-');
			$files_1 = isset($_FILES['avatar'])?$_FILES['avatar']:'';
			$files_2 = isset($_FILES['file1'])?$_FILES['file1']:'';
			$upload_1 = new Upload($files_1);
			$upload_2 = new Upload($files_2);
			$img =  new Images();
			if($files_1['name'] && $files_2['name']) {
				$copy_1 = $upload_1->moveFile($gallery_storage );
				$file_name_avartar = $upload_1->getNameFile();
				$copy_avartar = $img->resize($gallery_storage,$gallery_upload, $file_name_avartar, $file_name_avartar, 150,true);
				
				$copy_2 = $upload_2->moveFile($gallery_storage );
				$file_name_file1 = $upload_2->getNameFile();
				$copy_file1 = $img->resize($gallery_storage,$gallery_upload, $file_name_file1, $file_name_file1, 200,true);
				
				$productInfo = new ProductInfo($slug, $vn_name, $vn_sapo, $vn_details, $price, $s_price, $en_name, $en_sapo, $en_details, $position, $file_name_avartar, $date_published, $production, $category, $country, $status, '', '', '',  $file_name_file1,'','','','','','','');
				$field = array('slug'=>$productInfo->getSlug(),
							'vn_name'=>$productInfo->getName('vn'),
							'vn_sapo'=>$productInfo->getSapo('vn'),
							'vn_details'=>$productInfo->getDetails('vn'),
							'price'=>$productInfo->getPrice(),
							's_price'=>$productInfo->getSPrice(),
							'en_name'=>$productInfo->getName('en'),
							'en_sapo'=>$productInfo->getSapo('en'),
							'en_details'=>$productInfo->getDetails('en'),
							'position'=>$productInfo->getPosition(),
							'avatar'=>$productInfo->getAvatar(),
							'date_published'=>$productInfo->getDatePublished(),
							'production'=>$productInfo->getProduction(),
							'category'=>$productInfo->getCategory(),
							'country'=>$productInfo->getCountry(),
							'status'=>$productInfo->getStatus(),
							'file1'=>$productInfo->getFile(1),
							);
			}elseif($files_1['name'] && $files_2['name']='') {
				$copy_1 = $upload_1->moveFile($gallery_storage );
				$file_name_avartar = $upload_1->getNameFile();
				$copy_avartar = $img->resize($gallery_storage,$gallery_upload, $file_name_avartar, $file_name_avartar, 150,true);
				$productInfo = new ProductInfo($slug, $vn_name, $vn_sapo, $vn_details, $price, $s_price, $en_name, $en_sapo, $en_details, $position, $file_name_avartar, $date_published, $production, $category, $country, $status,'','','','','','','','','','','');
				$field = array('slug'=>$productInfo->getSlug(),
							'vn_name'=>$productInfo->getName('vn'),
							'vn_sapo'=>$productInfo->getSapo('vn'),
							'vn_details'=>$productInfo->getDetails('vn'),
							'price'=>$productInfo->getPrice(),
							's_price'=>$productInfo->getSPrice(),
							'en_name'=>$productInfo->getName('en'),
							'en_sapo'=>$productInfo->getSapo('en'),
							'en_details'=>$productInfo->getDetails('en'),
							'position'=>$productInfo->getPosition(),
							'avatar'=>$productInfo->getAvatar(),
							'date_published'=>$productInfo->getDatePublished(),
							'production'=>$productInfo->getProduction(),
							'category'=>$productInfo->getCategory(),
							'country'=>$productInfo->getCountry(),
							'status'=>$productInfo->getStatus()
							);
			}elseif($files_1['name']='' && $files_2['name']) {
				$copy_2 = $upload_2->moveFile($gallery_storage );
				$file_name_file1 = $upload_2->getNameFile();
				$copy_file1 = $img->resize($gallery_storage,$gallery_upload, $file_name_file1, $file_name_file1, 200,true);
				
				$productInfo = new ProductInfo($slug, $vn_name, $vn_sapo, $vn_details, $price, $s_price, $en_name, $en_sapo, $en_details, $position, '', $date_published, $production, $category, $country, $status, '', '', '',  $file_name_file1,'','','','','','','');
				$field = array('slug'=>$productInfo->getSlug(),
							'vn_name'=>$productInfo->getName('vn'),
							'vn_sapo'=>$productInfo->getSapo('vn'),
							'vn_details'=>$productInfo->getDetails('vn'),
							'price'=>$productInfo->getPrice(),
							's_price'=>$productInfo->getSPrice(),
							'en_name'=>$productInfo->getName('en'),
							'en_sapo'=>$productInfo->getSapo('en'),
							'en_details'=>$productInfo->getDetails('en'),
							'position'=>$productInfo->getPosition(),
							'date_published'=>$productInfo->getDatePublished(),
							'production'=>$productInfo->getProduction(),
							'category'=>$productInfo->getCategory(),
							'country'=>$productInfo->getCountry(),
							'status'=>$productInfo->getStatus(),
							'file1'=>$productInfo->getFile(1),
							);
			}else {
				$productInfo = new ProductInfo($slug, $vn_name, $vn_sapo, $vn_details, $price, $s_price, $en_name, $en_sapo, $en_details, $position, '', $date_published, $production, $category, $country, $status, '', '', '','','','','','','','','');
				$field = array('slug'=>$productInfo->getSlug(),
							'vn_name'=>$productInfo->getName('vn'),
							'vn_sapo'=>$productInfo->getSapo('vn'),
							'vn_details'=>$productInfo->getDetails('vn'),
							'price'=>$productInfo->getPrice(),
							's_price'=>$productInfo->getSPrice(),
							'en_name'=>$productInfo->getName('en'),
							'en_sapo'=>$productInfo->getSapo('en'),
							'en_details'=>$productInfo->getDetails('en'),
							'position'=>$productInfo->getPosition(),
							'date_published'=>$productInfo->getDatePublished(),
							'production'=>$productInfo->getProduction(),
							'category'=>$productInfo->getCategory(),
							'country'=>$productInfo->getCountry(),
							'status'=>$productInfo->getStatus()
							);
			}
			$product->updateData(&$field, $Id);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$pages = $product->getNumItems('id', "1=1");
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all Ads object and pass to template
			$productItems = $product->getObjects($page,'1=1', array('position'=>'ASC'));
			$template->assign("listObjects",$productItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=store&amp;part=product&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("product",$product);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
			$template->assign("rows",$rows);
			$template->assign("pages",$pages);
			$template->assign("page",$page);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
			$template->assign("storeCate",$storeCate);
			$template->assign("countries",$countries);
			$templateFile = "managelistproduct.temp.html";
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("production",$production);
			$template->assign("storeCate",$storeCate);
			$template->assign("countries",$countries);
			$template->assign("product",$product);
		}
	}
	# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);
	
}else{
# Thong bao Khong Ton Tai ID Category
	$infoText = $amessages['invalid_id'];
	$infoClass = "infoText";
	$act = 'list';
	$template->assign("act",$act);
	$templateFile = "managelistproduct.temp.html";
	$pages = $product->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all Ads object and pass to template
	$productItems = $product->getObjects($page,'1=1', array('position'=>'ASC'));
	#var_dump($adsItems);
	$template->assign("listObjects",$productItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=store&amp;part=product&amp;act=list&amp;page=%s",$pages,$page);
	$template->assign("adminPager",$listPage);
	$template->assign("product",$product);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);	
	$template->assign("rows",$rows);
	$template->assign("pages",$pages);
	$template->assign("page",$page);
	$template->assign("searchTerms",$searchTerms);
	$template->assign("searchStatus",$searchStatus);
	$template->assign("storeCate",$storeCate);
	$template->assign("countries",$countries);
	$template->assign("production",$production);
	$template->assign("product",$product);
}

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('searchStatus'));
	$infoText .= $validate->validString($amessages['position'],$request->element('position'));		
	return $infoText;
}
?>