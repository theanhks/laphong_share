<?php
/*************************************************************************
Edit Menu module
---------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/menusgroup.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageeditgroupmenu.temp.html";
$mgId = $request->element("oId");
$orderBy = $request->element('orderBy','id');
$orderDir = $request->element('orderDir','ASC');
$menugroups = new MenusGroup();
if($mgId) {
	#Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);
	
	# Get all entries object and pass to template
	$menugroupItems = $menugroups->getObject($mgId);
	$template->assign("listObject",$menugroupItems);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$status = $request->element('status','-1');
		$vn_name = $request->element('vn_name','');
	//	$en_name = $request->element('en_name','');
		$page = $request->element('page',1);
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$menugroup = new MenuGroupInfo($vn_name,"",$status);
			$fields = array('vn_name'=>$menugroup->getName('vn'),
							'en_name'=>$menugroup->getName('en'),
							'status'=>$menugroup->getStatus(),
							);
			$menugroups->updateObjects($fields, $mgId);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'listGroup';
			$template->assign("act",$act);
			
			$templateFile = "managelistgroupmenu.temp.html";
			$pages = $menugroups->getNumItems();
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			
			# Get all entries object and pass to template
			$menusItems = $menugroups->getObjects($page, '1=1', array($orderBy => $orderDir));
			$template->assign("listObjects",$menusItems);
			
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=menu&amp;act=listGroup&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
			$template->assign("rows",$rows);
			$template->assign("pages",$pages);
			$template->assign("page",$page);
			$template->assign("menugroups",$menugroups);
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("menugroups",$menugroups);
			$template->assign("vn_name",$vn_name);
			//$template->assign("en_name",$en_name);
			$template->assign("status",$status);
			
		}
	}
}else{

# Thong bao Khong Ton Tai ID Menu
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "errorText";
	$templateFile = "managelistmenu.temp.html";
	$pages = $menugroups->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	
	# Get all entries object and pass to template
	$menuItems = $menugroups->getObjects();
	$template->assign("listObjects",$menuItems);
	
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=menu&amp;act=listGroup&amp;page=%s",$pages,$page);
	$act = 'list';
	$template->assign("act",$act);
	$template->assign("adminPager",$listPage);
	$template->assign("menugroups",$menugroups);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);	
	$template->assign("rows",$rows);
	$template->assign("pages",$page);
}
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