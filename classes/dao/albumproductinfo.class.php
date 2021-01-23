<?php
/*************************************************************************
Class ProductCategory
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/
class albumProduct{
	var $id;			# Product type code (primary key)
	var $idpro;			# parent
	var $slug;			# Slug
	var $vn_name;		# Vietnamese name
	var $en_name;		# English name
	var $position;		# Position
	var $status;		# 0-Disabled, 1-Active, 2-Deleted, 3-Unpublished
	# Constructor
	function albumProduct($slug, $idpro, $vn_name, $en_name, $position, $status, $id = 0)
	{
		$this->id = $id;
		$this->slug = $slug;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->position = $position;
		$this->idpro = $idpro;
		$this->status = $status;
	}
	function getId() {
		return $this->id;
	}	
	function setId($nValue) {
		$this->id=$nValue;
	}
	function getSlug() {
		return $this->slug;
	}	
	function setSlug($nValue) {
		$this->slug=$nValue;
	}
	function getName($lang = "vn") {
		$key = $lang."_name";
		return $this->$key;		
	}
	function setName($nValue,$lang = "vn") {
		$key = $lang."_name";
		$this->$key=stripslashes($nValue);
	}
	function getPosition() {
		return $this->position;
	}	
	function setPosition($nValue) {
		$this->position=$nValue;
	}
	function getIdPro() {
		return $this->idpro;
	}	
	function setIdPro($nValue) {
		$this->idpro=$nValue;
	}
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
	}
	function getUrl($lang='vn',$idpro) {
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH."/index.php?op=albumproduct&lang=$lang&idpro=$idpro&slug=".$this->slug;		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = ROOTPATH."/$lang/albumproduct-".$this->slug."-$idpro.html";
			else $url = ROOTPATH."/$lang/albumproduct-".$this->slug."-$idpro.html";
			return $url;		
		} else return "";	
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