<?php
/*************************************************************************
Edit Ads module
---------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
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
$orderBy = $request->element('orderBy','date_published');
$orderDir = $request->element('orderDir','DESC');
$img=$request->element('img',''); 
$setwatermark = $request->element("setwatermark");
if ($Id && $sp != '') {	
	if($img!=''){
		$productItem = $product->getObject($Id);
		$photos_old=$productItem->getFile(1);
		foreach($photos_old as $key=>$value){
			if($img==$key){
				unlink(ROOT_PATH."gallery/avatar_upload/products/storage/".$value);
				unlink(ROOT_PATH."gallery/avatar_upload/products/medium/".$value);
				unlink(ROOT_PATH."gallery/avatar_upload/products/thumb/".$value);
				unlink(ROOT_PATH."gallery/avatar_upload/products/avatar/".$value);
				unset($photos_old[$key]);	
			}		
		}
	$photos_old= serialize($photos_old);
	#print_r($photos_old);
	$sql ="UPDATE `n_products` SET `file1` = '$photos_old' WHERE `id` =$Id";
	mysql_query($sql);
	}
	$productItem = $product->getObject($Id);
	#print_r($productItem->getProperty('hot'));
	$photos_old=$productItem->getFile(1);
	$template->assign("listObject",$productItem);
	$slug= $request->element('slug','');
	$vn_name = $request->element('vn_name','');
	#$en_name= $request->element('newhot','');
	$en_name= $request->element('spquantam',NULL);
	$num_product= $request->element('num_product','');
	$size= $request->element('size','');
	$vn_nsx = $request->element('vn_nsx','');
	$en_nsx= $request->element('iconhot',NULL);
	$vn_nhanhieu = $request->element('vn_nhanhieu','');
	$en_nhanhieu = $request->element('giamgia',NULL);
	$vn_details = $request->element('vn_details','');
	$en_details= $request->element('iconnew',NULL);
	$price= $request->element('price','0');
	$s_price = $request->element('s_price','0');
	$position= $request->element('position',0);
	$date_published = date("Y-m-d H:i:s");
	$category = $request->element('category',0);
	$status = $request->element('status',0);	
	$code_sp = $request->element('code_sp','');
	$avatar_old=$request->element('avatar_old','');
	$delete_avatar=$request->element('delete_avatar','0'); 
	#echo $delete_avatar;
	/**/	
	/**/
	$spmoi= $request->element('spmoi','0');
	$spkhuyenmai = $request->element('spkhuyenmai','0');
	$giasocmoingay = $request->element('giasocmoingay','0');
	#$product_on = $request->element('product_on');
	#$vat_on = $request->element('vat_on');	
	$property=NULL;
	//print_r($property);
	$properties= serialize($property);
	$propertiesItem= $productItem->getProperties();
/*$product_on_old= $propertiesItem['product_on'];
$template->assign("product_on_old",$product_on_old);
$vat_on_old= $propertiesItem['vat_on'];
$template->assign("vat_on_old",$vat_on_old);*/
#$spmoi_old= $propertiesItem['spmoi'];
$spmoi_old= $productItem->getHome();
$template->assign("spmoi_old",$spmoi_old);
$spkhuyenmai_old= $productItem->getPayment();
$template->assign("spkhuyenmai_old",$spkhuyenmai_old);
$giasocmoingay_old= $productItem->getViewed();
$template->assign("giasocmoingay_old",$giasocmoingay_old);

/*$spquantam_old= $productItem->getName("en");
$template->assign("spquantam_old",$spquantam_old);*/

