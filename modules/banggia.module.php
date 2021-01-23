<?php
$templateFile = "test.tpl.html";
include_once(ROOT_PATH."classes/dao/resources.class.php");
$Resource = new Resource();
$banggiaItems = $Resource->getObjects(1,'status=1 AND aid=1', array('date_created'=>'DESC'),1);
foreach ($banggiaItems as $banggiaItem) {
	$filename=$banggiaItem->getFileName();
    $url=ROOTPATH."/gallery/album/storage/".$filename;
}
if($banggiaItems){
header("Location: $url");}
else{	
	echo "Chưa có bảng giá";	
}
?>