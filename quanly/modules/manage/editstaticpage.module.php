<?php
/*************************************************************************
Edit StaticPage module
---------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 
include_once(ROOT_PATH."classes/dao/static.class.php");
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
$templateFile = "manageeditstaticpage.temp.html";
$gallery = ROOT_PATH."gallery/avatar_upload/";
$gallery_new = $gallery."static/";
$gallery_storage = $gallery_new."/storage/";
$gallery_avatar = $gallery_new."/avatar/";
$staticpage = new StaticPage;
$sId = $request->element("oId");
$pId = $request->element('pId');
$sp = $staticpage->getRecord($sId);
if ($sId && $sp != ''){
# Generate lang combobox for Search form
	$listLang = optionLang($request->element('searchLang','-1'));
	$template->assign("listLang",$listLang);
	
# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);	
# Get all staticpage object and pass to template
	$staticItem = $staticpage->getObject($sId);
	$template->assign("listObject",$staticItem);
	$listPid = $staticpage->optionAllCategories('id','vn_name',$pId);
$template->assign("listPid",$listPid);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$lang = $request->element('lang','en');
		$status = $request->element('status',0);
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');
		$keywords = $request->element('keyword','');
		$old_avatar = $request->element('old_avatar','');
		$position = $request->element('position',0);
		$vn_sapo = $request->element('vn_sapo','');
		$en_sapo = $request->element('en_sapo','');
		$vn_details = $request->element('vn_details','');
		$en_details = $request->element('en_details','');
		$home = $request->element('frontend',0);
		$page = $request->element('page',1);
		# Validation
		$validate = validateData($request);
		
		if($validate == '') {
			$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';
			if($files!=''){
				if($old_avatar!=''){
					// xoa hinh cu
				unlink(ROOT_PATH."gallery/avatar_upload/static/storage/".$old_avatar);
				unlink(ROOT_PATH."gallery/avatar_upload/static/avatar/".$old_avatar);
				}
				$upload = new Upload($files);
				$copy = $upload->moveFile($gallery_storage);
			$file_name = $upload->getNameFile();
			if ($files['tmp_name']){
			$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,165,142,0);
		}		
			}else $file_name=$old_avatar;
			$slug=removeSign($vn_name);
			$staticinfo= new Staticinfo($slug,$lang,$vn_name,$en_name,$keywords,$vn_sapo,$en_sapo,$vn_details,$en_details,$status,$position,$home,$file_name,$pId);
			$fields = array('slug'=>$staticinfo->getSlug(),	
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
		//print_r($fields);
		$staticpage->updateData($fields, $sId);
			$infoText = $amessages['item_edit_ok'];
			$act = 'list';
			$template->assign("act",$act);
			$infoClass = "infoText";
			$templateFile = "manageliststaticpage.temp.html";
			$pages = $staticpage->getNumItems();
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			# Get all staticpage object and pass to template
			$staticItems = $staticpage->getObjects($page,"1=1 AND properties=$pId", array('position'=>'ASC'));
			$template->assign("listObjects",$staticItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=static&amp;act=list&amp;page=%s",$pages,$page);
			$template->assign("adminPager",$listPage);
			$template->assign("staticpage",$staticpage);
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("rows",$rows);
			$template->assign("pages",$pages);
			$template->assign("page",$page);
			
		} else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("lang",$lang);
			$template->assign("status",$status);
			$template->assign("vn_name",$vn_name);
			$template->assign("en_name",$en_name);
			$template->assign("vn_sapo",$vn_sapo);
			$template->assign("en_sapo",$en_sapo);
			$template->assign("vn_details",$vn_details);
			$template->assign("en_details",$en_details);
			$template->assign("position",$position);
			//$template->assign("home",$home);
			$template->assign("pid",$pid);
		}
	}
}else{
# Thong bao Khong Ton Tai ID cua sta
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$act = 'list';
	$template->assign("act",$act);
	$infoClass = "infoText";
	$templateFile = "manageliststaticpage.temp.html";
	$pages = $staticpage->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
# Get all staticpage object and pass to template
	$staticItems = $staticpage->getObjects($page,"1=1 AND properties=$pId", array('position'=>'ASC'));
	$template->assign("listObjects",$staticItems);
# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=static&amp;act=list&amp;page=%s",$pages,$page);
	$template->assign("adminPager",$listPage);
	$template->assign("staticpage",$staticpage);
	$template->assign("infoText",$infoText);
	$template->assign("infoClass",$infoClass);
	$template->assign("rows",$rows);
	$template->assign("pages",$pages);
	$template->assign("page",$page);
	$template->assign("searchTerms",$searchTerms);
	$template->assign("searchStatus",$searchStatus);
	$template->assign("searchLang",$searchLang);
}

function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	//$infoText .= $validate->validString($amessages['vn_sapo'],$request->element('vn_sapo'));
	//$infoText .= $validate->validString($amessages['en_sapo'],$request->element('en_sapo'));
	#$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));	
	//$infoText .= $validate->validString($amessages['en_details'],$request->element('en_details'));	
	//$infoText .= $validate->validString($amessages['details'],$request->element('details'));		
	return $infoText;
}
?>