<?php
/*************************************************************************
Class AdsGroupInfo
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 05/10/2009
**************************************************************************/	

class  OrderItemInfo {
	var $Id;			# Primary key 
	var $oId;			# Session id
	var $pId;			# Product key
	var $slug;			# Slug
	var $price;			# Price
	var $quantity;		# Price
	var $date_created;	# Date
	var $product_name;		# Status
	var $product_size;		# Status
	var $product_color;
	var $status;		# Status
	function OrderItemInfo($oId='', $pId='', $slug='', $product_name='' ,$product_size = '',$product_color = '', $price=0, $quantity='', $date_created ='', $status='', $Id=0) {
		$this->Id = $Id;
		$this->pId = $pId;
		$this->oId = $oId;
		$this->slug = $slug;
		$this->product_name = $product_name;
		$this->product_size = $product_size;
		$this->product_color = $product_color;
		$this->price = $price;
		$this->quantity = $quantity;
		$this->date_created = $date_created;
		$this->status = $status ;
	}
	function getId() {
		return $this->Id;
	}	
	function setId($nValue) {
		$this->Id = $nValue;
	}
	
	function getPId() {
		return $this->pId;
	}	
	function setPId($nValue) {
		$this->pId = $nValue;
	}
	
	function getOId() {
		return $this->oId;
	}	
	function setOId($nValue) {
		$this->oId = $nValue;
	}
	
	function getSlug() {
		return $this->slug;
	}	
	function setSlug($nValue) {
		$this->slug = $nValue;
	}
	function getProductName() {
		return $this->product_name;
	}	
	function setProductName($nValue) {
		$this->product_name = $nValue;
	}
	function getProductSize() {
		return $this->product_size;		
	}
	function setProductSize($nValue) {
		$this->product_size=$nValue;
	}
	function getProductColor() {
		return $this->product_color;		
	}
	function setProductColor($nValue) {
		$this->product_color=$nValue;
	}
	
	function getQuantity() {
		return $this->quantity;
	}	
	function setQuantity($nValue) {
		$this->quantity = $nValue;
	}
	
	function getPrice() {
		return $this->price;
	}	
	function setPrice($nValue) {
		$this->price = $nValue;
	}
	
	function getDateCreated() {
		return $this->date_created;
	}	
	function setDateCreated($nValue) {
		$this->date_created = $nValue;
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