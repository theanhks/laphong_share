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
include_once(ROOT_PATH."classes/dao/parts.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
$templateFile = "manageaddsupport.temp.html";
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$support = new Support();
$parts = new Parts();
$infoClass = 'infoText';
$searchStatus = $request->element('searchStatus','-1');
$searchTerms=$request->element('searchTerms','');
$paId = $request->element('paId','-1');
$page= $request->element('page',1);
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
		$support->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		
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
		$template->assign("searchTerms",$searchTerms);
		$template->assign("searchStatus",$searchStatus);
	}else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
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
$listStatus = optionStatus($request->element('searchStatus','-1'),DEFAULT_ADMIN_LANGUAGE);
$template->assign("listStatus",$listStatus);
$listParts = $parts->comboListObjects();
$template->assign("listParts",$listParts);
$template->assign("parts",$parts);
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