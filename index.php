<?php
/*************************************************************************
Index page
----------------------------------------------------------------
DeraCMS Project
Company: AVA Co., Ltd
Email: kimque@ava.vn
Last updated: 27/09/2009
Author: Que Tran
**************************************************************************/

$time_start =  microtime(true);
# Set to 9 if you want to debug
error_reporting(0);
ini_set('display_errors','-1'); ini_set('display_startup_errors','-1'); 
# Autodetect current root folder
if (!defined('ROOT_PATH')) {
	define('ROOT_PATH', dirname(__FILE__).'/');
}
ob_start();

include_once(ROOT_PATH.'includes/config.conf.php');

include_once(ROOT_PATH.'includes/constant.conf.php');
include_once(ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH.'classes/dao/mysql.class.php');

include_once(ROOT_PATH.'classes/dao/configs.class.php');
include_once(ROOT_PATH.'classes/template/smarty.class.php');
include_once(ROOT_PATH.'classes/http/request.class.php');
include_once(ROOT_PATH.'classes/http/url.class.php');
include_once(ROOT_PATH.'classes/dao/users.class.php');
include_once(ROOT_PATH."classes/dao/cartitems.class.php");
//echo 'tets';
#include_once(ROOT_PATH.'counter/counter.php');
#Create database connection
$db = new DB();
# System configuration
$configs = new Configs($db);
$siteConfigs = $configs->getObject('general');
$popup = $siteConfigs->getProperty('check_popup');
# Template configuration
$template = new Smarty;
$template->compile_check = TEMPLATE_COMPILE;
$template->debugging = TEMPLATE_DEBUG;
$userTemplate = DEFAULT_TEMPLATE;					# Need to be re-coded to allow Admins change template in CMS and load here
# Initilize template file with a default value

# HTTP Request manager
$request = new Request();
$op = strtolower($request->element('op')?$request->element('op'):DEFAULT_OP);
$slug = $request->element("slug",'index');
$act = $request->element("act");
$quickcart = $request->element("quickcart",'');
$id = $request->element("id");
$orderby=array('position'=>'ASC');
# Session manager
include_once(ROOT_PATH.'includes/session.php');

# URL generator
$url = new Url(); 
# Language manager
$lang = $request->element('lang');
if(!$lang) $lang = DEFAULT_LANGUAGE;
include_once(ROOT_PATH.'languages/'.$lang.'.lang.php');
$template->assign('messages',$messages);
$template->assign('siteConfigs',$siteConfigs);
# Operations manager
include_once(ROOT_PATH.'modules/'.$op.'.module.php');

//print_r($logoItems);
# Addons manager here
#CartItems
$session_1=session_id();
$carts = new CartItems();
$count_item = $carts->getSumQuantity($session_1);
$cart1Items = $carts->getObjects(1,"sid='$session_1'");

#Member
$member = new Members();
#$memberLoginId = isset($_SESSION['memberId']) ? $_SESSION['memberId'] : '';
#$memberData = $member->getObject($memberLoginId);

$memberData = !empty($_SESSION['memberId']) ? $_SESSION['memberId_'.$_SESSION['memberId']] : '';
$template->assign("memberData",$memberData);
//var_dump($memberData); die;

//print_r($cart1Items);
$template->assign("count_item",$count_item);
$template->assign("carts",$carts);
$template->assign("session_1",$session_1);
$template->assign("cart1Items",$cart1Items);

# Addons will be loaded after an action is loaded
# Template global variables

$template->assign('quickcart',$quickcart);
$template->assign('url',$url);
$template->assign('op',$op);
$template->assign('act',$act);
$template->assign('orderby',$orderby);
$template->assign('slug',$slug);
$template->assign('lang',$lang);
$template->assign("configs",$configs);
#$template->assign("count",$count);
$template->assign('usertemplate',$userTemplate);
$template->assign("TEMPLATE_PATH",TEMPLATE_PATH);
$template->assign("DOMAIN",DOMAIN);
$template->assign("ROOTPATH",ROOTPATH);
$template->assign("URL_TYPE",URL_TYPE);
#$template->assign("pageTitle",$messages['title_header']);

# Display the web page
$template->display($userTemplate.'/'.$templateFile);
$db->close();
/*$time_end =  microtime(true);
echo $time_end-$time_start;*/

?>