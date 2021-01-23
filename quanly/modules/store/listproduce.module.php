<?php
/*************************************************************************
List categories
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen
Last updated: 04/12/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/storecountries.class.php');
include_once(ROOT_PATH.'classes/dao/storeproduction.class.php');
include_once(ROOT_PATH.'classes/dao/storeproduceinfo.class.php');
include_once(ROOT_PATH.'classes/dao/storeproduces.class.php');
include_once(ROOT_PATH.'classes/dao/storecategories.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = 'storelistproduce.temp.html';
$storecategory = new storeCate();
$countries = new Countries();
$production = new Production();
$product = new Products();
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$infoText = '';
$infoClass = 'infoText';

# Read parameters from request
$plus = $request->element('plus','');
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$searchCountry = $request->element('searchCountry','-1');
$searchCategory = $request->element('searchCategory','-1');
$searchProduction = $request->element('searchProduction','-1');
$page = $request->element('page',1);
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');

# Control plus action
switch ($plus) {
	case 'deleteItem':
		$oId = $request->element('oId');
		if($oId) {
			$product->update(array('status' => 2), "id = '$oId'");
			$infoText = $amessages['item_delete_ok'];
			$infoClass = "infoText";
		} else {
			$error = $amessages['delete_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'deleteItems':
		$oIds = $request->element('oIds');
		if($oIds) {
			$product->update(array('status' => 2), "id IN (".join(',',$oIds).")");
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
			$product->update(array('status' => 1), "id = '$oId'");
			$infoText = $amessages['item_activate_ok'];
			$infoClass = "infoText";
		} else {
			$error = $amessages['activate_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'activateItems':
		$oIds = $request->element('oIds');
		if($oIds) {		
			$product->update(array('status' => 1), "id IN (".join(',',$oIds).")");
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
			$product->update(array('status' => 0), "id = '$oId'");
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
			$product->update(array('status' => 0), "id IN (".join(',',$oIds).")");
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
		if($product->up($oId, $position)) {
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
		if($product->down($oId, $position)) {
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
		if($product->changePosition($oId, $position)) {
			$infoText = $amessages['item_change_position_ok'];
			$infoClass = "infoText";						
		} else {
			$infoText = $amessages['item_change_position_error'];
			$infoClass = "errorText";
		}
		break;
	case 'cleanTrash':
		$product->delete("status = '2'");
		$infoText = $amessages['clean_trash_ok'];
		$infoClass = "infoText";
		break;
}

# Build search condition
$searchCond = "1=1";			# For other cases, you can set this to "(1>0)"
if($searchStatus != '-1') $searchCond .= " AND status = '$searchStatus'";
if($searchTerms) $searchCond .= " AND (vn_name LIKE '%".$searchTerms."%' OR en_name LIKE '%".$searchTerms."%' OR slug LIKE '%".$searchTerms."%' OR id = '".$searchTerms."')";
if($searchCategory != '-1') $searchCond .= " AND category = '$searchCategory'";
if($searchCountry != '-1') $searchCond .= " AND country = '$searchCountry'";
if($searchProduction != '-1') $searchCond .= " AND production = '$searchProduction'";
# Get number of rows, pages
$pages = $product->getNumItems('id', $searchCond, $items_per_pages);
$rows = $pages['rows'];
$pages = $pages['pages'];
if($page > $pages) $page = $pages;

# Get all categories object and pass to template
$productItems = $product->getObjects($page, $searchCond, array($orderBy => $orderDir), $items_per_pages);
$template->assign("listObjects",$productItems);

# Generate and pass link pager to template
$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=product&amp;act=list&amp;searchTerms=".$searchTerms."&amp;status=".$searchStatus."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
$template->assign("adminPager",$listPage);

# Generate status combobox for Search form
$listStatus = optionStatus($searchStatus);
$template->assign("listStatus",$listStatus);

$listCountry = $countries->comboListObjects('id','vn_name', $searchCountry);
$template->assign("listCountry",$listCountry);

$listProduction = $production->comboListObjects('id','vn_name', $searchProduction);
$template->assign("listProduction",$listProduction);

$listCategory = $storecategory->comboListObjects('id','vn_name', $searchCategory);
$template->assign("listCategory",$listCategory);

# Pass some variables to template
$template->assign("searchTerms",$searchTerms);
$template->assign("searchStatus",$searchStatus);
$template->assign("rows",$rows);
$template->assign("start",($page - 1) * $items_per_pages);
$template->assign("page",$page);
$template->assign("pages",$pages);
$template->assign("orderBy",$orderBy);
$template->assign("orderDir",$orderDir);
$template->assign("infoText",$infoText);
$template->assign("infoClass",$infoClass);
$template->assign("product",$product);
$template->assign("countries",$countries);
#$template->assign("storecategory",$storecategory);
$template->assign("production",$production);
?>