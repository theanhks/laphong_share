<?php
/*************************************************************************
List categories
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen
Last updated: 10/10/2009
**************************************************************************/

include_once(ROOT_PATH.'classes/dao/resources.class.php');
include_once(ROOT_PATH.'classes/dao/galleries.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = 'managelistalbumresource.temp.html';
$resource = new Resource();

$items_per_row = 5;
$infoText = '';
$infoClass = 'infoText';

$album= new Gallery();

# Read parameters from request
$searchAlbum = $request->element('searchAlbum');
$page = $request->element('page',1);
$pId = $request->element('pId','');
if(!$pId) $pId = $searchAlbum;
$count_album = $album ->countAlbum($pId);
$oitems_per_page = $items_per_row;
# Build search condition
$searchCond = "1=1";

# Get all gallery object and pass to template
if (!$page) $page =1;

# Get number of rows, pages
if(!$page || $page==1) {
	$items_per_row = $oitems_per_page - $count_album;
	if($pId!=0)
		$pages = $resource->getNumItems('id', "aid='$pId' and status=1",$items_per_row);
	else
		$pages = $album->getNumItems('id', "pid='$pId'",$oitems_per_row);
}else {
	$items_per_row = $oitems_per_page;
	if($pId!=0)
		$pages = $resource->getNumItems('id', "aid='$pId' and status=1",$items_per_row-$count_album);
	else
		$pages = $album->getNumItems('id', "pid='$pId'",$items_per_row);
}
$rows = $pages['rows'];
$pages = $pages['pages'];
if(!$pages) $pages=1;
if($page > $pages) $page = $pages;

#get album child
$albumItems = $album->getObjects($page,"pid=$pId");
$template->assign("albumItems",$albumItems);
$resourceItems = $resource->getObjects($page, "aid=$pId", '', $items_per_row, $count_album);
$template->assign("listObjects",$resourceItems);

if($pId!=0){
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=albumresource&amp;act=list&amp;pId=$pId&amp;page=%s",$pages,$page);
	$template->assign("adminPager",$listPage);
}else{
	# Generate and pass link pager to template
	$listPage1 = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=album&amp;act=list&amp;page=%s",$pages,$page); 
	$template->assign("adminPager1",$listPage1);
}

# Generate Album combobox for Search form
$listAlbum = $album->optionAllGallery('id','vn_name','1=1');
$template->assign("listAlbum",$listAlbum);

# Pass some variables to template
$template->assign("rows",$rows);
$template->assign("page",$page);
$template->assign("pages",$pages);
$template->assign("pId",$pId);
$template->assign("infoText",$infoText);
$template->assign("infoClass",$infoClass);
$template->assign("resource",$resource);
$template->assign("album",$album);
$template->assign("searchAlbum",$searchAlbum);
?>