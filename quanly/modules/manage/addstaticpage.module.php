<?php

/*************************************************************************
List entries
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/upload.class.php");
include_once(ROOT_PATH.'classes/dao/static.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/textfilter.class.php");
$templateFile = 'manageaddstaticpage.temp.html';
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$gallery = ROOT_PATH."gallery/avatar_upload/";
$gallery_new = $gallery."static/";
$gallery_storage = $gallery_new."/storage/";
$gallery_avatar = $gallery_new."/avatar/";

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	//$infoText .= $validate->validString($amessages['vn_sapo'],$request->element('vn_sapo'));
	//$infoText .= $validate->validString($amessages['en_sapo'],$request->element('en_sapo'));
	#$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));	
	//$infoText .= $validate->validString($amessages['en_details'],$request->element('en_details'));
	//$infoText .= $validate->validString($amessages['details'],$request->element('details'));			
	return $infoText;
}
$static = new StaticPage();
$infoText = '';
$infoClass = 'infoText';
# Read parameters from request
$lang = $request->element('addLang','-1');
$status = $request->element('addStatus',-1);
$vn_name = $request->element('vn_name','');
$en_name = $request->element('en_name','');
$vn_sapo = $request->element('vn_sapo','');
$en_sapo = $request->element('en_sapo','');
$vn_details = $request->element('vn_details','');
$en_details = $request->element('en_details','');
$position = $request->element('position',0);
$home = $request->element('frontend',0);
$page = $request->element('page',1);
$pId = $request->element('pId','');
$keywords='';
# Generate status combobox for Search form
$listStatus = optionStatus($request->element('searchStatus','-1'));
$template->assign("listStatus",$listStatus);

# Generate status combobox for Search form
$listLang = optionLang($request->element('searchLang','-1'));
$template->assign("listLang",$listLang);
# Generate status combobox for Search form
$listPid = $static->optionAllCategories('id','vn_name',$pId);
$template->assign("listPid",$listPid);
if($_POST) {
	include_once(ROOT_PATH."classes/data/validate.class.php");
	$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
	# Validation
	$validate = validateData($request);
	if($validate == '') {
		$files['tmp_name']='';
		if($files['tmp_name']){ 
			$upload = new Upload($files);
			$copy = $upload->moveFile($gallery_storage);
			$file_name = $upload->getNameFile();
			if ($upload->isImage($file_name))
			$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,165,142,0);
		}else $file_name ='';
		$slug=removeSign($vn_name);
		$staticinfo = new Staticinfo($slug,$lang,$vn_name,$en_name,$keywords,$vn_sapo,$en_sapo,$vn_details,$en_details,$status,$position,$home,$file_name,$pId);
		$fields = array ('slug'=>$staticinfo->getSlug(),	
							'lang'=>$staticinfo->getLang(),	
							'vn_name'=>$staticinfo->getName('vn'),
							'en_name'=>$staticinfo->getName('en'),
							'keywords'=>$staticinfo->getKeywords(),
							'vn_sapo'=>$staticinfo->getSapo('vn'),
							'en_sapo'=>$staticinfo->getSapo('en'),
							'vn_details'=>$staticinfo->getDetails('vn'),
							'en_details'=>$staticinfo->getDetails('en'),
							'status'=>$staticinfo->getStatus(),
							'position'=>$staticinfo->getPosition(),
							'home'=>$staticinfo->getHome(),
							'avatar'=>$staticinfo->getAvatar(),
							'properties'=>$staticinfo->getProperties()
						);
		$static->addData($fields);
		$infoText = $amessages['item_inserted_ok'];
		$infoClass = "InfoText";
		$act = 'list';
		$template->assign("act",$act);
		$templateFile = "manageliststaticpage.temp.html";
		$pages = $static->getNumItems('id');
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		
		# Get all entries object and pass to template
		$staticItems = $static->getObjects($page, "1=1 AND properties=$pId", array('position'=>'ASC'));
		$template->assign("listObjects",$staticItems);
		if($page > $pages) $page = $pages;		
		# Generate and pass link pager to template
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=staticPage&amp;act=list&amp;&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign("rows",$rows);
		$template->assign("pages",$page);
		
	} else {
		$infoText = $amessages['item_inserted_error']."<br />".$validate;
		$infoClass = "errorText";	
		$template->assign("lang",$lang);
		$template->assign("status",$addStatus);
		$template->assign("vn_name",$vn_name);
		$template->assign("en_name",$en_name);
		$template->assign("vn_sapo",$vn_sapo);
		$template->assign("en_sapo",$en_sapo);
		$template->assign("vn_details",$vn_details);
		$template->assign("en_details",$en_details);
		$template->assign("position",$position);
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);
		$template->assign("static",$static);
		$template->assign("pId",$pId);
		$template->assign("home",$home);
	}
}
?>