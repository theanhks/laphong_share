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
	var $vote;				# so diem
	var $status;			# Status
	
	
	function VoteInfo ($idproduct='',$iduser='', $vote='', $status='',$id = 0)
	{
		$this->id = $id;
		$this->idproduct = $idproduct;
		$this->iduser = $iduser;
		$this->vote = $vote;
		$this->status = $status;
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
	function getVote() {
		return $this->vote;
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