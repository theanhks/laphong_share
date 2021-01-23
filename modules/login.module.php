<?php
/*************************************************************************
Login module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 02/07/2008
**************************************************************************/
#login
error_reporting(0);
ini_set('display_errors','0'); ini_set('display_startup_errors','0');
include_once(ROOT_PATH."classes/dao/members.class.php");
include_once(ROOT_PATH."modules/framework.module.php");
include_once(ROOT_PATH."includes/functions.php");
$members = new Members();
$lang = $request->element("lang",'vn');
$pageName = $lang == 'en' ? "Login" : "Đăng nhập";
$template->assign('pageName',$pageName);
$templateFile = "boxlogin.tpl.html";
$status = array();
$typePage = 'dang-nhap';
$template->assign('typePage',$typePage);
if($_POST) {
    $_SESSION['memberId'] =2 ;
	$username = trim($request->element("email",''));
	$password = trim($request->element("password",''));
	$type = $request->element("type",'');
	$userId = 0;
	$status['error'] = "";
	if($type == 'social'){
        $username = trim($request->element("name",''));
        $id = trim($request->element("id",''));
        $email = trim($request->element("email",''));
        $address = trim($request->element("address",''));
        $tel = trim($request->element("tel",''));
        $_SESSION['memberId']  = $id;
        $memberData = array('id'=>$id,'fullname'=>$username,'email'=>$email,'address'=>$address,'tel'=>$tel);
        $_SESSION['memberId_'.$id] = (object)$memberData;
        echo json_encode(array('success' => '200', 'url'=>"/{$lang}"));
       die;
    }else{
        if($username != "" && $password != ""){
            $userId = $members->authenticateUser($username,$password);
            if($userId) {
                $_SESSION['memberId'] = $userId;
                $_SESSION['memberId_'.$userId] = $members->getObject($userId);
                header("location: /".$lang);
            } else {
                $_SESSION['memberId'] = '';
                $status['error'] .= "Tên đăng nhập hoặc mật khẩu không đúng";
                $template->assign('status',$status['error']);
            }
        }else{
            $status['error'] .= "Tên đăng nhập hoặc mật khẩu không được rỗng";
            $template->assign('status',$status['error']);
        }
    }

}
//echo json_encode($status);
?>