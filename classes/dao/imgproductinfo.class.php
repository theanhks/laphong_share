<?php
/*************************************************************************
Class Ad
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: kimque@ava.vn                                   
Last updated: 08/03/2011
**************************************************************************/
class imgProduct {
	var $id;			# Ad code (primary key)
	var $idpro;
	var $idalpro;
	var $vn_name;
	var $en_name;
	var $file1;		# Ad logo URL
	var $status;		# 0-Disabled, 1-Active, 2-Deleted
	# Constructor
	function imgProduct($idpro,$idalpro,$vn_name,$en_name, $file1,$status, $id = 0)
	{
		$this->id = $id;
		$this->idpro = $idpro;
		$this->idalpro = $idalpro;
		$this->vn_name =stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->file1 = $file1;	
		$this->status = $status;
	}

	function getId() {
		return $this->id;
	}	
	function setId($nValue) {
		$this->id=$nValue;
	}	
	function getIdPro() {
		return $this->idpro;
	}	
	function setIdPro($nValue) {
		$this->idpro=$nValue;
	}
	function getIdAlpro() {
		return $this->idalpro;
	}	
	function setIdAlpro($nValue) {
		$this->idalpro=$nValue;
	}	
	function getFile1() {
		return $this->file1;
	}
	
	function setFile1($nValue) {
		$this->file1=$nValue;
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
	function setStatus($nValue) {
		$this->status = $nValue;
	}
	
	function isImage() {
		if(preg_match("/jpg|png|bmp|gif/",$file1)) return 1;
		return 0;
	}
	function isFlash() {
		if(preg_match("/.swf/",$file1)) return 1;
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