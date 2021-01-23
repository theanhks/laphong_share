<?php
/*************************************************************************
Class SupportInfo
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                   
Last updated: 25/11/2009
**************************************************************************/	

class  SupportInfo {
	var $Id;			# Primary key
	var $paId;			# Parts Id
	var $vn_name;		# Full name
	var $en_name;		# Full name
	var $telephone;		# Telephone
	var $cellphone;		# Cellphone
	var $nick_yahoo;	# Nick yahoo
	var $nick_skype;	# Nick skype
	var $status;		# Status
	var $position;		# Position
	function SupportInfo($paId=0, $vn_name='', $en_name='' , $telephone='', $cellphone='', $nick_yahoo='', $nick_skype='', $status='', $position='', $Id=0) {
		$this->Id = $Id;
		$this->paId = $paId;
		$this->vn_name = $vn_name;
		$this->en_name = $en_name;
		$this->telephone = $telephone;
		$this->cellphone = $cellphone;
		$this->nick_yahoo = $nick_yahoo;
		$this->nick_skype = $nick_skype;
		$this->status = $status;
		$this->position = $position;
	}
	function getId() {
		return $this->Id;
	}	
	function setId($nValue) {
		$this->Id=$nValue;
	}
	function getParts() {
		return $this->paId;
	}
	function setParts() {
		$this->paId=$nValue;
	}
	function getName($lang = "vn") {
		$key = $lang."_name";
		return $this->$key;		
	}
	function setName($nValue,$lang = "vn") {
		$key = $lang."_name";
		$this->$key=stripslashes($nValue);
	}	
	function getTelephone() {
		return $this->telephone;
	}
	function setTelephone() {
		$this->telephone=$nValue;
	}
	function getCellphone() {
		return $this->cellphone;
	}
	function setCellphone() {
		$this->cellphone=$nValue;
	}
	function getNickYahoo() {
		return $this->nick_yahoo;
	}
	function setNickYahoo() {
		$this->nick_yahoo=$nValue;
	}
	function getNickSkype() {
		return $this->nick_skype;
	}
	function setNickSkype() {
		$this->nick_skype=$nValue;
	}
	function getPosition() {
		return $this->position;
	}
	function setPosition() {
		$this->position=$nValue;
	}
	function getStatus() {
		return $this->status;
	}
	
	function CheckOnlineYahoo($nick) {
		$query=file("http://opi.yahoo.com/online?u=$nick&amp;t=2");
		if (strpos($query[0],"NOT ONLINE")==0)
			return 1;
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