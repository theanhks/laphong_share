<?php
/*************************************************************************
Class Cart Item
----------------------------------------------------------------
Derasoft CMS Project
Last updated: 09/12/2009
Name: Tran Thi Kim Que
Author: Mai Minh (http://maiminh.vnweblogs.com)
**************************************************************************/
class CartItemInfo {
	var $iId;			# Cart Item ID
	var $sId;			# Session ID
	var $pId;			# Product code (primary key)
	var $slug;			# Slug
	var $product_name;	# Size/Color
	var $product_code;
	var $product_size;
	var $product_color;
	var $quantity;		# Quantity
	var $price;			# Unit price
	var $s_price;			# Unit price
	var $avatar;		# Avatar
	var $time_stamp;	# Time stamp

	# Constructor
	function CartItemInfo($sId, $pId, $slug, $product_name, $product_code, $product_size,$product_color, $quantity, $price, $s_price, $avatar, $time_stamp, $iId = 0)
	{
		$this->iId = $iId;
		$this->sId = $sId;
		$this->pId = $pId;
		$this->slug = $slug;
		$this->product_name = $product_name;
		$this->product_code = $product_code;
		$this->product_size = $product_size;
		$this->product_color = $product_color;
		$this->quantity = $quantity;
		$this->price = $price;
		$this->s_price = $s_price;
		$this->avatar = $avatar;
		$this->time_stamp = $time_stamp;
	}
	function getId() {
		return $this->iId;
	}	
	function setId($nValue) {
		$this->iId=$nValue;
	}
	function getSId() {
		return $this->sId;
	}	
	function setSId($nValue) {
		$this->sId=$nValue;
	}
	
	function getPId() {
		return $this->pId;
	}	
	function setPId($nValue) {
		$this->pId=$nValue;
	}	
	function getSlug() {
		return $this->slug;
	}	
	function setSlug($nValue) {
		$this->slug=$nValue;
	}
	function getProductName() {
		return $this->product_name;		
	}
	function setProductName($nValue) {
		$this->product_name=$nValue;
	}
	function getProductCode() {
		return $this->product_code;		
	}	
	function setProductCode($nValue) {
		$this->product_code=$nValue;
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
		$this->quantity=$nValue;
	}
	function getTimeStamp() {
		return $this->time_stamp;		
	}
	function setTimeStamp($nValue) {
		$this->time_stamp=$nValue;
	}
	function getPrice() {
		return $this->price;		
	}
	function setPrice($nValue) {
		$this->price=$nValue;
	}
	function getSPrice() {
		return $this->s_price;		
	}
	function setSPrice($nValue) {
		$this->s_price=$nValue;
	}
	function getAvatar() {
		return $this->avatar;		
	}
	function setAvatar($nValue) {
		$this->avatar=$nValue;
	}
}	
?>