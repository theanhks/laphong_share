<?php
/*************************************************************************
Class AdsGroupInfo
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 05/10/2009
**************************************************************************/	

class  AdsGroupInfo {
	var $agId;			# Primary key
	var $vn_name;		# Vietnamese name
	var $en_name;		# English name
	var $status;		# Status
	function AdsGroupInfo($vn_name='', $en_name='', $status='', $agId=0) {
		$this->agId = $agId;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->status = $status;
	}
	function getId() {
		return $this->agId;
	}	
	function setId($nValue) {
		$this->agId=$nValue;
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