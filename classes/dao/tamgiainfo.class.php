<?php
/*************************************************************************
Class TamGiaInfo
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 05/10/2009
**************************************************************************/	

class  TamGiaInfo {
	var $agId;			# Primary key
	var $vn_name;		# Vietnamese name
	var $en_name;		# English name
	var $status;		# Status
	var $code;
	var $count ;
	
	var $pricefrom ;
	var $priceto   ;
	
	function TamGiaInfo($vn_name='', $en_name='', $status='', $code='', $pricefrom=0, $priceto=0, $agId=0, $count=0) {
		$this->agId = $agId;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->status = $status;
		$this->code = stripslashes($code);
		
		$this->pricefrom = $pricefrom;
		$this->priceto = $priceto;
		
		$this->count = $count;
	}
	function getPricefrom() {
		return $this->pricefrom;
	}	
	function getPriceto() {
		return $this->priceto;
	}	
	function setPricefrom($pricefrom) {
		$this->pricefrom = $pricefrom;
	}	
	function setPriceto($priceto) {
		$this->priceto = $priceto;
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

	function getUrl($lang='vn') {
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH."/index.php?op=products&lang=$lang&nsx=".$this->agId;		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = ROOTPATH."/nsx-".$this->agId.".html";
			else $url = ROOTPATH."/nsx-/".$this->agId."-p.html";
			return $url;		
		} else return "";	
	}
}
?>