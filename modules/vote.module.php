<?php
/*************************************************************************
Login module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 02/07/2008
**************************************************************************/
include_once(ROOT_PATH . "classes/dao/members.class.php");
include_once(ROOT_PATH . "classes/dao/products.class.php");
include_once(ROOT_PATH . "classes/dao/vote.class.php");
include_once(ROOT_PATH . "includes/functions.php");
$members        = new Members();
$products       = new Products();
$votes          = new Vote();
$templateFile 	= "poll.tpl.html";
$chatluong_vote = $request->element('chatluong_vote', 3);
/*$hinhdang_vote  = $request->element('hinhdang_vote', 3);
$gia_vote       = $request->element('gia_vote', 3);*/
$idproduct      = $request->element('idproduct', 0);
$name 			= $request->element('name','');
$title  		= $request->element('title','');
$comment      	= $request->element('comment','');
$date_created	= date("Y-m-d H:i:s");
$status         = array();
$userId         = session_id();
/*if(isset($_SESSION['memberId'])){
$userId = $_SESSION['memberId'];	
};
$objUser = $members->getObject($userId);
if (is_object($objUser)) {
	*/
    $objProduct = $products->getObject($idproduct);
    if ($objProduct) {
        $check = $votes->checkUserVoteProduct($idproduct, $userId);
        if ($check == 0) {			
            $voteinfo = new VoteInfo($idproduct, parseToXML($userId), parseToXML($chatluong_vote),/*parseToXML($hinhdang_vote),parseToXML($gia_vote), */parseToXML($name),parseToXML($title),parseToXML($comment),1,$date_created);
            $fields   = array(
                'idproduct' => $voteinfo->getIdProduct(),
                'iduser' => $voteinfo->getIdUser(),
                'chatluong_vote' => $voteinfo->getVote('chatluong'),
				/*'hinhdang_vote' => $voteinfo->getVote('hinhdang'),
				'gia_vote' => $voteinfo->getVote('gia'),*/
				'name' => $voteinfo->getName('chatluong'),
				'title' => $voteinfo->getTitle('chatluong'),
				'comment' => $voteinfo->getComment('chatluong'),
                'status' => $voteinfo->getStatus(),
				'date_created' => $voteinfo->getDateCreated()
            );
            $votes->addData(&$fields);
            $status['error']       = 3;
            // tính diem va lay so lan vote
            $voteProduct           = $votes->getVoteProduct($idproduct);
            $status['number_vote'] = $voteProduct['solan'];
            $status['sodiem']      = $voteProduct['sodiem'];
			
        }else {
            // da binh chon roi
            $status['error'] = 2;
        }
    }
	else{ exit;}
	/*
} else {
    // chua dang nhap
    $status['error'] = 1;
}*/
echo json_encode($status);
?>