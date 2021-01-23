<?php
/*************************************************************************
Class Staticinfo
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                  
Last updated: 08/03/2011                                 
**************************************************************************/
class VoteInfo {
	var $id;				# Primary key
	var $idproduct;			# idproduct
	var $iduser;			#iduser
	var $chatluong_vote;
	var $hinhdang_vote;
	var $gia_vote;
	var $name;
	var $title;
	var $comment;
	var $status;
	var $date_created;	
	
	function VoteInfo ($idproduct='',$iduser='', $chatluong_vote=0, $hinhdang_vote='', $gia_vote='', $name ='', $title='', $comment='', $status='', $date_created, $id = 0)
	{
		$this->id = $id;
		$this->idproduct = stripslashes($idproduct);
		$this->iduser = stripslashes($iduser);
		$this->chatluong_vote = stripslashes($chatluong_vote);
		$this->hinhdang_vote = stripslashes($hinhdang_vote);
		$this->gia_vote = stripslashes($gia_vote);
		$this->name = stripslashes($name);
		$this->title = stripslashes($title);
		$this->comment = stripslashes($comment);
		$this->status = stripslashes($status);
		$this->date_created = $date_created;
	}
	function getId() {
		return $this->id;
	}	
	function setId($nValue) {
		$this->id=$nValue;
	}
	function getIdProduct() {
		return $this->idproduct;
	}	
	function setIdProduct($nValue) {
		$this->idproduct=$nValue;
	}
	function getIdUser() {
		return $this->iduser;
	}	
	function setIdUser($nValue) {
		$this->iduser=$nValue;
	}
	function getVote($nValue = "chatluong") {
		$key = $nValue."_vote";
		return $this->$key;		
	}	
	function getName() {
		return $this->name;		
	}
	function getTitle() {
		return $this->title;		
	}
	function getComment() {
		return $this->comment;		
	}
	function setSlug($nValue) {
		$this->vote=$nValue;
	}
	function getLang() {
		return $this->lang;
	}	
	
	function getStatus() {
		return $this->status;
	}
	function getStatusText() {
		global $amessages;
		return $amessages['status_text'][$this->status];
	}	
	function setStatus($nValue) {
		$this->$status = $nValue;
	}
	function getDateCreated()
	{
		return $this->date_created;
	}
	function isEnabled() {
		return ($this->status == 1?1:0);
	}
	function isDeleted() {
		return ($this->status == 2?1:0);
	}
	function isDisabled() {
		return ($this->status == 0?1:0);
	}	
}	
?>