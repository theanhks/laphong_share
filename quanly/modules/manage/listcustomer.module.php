<?php

/*************************************************************************
List entries
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
 ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH.'classes/dao/customers.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = 'managelistcustomer.temp.html';
$customers = new Customers();
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$infoText = '';
$infoClass = 'infoText';

# Read parameters from request
$plus = $request->element('plus','');
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$page = $request->element('page',1);
$export_email = $request->element('export_email','-1');
$orderBy = $request->element('orderBy','id');
$orderDir = $request->element('orderDir','DESC');
# Control plus action
switch ($plus) {
	case 'deleteItem':
		$oId = $request->element('oId');
		if($oId) {
			$customers->update(array('status' => 2), "id = '$oId'");
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
			$customers->update(array('status' => 2), "id IN (".join(',',$oIds).")");
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
			$customers->update(array('status' => 1), "id = '$oId'");
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
			$customers->update(array('status' => 1), "id IN (".join(',',$oIds).")");
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
			$customers->update(array('status' => 0), "id = '$oId'");
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
			$customers->update(array('status' => 0), "id IN (".join(',',$oIds).")");
			$infoText = $amessages['item_disable_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['disable_error_no_item'];
			$infoClass = "errorText";
		}
	break;
	case 'cleanTrash':
		$customers->cleanTrash();
		$infoText = $amessages['clean_trash_ok'];
		$infoClass = "infoText";
		break;
}
# Build search condition
$searchCond = "1>0";			# For other cases, you can set this to "(1>0)"
if($searchStatus != '-1') $searchCond .= " AND status = '$searchStatus'";
if($export_email != '-1'){
$searchCond1 = "status=1 AND gcId = '$export_email'";
$emailItems = $customers->getObjects($page, $searchCond1, array($orderBy => $orderDir), '');
$template->assign("emailItems",$emailItems);
}
if($searchTerms) $searchCond .= " AND (name LIKE '%".$searchTerms."%' OR address LIKE '%".$searchTerms."%' )";
# Get number of rows, pages
$pages = $customers->getNumItems('id', $searchCond, $items_per_pages);
$rows = $pages['rows'];
$pages = $pages['pages'];
if($page > $pages) $page = $pages;

# Get all entries object and pass to template
$entryItems = $customers->getObjects($page, $searchCond, array($orderBy => $orderDir), $items_per_pages);
$template->assign("listObjects",$entryItems);

# Generate and pass link pager to template
$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=customer&amp;act=list&amp;searchTerms=".$searchTerms."&amp;status=".$searchStatus."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
$template->assign("adminPager",$listPage);

# Generate status combobox for Search form
$listStatus = optionStatus($searchStatus);
$template->assign("listStatus",$listStatus);
# Generate status combobox for Search form
# Pass some variables to template
$template->assign("searchTerms",$searchTerms);
$template->assign("searchStatus",$searchStatus);
$template->assign("rows",$rows);
$template->assign("page",$page);
$template->assign("pages",$pages);
$template->assign("orderBy",$orderBy);
$template->assign("orderDir",$orderDir);
$template->assign("infoText",$infoText);
$template->assign("infoClass",$infoClass);
$template->assign("customers",$customers);
?>