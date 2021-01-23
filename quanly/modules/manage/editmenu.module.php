<?php
/*************************************************************************
Edit Menu module
---------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                   
Last updated: 14/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/menus.class.php");
include_once(ROOT_PATH."classes/dao/menusgroup.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH.'classes/data/textfilter.class.php');
$templateFile = "manageeditmenu.temp.html";
$menus = new Menus();
$mId = $request->element("oId");
$orderBy = $request->element('orderBy','position');
$orderDir = $request->element('orderDir','ASC');
$menugroup = new MenusGroup();

if($mId) {
	#Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);
	
	# Generate parent combobox for Search form
	$listParentMenu = $menus->optionAllMenus('id','vn_name',$request->element('pId'));
	$template->assign("listParentMenu",$listParentMenu);
	
	$listMenu = $menugroup->comboListObjects('id', 'vn_name',$request->element('searchMenuGroup','-1'));
	$template->assign("listMenu",$listMenu);
	
	# Get all entries object and pass to template
	$menuItems = $menus->getObject($mId);
	$template->assign("listObject",$menuItems);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$mgid = $request->element('mgid','');
		$status = $request->element('status','-1');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		$vn_url = $request->element('vn_url','');
		$en_url = $request->element('en_url','');
		$position = $request->element('position','');
		$pId = $request->element('pId');
		$page = $request->element('page',1);
		$slug = $request->element('slug','');
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$slug=TextFilter::urlize($vn_name,false,'-');
			$menu = new MenuInfo($pId,$mgid,$slug,$vn_name,$en_name,$vn_url,$en_url,$status,$position);
			$fields = array('pid'=>$menu->getPId(),
							'mgid'=>$menu->getGroup(),
							'slug'=>$menu->getSlug(),
							'vn_name'=>$menu->getName('vn'),
							'en_name'=>$menu->getName('en'),
							'vn_url'=>$menu->getUrl('vn'),
							'en_url'=>$menu->getUrl('en'),
							'status'=>$menu->getStatus(),
							'position'=>$menu->getPosition()
							);
			$menus->updateObjects($fields, $mId);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			
			$templateFile = "managelistmenu.temp.html";
			$pages = $menus->getNumItems('id','pid=0');
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all entries object and pass to template
			$menusItems = $menus->getObjects($page, "pid='$pId'", array($orderBy => $orderDir));
			$template->assign("listObjects",$menusItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=menu&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("menus",$menus);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
			$template->assign("rows",$rows);
			$template->assign("page",$page);
			$template->assign("pages",$pages);
			$template->assign("menugroup",$menugroup);
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("menus",$menus);
			$template->assign("pId",$pId);
			$template->assign("mgid",$mgid);
			$template->assign("slug",$slug);
			$template->assign("en_name",$en_name);
			$template->assign("vn_name",$vn_name);
			$template->assign("vn_url",$vn_url);
			$template->assign("en_url",$en_url);
			$template->assign("status",$status);
			$template->assign("position",$position);
			$template->assign("menugroup",$menugroup);
		}
	}
}else{
# Thong bao Khong Ton Tai ID Menu
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "errorText";
	$templateFile = "managelistmenu.temp.html";
	$pages = $menus->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
if($page > $pages) $page = $pages;
	# Get all entries object and pass to template
	$menuItems = $menus->getObjects();
	$template->assign("listObjects",$menuItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=menu&amp;act=list&amp;page=%s",$pages,$page);
	$act = 'list';
	$template->assign("act",$act);
	$template->assign("adminPager",$listPage);
	$template->assign("menus",$menus);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);	
	$template->assign("rows",$rows);
	$template->assign("pages",$page);
	$template->assign("menugroup",$menugroup);
}
function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['status'],$request->element('status'));	
	$infoText .= $validate->validStatus($amessages['menugroup'],$request->element('mgid'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	//$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	$infoText .= $validate->validString($amessages['vn_url'],$request->element('vn_url'));	
	//$infoText .= $validate->validString($amessages['en_url'],$request->element('en_url'));
	$infoText .= $validate->validStatus($amessages['position'],$request->element('position',0));	
	return $infoText;
}
?>