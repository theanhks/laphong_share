<?php
/*************************************************************************
Class Validate data input
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 05/08/2008
**************************************************************************/
include_once(ROOT_PATH."classes/dao/mysql.class.php");
class Validate extends DB{
	var $messages;
	function Validate() {
		global $amessages;
		$this->messages = $amessages;
	}
	function validString($name,$str) {
		if(!$str) return $name." ".$this->messages['notValidString'];
		return '';	
	}
	function validStatus($name,$str) {
		if($str == -1) return $name." ".$this->messages['notValidStatus'];
		return '';	
	}	
	function validPassword($name,$str) {
		if(!$str) return $name."  ".$this->messages['notValidPassword'];
		return '';	
	}
	function validTestPass($name,$password,$confirm) {
		if($password != $confirm) return $name."  ".$this->messages['notValidTestPass'];
		return '';	
	}	
	function validCheckType($name,$str) {
	if(preg_match("/".ALLOW_FILE_TYPES."/",strtolower($str))||!$str)
		return $name." ".$this->messages['notValidString'];
		return '';	
	}
	function validEmail($name,$email) {
		$lengthPattern = "/^[^@]{1,64}@[^@]{1,255}$/";
		$syntaxPattern = "/^((([\w\+\-]+)(\.[\w\+\-]+)*)|(\"[^(\\|\")]{0,62}\"))@(([a-zA-Z0-9\-]+\.)+([a-zA-Z0-9]{2,})|\[?([1]?\d{1,2}|2[0-4]{1}\d{1}|25[0-5]{1})(\.([1]?\d{1,2}|2[0-4]{1}\d{1}|25[0-5]{1})){3}\]?)$/";
		return ((preg_match($lengthPattern, $email) > 0) && (preg_match($syntaxPattern, $email) > 0)) ? '' : $name." ".$this->messages['notValidEmail'];
	}
	function validUrl($name,$url) {
		$error = '';
		$domain = "(http(s?):\/\/|ftp:\/\/)*([[:alpha:]][-[:alnum:]]*[[:alnum:]])(\.[[:alpha:]][-[:alnum:]]*[[:alpha:]])+";
		$dir = "(/[[:alpha:]][-[:alnum:]]*[[:alnum:]])*";
		$trailingslash  = "(\/?)";
		$page = "(/[[:alpha:]][-[:alnum:]]*\.[[:alpha:]]{3,5})?";
		$getstring = "(\?([[:alnum:]][-_%[:alnum:]]*=[-_%[:alnum:]]+)(&([[:alnum:]][-_%[:alnum:]]*=[-_%[:alnum:]]+))*)?";
		$pattern = "^".$domain.$dir.$trailingslash.$page.$getstring."$";
		$check = eregi($pattern, $url);
		if(!$check) $error = $name."  ".$this->messages['notValidUrl'];
		return $error;		
	}
	function validInteger($name,$value) {
		if($value == '') return $name." - ".$this->messages['notValidInteger'];
		if(!is_numeric($value)) return $name." - ".$this->messages['notValidInteger'];
		if(!is_int((int)$value)) return $name." - ".$this->messages['notValidInteger'];
		return '';
	}
	function validDateTime($name,$dateTime) {
		if (preg_match("/^(\d{4})-(\d{2})-(\d{2}) ([01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/", $dateTime, $matches)) { 
			if (checkdate($matches[2], $matches[3], $matches[1])) { 
				return ''; 
			} 
		} 
		return $name." - ".$this->messages['notValidDateTime'];; 
	}
	function validUsername($name,$username) {
		$error = '';
		if(!$username) return $name." - ".$this->messages['notValidUsername'];
		if(preg_match("/^([a-z0-9_]+)$/",$username)) {
			return '';
		}
		return $name." - ".$this->messages['notValidUsername'];
	}
	function validSubdomain($name,$subdomain) {
		$error = '';
		if(!$subdomain) return $name." - ".$this->messages['notValidSubdomain'];
		if(preg_match("/^([a-z0-9_]+)$/",$subdomain)) {
			return '';
		}
		return $name." - ".$this->messages['notValidSubdomain'];
	}
	function validFileName($name,$fileName) {
		$error = '';
		if(!$fileName) return $name." - ".$this->messages['notValidFileName'];
		if(preg_match("/^([a-z0-9_]+)$/",$fileName)) {
			return '';
		}
		return $name." - ".$this->messages['notValidFileName'];
	}
	function validSlug($name,$slug) {
		$error = '';
		if(!$slug) return $name." - ".$this->messages['notValidSlug'];
		if(preg_match("/^([a-z0-9_-]+)$/",$slug)) {
			return '';
		}
		return $name." - ".$this->messages['notValidSlug'];
	}
}
?>