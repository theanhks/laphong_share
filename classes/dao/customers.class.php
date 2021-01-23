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
include_once(ROOT_PATH.'classes/dao/customerinfo.class.php');

class Customers extends Model {
	function Customers($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."customers";
	}

/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result){
			$customer = new CustomerInfo($result[0]['nhomid'],
									$result[0]['ngonnguid'],
									$result[0]['dotuoiid'],
									$result[0]['name'],
									$result[0]['address'],
									$result[0]['email'],
									$result[0]['tel'],
									$result[0]['status'],
									$key
									);
			return $customer;
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
	function getCode($email) {
		$result = $this->select('nhomid',"`email` = '$email'");
		//print_r($result);
		if($result){
			return $result[0][0];
		}
		return '';
	} 
/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/

	/*function checkExists($code,$email) {
		$result = $this->select('id',"`nhomid` = '$code' AND email='$email'");
		if($result) return 1;
		return '';
	}*/
	function checkExists($email) {
		$result = $this->select('id',"email='$email'");
		if($result) return 1;
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
				$adsInfo[] = new CustomerInfo($result['nhomid'],
											$result['ngonnguid'],
											$result['dotuoiid'],
											$result['name'],
											$result['address'],
											$result['email'],
											$result['tel'],
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
	
	function comboListObjects($pk = 'id', $title = 'vn_name', $value='', $condition = '1=1', $sort = array('id' => 'ASC')){		
		$results = $this->select("`$pk`,`$title`", $condition, $sort);
		$str = '';
		if($results){
			foreach($results as $key => $result) {
				$str .= "<option value=\"".$result[$pk]."\"".($result[$pk]==$value?" selected":"").">".$result[$title]."</option>";
			}
		}	
		return $str;
	}
	
	function getParentName($pId, $lang = 'vn') {
		$result = $this->select("`".$lang."_name`", "`id` = '$pId'");
		if($result) {
			return $result[0][0];
		}
		return "/";
	}
function cleanTrash() {
	# Delete avatars from the hard disk
		$results = $this->delete("status=2");
		if ($results)
			return 1;
		return 0;
	}
/*-----------------------------------------------------------------------*
* Function: updateData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/
	function isAdGroupEnabled($agId=0) {
		if(!$agId) return 0;
		$results = $this->select('status', "id='$agId'");
		if($results) {
			$row = $results[0][0];
			if($row == 1) return 1;
			return 0;
		}
		return 0;
	}	
}

?>
