<?php
/************************************************************************
Class UserTypeInfo
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                  
Last updated: 29/10/2009
**************************************************************************/
class UserTypeInfo {
	var $id;
	var $vn_type;
	var $en_type;
	var $jp_type;
	var $cn_type;
	var $status;
	function UserTypeInfo($vn_type='', $en_type='', $jp_type='', $cn_type='', $status='', $id=0) {
		$this->id = $id;
		$this->vn_type = $vn_type;
		$this->en_type = $en_type;
		$this->jp_type = $jp_type;
		$this->cn_type = $cn_type;
		$this->status = $status;
	}
	function getId()
	{
		return $this->id;
	}
	function setId($nValue) {
		$this->id = $nValue;
	}
	function getType($lang='vn')
	{
		$key = $lang.'_type';
		return $this->$key;
	}
	function setType($nValue, $lang='vn') {
		$key = $lang.'_type';
		$this->$key = stripslashes($nValue);
	}
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
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
