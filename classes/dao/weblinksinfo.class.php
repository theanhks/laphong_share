<?php
/*************************************************************************
Class Weblinks Info
----------------------------------------------------------------
Ava CMS Project
Company: Ava Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated:08/03/2011
**************************************************************************/
class WeblinksInfo {
	var $wId;			# Weblinks code (primary key)
	var $pid;			# Weblinks code (primary key)
	var $url;			# URL
	var $vn_name;		# Vietnamese name
	var $en_name;		# English name
	var $cn_name;		# China name
	var $vn_sapo;		# China name
	var $en_sapo;		# China name
	var $cn_sapo;		# China name
	var $avatar;		# hinh dai dien
	var $status;		# 0-Disabled, 1-Active, 2-Deleted
	var $position;		# Display order
	# Constructor
	function WeblinksInfo($pid=0,$url='', $vn_name='', $en_name='', $cn_name='',$vn_sapo='',$en_sapo='',$cn_sapo='',$avatar='', $position=0, $status=0, $wId = 0)
	{
		$this->wId = $wId;
		$this->pid = $pid;
		$this->url = $url;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->cn_name = stripslashes($cn_name);
		$this->vn_sapo = $vn_sapo;
		$this->en_sapo = $en_sapo;
		$this->cn_sapo = $cn_sapo;
		$this->avatar = $avatar;
		$this->position = $position;
		$this->status = $status;
		
	}
	function getId() {
		return $this->wId;
	}	
	function setId($nValue) {
		$this->wId=$nValue;
	}	
	function getPId() {
		return $this->pid;
	}	
	function setPId($nValue) {
		$this->pid=$nValue;
	}		
	function getUrl() {
		return $this->url;		
	}
	function setUrl($nValue) {
		$this->url=$nValue;
	}
	function getName($lang = 'vn') {
		$key = $lang.'_name';
		return $this->$key;
	}
	function setName($lang = 'vn', $nValue) {
		$key = $lang.'_name';
		$this->$key=stripslashes($nValue);
	}	
	function getSapo($lang = 'vn') {
		$key = $lang.'_sapo';
		return $this->$key;
	}
	function setSapo($lang = 'vn', $nValue) {
		$key = $lang.'_sapo';
		$this->$key=stripslashes($nValue);
	}
	function getAvatar() {
		return $this->avatar;
	}
	function setAvatar($nValue) {
		$this->avatar=stripslashes($nValue);
	}		
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status = $nValue;
	}
	function getPosition() {
		return $this->position;
	}
	function setPosition($nValue) {
		$this->position = $nValue;
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
	function getViewUrl($lang = 'vn', $page=1) {
		$url = '';
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH.'/index.php?op=weblink'.'&pid='.$this->wId.'&lang='.$lang;
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			$url = ROOTPATH.'/'.$lang.'/weblink-'.$this->wId.'.html';
			return $url;		
		} else return '';	
	}
}	
?>