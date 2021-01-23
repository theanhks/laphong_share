<?php
/*************************************************************************
Class MemberInfo
----------------------------------------------------------------
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
class MemberInfo {
	var $id;			# Primary key
	var $username;		# Username
	var $pass;			# Password
	var $type;
	var $fullname;			# Full name
	var $birthday;			# last name
	var $about;			# About
	var $email;			# Email
	var $country;			# Email
	var $tinh;			# Email
	var $company;			# Email
	var $phai;			# Email
	var $address;		# Address
	var $tel;				
	var $fax;			# Tax
	var $cel;		
	var $date_created;	# Date created
	var $last_login;	# Last login
	var $status;		# Status
	var $properties;
	function MemberInfo ($username='', $pass='', $type='', $fullname='', $birthday='', $about='', $email='', $country='',$tinh='', $company='', $phai='', $address='',$tel='', $fax='', $cel='', $date_created='', $last_login = '', $status='',$properties = '', $id = 0)
	{
		$this->id = $id;
		$this->username = $username;		
		$this->pass = $pass;
		$this->type = $type;
		$this->fullname = stripslashes($fullname);
		$this->birthday = $birthday;
		$this->about =$about;
		$this->email = $email;
		$this->country = $country;
		$this->tinh = $tinh;
		$this->company = $company;
		$this->phai = $phai;
		$this->address = $address;
		$this->tel = $tel;
		$this->fax = $fax;
		$this->cel = $cel;
		$this->date_created = $date_created;
		$this->last_login = $last_login;
		$this->status = $status;
		$this->properties = $properties;
	}

	function getId() {
		return $this->id;
	}	
	function setId($nValue) {
		$this->id=$nValue;
	}
	function getUsername() {
		return $this->username;
	}
	function setUsername($nValue) {
		$this->username=$nValue;
	}
	function getPass() {
		return $this->pass;
	}	
	function setPass($nValue) {
		$this->pass=$nValue;
	}
	function getType()
	{
		return $this->type;
	}
	function setType($nValue) 
	{
		$this->type = $nValue;
	}
	function getFullname() {
		return $this->fullname;
	}
	function setFullname($nValue) {
		$this->fullname=$nValue;
	}
	function getBirthday() {
		return $this->birthday;
	}
	function setBirthday() {
		$this->birthday=$nValue;
	}
	function getAbout() {
		return $this->about;
	}
	function setAbout($nValue) {
		$this->about=$nValue;
	}
	function getEmail() {
		return $this->email;
	}
	function setEmail($nValue) {
		$this->email = $nValue;
	}
	function getCountry() {
		return $this->country;
	}
	function setCountry($nValue) {
		$this->country=$nValue;
	}
	function getTinh() {
		return $this->tinh;
	}
	function setTinh($nValue) {
		$this->tinh=$nValue;
	}
	function getCompany() {
		return $this->company;
	}
	function setCompany($nValue) {
		$this->company=$nValue;
	}
	function getPhai() {
		return $this->phai;
	}
	function setPhai($nValue) {
		$this->phai = $nValue;
	}
	
	function getTel() {
		return $this->tel;
	}
	function setTel($nValue) {
		$this->tel = $nValue;
	}
	function getCel() {
		return $this->cel;
	}
	function setCel($nValue) {
		$this->cel = $nValue;
	}
	function getFax() {
		return $this->fax;
	}
	function setFax($nValue) {
		$this->fax = $nValue;
	}
	function getAddress() {
		return $this->address;
	}
	function setAddress($nValue) {
		$this->address = $nValue;
	}
	
	function getDateCreted() {
		return $this->date_created;
	}
	function setDateCreted($nValue) {
		$this->date_created = $nValue;
	}
	function getLastLogin() {
		return $this->last_login;
	}
	function setLastLogin($nValue) {
		$this->last_login = $nValue;
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
	function getProperty($key)
	{
		return isset($this->properties[$key])?$this->properties[$key]:'';
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