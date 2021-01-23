<?php
/*************************************************************************
Class Resource
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 26/07/2008
**************************************************************************/
class ResourceInfo {
	var $rId;
	var $aId;
	var $file_name;
	var $file_size;
	var $resource_type;
	var $vn_name;
	var $en_name;
	var $cn_name;
	var $vn_description;
	var $en_description;
	var $cn_description;
	var $date_created;
	var $url;
	var $properties;
	var $status;
	var $position ;
	var $thumbnail_format;
	
	function ResourceInfo($aId, $file_name, $file_size, $resource_type,$vn_name,$en_name,$cn_name,$vn_description, $en_description,$cn_description, $date_created,$url, $properties, $status = 1,$position, $thumbnail_format ='', $rId = 0) {
		$this->rId = $rId;
		$this->aId = $aId;
		$this->file_name = $file_name;
		$this->file_size = $file_size;
		$this->resource_type = $resource_type;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->cn_name = stripslashes($cn_name);
		$this->vn_description = stripslashes($vn_description);
		$this->en_description = stripslashes($en_description);
		$this->cn_description = stripslashes($cn_description);
		$this->date_created = $date_created;
		$this->url = $url;
#		$this->properties = unserialize($properties);
		$this->properties = $properties;
		$this->status = $status;
		$this->position = $position;
		$this->thumbnail_format = $thumbnail_format;
	}

	function getId() {
		return $this->rId;
	}	
	function setId($nValue) {
		$this->rId=$nValue;
	}	
	function getAlbumId() {
		return $this->aId;
	}	
	function setAlbumId($nValue) {
		$this->aId=$nValue;
	}
	function getUrl() {
		return $this->url;
	}	
	function setUrl($nValue) {
		$this->url=$nValue;
	}
	function getUrl_detail($lang='vn') {
		global $customDomain;
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = DOMAIN."/".SCRIPT."?op=gallerydetail&id=".$this->rId."&lang=$lang";		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			$url = ROOTPATH."/$lang/download-bang-gia-".$this->rId.".html";
			return $url;		
		} else return "";	
	}
	
	function getFileName() {
		return $this->file_name;
	}
	function setFileName($nValue) {
		$this->file_name=$nValue;
	}	
	function getStrippedFileName() {
		$str = substr(strstr($this->file_name,"_"),1);
		return $str;
	}
	function getName($lang="vn") {
		$key = $lang."_name";
		return $this->$key;
	}
	function setName($nValue,$lang="vn") {
		$key = $lang."_name";
		$this->$key=stripslashes($nValue);
	}	
	function getDescription($lang="vn") {
		$key = $lang."_description";
		return $this->$key;
	}
	function setDescription($nValue,$lang="vn") {
		$key = $lang."_description";
		$this->$key=stripslashes($nValue);
	}	
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
	}	
	function getDateCreated() {
		return $this->date_created;
	}
	function setDateCreated($nValue) {
		$this->date_created = $nValue;
	}
	function getFileSize() {
		return $this->file_size;
	}
	function setFileSize($nValue) {
		$this->file_size = $nValue;
	}
	function getRoundedFileSize() {
		return round($this->file_size/1024,1);
	}
	function getResourceType() {
		return $this->resource_type;
	}
	function setResourceType($nValue) {
		$this->resource_type = $nValue;
	}		
	function getThumbnailFormat() {
		return $this->thumbnail_format;
	}
	function setThumbnailFormat($nValue) {
		$this->thumbnail_format = $nValue;
	}		
	function getProperty()
	{
		return $this->properties;
	}
	function setProperty($key,$nValue)
	{
		$this->properties[$key]=$nValue;
	}
	function getProperties()
	{
		return $this->properties;
	}
	function setProperties($nValue)
	{
		$this->properties=$nValue;
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

	function isImage() {
		if(preg_match("/jpg|png|bmp|gif|jpeg/",$this->resource_type)) return 1;
		return 0;
	}
	function isVideo() {
		if(preg_match("/wmv|mpg|mp4|mov|avi/",$this->resource_type)) return 1;
		return 0;
	}
	function isFlash() {
		if(preg_match("/swf/",$this->resource_type)) return 1;
		return 0;
	}
	function getPosition() {
		return $this->position;
	}
	function setPosition($nValue) {
		$this->position = $nValue;
	}
}	
?>