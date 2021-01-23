<?php
/*************************************************************************
List support
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                   
Last updated: 27/11/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/parts.class.php');
include_once(ROOT_PATH.'classes/dao/support.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = 'managelistsupport.temp.html';
$parts = new Parts();
$support = new Support();
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$infoText = '';
$infoClass = 'infoText';

# Read parameters from request
$plus = $request->element('plus','');
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$searchParts = $request->element('searchParts','-1');

$page = $request->element('page',1);
$pId = $request->element('pId');
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');

# Control plus action
switch ($plus) {
	case 'deleteItem':
		$oId = $request->element('oId');
		if($oId) {
			$support->update(array('status' => 2), "id = '$oId'");
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
			$support->update(array('status' => 2), "id IN (".join(',',$oIds).")");
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
			$support->update(array('status' => 1), "id = '$oId'");
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
			$support->update(array('status' => 1), "id IN (".join(',',$oIds).")");
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
			$support->update(array('status' => 0), "id = '$oId'");
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
			$support->update(array('status' => 0), "id IN (".join(',',$oIds).")");
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
		if($support->up($oId, $position)) {
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
		if($support->down($oId, $position)) {
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
		if($support->changePosition($oId, $position)) {
			$infoText = $amessages['item_change_position_ok'];
			$infoClass = "infoText";						
		} else {
			$infoText = $amessages['item_change_position_error'];
			$infoClass = "errorText";
		}
		break;
	case 'cleanTrash':
		$support->delete("status = '2'");
		$infoText = $amessages['clean_trash_ok'];
		$infoClass = "infoText";
		break;
}

# Build search condition
$searchCond = "1>0 and status = 1";			# For other cases, you can set this to "(1>0)"
if($searchStatus != '-1') $searchCond .= " AND status = '$searchStatus'";
if($searchParts != '-1') $searchCond .= " AND paid = '$searchParts'";
if($searchTerms) $searchCond .= " AND (fullname LIKE '%".$searchTerms."%' OR telephone LIKE '".$searchTerms."' OR cellphone LIKE '".$searchTerms."' OR id = '".$searchTerms."' OR nick_yahoo = '%".$searchTerms."%'  OR nick_skype = '%".$searchTerms."%')";

# Get number of rows, pages
$pages = $support->getNumItems('id', $searchCond, $items_per_pages);
$rows = $pages['rows'];
$pages = $pages['pages'];
if($page > $pages) $page = $pages;

# Get all categories object and pass to template
$supportItems = $support->getObjects($page, $searchCond, array($orderBy => $orderDir), $items_per_pages);
$template->assign("listObjects",$supportItems);

# Generate and pass link pager to template
$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=support&amp;act=list&amp;searchTerms=".$searchTerms."&amp;status=".$searchStatus."&amp;searchParts=".$searchParts."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
$template->assign("adminPager",$listPage);

# Generate status combobox for Search form
$listStatus = optionStatus($searchStatus);
$template->assign("listStatus",$listStatus);
	
# Pass some variables to template
$template->assign("searchTerms",$searchTerms);
$template->assign("searchStatus",$searchStatus);
$template->assign("searchParts",$searchParts);
$template->assign("rows",$rows);
$template->assign("start",($page - 1) * $items_per_pages);
$template->assign("page",$page);
$template->assign("parts",$parts);
$template->assign("pages",$pages);
$template->assign("pId",$pId);
$template->assign("orderBy",$orderBy);
$template->assign("orderDir",$orderDir);
$template->assign("infoText",$infoText);
$template->assign("infoClass",$infoClass);
$template->assign("support",$support);
?>