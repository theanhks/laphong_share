<?php
/*************************************************************************
Class Order Item
----------------------------------------------------------------
Derasoft CMS Project
Created: 28/11/2008
Last updated: 29/12/2008
Author: Mai Minh (http://maiminh.vnweblogs.com)
**************************************************************************/
class OrderInfo {
	var $oId;			# Order ID
	var $code;			# Order code
	var $cId;			# Customer ID
	var $name;
	var $email;	
	var $address;
	var $province;
	var $tel;
	var $cell;
	var $rname;
	var $raddress;
	var $rprovince;
	var $rtel;
	var $rcell;
	var $rdate;
	var $gift_box;
	var $comment;
	var $date_created;
	var $last_updated;
	var $status;
	var $deposited;

	# Constructor
	function OrderInfo($code, $cId, $name, $email, $address, $province, $tel, $cell, $rname, $raddress, $rprovince, $rtel, $rcell, $rdate, $gift_box, $comment, $date_created, $last_updated, $status, $oId = 0, $deposited = 0)
	{
		$this->code = $code;
		$this->oId = $oId;
		$this->cId = $cId;
		$this->name = stripslashes($name);
		$this->email = $email;
		$this->address = stripslashes($address);
		$this->province = $province;
		$this->tel = $tel;
		$this->cell = $cell;
		$this->rname = stripslashes($rname);
		$this->raddress = stripslashes($raddress);
		$this->rprovince = $rprovince;
		$this->rtel = $rtel;
		$this->rcell = $rcell;		
		$this->rdate = $rdate;
		$this->gift_box = $gift_box;
		$this->comment = stripslashes($comment);
		$this->date_created = $date_created;		
		$this->last_updated = $last_updated;
		$this->status = $status;
		$this->deposited = $deposited;
	}
	function getCode() {
		return $this->code;
	}	
	function setCode($nValue) {
		$this->code=$nValue;
	}
	function getId() {
		return $this->oId;
	}	
	function setId($nValue) {
		$this->oId=$nValue;
	}
	function getCId() {
		return $this->cId;
	}
	function setCId($nValue) {
		$this->cId=$nValue;
	}
	function getName() {
		return $this->name;
	}	
	function setName($nValue) {
		$this->name=stripslashes($nValue);
	}
	function getEmail() {
		return $this->email;
	}	
	function setEmail($nValue) {
		$this->email=$nValue;
	}
	function getAddress() {
		return $this->address;
	}	
	function setAddress($nValue) {
		$this->address=stripslashes($nValue);
	}
	function getTel() {
		return $this->tel;
	}	
	function setTel($nValue) {
		$this->tel=$nValue;
	}
	function getCell() {
		return $this->cell;
	}	
	function setCell($nValue) {
		$this->cell=$nValue;
	}
	function getProvince() {
		return $this->province;
	}	
	function setProvince($nValue) {
		$this->province=$nValue;
	}
	function getRName() {
		return $this->rname;
	}	
	function setRName($nValue) {
		$this->rname=stripslashes($nValue);
	}
	function getRAddress() {
		return $this->raddress;
	}	
	function setRAddress($nValue) {
		$this->raddress=stripslashes($nValue);
	}
	function getRTel() {
		return $this->rtel;
	}
	function setRTel($nValue) {
		$this->rtel=$nValue;
	}
	function getRCell() {
		return $this->rcell;
	}	
	function setRCell($nValue) {
		$this->rcell=$nValue;
	}
	function getRProvince() {
		return $this->rprovince;
	}	
	function setRProvince($nValue) {
		$this->rprovince=$nValue;
	}
	function getRDate() {
		return $this->rdate;
	}	
	function setRDate($nValue) {
		$this->rdate=$nValue;
	}
	function getGiftBox() {
		return $this->gift_box;
	}	
	function setGiftBox($nValue) {
		$this->gift_box=$nValue;
	}
	function getComment() {
		return $this->comment;
	}	
	function setComment($nValue) {
		$this->comment=stripslashes($nValue);
	}
	function getDateCreated() {
		return $this->date_created;
	}	
	function setDateCreated($nValue) {
		$this->date_created=$nValue;
	}
	function getLastUpdated() {
		return $this->last_updated;
	}	
	function setLastUpdated($nValue) {
		$this->last_updated=$nValue;
	}
	function getStatus() {
		return $this->status;
	}	
	function setStatus($nValue) {
		$this->status=$nValue;
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
	function getDeposited() {
		return $this->deposited;
	}	
	function setDeposited($nValue) {
		$this->deposited=$nValue;
	}
	function getEditUrl() {
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = "http://".DOMAIN.(FOLDER?"/".FOLDER:"")."/".SCRIPT."?op=editorderinfo&orderCode=".$this->code;		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = "http://".DOMAIN."/editorderinfo/".$this->code."/";
			else $url = "http://".DOMAIN."/editorderinfo/".$this->code."/";
			return $url;		
		} else return "";	
	}
	function getGrandTotal() {
		$result = mysql_query("SELECT SUM(quantity*price) FROM ".DB_PREFIX."order_items WHERE oid='".$this->oId."'");
		if(mysql_num_rows($result)) {
			$row = mysql_fetch_row($result);
			mysql_free_result($result);
			return $row[0];
		}
		return 0;
	}
}
?>