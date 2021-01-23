<?php
/*************************************************************************
List categories
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: kimque@ava.vn                                   
Last updated: 08/03/2011
**************************************************************************/

include_once(ROOT_PATH."classes/dao/imgproducts.class.php");
include_once(ROOT_PATH.'classes/dao/albumproducts.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = 'managelistimgproduct.temp.html';
$imgproducts = new imgproducts();
$albumproducts = new albumProducts();
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$infoText = '';
$infoClass = 'infoText';

# Read parameters from request
$plus = $request->element('plus','');
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$page = $request->element('page','1');
$searchAlbumimg = $request->element('searchAlbumimg','-1');
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');

# Control plus action
switch ($plus) {
	case 'deleteItem':
		$oId = $request->element('oId');
		if($oId) {
			$imgproducts->update(array('status' => 2), "id = '$oId'");
			$infoText = $amessages['item_delete_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['delete_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'deleteItems':
		$oIds = $request->element('oIds');
		if($oIds) {
			$imgproducts->update(array('status' => 2), "id IN (".join(',',$oIds).")");
			$infoText = $amessages['item_delete_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['delete_error_no_item'];
			$infoClass = "errorText";
		}
		break;		
	case 'activateItem':
		$oId = $request->element('oId');
		if($oId) {
			$imgproducts->update(array('status' => 1), "id = '$oId'");
			$infoText = $amessages['item_activate_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['activate_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'activateItems':
		$oIds = $request->element('oIds');
		if($oIds) {		
			$imgproducts->update(array('status' => 1), "id IN (".join(',',$oIds).")");
			$infoText = $amessages['item_activate_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['activate_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'disableItem':
		$oId = $request->element('oId');
		if($oId) {
			$imgproducts->update(array('status' => 0), "id = '$oId'");
			$infoText = $amessages['item_disable_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['disable_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'disableItems':
		$oIds = $request->element('oIds');
		if($oIds) {		
			$imgproducts->update(array('status' => 0), "id IN (".join(',',$oIds).")");
			$infoText = $amessages['item_disable_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['disable_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'up':
		$oId = $request->element('oId');
		$position = $request->element('position');
		if($imgproducts->up($oId, $position)) {
			$infoText = $amessages['item_up_ok'];
			$infoClass = "infoText";						
		} else {
			$infoText = $amessages['item_up_error'];
			$infoClass = "errorText";
		}
		break;
	case 'down':
		$oId = $request->element('oId');
		$position = $request->element('position');
		if($imgproducts->down($oId, $position)) {
			$infoText = $amessages['item_down_ok'];
			$infoClass = "infoText";						
		} else {
			$infoText = $amessages['item_down_error'];
			$infoClass = "errorText";
		}
		break;
	case 'changePosition':
		$oId = $request->element('oId');
		$position = $request->element('position');
		if($imgproducts->changePosition($oId, $position)) {
			$infoText = $amessages['item_change_position_ok'];
			$infoClass = "infoText";						
		} else {
			$infoText = $amessages['item_change_position_error'];
			$infoClass = "errorText";
		}
		break;
	case 'cleanTrash':
		$imgproducts->cleanTrash();
		$infoText = $amessages['clean_trash_ok'];
		$infoClass = "infoText";
		break;
}

# Generate Group Ads combobox for Search form
/*$listProducts = $products->comboListObjects('id','vn_name',$searchGroupAds);
$template->assign("listProducts",$listProducts);*/
# Build search condition
$searchCond = "1=1";			# For other cases, you can set this to "(1>0)"
if($searchStatus != '-1') $searchCond .= " AND status = '$searchStatus'";
if($searchTerms) $searchCond .= " AND (vn_name LIKE '%".$searchTerms."%' OR en_name LIKE '%".$searchTerms."%')";
if($searchAlbumimg!= '-1') $searchCond .= " AND (idalpro='$searchAlbumimg')";
# Get number of rows, pages
$pages = $imgproducts->getNumItems('id', $searchCond, $items_per_pages);
$rows = $pages['rows'];
$pages = $pages['pages'];
if($page > $pages) $page = $pages;

# Get all categories object and pass to template
$adsItems = $imgproducts->getObjects($page, $searchCond, '', $items_per_pages);
$template->assign("listObjects",$adsItems);
# Generate and pass link pager to template
$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=imgproduct&amp;act=list&amp;searchTerms=".$searchTerms."&amp;status=".$searchStatus."&amp;searchGroupAds=".$searchAlbumimg."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
$template->assign("adminPager",$listPage);

# Generate status combobox for Search form
$listStatus = optionStatus($searchStatus);
$template->assign("listStatus",$listStatus);
$listAlbumpro = $albumproducts->comboListObjects();
$template->assign("listAlbumpro",$listAlbumpro);
# Pass some variables to template
$template->assign("searchTerms",$searchTerms);
$template->assign("searchStatus",$searchStatus);
$template->assign("rows",$rows);
$template->assign("start",($page - 1) * $items_per_pages);
$template->assign("page",$page);
$template->assign("pages",$pages);
$template->assign("searchAlbumimg",$searchAlbumimg);
$template->assign("orderBy",$orderBy);
$template->assign("orderDir",$orderDir);
$template->assign("infoText",$infoText);
$template->assign("infoClass",$infoClass);
$template->assign("imgproducts",$imgproducts);
$template->assign("albumproducts",$albumproducts);

?>