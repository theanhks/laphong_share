<?php
/*************************************************************************
Class Mailinfor
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen                                 
Last updated: 28/10/2009
**************************************************************************/
class EmailInfo {
	var $to;
	var $cc;
	var $subject;
	var $mailcontent;
	var $date_created;
	var $status;
	var $id;
	var $attach;
	function EmailInfo ($to, $cc, $attach, $subject, $mailcontent, $status, $date_created, $id=0){
		$this->id = $id;
		$this->attach = $attach;
		$this->to = $to;
		$this->cc = $cc;
		$this->subject = $subject;
		$this->mailcontent = $mailcontent;
		$this->status = $status;
		$this->date_created = $date_created;
	}

	function getId() {
		return $this->id;
	}
	function getAttach() {
		return $this->attach;
	}
	function getTo() {
		return $this->to;
	}	
	function getCc() {
		return $this->cc;
	}
	function getSubject() {
		return $this->subject;
	}	
	function getMailcontent() {
		return $this->mailcontent;		
	}
	function getDateCreated()
	{
		return $this->date_created;
	}
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
	}
	function getStatusText() {
		global $amessages;
		return $amessages['status_mail'][$this->status];
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