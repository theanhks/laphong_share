<?php
/*************************************************************************
Class MemberInfo
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                               
Last updated: 26/10/2009
**************************************************************************/
class QuestionInfo {
	var $Id;			# Primary key
	var $sId;			# Subject question
	var $slug;			# Slug
	var $people;		# people
	var $lang;			#lang
	var $address;		# address
	var $tel;			# tel
	var $email;			# email
	var $questions;		# questions
	var $answers;		# answers
	var $date_created;
	var $file_upload;	# file_upload
	var $status;		# Status
	var $position;		# Position
	
	function QuestionInfo ($sId=0, $slug, $people='',$lang='', $address='', $tel='', $email='', $questions='', $answers='',$date_created,$file_upload='', $status='', $position='', $Id = 0)
	{
		$this->Id = $Id;
		$this->sId = $sId;
		$this->slug = $slug;
		$this->lang = $lang;
		$this->people = $people;
		$this->address = $address;		
		$this->tel = $tel;
		$this->email = stripslashes($email);
		$this->questions = stripslashes($questions);
		$this->answers = stripslashes($answers);
		$this->date_created = $date_created;
		$this->file_upload = stripslashes($file_upload);
		$this->status = $status;
		$this->position = $position;
	}

	function getId() {
		return $this->Id;
	}	
	function setId($nValue) {
		$this->Id=$nValue;
	}
	function getSlug() {
		return $this->slug;
	}	
	function setSlug($nValue) {
		$this->slug=$nValue;
	}
	function getSId() {
		return $this->sId;
	}	
	function setSId($nValue) {
		$this->sId=$nValue;
	}
	function getPeople() {
		return $this->people;
	}
	function setPeople($nValue) {
		$this->people=$nValue;
	}
	function getLang() {
		return $this->lang;
	}
	function setLang($nValue) {
		$this->lang = $nValue;
	}
	function getAddress() {
		return $this->address;
	}
	function setAddress($nValue) {
		$this->address = $nValue;
	}
	
	function getTel() {
		return $this->tel;
	}
	function setTel($nValue) {
		$this->tel = $nValue;
	}
	function getEmail() {
		return $this->email;
	}
	function setEmail($nValue) {
		$this->email = $nValue;
	}
	function getQuestions() {
		return $this->questions;
	}
	function setQuestions($nValue) {
		$this->questions = $nValue;
	}
	function getAnswers() {
		return $this->answers;
	}
	function setAnswers($nValue) {
		$this->answers = $nValue;
	}
	function getDateCreated()
	{
		return $this->date_created;
	}	
	function setDateCreated($nValue)
	{
		$this->date_created = $nValue;
	}
	function getFile_upload() {
		return $this->file_upload;
	}
	function setFile_upload($nValue) {
		$this->file_upload = $nValue;
	}
	function getPosition() {
		return $this->position;
	}	
	function setPosition($nValue) {
		$this->position=$nValue;
	}
	function getStatus() {
		return $this->status;
	}
	
	function getUrl($lang='vn') {
		$slug=removeSign($this->slug);
		$url = "";
		if(URL_TYPE == 1) {			# Query string
			$url = ROOTPATH."index.php?op=questiondetail&slug=".$this->slug."&lang=$lang&id=".$this->Id;		
			return $url;
		} elseif(URL_TYPE == 2) {	# SEO
			if(SUB_DOMAIN) $url = ROOTPATH."/"."questions/".$slug."-".$this->Id.".html";
			else $url =ROOTPATH."/"."questions/".$slug."-".$this->Id.".html";
			return $url;		
		} else return "";	
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
	
}	
?>