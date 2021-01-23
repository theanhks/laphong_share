<?php
/*************************************************************************
Add Ads
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd
Name: Tran Thi Kim Que
Last updated: 08/03/2011
 **************************************************************************/
//ini_set('display_errors','1'); ini_set('display_startup_errors','1');
include_once(ROOT_PATH.'classes/dao/book.class.php');
include_once(ADMIN_ROOT_PATH.'includes/functions.php');
include_once(ROOT_PATH."classes/data/validate.class.php");
$templateFile = "manageeditbook.temp.html";

$book = new Book();
$id = $request->element("id");
$name = $request->element('name','');
$email = strtolower($request->element('email',''));
$tel = $request->element('tel','');
$note = $request->element('note','');
$date = $request->element('date','');
$time = $request->element('time','');
$quantity = $request->element('quantity','');
$status = $request->element('status','1');
$page = $request->element('page','');
if($id){
    $infoText = '';
    $searchTerms = $request->element('searchTerms','');
    $searchStatus = $request->element('searchStatus','-1');
    $page = $request->element('page',1);
    $orderBy = $request->element('orderBy','date');
    $orderDir = $request->element('orderDir','DESC');
    $items_per_pages = DEFAULT_ADMIN_ROWS_PER_PAGE;
    $bookItem = $book->getObject($id);
    $template->assign("listObject",$bookItem);
    if($_POST) {
        $validate = validateData($request);
        if($validate == '') {
            $bookInfo = new BookInfor($name,
                $email,
                $tel,
                $date,
                $time,
                $note,
                $quantity,
                $status
            );

            $fields = array('name'=>$bookInfo->getName(),
                'email'=>$bookInfo->getEmail(),
                'tel'=>$bookInfo->getTel(),
                'date'=>$bookInfo->getDate(),
                'time'=>$bookInfo->getTime(),
                'note'=>$bookInfo->getNote(),
                'quantity'=>$bookInfo->getQuantity(),
                'status'=>$bookInfo->getStatus(),
            );
            //print_r($fields);
            //$book->addData($fields);
            $book->updateData($fields, $id);
            $infoText = $amessages['item_inserted_ok'];
            $infoClass = "infoText";
            $templateFile = "managelistbook.temp.html";
            $act = 'list';
            $template->assign("act",$act);
            $pages = $book->getNumItems('id');
            $rows = $pages['rows'];
            $pages = $pages['pages'];
            if($page > $pages) $page = $pages;
            # Get all entries object and pass to template
            $bookItems = $book->getObjects($page,"1=1", array('date'=>'DESC'));
            $template->assign("listObjects",$bookItems);
            # Generate and pass link pager to template
            $listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=product&amp;act=list&amp;searchTerms=".$searchTerms."&amp;searchStatus=".$searchStatus."&amp;searchCategory=".$searchCategory."&amp;orderBy=".$orderBy."&amp;orderDir=".$orderDir."&amp;page=%s",$pages,$page);
            $template->assign("adminPager",$listPage);
            $template->assign("infoText",$infoText);
            $template->assign("infoClass",$infoClass);
            $template->assign("rows",$rows);
            $template->assign("pages",$page);
            $template->assign("start",($page - 1) * $items_per_pages);
            $template->assign("searchTerms",$searchTerms);
            $template->assign("searchStatus",$searchStatus);
            $template->assign("book",$book);
        }else {
            $infoText .=$amessages['item_inserted_error']."<br />";
            $infoText .=$validate;
            $infoClass = "errorText";
            $template->assign("infoText",$infoText);
            $template->assign("infoClass",$infoClass);
            $template->assign("email",$email);
            $template->assign("tel",$tel);
            $template->assign("date",$date);
            $template->assign("time",$time);
            $template->assign("note",$note);
            $template->assign("status",$status);
            $template->assign("name",$name);
        }
    }
    $status = isset($bookItem) ? $bookItem->getStatus() : $status;
    $listStatus = optionStatus($status,DEFAULT_ADMIN_LANGUAGE);
    $template->assign("listStatus",$listStatus);
    $template->assign("infoText",$infoText);
    $template->assign("searchTerms",$searchTerms);
    $template->assign("searchStatus",$searchStatus);
    $template->assign("orderBy",$orderBy);
    $template->assign("orderDir",$orderDir);
    $template->assign("page",$page);
}else{
    $infoText = $amessages['invalid_id'];
    $infoClass = "infoText";
    $act = 'edit';
    $template->assign("act",$act);

    $act = 'edit';
    $template->assign("act",$act);
    #$templateFile = "managelistproduct.temp.html";
    $pages = $book->getNumItems();
    $rows = $pages['rows'];
    $pages = $pages['pages'];
    if($page > $pages) $page = $pages;
    # Get all Ads object and pass to template
    $bookItems = $book->getObjects($page,'1=1', array('date'=>'DESC'));
    #var_dump($adsItems);
    $template->assign("listObjects",$bookItems);
    # Generate and pass link pager to template
    $listPage = linkPager(ADMIN_SCRIPT."?op=manage&amp;part=book&amp;act=list&amp;page=%s",$pages,$page);
    $template->assign("adminPager",$listPage);
    $template->assign("infoText",$infoText);
    $template->assign("infoClass",$infoClass);
    $template->assign("rows",$rows);
    $template->assign("pages",$pages);
    $template->assign("page",$page);
    $template->assign("searchTerms",$searchTerms);
    $template->assign("searchStatus",$searchStatus);
    $template->assign("book",$book);
}



function validateData($request) {
    global $amessages;
    $validate = new Validate();
    $infoText = '';
    $infoText .= $validate->validEmail($amessages['email_help'],$request->element('email'));
    $infoText .= $validate->validString($amessages['vn_name_help'],$request->element('name'));
    $infoText .= $validate->validStatus($amessages['status_help'],$request->element('status'));

    return $infoText;
}
?>