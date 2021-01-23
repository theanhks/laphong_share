<?php
/*************************************************************************
Class AdsGroups
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/	

include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/textbannerinfo.class.php');

class Textbanners extends Model {
	function Textbanners($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."textbanner";
	}

/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$ads = new TextbannerInfo($result[0]['vn_name'],
									$result[0]['en_name'],
									$result[0]['url'],
									$result[0]['position'],
									$result[0]['status'],
									$key
									);
			return $ads;
		}
		return '';
	}
/*-----------------------------------------------------------------------*
* Function: getRecord
* Parameter: WHERE condition
* Return: 1 if id already exists, 0 if not exists
*-----------------------------------------------------------------------*/
	function getRecord($id) {
		$result = $this->select('id',"`id` = '$id'");
		if($result) return 1;
		return '';
	} 
	function changePosition($oId = 0, $position = 0) {
		if(!$oId) return 0;
		if($this->update(array('position' => $position), "`id` = '$oId'")) return 1;
		return 0;
	}	
/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObjects($page = 1, $condition = '1>0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$adsInfo = array();
			foreach($results as $key => $result) {
				$adsInfo[] = new TextbannerInfo($result['vn_name'],
									$result['en_name'],
									$result['url'],
									$result['position'],
									$result['status'],
									$result['id']
									);
			}
			return $adsInfo;
			
		}
		return '';
	}
/*-----------------------------------------------------------------------*
* Function: addData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/
	function addData($object) {
			 $this->add($object,'id','NULL');
	}
/*-----------------------------------------------------------------------*
* Function: updateData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function updateData($object,$agId) {
			 $this->update($object,"id =$agId");
	}
	

}

?>
