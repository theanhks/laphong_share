<?php
/*************************************************************************
Admin Logout module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 02/07/2008
**************************************************************************/
$lang = $request->element("lang");
$_SESSION['memberId_'.$_SESSION['memberId']] = '';
$_SESSION['memberId'] = '';
/*$_SESSION['userName'] = '';
$_SESSION['userType'] = 0;*/		

header("location: /");
die;
?>