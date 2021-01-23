<?php
/*************************************************************************
Class User Info
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Author: Mai Minh
Email: info@derasoft.com                                    
Last updated: 29/09/2009
**************************************************************************/
class StudentsInfo {
	var $id;
	var $classes;
	var $lang;
	var $fname;
	var $note;
	var $email;
	var $company;
	var $address;
	var $tel;
	var $cell;
	var $status;
	var $date_created;
	var $position;
	var $properties;

	function StudentsInfo( $classes,$lang, $fname, $note, $email, $company, $address, $tel, $cell,$tax,$date_created, $status,$position, $properties = '', $id = 0 )
	{
		$this->id = $id;
		$this->classes = $classes;
		$this->lang = $lang;
		$this->fname = $fname;
		$this->note = $note;
		$this->email = $email;			
		$this->company = $company;
		$this->address = $address;
		$this->tel = $tel;
		$this->cell = $cell;
		$this->tax = $tax;			
		$this->status = $status;// by defaults, users are in status "active"
		$this->position = $position;			
		$this->date_created = $date_created;	
		$this->properties = $properties;	
	}
	function getId()
	{
		return $this->id;
	}
	function setId($nValue) {
		$this->id = $nValue;
	}
	function getClasses()
	{
	  return $this->classes;
	}
	function setClasses($nValue) {
		$this->classes = $nValue;
	}
	function getLang() {
		return $this->lang;		
	}
	function setLang($nValue) {
		$this->lang=stripslashes($nValue);
	}
	function getFName()
	{
	  return $this->fname;
	}
	function setFName($nValue) {
		$this->fname = $nValue;
	}
	function getNote()
	{
	  return $this->note;
	}
	function setNote($nValue) {
		$this->note = $nValue;
	}
	function getEmail()
	{
		return $this->email;
	}
	function setEmail($nValue)
	{
		$this->email = $nValue;
	}
	function getCompany() 
	{
		return $this->company;
	}
	function setCompany($nValue) {
		$this->company = $nValue;
	}
	function getTax() 
	{
		return $this->tax;
	}
	function setTax($nValue) {
		$this->tax = $nValue;
	}
	
	function getAddress() 
	{
		return $this->address;
	}
	function setAddress($nValue) {
		$this->address=$nValue;
	}
	function getTel() 
	{
		return $this->tel;
	}
	function setTel($nValue) 
	{
		$this->tel = $nValue;
	}
	function getCell() 
	{
		return $this->cell;
	}
	function setCell($nValue) 
	{
		$this->cell = $nValue;
	}
	function getDateCreated()
	{
		return $this->date_created;
	}
	function setDateCreated($nValue) 
	{
		$this->date_created = $nValue;
	}
	function getStatus()
	{
		return( $this->status );
	}
	function setStatus($nValue) 
	{
		$this->status = $nValue;
	}
	function getPosition() {
		return $this->position;
	}
	function setPosition($nValue) {
		$this->position = $nValue;
	}
	function getProperties()
	{
		return $this->properties;
	}
	function setProperties($nValue)
	{
		$this->properties=$nValue;
	}
	function getProperty($key)
	{
		return isset($this->properties[$key])?$this->properties[$key]:'';
	}
	function setProperty($key,$nValue)
	{
		$this->properties[$key]=$nValue;
	}
	
	function isWebmaster()
	{
		if($this->type == WEBMASTER) return 1;
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
}
?>