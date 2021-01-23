<?php
/*************************************************************************
Login module
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 02/07/2008
**************************************************************************/
/* ID
1.Internet
2.Báo chí
3.Quảng cáo
4.Bạn bè
5.Khác
*/
include_once(ROOT_PATH . "classes/dao/members.class.php");
#include_once(ROOT_PATH . "classes/dao/products.class.php");
include_once(ROOT_PATH . "classes/dao/poll.class.php");
include_once(ROOT_PATH . "includes/functions.php");
include_once(ROOT_PATH."classes/dao/poll.class.php");
$poll = new Poll();
$pollItems= $poll->getObjects(1," status=1 ",array('id'=>'ASC'));	
$template->assign('poll',$poll);
$template->assign('pollItems',$pollItems);
#$products       = new Products();
$votes          = new Poll();
$templateFile 	= "poll.tpl.html";
$chatluong_vote = $request->element('chatluong_vote', 0);
$hinhdang_vote  = $request->element('hinhdang_vote', 0);
$gia_vote       = $request->element('gia_vote', 0);
$idproduct      = $request->element('idpoll', 0);
$name 			= $request->element('name','');
$title  		= $request->element('title','');
$comment      	= $request->element('comment','');
$date_created	= date("Y-m-d H:i:s");
$status         = array();
#$userId         = session_id();
$userId         = '';
/*if(isset($_SESSION['memberId'])){
$userId = $_SESSION['memberId'];	
};
$objUser = $members->getObject($userId);
if (is_object($objUser)) {
	*/
    #$objProduct = $products->getObject($idproduct);
	if($_POST){
		if ($idproduct) {			
			#$check = $votes->checkUserVoteProduct($idproduct, $userId);
			$check = 0;
			if ($check == 0) {	
			//function VoteInfo ($idproduct='',$iduser='', $chatluong_vote='', /*$hinhdang_vote='', $gia_vote='', */$name ='', $title='', $comment='', $status='', $date_created, $id = 0)
	//			{}		
				$voteinfo = new VoteInfo($idproduct, parseToXML($userId), parseToXML($chatluong_vote) , parseToXML($hinhdang_vote),parseToXML($gia_vote), $name, $title,$comment,1,$date_created);
				$fields   = array(
					'idproduct' => $voteinfo->getIdProduct(),
					'iduser' => $voteinfo->getIdUser(),
					'chatluong_vote' => $voteinfo->getVote('chatluong'),
					/*'hinhdang_vote' => $voteinfo->getVote('hinhdang'),
					'gia_vote' => $voteinfo->getVote('gia'),*/
					#'name' => $voteinfo->getName('chatluong'),
					#'title' => $voteinfo->getTitle('chatluong'),
					#'comment' => $voteinfo->getComment('chatluong'),
					'status' => $voteinfo->getStatus(),
					'date_created' => $voteinfo->getDateCreated()
				);
				
				#$votes->updateData(&$fields,$idproduct);
				#$status['error']       = 3;
				// tính diem va lay so lan vote
				$voteProduct           = $votes->getVoteProduct($idproduct);
				#$status['number_vote'] = $voteProduct['solan'];
				#$status['sodiem']      = $voteProduct['sodiem'];
				
			}else {
				// da binh chon roi
				exit;
				#$status['error'] = 2;
			}
		}
		else{ exit;}
	}
#Poll
	/*
} else {
    // chua dang nhap
    $status['error'] = 1;
}*/
#echo json_encode($status);
?>