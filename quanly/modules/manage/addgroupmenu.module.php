<?php
/*************************************************************************
Modudel Add Group
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 12/10/2009
**************************************************************************/

include_once(ROOT_PATH.'classes/data/textfilter.class.php');
include_once(ROOT_PATH.'classes/dao/menusgroup.class.php');
include_once(ROOT_PATH.'classes/dao/menugroupinfo.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = 'manageaddgroupmenu.temp.html';
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$menugroup = new MenusGroup();

$infoClass = 'infoText';

$orderBy = $request->element('orderBy','id');
$orderDir = $request->element('orderDir','ASC');
$page = $request->element('page',1);
$vn_name = $request->element('vn_name','');
//$en_name = $request->element('en_name','');
$status = $request->element('status',-1);

if($_POST) {
	include_once(ROOT_PATH.'classes/data/validate.class.php');
	# Validation
	$validate = validateData($request);
	if($validate == '') {
		
		$menu = new MenuGroupInfo($vn_name,"", $status);
		$fields = array('vn_name'=>$menu->getName('vn'), 'en_name'=>$menu->getName('en'), 'status'=>$menu->getStatus());
		$rs = $menugroup->addObjects(&$fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		$act = 'list';
		$template->assign("act",$act);
		$templateFile = 'managelistgroupmenu.temp.html';
		$pages = $menugroup->getNumItems('id', '1=1', $items_per_pages);
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=menu&amp;act=listGroup&amp;page=%s",$pages,$page);
		
		$menuItems = $menugroup->getObjects($page,'1=1', array($orderBy => $orderDir));
		
		$template->assign('listObjects',$menuItems);
		$template->assign('adminPager',$listPage);
		$template->assign('listObjects',$menuItems);
		$template->assign('menugroup',$menugroup);
		$template->assign('rows',$rows);
		$template->assign('start',($page - 1) * $items_per_pages);
		$template->assign('page',$page);
		$template->assign('pages',$pages);
	}else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
		$infoClass = 'errorText';	
		$template->assign('infoText',$infoText);
		$template->assign('infoClass',$infoClass);
		$template->assign('vn_name',$vn_name);
		//$template->assign('en_name',$en_name);
		$template->assign('status',$status);
	}
}
$listStatus = optionStatus($status,DEFAULT_ADMIN_LANGUAGE);
$template->assign('listStatus',$listStatus);

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	//$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	return $infoText;
}
?>