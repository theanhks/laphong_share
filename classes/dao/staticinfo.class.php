<?php
/*************************************************************************
Class Staticinfo
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                  
Last updated: 08/03/2011                                 
**************************************************************************/
class Staticinfo {
	var $sId;			# Primary key
	var $slug;			# Slug
	var $lang;			#lang
	var $vn_name;			# Vietnamese name
	var $en_name;
	var $keywords;		# Vietnamese keywords
	var $vn_sapo;			# Vietnamese sapo
	var $en_sapo;
	var $vn_details;		# Vietnamese details
	var $en_details;	
	var $status;		# Status
	var $position;		# Position
	var $properties;	# Properties
	var $home;			# Home
	var $avatar;			# Category
	
	function Staticinfo ($slug='',$lang='', $vn_name='', $en_name='', $keywords='', $vn_sapo='',$en_sapo='',$vn_details='',$en_details='', $status='',$position='', $home='', $avatar='', $properties = 0,$sId = 0)
	{
		$this->sId = $sId;
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
		$this->position = $position;
		$this->properties = $properties;
		$this->home = $home;
		$this->avatar = $avatar;
	}

	function getId() {
		return $this->sId;
	}	
	function setId($nValue) {
		$this->$sId=$nValue;
	}
	function getHome() {
		return $this->home;
	}	
	function setHome($nValue) {
		$this->$home=$nValue;
	}
	function getAvatar() {
		return $this->avatar;
	}	
	function setAvatar($nValue) {
		$this->$avatar=$nValue;
	}
	function getSlug() {
		return $this->slug;
	}	
	function setSlug($nValue) {
		$this->$slug=stripslashes($nValue);
	}
	function getLang() {
		return $this->lang;
	}	
	function setLang($nValue) {
		$this->$lang=stripslashes($nValue);
	}
	function getName($lang="vn") {
		$key=$lang."_name";
		return $this->$key;
	}
	function setName($nValue,$lang="vn") {
		$key = $lang."_name";
		$this->$key=stripslashes($nValue);
	}
	function getKeywords($nValue) {
		return $this->keywords;
	}
	function setKeywords( $nValue) {
		$this->$keywords=stripslashes($nValue);
	}
	function getSapo($lang="vn") {
		$key = $lang."_sapo";
		return $this->$key;
	}
	function setSapo($nValue,$lang="vn") {
		$key = $lang."_sapo";
		$this->$key=stripslashes($nValue);
	}
	function getDetails($lang="vn") {
		$key = $lang."_details";
		return $this->$key;
	}
	function setDetails( $nVlaue,$lang="vn") {
		$key = $lang."_details";
		$this->$key=stripslashes($nValue);
	}
	function getStatus() {
		return $this->status;
	}
	function getStatusText() {
		global $amessages;
		return $amessages['status_text'][$this->status];
	}	
	function setStatus($nValue) {
		$this->$status = $nValue;
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
	function getProperties() {
		return $this->properties;
	}
	function setProperties($nValue) {
		$this->properties = $nValue;
	}
	
/*-----------------------------------------------------------------------*
* Function: getUrl
* Parameter: lang, include_id (0 - does not include static ID in URL, 1 - include in URL
* Return: URL
*-----------------------------------------------------------------------*/
	# This function only supports 2 levels, e.g http://www.domain.com/vn/static/news/sub_news/
	function getUrl($lang = 'vn', $include_id = 1) {
		$url = '';
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH.'/index.php?op=static'.($include_id?'&Id='.$this->Id:'').'&slug='.$this->slug.'&lang='.$lang;
			return $url;
		} elseif(URL_TYPE == 2) {	
			# SEO
			#$url = ROOTPATH.'/introduction.html';
			$url = ROOTPATH.'/'.$lang.'/'.$this->slug.'-s'.$this->sId.'.html';
			return $url;		
		} else return '';	
	}	
	function getUrlTemplate($lang = 'vn', $include_id = 1) {
		$url = '';
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH.'/index.php?op=category'.'&slug='.$this->slug.'&lang='.$lang.'&page=%s';
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO			
			$url = ROOTPATH."/$lang/".$this->slug.'-s'.$this->sId."/page-%s.html";
			return $url;		
		} else return '';	
	}

}	
?>