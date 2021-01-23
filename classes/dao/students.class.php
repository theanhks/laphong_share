<?php
/*************************************************************************
Class Users
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com
Author: Mai Minh
Last updated: 30/09/2009
**************************************************************************/
/* Edit log:
- 30/09/2009 08:00 - Mai Minh: Initialize
*/

include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/studentsinfo.class.php");


class Students extends Model {
	function Students($database = '') {
		if(!$database) {
		global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."students";	
	}	


/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = 0) {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$studentInfo = new StudentsInfo($result[0]['class'],
									$result[0]['lang'],
									$result[0]['fname'],
									$result[0]['note'],
									$result[0]['email'],																	
									$result[0]['company'],
									$result[0]['address'],
									$result[0]['tel'],
									$result[0]['cell'],
									$result[0]['tax'],
									$result[0]['date_created'],
									$result[0]['status'],
									$result[0]['position'],
									$result[0]['properties'],
									$key
									);
									 
			return $studentInfo;
		}
		return '';
	}
/*-----------------------------------------------------------------------*
* Function: updateData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function updateData($fields,$cId) {
		$result = $this->update($fields,"id =$cId ");
		if($result)
			return $result;
		return "";
	}

/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObjects($page = 1, $condition = '`id` = 0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$studentsInfos = array();
			foreach($results as $key => $result) {
				$studentsInfos[] = new StudentsInfo($result['class'],
									$result['lang'],
									$result['fname'],
									$result['note'],
									$result['email'],																	
									$result['company'],
									$result['address'],
									$result['tel'],
									$result['cell'],
									$result['tax'],
									$result['date_created'],
									$result['status'],
									$result['position'],
									$result['properties'],
									$result['id']
									);
			}
			return $studentsInfos;
		}
		return '';
	}
/*-----------------------------------------------------------------------*
* Function: addData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function addData($object) {
		$result = $this->add($object,'id','NULL');
		if($result)
			return $result;
		return "";
	}
	
	
	function up($oId = 0, $position = 0) {
		if(!$oId) return 0;
		$result = $this->select("`id`,`position`", "`id` <> '$oId' AND `position` <= '$position'", array('`position`' => 'DESC'),0,1);
		if($result) {
			$nId = $result[0][0];
			$nPosition = $result[0][1];
			if($nPosition >= $position) $nPosition = $position - 1;
			$this->update(array('position' => $nPosition), "`id` = '$oId'");
			$this->update(array('position' => $position), "`id` = '$nId'");				
			return 1;
		}
		return 0;
	}
	
	function down($oId = 0, $position = 0) {
		if(!$oId) return 0;
		$result = $this->select("`id`,`position`", "`id` <> '$oId' AND `position` >= '$position'", array('`position`' => 'ASC'), 0, 1);
		if($result) {
			$nId = $result[0][0];
			$nPosition = $result[0][1];
			$this->update(array('position' => $nPosition), "`id` = '$oId'");
			$this->update(array('position' => $position), "`id` = '$nId'");				
			return 1;
		}
		return 0;
	}
	
	function changePosition($oId = 0, $position = 0) {
		if(!$oId) return 0;
		if($this->update(array('position' => $position), "`id` = '$oId'")) return 1;
		return 0;
	}
	
}
?>