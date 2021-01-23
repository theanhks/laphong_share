<?php
/*************************************************************************
List users
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                
Last updated: 29/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/email.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = 'adminlistcontact.temp.html';
$email = new SaveEmail();
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$infoText = '';
$infoClass = 'infoText';

# Read parameters from request
$plus = $request->element('plus','');
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$page = $request->element('page',1);
$eId = $request->element('eId');
$date_created = date("Y-m-d H:i:s");
$orderBy = $request->element('orderBy','id');
$orderDir = $request->element('orderDir','ASC');

# Control plus action
switch ($plus) {
	case 'deleteItem':
		$oId = $request->element('oId');
		if($oId) {
			$email->update(array('status' => 2), "id = '$oId'");
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
			$email->update(array('status' => 2), "id IN (".join(',',$oIds).")");
			$infoText = $amessages['item_delete_ok'];
			$infoClass = "infoText";
		} else {
			$infoText = $amessages['delete_error_no_item'];
			$infoClass = "errorText";
		}
		break;		
	case 'cleanTrash':
		$users->delete("status = '2'");
		$infoText = $amessages['clean_trash_ok'];
		$infoClass = "infoText";
		break;
}

# Build search condition
$searchCond = "status=1";			# For other cases, you can set this to "(1>0)"
if($searchStatus != '-1') $searchCond .= " AND status = '$searchStatus'";
if($searchTerms) $searchCond .= " AND (`to` LIKE '%".$searchTerms."%' OR subject LIKE '%".$searchTerms."%' OR cc LIKE '%".$searchTerms."%' OR id ='".$searchTerms."')";

# Get number of rows, pages
$pages = $email->getNumItems('id', $searchCond, $items_per_pages);
$rows = $pages['rows'];
$pages = $pages['pages'];
if($page > $pages) $page = $pages;

# Generate and pass link pager to template
$listPage = linkPager(ADMIN_SCRIPT."?op=admin&part=mail&act=list&amp;searchTerms=".$searchTerms."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
$template->assign("adminPager",$listPage);

# Get all categories object and pass to template
$emailItems = $email->getObjects($page, $searchCond, array($orderBy => $orderDir), $items_per_pages);
$template->assign("listObjects",$emailItems);

# Generate status combobox for Search form
$listStatus = optionStatus($searchStatus);
$template->assign("listStatus",$listStatus);

# Pass some variables to template
$template->assign("searchTerms",$searchTerms);
$template->assign("searchStatus",$searchStatus);
$template->assign("rows",$rows);
$template->assign("page",$page);
$template->assign("start",($page - 1) * $items_per_pages);
$template->assign("pages",$pages);
$template->assign("eId",$eId);
$template->assign("orderBy",$orderBy);
$template->assign("orderDir",$orderDir);
$template->assign("infoText",$infoText);
$template->assign("infoClass",$infoClass);
$template->assign("email",$email);
?>