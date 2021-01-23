<?php
/*************************************************************************
Add category
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/support.class.php");
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/dao/parts.class.php");

$templateFile = "manageeditsupport.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$support = new Support();
$parts = new Parts();
$infoClass = 'infoText';

$Id = $request->element('oId');
$sp = $support->getRecord($Id);
$page= $request->element('page',1);
$searchStatus = $request->element('searchStatus','-1');
if($searchStatus == -1) $searchStatus = $request->element('status','-1');
$searchParts = $request->element('searchParts','-1');
if($searchParts == -1) $searchParts = $request->element('paId','-1');
if($Id && $sp != '') {
	$supportItem = $support->getObject($Id);
	$template->assign("listObject",$supportItem);
	
	$paId = $request->element('paId','-1');
	$vn_name = $request->element('vn_name','');
	$en_name = $request->element('en_name','');
	$tel = $request->element('tel',0);
	$cell = $request->element('cell',0);
	$yahoo = $request->element('yahoo','');
	$skype = $request->element('skype','');
	$status = $request->element('status',0);
	$position = $request->element('position',0);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		# Validation
		 $validate = validateData($request);
		if($validate == '') {
			$supportinfo = new SupportInfo($paId, $vn_name, $en_name, $tel, $cell, $yahoo, $skype, $status, $position);
			$fields = array('paid'=>$supportinfo->getParts(),
							'vn_name'=>$supportinfo->getName('vn'),
							'en_name'=>$supportinfo->getName('en'),
							'telephone'=>$supportinfo->getTelephone(),
							'cellphone'=>$supportinfo->getCellphone(),
							'nick_yahoo'=>$supportinfo->getNickYahoo(),
							'nick_skype'=>$supportinfo->getNickSkype(),
							'status'=>$supportinfo->getStatus(),
							'position'=>$supportinfo->getPosition()
							);
			$support->updateData($fields, $Id);
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "InfoText";
			$searchStatus = -1;
			$searchParts = -1;
			$templateFile = "managelistsupport.temp.html";
			$act = 'list';
			$template->assign("act",$act);
			$pages = $support->getNumItems('id',"1=1");
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			
			if($page > $pages) $page = $pages;	
			# Get all entries object and pass to template
			$supportItems = $support->getObjects($page,"1=1", array('position'=>'ASC'));
			$template->assign("listObjects",$supportItems);	
			
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=support&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign('support',$support);
			$template->assign('paId',$paId);
			$template->assign("rows",$rows);
			$template->assign("page",$page);
			$template->assign("pages",$pages);
			$template->assign("start",($page - 1) * $items_per_pages);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
		}else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign('paId',$paId);
			$template->assign('vn_name',$vn_name);
			$template->assign('en_name',$en_name);
			$template->assign('tel',$tel);
			$template->assign('cell',$cell);
			$template->assign('yahoo',$yahoo);
			$template->assign('skype',$skype);
			$template->assign('status',$status);
			$template->assign('position',$position);
		}
	}
	$listStatus = optionStatus($searchStatus,DEFAULT_ADMIN_LANGUAGE);
	$template->assign("listStatus",$listStatus);
	$listParts = $parts->comboListObjects('id','vn_name',$searchParts);
	$template->assign("listParts",$listParts);
	$template->assign("parts",$parts);
	
}else {
	# Thong bao Khong Ton Tai ID
	$infoText = $amessages['invalid_id'];
	$infoClass = "errorText";
	$templateFile = "managelistsupport.temp.html";
	$pages = $support->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all category object and pass to template
	$supportItems = $support->getObjects();
	$template->assign("listObjects",$supportItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=support&amp;act=list&amp;page=%s",$pages,$page);
	$act = 'list';
	$template->assign("act",$act);
	$template->assign("adminPager",$listPage);
	$template->assign("support",$support);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);	
	$template->assign("rows",$rows);
	$template->assign("pages",$pages);
	$template->assign("page",$page);
}
function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	#$infoText .= $validate->validString($amessages['yahoo'],$request->element('yahoo'));
	#$infoText .= $validate->validString($amessages['skype'],$request->element('skype'));
	return $infoText;
}
?>