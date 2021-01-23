<?php
/*************************************************************************
Add Ads
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
//ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH.'classes/dao/procategories.class.php');
include_once(ROOT_PATH.'classes/dao/products.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
$templateFile = "manageaddproduct.temp.html";
$gallery_upload = ROOT_PATH."gallery/avatar_upload/products/";
$gallery_storage = $gallery_upload."storage/";
$gallery_avatar = $gallery_upload."avatar/";
$gallery_thumb = $gallery_upload."thumb/";
$gallery_medium= $gallery_upload."medium/";
$product = new Products();
$pro_cate = new ProductCategories();
$status = $request->element('status','1');
$category = $request->element('category','-1');
$vn_name = $request->element('vn_name','');
$mausac = $request->element('mausac','');
#$en_name = $request->element('newhot','');
$en_name = $request->element('en_name',NULL);
$num_product = $request->element('num_product','');
$size = $request->element('size','');
$vn_details = $request->element('vn_details','');
$vn_nsx = $request->element('vn_nsx','');
$en_nsx = $request->element('en_nsx','');
$en_details = $request->element('en_details',NULL);
$price = $request->element('price','0');
$s_price = $request->element('s_price','0');
$vn_nhanhieu=$request->element('vn_nhanhieu','');
$en_nhanhieu=$request->element('en_nhanhieu','');
$position = $request->element('position',0);
$date_published = date("Y-m-d H:i:s");
$home = $request->element('home','0');
$code_sp = $request->element('code_sp','');

$spmoi= $request->element('spmoi','0');
$spkhuyenmai = $request->element('spkhuyenmai','0');
$newhot = $request->element('newhot','0');
#$vat_on= $request->element('vat_on');
/* màu sắc */
$property=$request->element('color','');
$properties= serialize($property);

/* kích thước */
$kichthuoc=$request->element('kichthuoc','');
$kichthuocs= serialize($kichthuoc);


