<?php
/*************************************************************************
Class CounterInfo
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 05/10/2009
**************************************************************************/	

class  CounterInfo {
	var $session;			# Primary key
	var $times;					# time
	var $status;
	
	function CounterInfo($session='', $times='') {
		$this->session = $session;
		$this->times = $times;
		
	}
	function getSession() {
		return $this->session;
	}	
	function setSession($nValue) {
		$this->session=$nValue;
	}
	function getTimes() {
		return $this->times;
	}
	function setTimes($nValue) {
		$this->times=$nValue;
	}
	function getStatus() {
		return $this->status;
	}
	function setStatus($nValue) {
		$this->status=$nValue;
	}
	
}
?>