<?php
/*************************************************************************
Add Ads
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/

include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH."classes/dao/albumproducts.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/validate.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH."classes/dao/imgproducts.class.php");
$templateFile = "manageaddimgproduct.temp.html";
$gallery = ROOT_PATH."gallery/avatar_upload/imgproduct/";
$gallery_storage = $gallery."/storage/";
$gallery_avatar = $gallery."/avatar/";
$gallery_medium = $gallery."/medium/";
$gallery_thumb = $gallery."/thumb/";
$imgproducts = new imgProducts();
$products = new Products();
$albumproducts = new albumProducts();
$status = $request->element('status',0);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$album = 1;
$product = 1;
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
$page = $request->element('page',1);
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
if($_POST) {
		# Validation
		$validate = validateData($request);
		if($validate == '') {
		$files = isset($_FILES['file1'])?$_FILES['file1']:'';
			if ($files['tmp_name']!='') {
			$upload = new Upload($files);
			$copy = $upload->moveFile($gallery_storage);
			$file_name = $upload->getNameFile();
			if ($upload->isImage($file_name)){
			$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,120,78);
			$copy_avatar = $upload->resize($gallery_storage,$gallery_medium, $file_name, $file_name,500,300);
			$copy_avatar = $upload->resize($gallery_storage,$gallery_thumb, $file_name, $file_name,150,120);
			}
			}else $file_name='';
			$file1 = $file_name;
			$img = new imgProduct($product,$album, $vn_name, $en_name,$file1, $status);
			$fields = array('idpro'=>$img->getIdPro(),
							'idalpro'=>$img->getIdAlpro(),
							'file1'=>$img->getFile1(),
							'vn_name'=>$img->getName('vn'),
							'en_name'=>$img->getName('en'),
							'status'=>$img->getStatus()
							);
			$imgproducts->addData($fields);
			$infoText = $amessages['item_inserted_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$templateFile = "managelistimgproduct.temp.html";
			$pages = $imgproducts->getNumItems('id');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$adsItems = $imgproducts->getObjects('',"1=1", array('id'=>'ASC'));
			$template->assign("listObjects",$adsItems);	
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=ads&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("rows",$rows);
			$template->assign("pages",$page);
			$template->assign("start",($page - 1) * $items_per_pages);
			$template->assign("searchTerms",$searchTerms);
			$template->assign("searchStatus",$searchStatus);
		}else {
			$infoText = $amessages['item_inserted_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("album",$album);
			$template->assign("product",$product);
			$template->assign("vn_name",$vn_name);
			$template->assign("en_name",$en_name);
			$template->assign("status",$status);
		}
	}
$listStatus = optionStatus($searchStatus ,DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);
$listProducts = $products->comboListObjects();
$template->assign("listProducts",$listProducts);
$listAlbumpro = $albumproducts->comboListObjects();
$template->assign("listAlbumpro",$listAlbumpro);
$template->assign('products',$products);
$template->assign('albumproducts',$albumproducts);
function validateData($request) {
	global $amessages;
	$validate = new Validate();
	$infoText = '';
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	//$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	
	return $infoText;
}
?>