<?php
/*************************************************************************
Module Menu
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 9/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/menus.class.php');
include_once(ROOT_PATH.'classes/dao/menuinfo.class.php');
include_once(ROOT_PATH.'classes/data/textfilter.class.php');
include_once(ROOT_PATH.'classes/dao/menusgroup.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = 'manageaddmenu.temp.html';
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$menus = new Menus();
$menugroup = new MenusGroup();
$infoClass = 'infoText';

$pId = $request->element('pId','');
$mgid = $request->element('mgid','');
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
$vn_url = $request->element('vn_url','');
$en_url = $request->element('en_url','');
$position = $request->element('position','');
$addslug = $request->element('slug','');
$status = $request->element('status');
$page = $request->element('page',1);
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');
$searchMenuGroup= $request->element('searchMenuGroup','-1');
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	# Validation
	$validate = validateData($request);
	if($validate == '') {
		$slug=TextFilter::urlize($vn_name,false,'-');
		$menu = new MenuInfo($pId, $mgid, $slug, $vn_name, $en_name, $vn_url, $en_url, $status, $position);
		$fields = array('pid'=>$menu->getPId(), 'mgid'=>$menu->getGroup(), 'slug'=>$menu->getSlug(), 'vn_name'=>$menu->getName('vn'), 'en_name'=>$menu->getName('en'), 'vn_url'=>$menu->getURL('vn'), 'en_url'=>$menu->getURL('en'), 'status'=>$menu->getStatus(),'position'=>$menu->getPosition());
		$m = $menus->addObjects(&$fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = 'InfoText';
		$act = 'list';
		$template->assign("act",$act);
		$templateFile = 'managelistmenu.temp.html';
		$pages = $menus->getNumItems('id', "pid='$pId'");
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=menu&amp;act=list&amp;page=%s",$pages,$page);		
		$menuItems = $menus->getObjects($page,"pid='$pId'", array($orderBy => $orderDir));
		
		$template->assign('listObjects',$menuItems);
		$template->assign('adminPager',$listPage);
		$template->assign('listObjects',$menuItems);
		$template->assign('menus',$menus);
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
		$template->assign('en_name',$en_name);
		$template->assign('mgid',$mgid);
		$template->assign('vn_url',$vn_url);
		$template->assign('en_url',$en_url);
		$template->assign('position',$position);
		$template->assign('status',$status);
		$template->assign('slug',$addslug);
	}
}
$listStatus = optionStatus($request->element('searchStatus','-1'));
$template->assign("listStatus",$listStatus);
$listParentMenu = $menus->optionAllMenus('id','vn_name',$searchMenuGroup);
$template->assign("listParentMenu",$listParentMenu);
$listMenus = $menugroup->comboListObjects('id','vn_name',$mgid);
$template->assign("listMenus",$listMenus);
$template->assign('menugroup',$menugroup);

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));	
	$infoText .= $validate->validStatus($amessages['menugroup'],$request->element('mgid'));
	#$infoText .= $validate->validStatus($amessages['slug'],$request->element('slug'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	$infoText .= $validate->validString($amessages['vn_url'],$request->element('vn_url'));
	#$infoText .= $validate->validString($amessages['en_url'],$request->element('en_url'));
	#$infoText .= $validate->validString($amessages['position'],$request->element('position',0));
	return $infoText;
}
?>