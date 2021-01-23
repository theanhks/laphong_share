<?php
/*************************************************************************
Class ProductCategory
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/
class ProCategoryInfo {
	var $pcId;			# Product type code (primary key)
	var $ppcId;			# parent
	var $slug;			# Slug
	var $vn_name;		# Vietnamese name
	var $en_name;		# English name
	var $vn_details;		# Vietnamese name
	var $en_details;		# English name
	var $avatar;
	var $position;		# Position
	
	var $status;		# 0-Disabled, 1-Active, 2-Deleted, 3-Unpublished
	# Constructor
	function ProCategoryInfo($slug, $ppcId, $vn_name, $en_name,$vn_details,$en_details,$avatar, $position, $status, $pcId = 0)
	{
		$this->pcId = $pcId;
		$this->slug = $slug;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->vn_details = stripslashes($vn_details);
		$this->en_details = stripslashes($en_details);
		$this->avatar = stripslashes($avatar);
		$this->position = $position;
		$this->ppcId = $ppcId;
		$this->status = $status;
	}
	function getId() {
		return $this->pcId;
	}	
	function setId($nValue) {
		$this->pcId=$nValue;
	}
	function getSlug() {
		return $this->slug;
	}	
	function setSlug($nValue) {
		$this->slug=$nValue;
	}
	function getName($lang = "vn") {
		$key = $lang."_name";
		return refineChar($this->$key);		
	}
	function setName($nValue,$lang = "vn") {
		$key = $lang."_name";
		$this->$key=stripslashes($nValue);
	}
	function getDetails($lang = "vn") {
		$key = $lang."_details";
		return $this->$key;		
	}
	function setDetails($nValue,$lang = "vn") {
		$key = $lang."_details";
		$this->$key=stripslashes($nValue);
	}
	function getAvatar() {
		return $this->avatar;
	}	
	function setAvatar($nValue) {
		$this->avatar=$nValue;
	}
	function getPosition() {
		return $this->position;
	}	
	function setPosition($nValue) {
		$this->position=$nValue;
	}
	
	function getPPCId() {
		return $this->ppcId;
	}	
	function setPPCId($nValue) {
		$this->ppcId=$nValue;
	}
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
	}
	function getUrl($lang='vn') {
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH."/index.php?op=products&slug=".$this->slug;		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = ROOTPATH."/".$lang."/p".$this->pcId."/".$this->slug.".html";
			else $url = ROOTPATH."/".$lang."/p".$this->pcId."/".$this->slug.".html";
			return $url;		
		} else return "";	
	}
	function getUrlTemplate($lang = 'vn', $include_id = 1) {
		$url = '';
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH.'/index.php?op=products'.'&slug='.$this->slug.'&page=%s';
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			#$pSlug = $this->getPSlug();
			$url = ROOTPATH."/".$this->slug."-p".$this->pcId."/page-%s.html";
			return $url;		
		} else return '';	
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