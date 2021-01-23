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

$templateFile = "storeaddproduce.temp.html";
$gallery = ROOT_PATH."gallery/album/";
$gallery_storage = $gallery."storage/";
$gallery_upload = ROOT_PATH."gallery/avatar_upload/product/";
$product = new Products();
$storeCate = new storeCate();
$countries = new Countries();
$production = new Production();

$listCountry = $countries->comboListObjects('id','vn_name');
$template->assign("listCountry",$listCountry);

$listProduction = $production->comboListObjects('id','vn_name');
$template->assign("listProduction",$listProduction);

$listCategory = $storeCate->comboListObjects('id','vn_name');
$template->assign("listCategory",$listCategory);
$template->assign("production",$production);
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

$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$page = $request->element('page',1);
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
if($_POST) {
	$avatar = isset($_FILES['avatar'])?$_FILES['avatar']:'';
	$uploadAvatar = new Upload($avatar);
	$img =  new Images();
	$photos = array();
	for ($i=1; $i<=8; $i++){
		$files = isset($_FILES['file'.$i])?$_FILES['file'.$i]:'';
		$upload = new Upload($files);
		$move = $upload->moveFile($gallery_storage);
		$file_name = $upload->getNameFile();
		$copy = $img->resize($gallery_storage,$gallery_upload, $file_name, $file_name, 200,true);
		$photos[] = $file_name;
	}
	if($avatar) {
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$copy_1 = $uploadAvatar->moveFile($gallery_storage );
			$file_name_avartar = $uploadAvatar->getNameFile();
			$copy_avartar = $img->resize($gallery_storage,$gallery_upload, $file_name_avartar, $file_name_avartar, 150,true);
			$slug=TextFilter::urlize($request->element('slug'),false,'-');
			$productInfo = new ProductInfo($slug, $vn_name, $vn_sapo, $vn_details, $price, $s_price, $en_name, $en_sapo, $en_details, $position, $file_name_avartar, $date_published, $production, $category, $country, $status, '', '', '',$photos[0],$photos[1],$photos[2], $photos[3],$photos[4],$photos[5],$photos[6],$photos[7]);
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
							'file2'=>$productInfo->getFile(2),
							'file3'=>$productInfo->getFile(3),
							'file4'=>$productInfo->getFile(4),
							'file5'=>$productInfo->getFile(5),
							'file6'=>$productInfo->getFile(6),
							'file7'=>$productInfo->getFile(7),
							'file8'=>$productInfo->getFile(8),
							);
			$product->addData(&$field);
			$infoText = $amessages['item_inserted_ok'];
			$infoClass = "infoText";
			
			$templateFile = "storelistproduce.temp.html";
			$act = 'list';
			$template->assign("act",$act);
			$pages = $product->getNumItems('id');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$productItems = $product->getObjects('',"1=1", array('position'=>'ASC'));
			$template->assign("listObjects",$productItems);	
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=product&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("rows",$rows);
			$template->assign("pages",$page);
			$template->assign("start",($page - 1) * $items_per_pages);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
			$template->assign("product",$product);
			$template->assign("storeCate",$storeCate);
			$template->assign("countries",$countries);
			
		}else {
			$infoText = $amessages['item_inserted_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("slug",$slug);
			$template->assign("vn_name",$vn_name);
			$template->assign("vn_sapo",$vn_sapo);
			$template->assign("vn_details",$vn_details);
			$template->assign("price",$price);
			$template->assign("s_price",$s_price);
			$template->assign("en_name",$en_name);
			$template->assign("en_sapo",$en_sapo);
			$template->assign("en_details",$en_details);
			$template->assign("position",$position);
			$template->assign("avatar",$avatar);
			$template->assign("production",$production);
			$template->assign("category",$category);
			$template->assign("country",$country);
			$template->assign("status",$status);
			$template->assign("product",$product);
			$template->assign("storeCate",$storeCate);
			$template->assign("countries",$countries);
			$template->assign("production",$production);
		}	
	}
}
$listStatus = optionStatus($request->element('searchStatus','-1'),DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);


function validateData($request) {
	global $amessages;
	$validate = new Validate();
	$infoText = '';
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validStatus($amessages['production'],$request->element('production'));
	$infoText .= $validate->validStatus($amessages['category'],$request->element('category'));
	$infoText .= $validate->validStatus($amessages['country'],$request->element('country'));
	$infoText .= $validate->validString($amessages['slug'],$request->element('slug'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	$infoText .= $validate->validString($amessages['vn_sapo'],$request->element('vn_sapo'));
	return $infoText;
}


?>