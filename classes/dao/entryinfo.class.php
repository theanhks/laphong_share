<?php
/*************************************************************************
Class Entryinfo
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
class Entryinfo {
	var $cId;
	var $nId;
	var $slug;
	var $lang;
	var $vn_name;
	var $en_name;
	var $keywords;
	var $vn_sapo;
	var $en_sapo;
	var $vn_details;
	var $en_details;		
	var $status;
	var $date_created;
	var $avatar;
	var $position;
	var $home;	
	var $popup;
	
	function Entryinfo ($cId, $slug, $lang, $vn_name, $en_name, $keywords, $vn_sapo, $en_sapo, $vn_details, $en_details, $status, $home, $date_created, $avatar='', $position, $popup=0, $nId = 0)
	{
		$this->cId = $cId;
		$this->nId = $nId;
		$this->slug = $slug;
		$this->lang = $lang;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->keywords = stripslashes($keywords);		
		$this->vn_sapo = stripslashes($vn_sapo);
		$this->en_sapo = stripslashes($en_sapo);
		$this->vn_details = stripslashes($vn_details);
		$this->en_details = stripslashes($en_details);		
		$this->status = $status;
		$this->home = $home;
		$this->date_created = $date_created;
		$this->avatar = $avatar;
		$this->position = $position;
		$this->popup = $popup;
	}

	function getId() {
		return $this->nId;
	}	
	function setId($nValue) {
		$this->nId=$nValue;
	}
	function getCId() {
		return $this->cId;
	}
	function getCatName() {
		include_once(ROOT_PATH."classes/dao/categories.class.php");
		$categories = new Categories();
		return $categories->getParentName($this->cId);
	}
	function getSlug() {
		return $this->slug;
	}	
	function setSlug($nValue) {
		$this->slug=stripslashes($nValue);
	}	
	function getLang() {
		return $this->lang;		
	}
	function setLang($nValue) {
		$this->lang=stripslashes($nValue);
	}
	function getAvatar() {
		return $this->avatar;		
	}
	function setAvatar($nValue) {
		$this->avatar=$nValue;
	}
	function getPopup() {
		return $this->popup;		
	}
	function setPopup($nValue) {
		$this->popup=$nValue;
	}
	function getUrl($lang='vn',$page=1) {
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = DOMAIN.(FOLDER?"/".FOLDER:"")."/".SCRIPT."?op=newsdetail&nId=".$this->nId."&content=".$this->slug."&page=$page";		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = ROOTPATH.'/'.$lang."/tin-tuc/".$this->nId.'/'.$this->slug.".html";
			else $url =ROOTPATH.'/'.$lang."/tin-tuc/".$this->nId.'/'.$this->slug.".html";
			return $url;		
		} else return "";	
	}
	function getName($lang = "vn") {
		$key = $lang."_name";
		return refineChar($this->$key);		
	}
	function setName($nValue,$lang = "vn") {
		$key = $lang."_name";
		$this->$key=stripslashes($nValue);
	}	
	function getKeywords() {
		return $this->keywords;
	}
	function setKeyword($nValue) {
		$this->keywords = stripslashes($nValue);
	}	
	function getDateCreated()
	{
		return $this->date_created;
	}	
	function getSapo($lang="vn") {
		$key = $lang."_sapo";
		return $this->$key;
	}
	function setSapo($nValue,$lang = "vn") {
		$key = $lang."_sapo";
		$this->$key=stripslashes($nValue);
	}	
	function getDetails($lang = "vn") {
		$key = $lang."_details";
		return $this->$key;		
	}
	function setDetails($nValue,$lang = "vn") {
		$key = $lang."_details";
		$this->$key=stripslashes($nValue);
	}	
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
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
	function getPosition() {
		return $this->position;
	}
	function setPosition($nValue) {
		$this->position = $nValue;
	}
	function getHome() {
		return $this->home;
	}
	function setHome($nValue) {
		$this->home = $nValue;
	}
	function setDateCreated($nValue)
	{
		$this->date_created = $nValue;
	}	
	# This function only supports 2 sub levels, e.g 'News > Sub level news > Sub level 2 News'
	function getNavigation($lang = 'vn', $seperator = '', $open_tag = '<li>', $close_tag = '</li>') {
		include_once(ROOT_PATH.'classes/dao/entries.class.php');
		$entries = new Entries();
		$str = '';
		$pEntry = $entries->getData($this->cId);
		if($pEntry) {			# Parent category
			$str .= $open_tag.'<a href="'.$pEntry->getUrl($lang).'" title="'.$pEntry->getTitle($lang).'">'.$pEntry->getTitle($lang).'</a>'.$close_tag.$seperator;
			if($pEntry->getCId()) {
				$gpEntry = $entries->getData($pEntry->getCId());
				if($gpEntry) {	# Grand parent cateogry
					$str = $open_tag.'<a href="'.$gpEntry->getUrl($lang).'" title="'.$gpEntry->getTitle($lang).'">'.$gpEntry->getTitle($lang).'</a>'.$close_tag.$seperator.$str;
				}
			}
		}
		$str .= $open_tag.$pEntry->getTitle($lang).$close_tag;	# Current category does not have a link
		return $str;
	}
}	
?>