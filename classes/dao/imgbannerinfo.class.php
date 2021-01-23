<?php
/*************************************************************************
Class Ad
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: kimque@ava.vn                                   
Last updated: 08/03/2011
**************************************************************************/
class ImgbannerInfo {
	var $id;			# Ad code (primary key)
	var $gid;			# Gid		
	var $logo_url;		# Ad logo URL
	var $url;			# Ad URL
	var $status;		# 0-Disabled, 1-Active, 2-Deleted
	var $position;		# Display order
	var $vn_name;	
	var $en_name;
	var $vn_details;
	var $en_details;
	# Constructor
	function ImgbannerInfo($logo_url, $url, $vn_name,$en_name,$vn_details,$en_details,$position, $status, $id = 0)
	{
		$this->id = $id;
		$this->logo_url = $logo_url;
		$this->url = $url;	
		$this->vn_name = $vn_name;
		$this->en_name = $en_name;
		$this->vn_details = $vn_details;
		$this->en_details = $en_details;
		$this->status = $status;
		$this->position = $position;
		
	}

	function getId() {
		return $this->id;
	}	
	function setId($nValue) {
		$this->ids=$nValue;
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
	function getName($lang = 'vn') {
		$key = $lang.'_name';
		return $this->$key;
	}
	function setName($lang = 'vn', $nValue) {
		$key = $lang.'_name';
		$this->$key=stripslashes($nValue);
	}
	function getDetails($lang = 'vn') {
		$key = $lang.'_details';
		return $this->$key;
	}
	function setDetails($lang = 'vn', $nVlaue) {
		$key = $lang.'_details';
		$this->$key=stripslashes($nValue);
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
	function getDetailUrl($lang = 'vn') {
		$url = '';
		$slug = removeSign($this->vn_name);
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH.'/index.php?op=customerdetails'.'&slug='.$slug.'&lang='.$lang.'&id='.$this->id;
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			$url = ROOTPATH.'/'.$lang.'/khach-hang/'.$slug.'-'.$this->id.'.html';
			return $url;		
		} else return '';	
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