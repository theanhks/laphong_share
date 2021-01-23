<?php
/*************************************************************************
Class AdsGroupInfo
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011   
**************************************************************************/	

class  TextbannerInfo {
	var $id;			# Primary key
	var $vn_name;		# Vietnamese name
	var $en_name;		# English name
	var $url;		# English name
	var $positon;		# English name
	var $status;		# Status
	function TextbannerInfo($vn_name='', $en_name='',$url,$positon=0, $status=0, $id=0) {
		$this->id = $id;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->status = $status;
		$this->position = $positon;
		$this->url = $url;
	}
	function getId() {
		return $this->id;
	}	
	function setId($nValue) {
		$this->id=$nValue;
	}
	function getName($lang = 'vn') {
		$key = $lang.'_name';
		return $this->$key;
	}
	function setName($lang = 'vn', $nValue) {
		$key = $lang.'_name';
		$this->$key=stripslashes($nValue);
	}
	function getPosition() {
		return $this->position;
	}	
	function setPosition($nValue) {
		$this->position=$nValue;
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
	function getViewUrl($lang='vn') {
		$url = "";
		$slug=removeSign($this->position);
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH."/index.php?op=tuyendungdetail&lang=$lang&slug=".$slug."&id=".$this->id;		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = ROOTPATH."/$lang/tuyen-dung/".$slug."-".$this->id.".html";
			else $url = ROOTPATH."/$lang/tuyen-dung".$slug."-".$this->id.".html";
			return $url;		
		} else return "";
	}
	
	
}
?>