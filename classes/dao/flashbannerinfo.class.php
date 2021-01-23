<?php
/*************************************************************************
Class Ad
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: kimque@ava.vn                                   
Last updated: 08/03/2011
**************************************************************************/
class FlashInfo {
	var $id;			# Ad code (primary key)
	var $logo_url;		# Ad logo URL
	var $status;		# 0-Disabled, 1-Active, 2-Deleted
	# Constructor
	function FlashInfo($logo_url,$status, $id = 0)
	{
		$this->id = $id;
		$this->logo_url = $logo_url;
		$this->status = $status;
	}

	function getId() {
		return $this->id;
	}	
	function setId($nValue) {
		$this->id=$nValue;
	}	
	
	function getLogoUrl() {
		if($this->logo_url) return $this->logo_url;
	}
	
	function setLogoUrl($nValue) {
		$this->logo_url=$nValue;
	}
	
	
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
	}
	function isImage() {
		$img = $this->avatar;
		if($this->logo_url) $img = $this->logo_url;
		if(preg_match("/jpg|png|bmp|gif/",$img)) return 1;
		return 0;
	}
	function isFlash() {
		$img = $this->avatar;
		if($this->logo_url) $img = $this->logo_url;
		if(preg_match("/.swf/",$img)) return 1;
		return 0;
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