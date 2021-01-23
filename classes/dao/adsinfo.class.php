<?php
/*************************************************************************
Class Ad
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: kimque@ava.vn                                   
Last updated: 08/03/2011
**************************************************************************/
class AdsInfo {
	var $aId;			# Ad code (primary key)
	var $group;			# Group of the ad	
	var $vn_name;
	var $en_name;
	var $logo_url;		# Ad logo URL
	var $url;			# Ad URL
	var $position;		# Display order
	var $status;
	
	# Constructor
	function AdsInfo($group, $vn_name, $en_name, $logo_url, $url, $position, $status, $aId = 0)
	{
		$this->aId = $aId;
		$this->group = $group;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->logo_url = $logo_url;
		$this->url = $url;	
		$this->position = $position;
		$this->status = $status;		
	}

	function getId() {
		return $this->aId;
	}	
	function setId($nValue) {
		$this->aId=$nValue;
	}	
	function getGroup() {
		return $this->group;		
	}
	function setGroup($nValue) {
		$this->group=$nValue;
	}
	function getName($lang = "vn") {
		$key = $lang."_name";
		return refineChar($this->$key);		
	}
	function getLogoUrl() {
		if($this->logo_url) return $this->logo_url;
	}
	
	function setLogoUrl($nValue) {
		$this->logo_url=$nValue;
	}
	
	function getUrl() {
		return $this->url;		
	}
	function setUrl($nValue) {
		$this->url=$nValue;
	}
	
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
	}
	function getPosition() {
		return refineChar($this->position);
	}
	function setPosition($nValue) {
		$this->position = $nValue;
	}
	function isImage() {
		$img = $this->avatar;
		if($this->logo_url) $img = strtolower($this->logo_url);
		if(preg_match("/jpg|png|bmp|gif|peg/",$img)) return 1;
		return 0;
	}
	function isFlash() {
		$img = $this->avatar ;
		if($this->logo_url) $img = $this->logo_url;
		if(preg_match("/.swf/",$img)) return 1;
		return 0;
	}
	function isVideo() {
		if($this->logo_url) $img = $this->logo_url;
		if(preg_match("/wmv|mpg|mp4|mov|avi|flv/",$img)) return 1;
		return 0;
	}
	function getWidth($uploadDir="/gallery/avatar_upload/ads/storage/") {
		$filepath =  ROOTPATH.$uploadDir.$this->avatar;
		$size_info=getimagesize($filepath);  
		return $size_info[0];
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