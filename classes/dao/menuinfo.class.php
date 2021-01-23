<?php
/*************************************************************************
Class MenuInfo
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 07/10/2009
**************************************************************************/

class MenuInfo {
	var $mId;			# Primary key
	var $pId;			# Parent ID
	var $mgId;			# Groupt Menu ID
	var $slug;			# Groupt Menu ID
	var $vn_name;		# Vietnamese name
	var $en_name;		# English name
	var $cn_name;	# China name
	var $vn_url;		# Vietnamese url
	var $en_url;		# English url
	var $status;		# Status
	var $position;		# Order position
	
	function MenuInfo ($pId=0, $mgId = 0, $slug='', $vn_name='', $en_name='', $vn_url='', $en_url='', $status='', $position='', $mId = 0)
	{
		$this->mId = $mId;
		$this->pId = $pId;		
		$this->mgId= $mgId;
		$this->slug= $slug;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->vn_url = stripslashes($vn_url);
		$this->en_url = stripslashes($en_url);
		$this->status = $status;
		$this->position = $position;
	}

	function getId() {
		return $this->mId;
	}	
	function setId($nValue) {
		$this->mId=$nValue;
	}
	function getPId() {
		return $this->pId;
	}
	function setPId($nValue) {
		$this->pId=$nValue;
	}

	function getSlug() {
		return $this->slug;
	}
	function setSlug($nValue) {
		$this->slug=$nValue;
	}
	function getName($lang = 'vn') {
		$key = $lang.'_name';
		return $this->$key;
	}
	function setName($lang = 'vn', $nValue) {
		$key = $lang.'_name';
		$this->$key=stripslashes($nValue);
	}
	function getGroup() {
		return $this->mgId;
	}
	function setGroup($nValue) {
		$this->mgId = $nValue;
	}
	function getUrl($lang = 'vn') {
		$key = $lang.'_url';
		return $this->$key;
	}
	function setUrl($lang = 'vn', $nVlaue) {
		$key = $lang.'_url';
		$this->$key=stripslashes($nValue);
	}
	function getStatus() {
		return $this->status;
	}
	function getStatusText() {
		global $amessages;
		return $amessages['status_text'][$this->status];
	}	
	function setStatus($nValue) {
		$this->status = $nValue;
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
	function getPosition() {
		return $this->position;
	}
	function setPosition($nValue) {
		$this->position = $nValue;
	}
	
}	
?>