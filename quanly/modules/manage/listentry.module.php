<?php

/*************************************************************************
List entries
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen
Last updated: 10/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/entries.class.php');
include_once(ROOT_PATH.'classes/dao/categories.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = 'managelistentry.temp.html';
$entries = new Entries();
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$infoText = '';
$infoClass = 'infoText';

# Read parameters from request
$plus = $request->element('plus','');
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$searchLang = $request->element('searchLang','-1');

$page = $request->element('page',1);
$cId = $request->element('cId');
$searchCategory = $request->element('searchCategory','-1');
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');
# Control plus action
switch ($plus) {
	case 'deleteItem':
		$oId = $request->element('oId');
		if($oId) {
			$entries->update(array('status' => 2), "id = '$oId'");
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
			$entries->update(array('status' => 2), "id IN (".join(',',$oIds).")");
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
			$entries->update(array('status' => 1), "id = '$oId'");
			$infoText = $amessages['item_activate_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['activate_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'activateHome':
		$oId = $request->element('oId');
		if($oId) {
			$entries->update(array('home' => 1), "id = '$oId'");
			$infoText = $amessages['item_activate_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['activate_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'activatePopup':
		$oId = $request->element('oId');
		$lang = $request->element('lang');
		if($oId) {
			$entries->update(array('popup' => 1), "id = '$oId'");
			$entries->update(array('popup' => 0), "id != '$oId' and lang='$lang'");
			$infoText = $amessages['item_activate_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['activate_error_no_item'];
			$infoClass = "errorText";
		}
		break;	
	case 'deleteHome':
		$oId = $request->element('oId');
		if($oId) {
			$entries->update(array('home' => 0), "id = '$oId'");
			$infoText = $amessages['item_activate_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['activate_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'deletePopup':
		$oId = $request->element('oId');
		if($oId) {
			$entries->update(array('popup' => 0), "id = '$oId'");
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
			$entries->update(array('status' => 1), "id IN (".join(',',$oIds).")");
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
			$entries->update(array('status' => 0), "id = '$oId'");
			$infoText = $amessages['item_disable_ok'];
			$infoClass = "infoText";
		} else {
			$error = $amessages['disable_error_no_item'];
			$infoClass = "errorText";
		}
		break;
	case 'disableItems':
		$oIds = $request->element('oIds');
		if($oIds) {		
			$entries->update(array('status' => 0), "id IN (".join(',',$oIds).")");
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
		if($entries->up($oId, $position)) {
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
		if($entries->down($oId, $position)) {
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
		if($entries->changePosition($oId, $position)) {
			$infoText = $amessages['item_change_position_ok'];
			$infoClass = "infoText";						
		} else {
			$infoText = $amessages['item_change_position_error'];
			$infoClass = "errorText";
		}
		break;
	case 'cleanTrash':
		$entries->cleanTrash();
		$infoText = $amessages['clean_trash_ok'];
		$infoClass = "infoText";
		break;
}
# Build search condition
$searchCond = "1=1 and status <> 0";			# For other cases, you can set this to "(1>0)"
if($searchStatus != '-1') $searchCond .= " AND status = '$searchStatus'";
if($searchLang != '-1') $searchCond .= " AND lang = '$searchLang'";
if($searchCategory != '-1') {
	$categories= new Categories();
	$subcat = $categories->getSubCategory1($searchCategory);
	$searchCond .= " AND cid in($subcat)";}
if($searchTerms) $searchCond .= " AND (vn_name LIKE '%".$searchTerms."%' OR en_name LIKE '%".$searchTerms."%' )";
# Get number of rows, pages
$pages = $entries->getNumItems('id', $searchCond, $items_per_pages);
$rows = $pages['rows'];
$pages = $pages['pages'];
if($page > $pages) $page = $pages;

# Get all entries object and pass to template
$entryItems = $entries->getObjects($page, $searchCond, array('date_created'=>'DESC'), $items_per_pages);
$template->assign("listObjects",$entryItems);

# Generate and pass link pager to template
$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=entry&amp;act=list&amp;searchTerms=".$searchTerms."&amp;status=".$searchStatus."&amp;searchLang=".$searchLang."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
$template->assign("adminPager",$listPage);

# Generate status combobox for Search form
$listStatus = optionStatus($searchStatus);
$template->assign("listStatus",$listStatus);

# Generate status combobox for Search form
$listLang = optionLang($searchLang);
$template->assign("listLang",$listLang);
# Generate status combobox for Search form
$categories= new Categories();
$listCategories = $categories->optionAllCategories('id','vn_name',$searchCategory);
$template->assign("listCategories",$listCategories);
# Pass some variables to template
$template->assign("searchTerms",$searchTerms);
$template->assign("searchLang",$searchLang);
$template->assign("searchStatus",$searchStatus);
$template->assign("searchCategory",$searchCategory);
$template->assign("rows",$rows);
$template->assign("page",$page);
$template->assign("pages",$pages);
$template->assign("cId",$cId);
$template->assign("orderBy",$orderBy);
$template->assign("orderDir",$orderDir);
$template->assign("infoText",$infoText);
$template->assign("infoClass",$infoClass);
$template->assign("entries",$entries);
$template->assign("categories",$categories);
?>