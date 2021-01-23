<?php
/*************************************************************************
Admin Index page
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 29/09/2009
Author: Mai Minh
**************************************************************************/
# Set to 9 if you want to debug
#error_reporting(E_ALL);
#ini_set('display_errors','1'); ini_set('display_startup_errors','1'); 

# Autodetect current root folder
if (!defined('ROOT_PATH')) {
	define('ROOT_PATH', dirname(__FILE__).'/../');
}
if (!defined('ADMIN_ROOT_PATH')) {
	define('ADMIN_ROOT_PATH', dirname(__FILE__).'/');
}
ini_set('memory_limit', '-1');
ini_set('max_execution_time', '-1');
#ini_set("memory_limit","16M");
# Libraries
include_once(ROOT_PATH.'includes/config.conf.php');
include_once(ROOT_PATH.'includes/constant.conf.php');
include_once(ROOT_PATH.'version.php');
include_once(ROOT_PATH.'classes/dao/mysql.class.php');
include_once(ROOT_PATH.'classes/http/request.class.php');
include_once(ADMIN_ROOT_PATH.'classes/template/smarty.class.php');
# Database connection
$db = new DB();
# Template configuration
$template = new Smarty;
$template->compile_check = ADMIN_TEMPLATE_COMPILE;
$template->debugging = ADMIN_TEMPLATE_DEBUG;
$userTemplate = ADMIN_DEFAULT_TEMPLATE;
$templateFile = 'index.temp.html';
# HTTP Request manager
$request = new Request;
$op = strtolower($request->element('op')?$request->element('op'):DEFAULT_ADMIN_OP);
$site = $request->element('site');

# Language manager
$lang = DEFAULT_ADMIN_LANGUAGE;
include_once(ADMIN_ROOT_PATH.'languages/'.$lang.'.lang.php');
$template->assign('amessages',$amessages);
# Session manager
include_once(ADMIN_ROOT_PATH.'includes/session.php');
# Operations manager
if($op == 'admin' && !$userInfo->isFounder()) $op = strtolower(DEFAULT_ADMIN_OP);
include_once(ADMIN_ROOT_PATH.'modules/'.$op.".module.php");
# Template global variables
if(isset($op)) $template->assign('op',$op);
$part = isset($part) ? $part : '';
$template->assign('part',$part);
if(isset($act)) $template->assign('act',$act);
$template->assign('domain',DOMAIN);
$script = (ADMIN_SCRIPT == 'index.php')?'./':'./'.ADMIN_SCRIPT;
$template->assign('script', $script);
$template->assign('version', VERSION);
$template->assign('usertemplate',$userTemplate);
$template->assign("URL",DOMAIN);
$template->assign("ADMIN_ROOTPATH",ADMIN_ROOTPATH);
$template->assign("ROOTPATH",ROOTPATH);
# Display the web page
$template->display($userTemplate.'/'.$templateFile);

# Close database connection
$db->close();
?>
