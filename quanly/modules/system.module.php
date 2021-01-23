<?php
/*************************************************************************
Manage
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 03/10/2009
**************************************************************************/
/* Edit log:
- 03/10/2009 18:00 - Mai Minh: Initialize
*/

$part = $request->element('part','index');
$act = $request->element('act','');
$error = '';
$infoClass = '';
if ($act) include_once(ADMIN_ROOT_PATH.'modules/system/'.strtolower($act.$part).'.module.php');

# Pass error (if occurs after module excecuted) to template
$template->assign('error',$error);
$template->assign('infoClass',$infoClass);
?>