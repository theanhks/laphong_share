<?php
/*************************************************************************
Edit GroupAds module
---------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                
Last updated: 15/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/dao/tamgia.class.php");
include_once(ROOT_PATH.'classes/dao/procategories.class.php');
include_once(ROOT_PATH.'classes/dao/products.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');

$templateFile = "manageedittamgia.temp.html";
$tamgia = new TamGia();
$product = new Products();

$agId = $request->element("oId");
$sp = $tamgia->getRecord($agId);
$page = $request->element('page',1);
if ($agId && $sp != ''){
# Generate status combobox for Search form
	$listStatus = optionStatus($request->element('searchStatus','-1'));
	$template->assign("listStatus",$listStatus);

# Get all GroupAds object and pass to template
	$tamgiaItem = $tamgia->getObject($agId);
	$template->assign("listObject",$tamgiaItem);
	if($_POST) {
		include_once(ROOT_PATH."classes/data/validate.class.php");
		$status = $request->element('status','-1');
		$vn_name = $request->element('vn_name','');
		$en_name = $request->element('en_name','');		
		$pricefrom = $request->element('pricefrom','0');
		$priceto = $request->element('priceto','0');		
		# Validation
		$validate = validateData($request);
		if($validate == '') {
			$tamgiainfo = new TamGiaInfo($vn_name,$en_name,$status, '', $pricefrom, $priceto);
			$fields = array('vn_name'=>$tamgiainfo->getName('vn'),
							'en_name'=>$tamgiainfo->getName('en'),
							'status'=>$tamgiainfo->getStatus(),
							'pricefrom'=>$tamgiainfo->getPricefrom(),
							'priceto'=>$tamgiainfo->getPriceto()
							);
			$result = $tamgia->updateData($fields, $agId);
			//echo "XXX[$result]XXXXXX" ;
			//exit() ;
			if ($result)
			{
				#$tamgia->updatetamgiaproductlist() ;
			}
		
			$infoText = $amessages['item_edit_ok'];
			$infoClass = "infoText";
			$act = 'list';
			$template->assign("act",$act);
			$templateFile = "managelisttamgia.temp.html";
			$pages = $tamgia->getNumItems();
			$rows = $pages['rows'];
			$pages = $pages['pages'];
			if($page > $pages) $page = $pages;
			# Get all GroupAds object and pass to template
			$tamgiaItems = $tamgia->getObjects($page,'1=1');
			$template->assign("listObjects",$tamgiaItems);
			# Generate and pass link pager to template
			$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=tamgia&amp;act=list&amp;page=%s",$pages, $page);
			$template->assign("adminPager",$listPage);
			$template->assign("tamgia",$tamgia);
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
			$template->assign("tamgia",$tamgia);
			$template->assign("en_name",$en_name);
			$template->assign("vn_name",$vn_name);
			
		}
	}
}else{
# Thong bao Khong Ton Tai ID GroupAds
	$page = $request->element('page',1);
	$infoText = $amessages['invalid_id'];
	$infoClass = "infoText";
	$act = 'list';
	$template->assign("act",$act);
	$templateFile = "managelisttamgia.temp.html";
	$pages = $tamgia->getNumItems();
	$rows = $pages['rows'];
	$pages = $pages['pages'];
	if($page > $pages) $page = $pages;
	# Get all GroupAds object and pass to template
	$tamgiaItems = $tamgia->getObjects($page,'1=1');
	$template->assign("listObjects",$tamgiaItems);
	# Generate and pass link pager to template
	$listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=tamgia&amp;act=list&amp;page=%s",$page);
	$template->assign("adminPager",$listPage);
	$template->assign("tamgia",$tamgia);
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