$listCategory = $pro_cate->optionAllCategories('id','vn_name', $category);
$template->assign("listCategory",$listCategory);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$searchCategory = $request->element('searchCategory','-1');
$page = $request->element('page',1);
$orderBy = $request->element('orderBy','date_published');
$orderDir = $request->element('orderDir','DESC');
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
if($_POST) {
	
	$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
	$upload = new Upload($files);
	
	$files3 = isset($_FILES['file3'])?$_FILES['file3']:'';
	$upload3 = new Upload($files3);
	
	# Validation
	$validate = validateData($request);
	if($validate == '') {
		
		if($files3['tmp_name']){
			$copy = $upload3->moveFile($gallery_storage);
			$file3_name = $upload3->getNameFile();
			if ($upload3->isImage($file3_name)){
				$copy_1= $upload3->resize($gallery_storage,$gallery_avatar,$file3_name,$file3_name, PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_HEIGHT,0);
				$copy_1= $upload3->resize($gallery_storage,$gallery_thumb,$file3_name,$file3_name, PRO_IMAGE_THUMB_WIDTH,PRO_IMAGE_THUMB_HEIGHT,0);
				$copy_1= $upload3->resize($gallery_storage,$gallery_medium,$file3_name,$file3_name, PRO_IMAGE_MEDIUM_WIDTH,PRO_IMAGE_MEDIUM_HEIGHT,0);
			}
		}else $file3_name = '';
		
		
		if($files['tmp_name']){
			$copy = $upload->moveFile($gallery_storage);
			$file_name = $upload->getNameFile();
			if ($upload->isImage($file_name)){
				$copy_1= $upload->resize($gallery_storage,$gallery_avatar,$file_name,$file_name, PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_HEIGHT,0);
				$copy_1= $upload->resize($gallery_storage,$gallery_thumb,$file_name,$file_name, PRO_IMAGE_THUMB_WIDTH,PRO_IMAGE_THUMB_HEIGHT,0);
				$copy_1= $upload->resize($gallery_storage,$gallery_medium,$file_name,$file_name, PRO_IMAGE_MEDIUM_WIDTH,PRO_IMAGE_MEDIUM_HEIGHT,0);
			}
		}else $file_name = '';		
		/***********upload nhieu hinh anh ************/
			$file = isset($_FILES['files'])?$_FILES['files']:'';
			if($file['tmp_name'][0]!=''){
				$photos = array();
				for($i=0;$i<sizeof($file['name']);$i++){
					$array_upload=array(
										'name'=>$file['name'][$i],
										'type'=>$file['type'][$i],
										'tmp_name'=>$file['tmp_name'][$i],
										'error'=>$file['error'][$i],
										'size'=>$file['size'][$i]);								
					$upload1= new Upload($array_upload);
					$upload1->moveFile($gallery_storage);
					$file_name1=$upload1->getNameFile();
					if (isImage($file_name1)){
						$copy_4= $upload1->resize($gallery_storage,$gallery_avatar, $file_name1, $file_name1,PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_WIDTH,0);
						$copy_4= $upload1->resize($gallery_storage,$gallery_thumb, $file_name1, $file_name1,PRO_IMAGE_THUMB_WIDTH,PRO_IMAGE_THUMB_HEIGHT,0);
						$copy_4= $upload1->resize($gallery_storage,$gallery_medium, $file_name1, $file_name1,PRO_IMAGE_MEDIUM_WIDTH,PRO_IMAGE_MEDIUM_HEIGHT,0);
					}
					$photos[]=$file_name1;
				}
				$photos1=serialize($photos);
			}else
			$photos1=NULL;
		/***********************/		
		$slug=removeSign($vn_name);
		/*
		function ProductInfo($slug, $vn_name, $en_name, $vn_details, $en_details,$vn_nsx,$en_nsx,$vn_nhanhieu, $en_nhanhieu, $price, $s_price, $avatar,$file1, $file2, $file3, $file4, $file5, $position, $date_published, $num_product, $category, $status,$payment, $viewed, $home,$properties, $pId = 0)
	{}*/
		$productInfo = new ProductInfo($slug, $vn_name, $en_name, $vn_details, $en_details,$vn_nsx,$en_nsx,$vn_nhanhieu,$en_nhanhieu,$price, $s_price, $file_name,$photos1, $kichthuocs, $file3_name, '', '', $position, $date_published, $num_product, $category, $status,$newhot, $spkhuyenmai, $spmoi,$properties);

			$field = array(
						'slug'=>$productInfo->getSlug(),
						'vn_name'=>$productInfo->getName('vn'),
						'en_name'=>$productInfo->getName('en'),
						'vn_details'=>$productInfo->getDetails('vn'),
						'en_details'=>$productInfo->getDetails('en'),
						'vn_nsx'=>$productInfo->getNSX('vn'),
						'en_nsx'=>$productInfo->getNSX('en'),
						'vn_nhanhieu'=>$productInfo->getNhanhieu('vn'),
						'en_nhanhieu'=>$productInfo->getNhanhieu('en'),
						'price'=>$productInfo->getPrice(),
						's_price'=>$productInfo->getSPrice(),
						'position'=>$productInfo->getPosition(),
						'avatar'=>$productInfo->getAvatar(),
						'file1'=>$productInfo->getFile1(),
						'file2'=>$productInfo->getFile2(),
						'file3'=>$productInfo->getFile3(),
						'file4'=>$productInfo->getFile(4),
						'file5'=>$productInfo->getFile(5),
						'date_published'=>$productInfo->getDatePublished(),
						'category'=>$productInfo->getCategory(),
						'status'=>$productInfo->getStatus(),
						'num_product'=>$productInfo->getNumProduct(),
						'viewed'=>$productInfo->getViewed(),
						'payment'=>$productInfo->getPayment(),
						'home'=>$productInfo->getHome(),
						'properties'=>$productInfo->setProperties()
						);
		$product->addData($field);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "infoText";
		$templateFile = "managelistproduct.temp.html";
		$act = 'list';
		$template->assign("act",$act);
		$pages = $product->getNumItems('id');
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;	
		# Get all entries object and pass to template
		$productItems = $product->getObjects($page,"1=1", array('date_published'=>'DESC'));
		$template->assign("listObjects",$productItems);	
		# Generate and pass link pager to template
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=product&amp;act=list&amp;searchTerms=".$searchTerms."&amp;searchStatus=".$searchStatus."&amp;searchCategory=".$searchCategory."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign("rows",$rows);
		$template->assign("pages",$page);
		$template->assign("start",($page - 1) * $items_per_pages);
		$template->assign("searchTerms",$searchTerms);
		$template->assign("searchStatus",$searchStatus);
		$template->assign("product",$product);
		$template->assign("pro_cate",$pro_cate);
	}else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
		$infoClass = "errorText";	
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign("vn_name",$vn_name);
		$template->assign("en_name",$en_name);		
		$template->assign("vn_details",$vn_details);
		$template->assign("en_details",$en_details);
		$template->assign("vn_nsx",$vn_nsx);
		$template->assign("en_nsx",$en_nsx);
		$template->assign("vn_nhanhieu",$vn_nhanhieu);
		$template->assign("en_nhanhieu",$en_nhanhieu);
		$template->assign("price",$price);
		$template->assign("s_price",$s_price);
		$template->assign("position",$position);
		$template->assign("category",$category);
		$template->assign("status",$status);
		$template->assign("code_sp",$code_sp);
		$template->assign("product",$product);
		$template->assign("pro_cate",$pro_cate);
	}
}
$listStatus = optionStatus($status,DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);
$template->assign("searchTerms",$searchTerms);
$template->assign("searchStatus",$searchStatus);
$template->assign("orderBy",$orderBy);
$template->assign("orderDir",$orderDir);
$template->assign("page",$page);

function isImage($str) {
	$ext = strtolower(substr($str,-3));
	if(preg_match("/jpg|png|bmp|gif|peg/",$ext)) return 1;
	return 0;
}

function validateData($request) {
	global $amessages;
	$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
	$upload = new Upload($files);
	$validate = new Validate();
	$infoText = '';
	$infoText .= $validate->validStatus($amessages['category'],$request->element('category'));
	#$infoText .= $validate->validString("Mã sản phẩm",$request->element('num_product'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	#$infoText .= $validate->validString($amessages['vn_sapo'],$request->element('vn_nsx'));
	#$infoText .= $validate->validString($amessages['en_sapo'],$request->element('en_nsx'));
	#$infoText .= $validate->validString($amessages['vn_nhanhieu'],$request->element('vn_nhanhieu'));
	#$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));
	#$infoText .= $validate->validString($amessages['en_details'],$request->element('en_details'));
	#$infoText .= $validate->validString("Tình trạng",$request->element('vn_nsx'));
	#$infoText .= $validate->validString("Bảo hành",$request->element('en_nsx'));
	$infoText .= $validate->validCheckType($amessages['avatar'],$upload->checkType());
	return $infoText;
}
?>