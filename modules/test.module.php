<?php
error_reporting(0);
ini_set('display_errors','-1'); ini_set('display_startup_errors','-1');
$templateFile = "test.tpl.html";
include_once(ROOT_PATH.'/includes/functions.php');
include_once(ROOT_PATH . 'classes/dao/procategories.class.php');
include_once(ROOT_PATH."classes/dao/products.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
$products = new Products();
$procategories = new ProductCategories();
$upload = new Upload(' ');

$gallery_upload = ROOT_PATH."gallery/avatar_upload/products/";
$gallery_storage = $gallery_upload."storage/";
$gallery_medium = $gallery_upload."medium/";
$gallery_avatar = $gallery_upload."avatar/";
$gallery_thumb = $gallery_upload."thumb/";
#$entries->update(array('status' => 1), "id = '$oId'");
$entriesItems  = $products->getObjects(1, '1=1', array( 'position' => 'ASC'), 0);
#print_r($entriesItems);
/*$sql ="SELECT * from `n_productpic_host`";
$result=mysql_query($sql);
while ($row = mysql_fetch_array($result)) {
    #echo $row['productpicid'];
    $id=$row['productid'];
    $avatar=$row['productpicname'];
	$products->update(array('avatar'=>$avatar), "id = '$id'");
}*/
foreach ($entriesItems as $entriesItem) {
    $id      = $entriesItem->getId();
    #$vn_name = $entriesItem->getName("vn");
    #$vn_sapo=$entriesItem->getSapo("vn");
    #$vn_details=$entriesItem->getDetails("vn");
    #$slug    = removeSign($vn_name);
    echo $vn_name.'<br>';
	$file_name=$entriesItem->getAvatar();
	$upload->resize($gallery_storage,$gallery_avatar,$file_name,$file_name, PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_HEIGHT,0);
	$upload->resize($gallery_storage,$gallery_thumb,$file_name,$file_name, PRO_IMAGE_THUMB_WIDTH,PRO_IMAGE_THUMB_HEIGHT,0);
	$upload->resize($gallery_storage,$gallery_medium,$file_name,$file_name, PRO_IMAGE_MEDIUM_WIDTH,PRO_IMAGE_MEDIUM_HEIGHT,0);
	#$date=date('Y-m-d H:i:s', $entriesItem->getDatePublished());
   # $products->update(array('en_name' => $vn_name,'slug' => $slug,'date_published'=>$date,'price'=>0,'s_price'=>0), "id = '$id'");
}
?>