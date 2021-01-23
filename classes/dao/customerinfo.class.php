<?php
/*************************************************************************
Class AdsGroupInfo
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/	

class  CustomerInfo {
	var $id;
	var $nhomid;		# Primary key
	var $ngonnguid;		# Primary key
	var $dotuoiid;		# Primary key
	var $name;			# Vietnamese name
	var $address;		# English name
	var $email;			# English name
	var $tel;			# English name
	var $status;		# Status
	function CustomerInfo($nhomid='',$ngonnguid='',$dotuoiid='', $name='',$address='',  $email='',$tel='', $status='', $id=0) {
		$this->id = $id;
		$this->nhomid = $nhomid;
		$this->ngonnguid = $ngonnguid;
		$this->dotuoiid = $dotuoiid;
		$this->name = stripslashes($name);
		$this->address = stripslashes($address);
		$this->email = $email;
		$this->tel = $tel;
		$this->status = $status;
	}
	function getId() {
		return $this->id;
	}	
	function setId($nValue) {
		$this->id=$nValue;
	}
	function getNhom() {
		return $this->nhomid;
	}	
	function setNhom($nValue) {
		$this->nhomid=$nValue;
	}
	function getNgonngu() {
		return $this->ngonnguid;
	}	
	function setNgonngu($nValue) {
		$this->ngonnguid=$nValue;
	}
	function getDotuoi() {
		return $this->dotuoiid;
	}	
	function setDotuoi($nValue) {
		$this->dotuoiid=$nValue;
	}
	function getName() {
		return $this->name;
	}
	function setName( $nValue) {
		$this->name=stripslashes($nValue);
	}
	
	function getAddress() {
		return $this->address;
	}	
	function setAddress($nValue) {
		$this->address=$nValue;
	}
	function getEmail() {
		return $this->email;
	}	
	function setEmail($nValue) {
		$this->email=$nValue;
	}
	function getTel() {
		return $this->tel;
	}	
	function setTel($nValue) {
		$this->tel=$nValue;
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

	
}
?>