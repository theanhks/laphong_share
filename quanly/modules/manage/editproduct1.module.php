<?php
/*************************************************************************
Edit Ads module
---------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/images.class.php");
include_once(ROOT_PATH.'classes/dao/procategories.class.php');
include_once(ROOT_PATH.'classes/dao/products.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");

$templateFile = "manageeditproduct.temp.html";

$gallery_upload = ROOT_PATH."gallery/avatar_upload/products/";
$gallery_storage = $gallery_upload."storage/";
$gallery_medium = $gallery_upload."medium/";
$gallery_avatar = $gallery_upload."avatar/";
$gallery_thumb = $gallery_upload."thumb/";
$gallery_watermark = $gallery_upload."watermark/";

$watermark_vuong = ROOT_PATH."gallery/watermark/vuong.png";
$watermark_dung = ROOT_PATH."gallery/watermark/dung.png";
$watermark_nam = ROOT_PATH."gallery/watermark/nam.png";

$product = new Products();
$pro_cate = new ProductCategories();

$Id = $request->element("oId");
$sp = $product->getRecord($Id);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
if($searchStatus ==-1)  $searchStatus = $request->element('status','-1');
$searchCategory = $request->element('searchCategory','-1');
if($searchCategory==-1) $searchCategory = $request->element('category','-1');
$page = $request->element('page',1);
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');

if ($Id && $sp != '') {	
	$productItem = $product->getObject($Id);
	$template->assign("listObject",$productItem);

	$slug= $request->element('slug','');
	$vn_name = $request->element('vn_name','');
	$vn_sapo= $request->element('vn_sapo','');
	$vn_details = $request->element('vn_details','');
	$price= $request->element('price','');
	$s_price = $request->element('s_price','');
	$en_name= $request->element('en_name','');
	$en_sapo = $request->element('en_sapo','');
	$en_details= $request->element('en_details','');
	$position= $request->element('position','');
	$date_published = date("Y-m-d H:i:s");
	$category = $request->element('category','');
	$status = $request->element('status','');
	$home = $request->element('frontend');

	$file1 = $request->element('file_1','');
	$file2 = $request->element('file_2','');
	$file3 = $request->element('file_3','');
	$file4 = $request->element('file_4','');
	$file5 = $request->element('file_5','');

	$photos_old =array('1'=>$file1,'2'=>$file2,'3'=>$file3,'4'=>$file4,'5'=>$file5);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$slug = TextFilter::urlize($request->element('vn_name'),false,'-');
			$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
			$upload = new Upload($files);
			$img =  new Images();
			if($files['tmp_name']){
				$copy = $upload->moveFile($gallery_storage);
				$file_name = $upload->getNameFile();
				$imgWidth = $upload->getWidth($gallery_storage);
				$imgHeight = $upload->getHeight($gallery_storage);
				$imgh=$upload->getDangHinh($gallery_storage);
				if($imgh ==2)
					$img->watermark($gallery_storage.$file_name,$watermark_dung);
				else{
					if ($imgh ==1)
						$img->watermark($gallery_storage.$file_name,$watermark_nam);
					else
						$img->watermark($gallery_storage.$file_name,$watermark_vuong);
				}

				$copy_1= $img->resize($gallery_storage,$gallery_avatar, $file_name, $file_name, 216,0);
				$copy_2= $img->resize($gallery_storage,$gallery_medium, $file_name, $file_name, 335,0);
				$copy_3= $img->resize($gallery_storage,$gallery_thumb, $file_name, $file_name, 158,0);
			}else $file_name = $request->element('old_avatar','');
			$photos = array();
			for($i=1;$i<=5;$i++) {
			$file = isset($_FILES['file'.$i])?$_FILES['file'.$i]:'';
			$upload1 = new Upload($file);
			if($file['tmp_name']){
				$copy = $upload1->moveFile($gallery_storage);
				$file_name1 = $upload1->getNameFile();	
				//if (isImage($file_name1)){	
					$copy_4= $img->resize($gallery_storage,$gallery_medium, $file_name1, $file_name1, 335,0);			
				//}
					$photos[$i] = $file_name1;

			}else $photos[$i] = $photos_old[$i] ;

		}
			$slug = TextFilter::urlize($request->element('vn_name'),false,'-');
			$productInfo = new ProductInfo($slug, $vn_name, $vn_sapo, $vn_details, $price, $s_price, $en_name, $en_sapo, $en_details, $position, $file_name,$photos[1],$photos[2],$photos[3],$photos[4],$photos[5], $date_published, '', '', $category, '', $status, '', '', '', '', '', '', $home);
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
						'file1'=>$productInfo->getFile(1),
						'file2'=>$productInfo->getFile(2),
						'file3'=>$productInfo->getFile(3),
						'file4'=>$productInfo->getFile(4),
						'file5'=>$productInfo->getFile(5),
						'date_published'=>$productInfo->getDatePublished(),
						'production'=>$productInfo->getProduction(),
						'category'=>$productInfo->getCategory(),
						'country'=>$productInfo->getCountry(),
						'status'=>$productInfo->getStatus(),
						'viewed'=>$productInfo->getViewed(),
						'num_product'=>$productInfo->getNumProduct(),
						'status_product'=>$productInfo->getStatusProduct(),
						'material'=>$productInfo->getMaterial(),
						'size'=>$productInfo->getSize(),
						'color'=>$productInfo->getColor(),
						'payment'=>$productInfo->getPayment(),
						'home'=>$productInfo->getHome()
						);
			$product->updateData(&$field, $Id);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$searchStatus = -1;
			$searchCountry = -1;
			$searchCategory = -1;
			$searchProduction = -1;
			$pages = $product->getNumItems('id', "1=1");
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all Ads object and pass to template
			$productItems = $product->getObjects($page,'1=1', array('position'=>'ASC'));
			$template->assign("listObjects",$productItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=product&amp;act=list&amp;searchTerms=".$searchTerms."&amp;searchStatus=".$searchStatus."&amp;searchCategory=".$searchCategory."&amp;searchCountry=".$searchCountry."&amp;searchProduction=".$searchProduction."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("product",$product);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
			$template->assign("rows",$rows);
			$template->assign("pages",$pages);
			$template->assign("page",$page);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
			$template->assign("pro_cate",$pro_cate);
			$templateFile = "manageeditproduct.temp.html";
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("slug",$slug);
			$template->assign("vn_name",$vn_name);
			$template->assign("vn_sapo",$vn_sapo);
			$template->assign("vn_details",$vn_details);
			$template->assign("price",$price);
			$template->assign("en_name",$en_name);
			$template->assign("en_sapo",$en_sapo);
			$template->assign("en_details",$en_details);
			$template->assign("position",$position);
			$template->assign("avatar",$avatar);
			$template->assign("category",$category);
			$template->assign("status",$status);
			$template->assign("product",$product);
			$template->assign("pro_cate",$pro_cate);
			$template->assign("frontend",$home);
		}
	}
	# Generate status combobox for Search form
	$listStatus = optionStatus($searchStatus);
	$template->assign("listStatus",$listStatus);
	$listCategory = $pro_cate->optionAllCategories('id','vn_name', $searchCategory);
	$template->assign("listCategory",$listCategory);
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
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=product&amp;act=list&amp;page=%s",$pages,$page);
	$template->assign("adminPager",$listPage);
	$template->assign("product",$product);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);	
	$template->assign("rows",$rows);
	$template->assign("pages",$pages);
	$template->assign("page",$page);
	$template->assign("searchTerms",$searchTerms);
	$template->assign("searchStatus",$searchStatus);
	$template->assign("pro_cate",$pro_cate);
	$template->assign("product",$product);
}

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validStatus($amessages['category'],$request->element('category'));
	#$infoText .= $validate->validString($amessages['slug'],$request->element('slug'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	$infoText .= $validate->validString($amessages['vn_sapo'],$request->element('vn_sapo'));
	$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));
	return $infoText;
}
?>