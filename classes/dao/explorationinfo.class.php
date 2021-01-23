<?php
/*************************************************************************
Class Exploration
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc
Last updated: 19/11/2009
**************************************************************************/
class ExplorationInfo {
	var $eId;			# primary key
	var $pId;			# Parent key 
	var $vn_name;		# Name English
	var $en_name;		# Name Vietname
	var $cn_name;		# Name Vietname
	var $amount;		# Amount
	var $status;		# 0-Disabled, 1-Active, 2-Deleted
	var $position;		# Display order
	var $properties;
	# Constructor
	function ExplorationInfo($pId, $vn_name, $en_name, $cn_name, $amount, $position, $status, $properties='', $eId = 0)
	{
		$this->eId = $eId;
		$this->pId = $pId;
		$this->vn_name = $vn_name;
		$this->en_name = $en_name;
		$this->cn_name = $cn_name;
		$this->amount = $amount;
		$this->position = $position;
		$this->status = $status;
		$this->properties = $properties;
	}

	function getId() {
		return $this->eId;
	}	
	function setId($nValue) {
		$this->eId=$nValue;
	}	
	function getPId() {
		return $this->pId;		
	}
	function setPId($nValue) {
		$this->pId=$nValue;
	}
		
	function getName($lang='vn') {
		$key = $lang.'_name';
		return $this->$key;		
	}
	function setName($nValue) {
		$key = $lang.'_name';
		$this->$key=$nValue;
	}
	function getAmount() {
		return $this->amount;		
	}
	function setAmount($nValue) {
		$this->amount=$nValue;
	}
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
	}
	function getPosition() {
		return $this->position;
	}
	function setPosition($nValue) {
		$this->position = $nValue;
	}
	function getProperties() {
		return $this->properties;
	}
	function setProperties($nValue) {
		$this->properties = $nValue;
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