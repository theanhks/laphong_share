<?php
/*************************************************************************
Class Album
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen
Last updated: 07/10/2009
**************************************************************************/
class GalleryInfo {
	var $aId;
	var $slug;
	var $pId;
	var $vn_name;
	var $en_name;
	var $cn_name;
	var $vn_description;
	var $en_description;
	var $cn_description;
	var $private;			
	var $status;
	var $date_created;
	var $resources;
	var $children;
	var $avatarId;
	var $position;
	function GalleryInfo($slug, $pId, $vn_name,$en_name, $cn_name, $vn_description, $en_description, $cn_description, $private, $status, $date_created, $resources,$children, $avatarId, $position, $aId = 0) {
		$this->aId = $aId;
		$this->slug = $slug;
		$this->pId = $pId;
		$this->avatarId = $avatarId;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->cn_name = stripslashes($cn_name);
		$this->vn_description = stripslashes($vn_description);
		$this->en_description = stripslashes($en_description);
		$this->cn_description = stripslashes($cn_description);
		$this->private = $private;
		$this->status = $status;
		$this->date_created = $date_created;
		$this->resources = $resources;
		$this->children = $children;
		$this->position = $position;
	}

	function getId() {
		return $this->aId;
	}	
	function setId($nValue) {
		$this->aId=$nValue;
	}	
	function getPId() {
		return $this->pId;
	}	
	function setPId($nValue) {
		$this->pId=$nValue;
	}
	function getAvatarId() {
		return $this->avatarId;
	}	
	function setAvatarId($nValue) {
		$this->avatarId=$nValue;
	}		
	function getName($lang="vn") {
		$key = $lang."_name";
		return htmlspecialchars($this->$key);		
	}
	function setName($nValue,$lang="vn") {
		$key = $lang."_name";
		$this->$key=stripslashes($nValue);
	}	
	function getSlug() {
		return $this->slug;		
	}
	function setSlug($nValue) {
		$this->slug=stripslashes($nValue);
	}	
	function getUrl($lang='vn') {
		global $customDomain;
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = OMAIN.(FOLDER?"/".FOLDER:"")."/".SCRIPT."?op=gallery&aId=".$this->aId."&lang=$lang";		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			$url = DOMAIN."/$lang/gallery/".$this->aId."/".$this->slug.".html";
			return $url;		
		} else return "";	
	}
	
	function getUrlGalleryAlbum($lang='vn') {
		global $customDomain;
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH."?op=galleryresource&content=".$this->slug."&lang=$lang";		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			$url = ROOTPATH."/$lang/gallery/".$this->slug."-".$this->aId.".html";
			return $url;		
		} else return "";	
	}
	
	function getUrlTemplate($albumId=0,$lang = "vn",$slug="album") {
		global $customDomain;
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = "http://".($customDomain?$customDomain:DOMAIN)."/".FOLDER."/".SCRIPT."?op=gallery&lang=$lang&aId=$albumId&page={page}";
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = "http://".($customDomain?$customDomain:$this->file_name.".".DOMAIN)."/r/".$this->id."/".$lang.($albumId?"/album/$albumId/{page}":"")."/$slug".($albumId?"":"album{page}").".html";
			else $url = "http://".($customDomain?$customDomain:"www.".DOMAIN)."/r/".$this->file_name."/".$this->id."/".$lang.($albumId?"/album/$albumId/{page}":"")."/$slug".($albumId?"":"album{page}").".html";
			return $url;
		} else return "";		
	}	
	function getDescription($lang="vn") {
		$key = $lang."_description";
		return $this->$key;
	}
	function setDescription($nVlaue,$lang="vn") {
		$key = $lang."_description";
		$this->$key=stripslashes($nValue);
	}	
	function getPrivate() {
		return $this->private;
	}
	function setPrivate($nValue) {
		$this->private = $nValue;
	}
	function getStatus() {
		return $this->status;
	}
	function getStatusText() {
		global $amessages;
		return $amessages['status_text'][$this->status];
	}	
	function setStatus($nValue) {
		$this->status = $nValue;
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
	function getDateCreated() {
		return $this->date_created;
	}
	function setDateCreated($nValue) {
		$this->date_created = $nValue;
	}	
	function getResources() {
		return $this->resources;
	}
	function setResources($nValue) {
		$this->resources = $nValue;
	}
	function getChildren() {
		return $this->children;
	}
	function setChildren($nValue) {
		$this->children = $nValue;
	}
	function getPosition() {
		return $this->position;
	}
	function setPosition($nValue) {
		$this->position = $nValue;
	}		
}	
?>