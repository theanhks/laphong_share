<?php
/*************************************************************************
Class CategoryInfo
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: kimque@ava.vn                                   
Last updated: 08/03/2011
**************************************************************************/


class CategoryInfo {
	var $cId;			# Primary key
	var $pId;			# Parent ID
	var $slug;			# Slug
	var $vn_name;		# Vietnamese name
	var $en_name;		# English name
	var $vn_sapo;
	var $en_sapo;	# Vietnamese details
	var $vn_details;	# English details
	var $en_details;
	var $avatar;
	var $status;		# Status
	var $position;		# Order position
	var $properties;	# Properties
	
	function CategoryInfo ($pId=0, $slug='', $vn_name='', $en_name='',$vn_sapo='', $en_sapo='', $vn_details='', $en_details='', $avatar='', $status='', $position='', $properties = '', $cId = 0)
	{
		$this->cId = $cId;
		$this->pId = $pId;		
		$this->slug = $slug;
		$this->vn_name = stripslashes($vn_name);
		$this->en_name = stripslashes($en_name);
		$this->vn_sapo = stripslashes($vn_sapo);
		$this->en_sapo = stripslashes($en_sapo);
		$this->vn_details = stripslashes($vn_details);
		$this->en_details = stripslashes($en_details);
		$this->avatar = $avatar;
		$this->status = $status;
		$this->position = $position;
		$this->properties = $properties;
	}

	function getId() {
		return $this->cId;
	}	
	function setId($nValue) {
		$this->cId=$nValue;
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
		$this->slug=stripslashes($nValue);
	}
	function getName($lang = 'vn') {
		$key = $lang.'_name';
		return refineChar($this->$key);
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
	function getDetails($lang = 'vn') {
		$key = $lang.'_details';
		return $this->$key;
	}
	function setDetails($lang = 'vn', $nVlaue) {
		$key = $lang.'_details';
		$this->$key=stripslashes($nValue);
	}
	function getAvatar() {
		return $this->avatar;		
	}
	function setAvatar($nValue) {
		$this->avatar=$nValue;
	}
	function getProperties() {
		return $this->properties;		
	}
	function setProperties($nValue) {
		$this->properties=$nValue;
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
	function getPosition() {
		return $this->position;
	}
	function setPosition($nValue) {
		$this->position = $nValue;
	}
	function getPSlug() {
		include_once(ROOT_PATH.'classes/dao/categories.class.php');
		$categories = new Categories();
		$slug = $categories->getParentSlug($this->pId);
		return $slug;
	}

/*-----------------------------------------------------------------------*
* Function: getUrl
* Parameter: lang, include_id (0 - does not include category ID in URL, 1 - include in URL
* Return: URL
*-----------------------------------------------------------------------*/
	# This function only supports 2 levels, e.g http://www.domain.com/vn/category/news/sub_news/
	function getUrl($lang = 'vn', $page=1) {
		$url = '';
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH.'/index.php?op=category'.'&lang='.$lang.'&slug='.$this->slug.'&page='.$page;
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			$url = ROOTPATH."/".$lang."/".$this->slug."-c".$this->cId.".html";
			return $url;		
		} else return '';	
	}
	function getDetailUrl($lang = 'vn', $page=1) {
		$url = '';
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH.'/index.php?op=category'.'&slug='.$this->slug.'&act=details';
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			$url = ROOTPATH.'/'.$this->slug.'-c/details.html';
			return $url;		
		} else return '';	
	}

	function getUrlTemplate($lang = 'vn', $include_id = 1) {
		$url = '';
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH.'/index.php?op=category'.'&slug='.$this->slug.'&lang='.$lang.'&page=%s';
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			#$pSlug = $this->getPSlug();
			$url = ROOTPATH."/$lang/".$this->slug."-c".$this->cId."/page-%s.html";
			return $url;		
		} else return '';	
	}



		
/*	function getUrlTemplate($lang = "vn") {
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = "http://".DOMAIN.(FOLDER?"/".FOLDER:"")."/".SCRIPT."?op=news&lang=$lang&page={page}";		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = "http://".DOMAIN."/news/p/{page}/";
			else $url = "http://".DOMAIN."/news/p/{page}/";
			return $url;		
		} else return "";		
	}
*/
	# This function only supports 2 sub levels, e.g 'News > Sub level news > Sub level 2 News'
	function getNavigation($lang = 'vn', $seperator = '', $open_tag = '<li>', $close_tag = '</li>') {
		include_once(ROOT_PATH.'classes/dao/categories.class.php');
		$categories = new Categories();
		$str = '';
		$pCategory = $categories->getObject($this->pId);
		if($pCategory) {			# Parent category
			$str .= $open_tag.'<a href="'.$pCategory->getUrl($lang).'" title="'.$pCategory->getName($lang).'">'.$pCategory->getName($lang).'</a>'.$close_tag.$seperator;
			if($pCategory->getPId()) {
				$gpCategory = $categories->getObject($pCategory->getPId());
				if($gpCategory) {	# Grand parent cateogry
					$str = $open_tag.'<a href="'.$gpCategory->getUrl($lang).'" title="'.$gpCategory->getName($lang).'">'.$gpCategory->getName($lang).'</a>'.$close_tag.$seperator.$str;
				}
			}
		}
		$str .= $open_tag.$pCategory->getName($lang).$close_tag;	# Current category does not have a link
		return $str;
	}
}	
?>