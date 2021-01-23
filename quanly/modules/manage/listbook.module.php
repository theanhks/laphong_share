<?php
/*************************************************************************
List members
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd
Name: Nguyen Anh Ngoc
Last updated: 27/10/2009
 **************************************************************************/
include_once(ROOT_PATH.'classes/dao/book.class.php');
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = 'managelistbook.temp.html';
$book = new Book();
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$infoText = '';
$infoClass = 'infoText';

# Read parameters from request
$plus = $request->element('plus','');
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$page = $request->element('page',1);
$uId = $request->element('uId');
$date_created = date("Y-m-d H:i:s");
$orderBy = $request->element('orderBy','id');
$orderDir = $request->element('orderDir','ASC');

# Control plus action
switch ($plus) {
    case 'deleteItem':
        $oId = $request->element('oId');
        if($oId) {
            $book->update(array('status' => 2), "id = '$oId'");
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
            $book->update(array('status' => 2), "id IN (".join(',',$oIds).")");
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
            $book->update(array('status' => 1), "id = '$oId'");
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
            $book->update(array('status' => 1), "id IN (".join(',',$oIds).")");
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
            $book->update(array('status' => 0), "id = '$oId'");
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
            $book->update(array('status' => 0), "id IN (".join(',',$oIds).")");
            $infoText = $amessages['item_disable_ok'];
            $infoClass = "infoText";
        } else {
            $infoText = $amessages['disable_error_no_item'];
            $infoClass = "errorText";
        }
        break;

    case 'cleanTrash':
        $book->delete("status = '2'");
        $infoText = $amessages['clean_trash_ok'];
        $infoClass = "infoText";
        break;
}
# Build search condition
$searchCond = "1=1";			# For other cases, you can set this to "(1>0)"
if($searchStatus != '-1') $searchCond .= " AND status = '$searchStatus'";

if($searchTerms) $searchCond .= " AND (name LIKE '%".$searchTerms."%' OR email LIKE '%".$searchTerms."%' OR id LIKE '%".$searchTerms."%' OR tel LIKE '%".$searchTerms."%')";

# Get number of rows, pages
$pages = $book->getNumItems('id', $searchCond, $items_per_pages);
$rows = $pages['rows'];
$pages = $pages['pages'];
if($page > $pages) $page = $pages;
# Get all categories object and pass to template
$bookItems = $book->getObjects($page, $searchCond, array($orderBy => $orderDir), $items_per_pages);
$template->assign("listObjects",$bookItems);

# Generate and pass link pager to template
$listPage = linkPager(ADMIN_SCRIPT."?op=manage&part=book&act=list&amp;searchTerms=".$searchTerms."&amp;status=".$searchStatus."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
$template->assign("adminPager",$listPage);

# Generate status combobox for Search form
$listStatus = optionStatus($searchStatus);
$template->assign("listStatus",$listStatus);

# Pass some variables to template
$template->assign("searchTerms",$searchTerms);
$template->assign("searchStatus",$searchStatus);
$template->assign("rows",$rows);
$template->assign("start",($page - 1) * $items_per_pages);
$template->assign("page",$page);
$template->assign("pages",$pages);
$template->assign("uId",$uId);
$template->assign("orderBy",$orderBy);
$template->assign("orderDir",$orderDir);
$template->assign("infoText",$infoText);
$template->assign("infoClass",$infoClass);
//$template->assign("book",$book);

?>