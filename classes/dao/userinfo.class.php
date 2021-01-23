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
class UserInfo {
	var $id;
	var $username;
	var $password;
	var $about;
	var $email;
	var $type;	# guest-0, member-1, vip-2, staff-6, webmaster-7, admin-8, founder-9
	var $fname;
	var $lname;
	var $company;
	var $tax;
	var $address;
	var $address2;
	var $tel;
	var $fax;
	var $cell;
	var $date_created;
	var $last_login;
	var $status;
	var $properties;

	function UserInfo( $username, $password, $email, $about, $fname, $lname, $company, $tax, $address, $address2, $tel, $fax, $cell, $type, $date_created, $last_login, $status, $properties = '', $id = 0 )
	{
		$this->id = $id;
		$this->username = trim($username);
		$this->password = $password;
		$this->email = $email;
		$this->about = $about;
		$this->fname = $fname;
		$this->lname = $lname;			
		$this->company = $company;
		$this->tax = $tax;
		$this->address = $address;
		$this->address2 = $address2;
		$this->tel = $tel;
		$this->fax = $fax;
		$this->cell = $cell;
		$this->type = $type;
		$this->date_created = $date_created;
		$this->last_login = $last_login;	
		$this->status=$status;		
		$this->properties = $properties;	
	}
	function getId()
	{
		return $this->id;
	}
	function setId($nValue) {
		$this->id = $nValue;
	}
	function getUserName()
	{
		return $this->username;
	}
	function setUserName($nValue) {
		$this->username = $nValue;
	}
	function getPassword()
	{
		return $this->password;
	}
	function setPassword($nValue) {
		$this->password = $nValue;
	}
	function getEmail()
	{
		return $this->email;
	}
	function setEmail($nValue)
	{
		$this->email = $nValue;
	}
	function getAbout() 
	{
		return $this->about;
	}
	function setAbout($nValue) {
		$this->about = $nValue;
	}
	function getFName()
	{
	  return $this->fname;
	}
	function setFName($nValue) {
		$this->fname = $nValue;
	}
	function getLName()
	{
	  return $this->lname;
	}
	function setLName($nValue) {
		$this->lname = $nValue;
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
	function setTax($nValue) 
	{
		$this->tax = $nValue;
	}
	function getAddress() 
	{
		return $this->address;
	}
	function setAddress($nValue) {
		$this->address=$nValue;
	}
	function getAddress2() 
	{
		return $this->address2;
	}
	function setAddress2($nValue) {
		$this->address2 = $nValue;
	}
	function getTel() 
	{
		return $this->tel;
	}
	function setTel($nValue) 
	{
		$this->tel = $nValue;
	}
	function getFax() 
	{
		return $this->fax;
	}
	function setFax($nValue) 
	{
		$this->fax = $nValue;
	}
	function getCell() 
	{
		return $this->cell;
	}
	function setCell($nValue) 
	{
		$this->cell = $nValue;
	}
	function getType()
	{
		return $this->type;
	}
	function setType($nValue) 
	{
		$this->type = $nValue;
	}
	function getDateCreated()
	{
		return $this->date_created;
	}
	function setDateCreated($nValue) 
	{
		$this->date_created = $nValue;
	}
	function getLastLogin()
	{
		return $this->last_login;
	}
	function setLastLogin($nValue) 
	{
		$this->last_login = $nValue;
	}
	
	function getStatus()
	{
		return( $this->status );
	}
	function setStatus($nValue) 
	{
		$this->status = $nValue;
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
	function isActive()
	{
		if($this->status>0) return 1;
		return 0;
	}
	function isFounder()
	{
		if($this->type == FOUNDER) return 1;
		return 0;
	}
	function isAdmin()
	{
		if($this->type == ADMIN) return 1;
		return 0;
	}
	function isWebmaster()
	{
		if($this->type == WEBMASTER) return 1;
		return 0;
	}
	function isStaff()
	{
		if($this->type == STAFF) return 1;
		return 0;
	}
	function isVip()
	{
		if($this->type == VIP) return 1;
		return 0;
	}
	function isMember()
	{
		if($this->type == MEMBER) return 1;
		return 0;
	}
	function isGuest()
	{
		if($this->type == GUEST) return 1;
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