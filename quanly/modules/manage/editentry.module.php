
<?php
/*************************************************************************
Edit entries
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/entries.class.php');
include_once(ROOT_PATH.'classes/dao/categories.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/textfilter.class.php");
include_once(ROOT_PATH."classes/dao/upload.class.php");
$templateFile = 'manageeditentry.temp.html';
$items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
$entries = new Entries();
$infoText = '';
$infoClass = 'infoText';

$gallery = ROOT_PATH."gallery/avatar_upload/";
$gallery_new = $gallery."entry/";
$gallery_storage = $gallery_new."storage/";
$gallery_avatar = $gallery_new."/avatar";
$gallery_thubnail = $gallery_new."/thubnail";


# Read parameters from url
$id = $request->element('oId');
$ck = $entries->getRecord($id);
$page = $request->element('page',1);
$searchTerms = $request->element('searchTerms','');
$searchStatus = $request->element('searchStatus','-1');
$searchLang = $request->element('searchLang','-1');
$searchCategory = $request->element('searchCategory','-1');

#request
			
			$lang = $request->element('lang','vn');
			$status = $request->element('status','-1');
			$vn_name = $request->element('vn_name','');
			$en_name = $request->element('en_name','');
			$vn_sapo = $request->element('vn_sapo','');
			$en_sapo = $request->element('en_sapo','');
			$vn_details = $request->element('vn_details','');
			$en_details = $request->element('en_details','');
			$cId = $request->element('cId');
			$home = $request->element('frontend',0);
			$position = $request->element('position',0);
			$news_avatar = $request->element('news_avatar','');
            $keywords = $request->element('keywords','');

if ($id && $ck != ''){
	if(@$img=='1'){
		$entryItem = $entries->getObject($id);
		$avatar_old=$entryItem->getAvatar();
		unlink(ROOT_PATH."gallery/avatar_upload/entry/storage/".$avatar_old);
		unlink(ROOT_PATH."gallery/avatar_upload/entry/avatar/".$avatar_old);
		unlink(ROOT_PATH."gallery/avatar_upload/entry/thubnail/".$avatar_old);
		unlink(ROOT_PATH."gallery/avatar_upload/entry/medium/".$avatar_old);
	$sql ="UPDATE `n_news` SET `avatar` = '' WHERE `id` =$id";
	mysql_query($sql);
	}
	$entryItem = $entries->getObject($id);
	$template->assign("listObject",$entryItem);
	if($_POST) {
		$setwatermark = $request->element('setwatermark');
		$files = isset($_FILES['avatar'])?$_FILES['avatar']:'';

		include_once(ROOT_PATH."classes/data/validate.class.php");
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			if($files['tmp_name']){
			/* xoa hinh cu upload hinh moi*/
			unlink(ROOT_PATH."gallery/avatar_upload/entry/storage/".$news_avatar);
			unlink(ROOT_PATH."gallery/avatar_upload/entry/avatar/".$news_avatar);
			unlink(ROOT_PATH."gallery/avatar_upload/entry/thubnail/".$news_avatar);
				$upload = new Upload($files);
				$copy = $upload->moveFile($gallery_storage);
				$file_name = $upload->getNameFile();
				if ($files['tmp_name']){
			$copy_avatar = $upload->resize($gallery_storage,$gallery_avatar, $file_name, $file_name,PRO_IMAGE_AVATAR_WIDTH,PRO_IMAGE_AVATAR_HEIGHT,0);
			$copy2= $upload->resize($gallery_storage,$gallery_thubnail, $file_name, $file_name,PRO_IMAGE_THUMB_WIDTH,PRO_IMAGE_THUMB_HEIGHT,0);
			}	
			}else $file_name =$news_avatar;
			#edit
			$slug=removeSign($vn_name);
				
			$data = new Entryinfo($cId, $slug, $lang, $vn_name , $en_name, $keywords, $vn_sapo, $en_sapo, $vn_details, $en_details, $status, $home, date("Y-m-d H:i:s"),$file_name, $position);
			$fields = array ('cid'=>$data->getCId(),
							'slug'=>$data->getSlug(),
							'lang'=>$data->getLang(), 
							'vn_name'=>$data->getName('vn'),
							'en_name'=>$data->getName('en'),
							'keywords'=>$data->getKeywords(),
							'vn_sapo'=>$data->getSapo('vn'),
							'en_sapo'=>$data->getSapo('en'),
							'vn_details'=>$data->getDetails('vn'),
							'en_details'=>$data->getDetails('en'),
							'status'=>$data->getStatus(),
							'home'=>$data->getHome(),
							'date_created'=>$data->getDateCreated(), 
							'avatar'=>$data->getAvatar(),
							'position'=>$data->getPosition()
							);
			$entries->updateData($fields,$id);
			if (($data->getPopup())==1)	$entries->update(array('popup' => 0), "id != '$id' and lang='$data->getLang()'");
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "InfoText";
			$act = 'list';
			$template->assign("act",$act);
			
			$templateFile = "managelistentry.temp.html";
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);	
		} else {
			$infoText = $amessages['item_edit_error']."<br />".$validate;
			$infoClass = "errorText";	
			$template->assign("infoText",$infoText);
			$template->assign("infoClass",$infoClass);
			$template->assign("vn_name",$vn_name);
			$template->assign("en_name",$en_name);
			$template->assign("vn_sapo",$vn_sapo);
			$template->assign("en_sapo",$en_sapo);
			$template->assign("vn_details",$vn_details);
			$template->assign("en_details",$en_details);
			$template->assign("home",$home);
			$template->assign("position",$position);
		}
	}
	# Generate status combobox for Search form
	$categories= new Categories();
	$listCategories = $categories->optionAllCategories('id','vn_name',$searchCategory);
	$template->assign("listCategories",$listCategories);
	# Generate status combobox for Search form
	$listStatus = optionStatus($searchStatus);
	$template->assign("listStatus",$listStatus);
	# Generate status combobox for Search form
	$listLang = optionLang($searchLang);
	$template->assign("listLang",$listLang);
	# Get all entries object and pass to template
	$entryItem = $entries->getObject($id);
	$template->assign("listObject",$entryItem);
	$pages = $entries->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all entries object and pass to template
	$entryItems = $entries->getObjects($page,"1=1",array('date_created'=>'DESC'),$items_per_pages);
	$template->assign("listObjects",$entryItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=entry&amp;act=list&amp;page=%s",$pages,$page);
	$template->assign("adminPager",$listPage);
	$template->assign("listCategories",$listCategories);
	$template->assign("categories",$categories);
	$template->assign("rows",$rows);
	$template->assign("pages",$page);
}else{
		$infoText = $amessages['invalid_id'];
		$infoClass = "InfoText";
		$templateFile = "managelistentry.temp.html";
		$pages = $entries->getNumItems();
		$rows = $pages['rows'];
		$pages = $pages['pages'];
		if($page > $pages) $page = $pages;
		
		# Get all entries object and pass to template
		$entryItems = $entries->getObjects();
		$template->assign("listObjects",$entryItems);
		
		# Generate and pass link pager to template
		$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=entry&amp;act=list&amp;page=%s",$pages,$page);
		$template->assign("adminPager",$listPage);
		$categories= new Categories();
		$listCategories = $categories->optionAllCategories('id','vn_name',$searchCategory);
		$template->assign("listCategories",$listCategories);
		$template->assign("categories",$categories);
		$template->assign("infoText",$infoText);
		$template->assign("infoClass",$infoClass);	
		$template->assign("rows",$rows);
		$template->assign("page",$page);
		$template->assign("pages",$pages);
}
function validateData($request) {
	global $amessages;
	$infoText = '';
	$validate = new Validate();
	$infoText .= $validate->validStatus($amessages['category'],$request->element('cId'));
	$infoText .= $validate->validString($amessages['vn_name'],$request->element('vn_name'));
	#$infoText .= $validate->validString($amessages['en_name'],$request->element('en_name'));
	#$infoText .= $validate->validString($amessages['vn_sapo'],$request->element('vn_sapo'));
	#$infoText .= $validate->validString($amessages['en_sapo'],$request->element('en_sapo'));
	#$infoText .= $validate->validString($amessages['vn_details'],$request->element('vn_details'));
	#$infoText .= $validate->validString($amessages['en_details'],$request->element('en_details'));					
	return $infoText;
}
?>