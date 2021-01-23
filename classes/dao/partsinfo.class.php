<?php
/*************************************************************************
Class PartsInfo
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 25/11/2009
**************************************************************************/	

class  PartsInfo {
	var $Id;			# Primary key
	var $vn_name;		# Vietnamese name
	var $en_name;		# English name
	var $status;		# Status
	function PartsInfo($vn_name='', $en_name='', $status='', $Id=0) {
		$this->Id = $Id;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->status = $status;
	}
	function getId() {
		return $this->Id;
	}	
	function setId($nValue) {
		$this->Id=$nValue;
	}
	function getName($lang = 'vn') {
		$key = $lang.'_name';
		return $this->$key;
	}
	function setName($lang = 'vn', $nValue) {
		$key = $lang.'_name';
		$this->$key=stripslashes($nValue);
	}
	function getStatus() {
		return $this->status;
	}
	function getStatusText() {
		global $amessages;
		return $amessages['status_text'][$this->status];
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