$iconnew_old= $productItem->getDetails("en");
$template->assign("iconnew_old",$iconnew_old);
$iconhot_old= $productItem->getNSX("en");
$template->assign("iconhot_old",$iconhot_old);

	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
			$upload = new Upload($files);
			if($files['tmp_name']){
				/* xoa hinh cu upload hinh moi*/
				unlink(ROOT_PATH."gallery/avatar_upload/products/storage/".$avatar_old);
				unlink(ROOT_PATH."gallery/avatar_upload/products/thumb/".$avatar_old);
				unlink(ROOT_PATH."gallery/avatar_upload/products/avatar/".$avatar_old);
				unlink(ROOT_PATH."gallery/avatar_upload/products/medium/".$avatar_old);
				$copy = $upload->moveFile($gallery_storage);
				$file_name = $upload->getNameFile();
				if ($upload->isImage($file_name)){
				$copy_1= $upload->resize($gallery_storage,$gallery_avatar,$file_name,$file_name, PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_HEIGHT,0);
				$copy_1= $upload->resize($gallery_storage,$gallery_thumb,$file_name,$file_name, PRO_IMAGE_THUMB_WIDTH,PRO_IMAGE_THUMB_HEIGHT,0);
				$copy_1= $upload->resize($gallery_storage,$gallery_medium,$file_name,$file_name, PRO_IMAGE_MEDIUM_WIDTH,PRO_IMAGE_MEDIUM_HEIGHT,0);				
				}
			}else $file_name = $avatar_old;			
			/*if($delete_avatar=='1')
				{
					echo $delete_avatar;
					$productItem = $product->getObject($Id);			
					unlink(ROOT_PATH."gallery/avatar_upload/products/storage/".$avatar_old);
					unlink(ROOT_PATH."gallery/avatar_upload/products/thumb/".$avatar_old);
					unlink(ROOT_PATH."gallery/avatar_upload/products/avatar/".$avatar_old);
					unlink(ROOT_PATH."gallery/avatar_upload/products/medium/".$avatar_old);
					$file_name=NULL;
				}
			else $file_name = $avatar_old;*/
			/***********upload nhieu hinh anh ************/
			$file = isset($_FILES['files'])?$_FILES['files']:'';
			if($file['name'][0]!=''){
				$photos = array();
				for($i=0;$i<sizeof($file['name']);$i++){
					$array_upload=array('name'=>$file['name'][$i],'type'=>$file['type'][$i],'tmp_name'=>$file['tmp_name'][$i],'error'=>$file['error'][$i],'size'=>$file['size'][$i]);
					//print_r($array_upload);
					$upload1= new Upload($array_upload);
					$upload1->moveFile($gallery_storage);
					$file_name1=$upload1->getNameFile();
					if (isImage($file_name1)){
						$copy_4= $upload1->resize($gallery_storage,$gallery_avatar, $file_name1, $file_name1,PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_HEIGHT,0);
						$copy_4= $upload1->resize($gallery_storage,$gallery_thumb, $file_name1, $file_name1, PRO_IMAGE_THUMB_WIDTH,PRO_IMAGE_THUMB_WIDTH,0);
						$copy_4= $upload1->resize($gallery_storage,$gallery_medium, $file_name1, $file_name1, PRO_IMAGE_MEDIUM_WIDTH,PRO_IMAGE_MEDIUM_WIDTH,0);
					}
					$photos_old[]=$file_name1;
				}
			$photos1=serialize($photos_old);
			}else{
				if(is_null($photos_old)==FALSE)
					$photos1=serialize($photos_old);
				else $photos1=NULL;
			}			
			$slug=removeSign($vn_name);
			/*function ProductInfo($slug, $vn_name, $en_name, $vn_details, $en_details,$vn_nsx,$en_nsx,$vn_nhanhieu, $en_nhanhieu, $price, $s_price, $avatar,$file1, $file2, $file3, $file4, $file5, $position, $date_published, $num_product, $category, $status,$payment, $viewed, $home,$properties, $pId = 0)
	{}*/
			//$slug=TextFilter::urlize($vn_name,false,'-');
		$productInfo = new ProductInfo($slug, $vn_name, $en_name, $vn_details, $en_details,$vn_nsx,$en_nsx,$vn_nhanhieu,$en_nhanhieu,$price, $s_price, $file_name,$photos1, '', '', '', '', $position, $date_published, $num_product, $category, $status,$spkhuyenmai, $giasocmoingay, $spmoi,$properties);
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
						'file2'=>$productInfo->getFile(2),
						'file3'=>$productInfo->getFile(3),
						'file4'=>$productInfo->getFile(4),
						'file5'=>$productInfo->getFile(5),
						#'date_published'=>$productInfo->getDatePublished(),
						'category'=>$productInfo->getCategory(),
						'status'=>$productInfo->getStatus(),
						'viewed'=>$productInfo->getViewed(),
						'num_product'=>$productInfo->getNumProduct(),
						'payment'=>$productInfo->getPayment(),
						'home'=>$productInfo->getHome(),
						'properties'=>$productInfo->setProperties()
						);
			$product->updateData(&$field, $Id);
			
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$templateFile = "managelistproduct.temp.html";
			$template->assign("act",$act);
			$searchStatus = -1;
			$pages = $product->getNumItems('id', "1=1");
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all Ads object and pass to template
			$productItems = $product->getObjects($page,'1=1', array('date_published'=>'DESC'));
			$template->assign("listObjects",$productItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=product&amp;act=list&amp;searchTerms=".$searchTerms."&amp;searchStatus=".$searchStatus."&amp;searchCategory=".$searchCategory."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
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
			
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("vn_name",$vn_name);
			$template->assign("newhot",$en_name);
			$template->assign("en_name",$en_name);
			$template->assign("vn_details",$vn_details);
			$template->assign("en_details",$en_details);
			$template->assign("vn_nsx",$vn_nsx);
			$template->assign("en_nsx",$en_nsx);
			$template->assign("vn_nhanhieu",$vn_nhanhieu);
			$template->assign("en_nhanhieu",$en_nhanhieu);
			$template->assign("price",$price);
			$template->assign("s_price",$s_price);
			$template->assign("home",$home);
			$template->assign("code_sp",$code_sp);
			$template->assign("position",$position);
			$template->assign("category",$category);
			$template->assign("status",$status);
			$template->assign("product",$product);
			$template->assign("pro_cate",$pro_cate);
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
	$act = 'edit';
	$template->assign("act",$act);
	#$templateFile = "managelistproduct.temp.html";
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
//echo 'test';
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
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString("Mã sản phẩm",$request->element('num_product'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	#$infoText .= $validate->validString($amessages['vn_sapo'],$request->element('vn_nsx'));
	#$infoText .= $validate->validString($amessages['en_sapo'],$request->element('en_nsx'));
	#$infoText .= $validate->validString($amessages['vn_nhanhieu'],$request->element('vn_nhanhieu'));
	#$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));
	#$infoText .= $validate->validString($amessages['en_details'],$request->element('en_details'));
	#$infoText .= $validate->validString("Tình trạng",$request->element('vn_nsx'));
	#$infoText .= $validate->validString("Bảo hành",$request->element('en_nsx'));
	#$infoText .= $validate->validString($amessages['price'],$request->element('price'));
	#$infoText .= $validate->validCheckType($amessages['avatar'],$upload->checkType());
	return $infoText;
}
?>