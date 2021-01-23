<?php
/*************************************************************************
Class Systems
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com
Author: Mai Minh
Last updated: 29/09/2009
**************************************************************************/
/* Edit log:
- 29/09/2009 15:05 - Mai Minh: Initialize
*/

include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/configinfo.class.php');

class Configs extends Model {
/*-----------------------------------------------------------------------*
* Function: Constructor
* Parameter: Database object
* Return: Nothing
*-----------------------------------------------------------------------*/
	function Configs($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX.'config';
	}

/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = 'general') {
		$result = $this->select('*',"config_key = '$key'");
		if($result) {
			$config = new ConfigInfo ($key,$result[0]['config_value']);
			return $config;
		}
		return '';
	}
	
/*-----------------------------------------------------------------------*
* Function: existData
* Parameter: key as string
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function existData($key) {
		$numItems = $this->getNumItems('id',"config_key = '$key'");
		if ($numItems['rows']) return 1;
		return 0;
	}
	
/*-----------------------------------------------------------------------*
* Function: addData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function addData($object) {
		if(!$this->existData($object->getKey())) {
			$fields = array('config_key' => $object->getKey(),
							'config_value' => serialize($object->getProperties())
							);
			return $this->add($fields,'id','NULL');
		}
		return 0;
	}

/*-----------------------------------------------------------------------*
* Function: updateData
* Parameter: Info object
* Return: 1 if OK, 0 if failed
*-----------------------------------------------------------------------*/	
	function updateData($object) {
		$fields = array('config_key' => $object->getKey(),
						'config_value' => serialize($object->getProperties())
						);
		if ($this->update($fields, "config_key='".$object->getKey()."'")) return 1;
		return 0;
	}
}	
?>