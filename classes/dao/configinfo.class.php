<?php
/*************************************************************************
Class Config
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 29/09/2009
**************************************************************************/
/* Edit log:
- 29/09/2009 15:013- Mai Minh: Optimize all the codes
- 29/09/2009 08:33 - Mai Minh: Initialize
*/

class ConfigInfo {
	var $key;
	var $value;
	function ConfigInfo($key, $value) {
		$this->key = $key;
		$this->value = unserialize($value);
	}
	function getKey() {
		return $this->key;
	}
	function setKey($nValue)
	{
		$this->key = $nValue;
	}
	function getProperties()
	{
		return $this->value;
	}
	function setProperties($nValue)
	{
		$this->value=$nValue;
	}
	function getProperty($key)
	{
		return isset($this->value[$key])?$this->value[$key]:'';
	}
	function setProperty($key,$nValue)
	{
		$this->value[$key]=$nValue;
	}
}	
?>