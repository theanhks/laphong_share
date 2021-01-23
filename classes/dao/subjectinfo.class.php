<?php
/*************************************************************************
Class Subject Info
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 05/10/2009
**************************************************************************/	

class  SubjectInfo {
	var $sId;			# Primary key
	var $slug;			# Slug
	var $vn_name;		# Vietnamese name
	var $en_name;		# English name
	var $cn_name;		# Chinese name
	var $status;		# Status
	function SubjectInfo($slug, $vn_name='', $en_name='', $cn_name='', $status='', $sId=0) {
		$this->sId = $sId;
		$this->slug = $slug;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->cn_name = stripslashes($cn_name);
		$this->status = $status;
	}
	function getId() {
		return $this->sId;
	}	
	function setId($nValue) {
		$this->sId=$nValue;
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
function getUrl($lang='vn') {
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = DOMAIN.(FOLDER?"/".FOLDER:"")."/".SCRIPT."?op=faqs&nId=".$this->nId."&slug=".$this->slug."&lang=$lang&page=$page";		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = DOMAIN."/$lang/faqs/".$this->slug.".html";
			else $url =DOMAIN."/$lang/faqs/".$this->slug.".html";
			return $url;		
		} else return "";	
	}
	
}
?>