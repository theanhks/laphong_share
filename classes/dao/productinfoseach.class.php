<?php
/*************************************************************************
Class Product
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
class ProductInfoSearch {
	var $pId;			# Product code (primary key)
	var $slug;			# Slug
	var $vn_name;		# Name
	var $en_name;		# Intro
	var $vn_details;	# Description
	var $en_details;	# Description
	var $vn_nsx;			# Description
	var $en_nsx;			# Description
	var $vn_nhanhieu;			# Description
	var $en_nhanhieu;			# Description
	var $price;			# gia moi
	var $s_price;		# gioi cu
	var $avatar;		# Avatar URL
	var $file1;
	var $file2;
	var $file3;
	var $file4;
	var $file5;
	var $position;
	var $date_published;# Date published
	var $num_product; 	# Number product
	var $category;		# Category
	var $status;		# 0-Disabled, 1-Active, 2-Deleted, 3-Unpublished
	var $payment;		# san pham chinh
	var $viewed;		# san pham ban chay
	var $home;			# san pham moi

	# Constructor
	
	
	function ProductInfoSearch($slug, $vn_name, $en_name,  $pId = 0)
	{
		$this->pId = $pId;
		$this->slug = $slug;
		$this->en_name = stripslashes($en_name);
		$this->vn_name = stripslashes($vn_name);

	}
	
	function getId() {
		return $this->pId;
	}	
	function setId($nValue) {
		$this->pId=$nValue;
	}
	function getSlug() {
		return $this->slug;
	}	
	function setSlug($nValue) {
		$this->slug=$nValue;
	}
	function refinetooltip_name($lang="vn")
	{  
		$key = $lang."_name";
		return str_replace(array("\r", "\n", "'", '"'), array("", "", "\'", '&quot;'), $this->$key);
	}
	function getName($lang = "vn") {
		$key = $lang."_name";
		return refineChar($this->$key);		
	}
	function setName($nValue,$lang = "vn") {
		$key = $lang."_name";
		$this->$key=stripslashes($nValue);
	}
	
	function refinetooltip($lang="vn")
	{  
		$key = $lang."_details";
		return str_replace(array("\r", "\n", "'", '"'), array("", "", "\'", '&quot;'), $this->$key);
	}
	function getDetails($lang = "vn") {
		$key = $lang."_details";
		return $this->$key;		
	}
	function setDetails($nValue,$lang = "vn") {
		$key = $lang."_details";
		$this->$key=stripslashes($nValue);
	}
	function getNhanhieu($lang = "vn") {
		$key = $lang."_nhanhieu";
		return $this->$key;		
	}
	function setNhanhieu($nValue,$lang = "vn") {
		$key = $lang."_nhanhieu";
		$this->$key=stripslashes($nValue);
	}
	function getNSX($lang = "vn") {
		$key = $lang."_nsx";
		return $this->$key;		
	}
	function setNSX($nValue,$lang = "vn") {
		$key = $lang."_nsx";
		$this->$key=stripslashes($nValue);
	}
	function getPrice() {
		return $this->price;		
	}
	function setPrice($nValue) {
		$this->price=stripslashes($nValue);
	}
	function getSPrice() {
		return $this->s_price;		
	}
	function setSPrice($nValue) {
		$this->s_price=stripslashes($nValue);
	}	
	function getPosition() {
		return $this->position;
	}	
	function setPosition($nValue) {
		$this->position=$nValue;
	}
	function getAvatar() {
		return $this->avatar;
	}	
	function setAvatar($nValue) {
		$this->avatar=$nValue;
	}
	function getFile1() {		
		return $this->file1;
	}

	function getFile2() {		
		return $this->file2;
	}
	function getFile($num) {
		$key = "file".$num;
		return unserialize($this->$key);
	}	
	function setFile($num,$nValue) {
		$key = "file".$num;
		$this->$key=$nValue;
	}
	function getDatePublished() {
		return $this->date_published;
	}	
	function setDatePublished($nValue) {
		$this->date_published=$nValue;
	}
	function getNumProduct() {
		return $this->num_product;
	}	
	function setNumProduct($nValue) {
		$this->num_product=$nValue;
	}
	function getCategory() {
		return $this->category;
	}	
	function setCategory($nValue) {
		$this->category=$nValue;
	}
	function getPayment() {
		return $this->payment;
	}	
	function setPayment($nValue) {
		$this->payment=$nValue;
	}
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
	}
	
	function getViewed() {
		return $this->viewed;
	}	
	function setViewed($nValue) {
		$this->viewed=$nValue;
	}
	/*
	function getProperty($key)
	{
		$properties = $this->getProperties($this->properties) ;
		return isset($properties[$key])?$properties[$key]:'';
	}*/
	function getProperty($key)
	{
		$properties = $this->getProperties($this->properties) ;
		return isset($properties[$key])?$properties[$key]:'';
	}
	function getProperties($key)
	{
		return unserialize($this->properties);
	}
	function setProperties()
	{
		return $this->properties;
	}
	function setProperty($key,$nValue)
	{
		$this->properties[$key]=$nValue;
	}
	function getViewUrl($lang='vn') {
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH."/index.php?op=productdetail&slug=".$this->slug."&id=".$this->pId;		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = ROOTPATH."/".$this->pId."/".$this->slug.".html";
			else $url = ROOTPATH."/".$this->pId."/".$this->slug.".html";
			return $url;		
		} else return "";	
	}
	function getViewQuickUrl($lang='vn') {
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH."/index.php?op=productdetail&slug=".$this->slug."&id=".$this->pId;		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = ROOTPATH."/".$this->slug."-".$this->pId."-quick.html";
			else $url = ROOTPATH."/".$this->slug."-".$this->pId."-quick.html";
			return $url;		
		} else return "";	
	}
	function getCartUrl($lang='vn') {
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH."/index.php?op=shopping&slug=".$this->slug."&id=".$this->pId;		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = ROOTPATH."/".$this->slug."-".$this->pId."-shopping.html";
			else $url = ROOTPATH."/".$this->slug."-".$this->pId."-shopping.html";
			return $url;		
		} else return "";	
	}	
	function getHome() {
		return $this->home;
	}	
	function setHome($nValue) {
		$this->home=$nValue;
	}
	function isNew() {
		$year = date("Y");
		$month = date("m");
		$day = date("d");
		$last_week = date("Y-m-m H:i:s",mktime(0,0,0,$month,$day-7,$year));
		if($this->date_published > $last_week) return 1;
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
	function getPhenotype($uploadDir,$name)	{
		$filepath = ROOT_PATH.$uploadDir.$name;
		$size_info=getimagesize($filepath);
		if($size_info[0]>$size_info[1])
			return 1; // hinh nam
		 if($size_info[0]<$size_info[1])
			return 2; // hinh dung
		return 0; // hinh vuong
	}

	function getWidth($uploadDir,$name)	{
			$filepath = ROOT_PATH.$uploadDir.$name;
			$size_info=getimagesize($filepath);
				return $size_info[0];
	}
	function getHeight($uploadDir,$name)	{
			$filepath = ROOT_PATH.$uploadDir.$name;
			$size_info=getimagesize($filepath);
				return $size_info[1];
	}

}
?>