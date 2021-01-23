<?php
/*************************************************************************
List album
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen                                    
Last updated: 07/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/galleries.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = 'managelistalbum.temp.html';
$gallery = new Gallery();
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$infoText = '';
$infoClass = 'infoText';

# Read parameters from request
$page = $request->element('page',1);
$pId = $request->element('searchAlbum');
# Build search condition
$searchCond = "pid='$pId'";			# For other cases, you can set this to "(1>0)"

# Get number of rows, pages
$pages = $gallery->getNumItems('id', $searchCond, $items_per_pages);
$rows = $pages['rows'];
$pages = $pages['pages'];
if($page > $pages) $page = $pages;

# Get all gallery object and pass to template
$galleryItems = $gallery->getObjects($page, $searchCond,'', $items_per_pages);
$template->assign("listObjects",$galleryItems);

# Generate and pass link pager to template
$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=album&amp;act=list",$pages,$page);
$template->assign("adminPager",$listPage);

# Generate status combobox for Search form
$listGallery = $gallery->optionAllGallery('id','vn_name','1=1');
$template->assign("listGallery",$listGallery);

# Pass some variables to template
$template->assign("rows",$rows);
$template->assign("start",($page - 1) * $items_per_pages);
$template->assign("page",$page);
$template->assign("pages",$pages);
$template->assign("pId",$pId);
$template->assign("infoText",$infoText);
$template->assign("infoClass",$infoClass);
$template->assign("gallery",$gallery);
?>