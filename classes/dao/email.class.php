<?php
/*************************************************************************
Class Mailinfor
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen                                 
Last updated: 28/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH."classes/dao/emailinfo.class.php");


class SaveEmail extends Model {
	function SaveEmail($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."email";	
	}

/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/

	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$EmailInfo = new EmailInfo ($result[0]['to'],
										$result[0]['cc'],
										$result[0]['attach'],	
										$result[0]['subject'],
										$result[0]['content'],
										$result[0]['status'],
										$result[0]['date_created'],
										$key
										);
			return $EmailInfo;
		}
		return '';
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
			$emailInfos = array();
			foreach($results as $key => $result) {
				$emailInfos[] = new EmailInfo ($result['to'],
											$result['cc'],
											$result['attach'],
											$result['subject'],
											$result['content'],
											$result['status'],
											$result['date_created'],
											$result['id']
											);
			}
			return $emailInfos;
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
	function addData(&$data) {
		if($this->add($data)) return 1;
		return 0;
	}

	function updateData(&$data,$id) {
		if($this->update($data, "`id` = '$id'")) return 1;
		return 0;
	}

}
?>