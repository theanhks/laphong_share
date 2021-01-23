<?php
/*************************************************************************
ClassStaticpage
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Tran Thi Kim Que                                  
Last updated: 15/10/2009    
**************************************************************************/

include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/questioninfo.class.php');

class Questions extends Model {
	function Questions($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."questions";	
	}

/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/

	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$questionInfo = new QuestionInfo ($result[0]['sid'],
											$result[0]['slug'],
											$result[0]['people'],
											$result[0]['lang'],	
											$result[0]['address'],
											$result[0]['tel'],
											$result[0]['email'],
											$result[0]['questions'],
											$result[0]['answers'],
											$result[0]['date_created'],
											$result[0]['file_upload'],
											$result[0]['status'],
											$result[0]['position'],										
											$key
											);
			return $questionInfo;
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
			$questionInfos = array();
			foreach($results as $key => $result) {
				$questionInfos[] = new QuestionInfo ($result['sid'],
													$result['slug'],
													$result['people'],
													$result['lang'],
													$result['address'],
													$result['tel'],
													$result['email'],
													$result['questions'],
													$result['answers'],
													$result['date_created'],
													$result['file_upload'],
													$result['status'],
													$result['position'],
													$result['id']
													);
			}
			return $questionInfos;
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
	
	function getQuestionFromSubject($sId, $lang='vn') {
		$results = $this->select("*", "`sid` = '$sId' and status=1 and lang='$lang'",0,3);
		if($results) {
			$questionInfos = array();
			foreach($results as $key => $result) {
				$questionInfos[] = new QuestionInfo ($result['sid'],
													$result['slug'],
													$result['people'],
													$result['lang'],
													$result['address'],
													$result['tel'],
													$result['email'],
													$result['questions'],
													$result['answers'],
													$result['date_created'],
													$result['file_upload'],
													$result['status'],
													$result['position'],
													$result['id']
													);
			}
			return $questionInfos;
		}
		return '';
	}
	function getQuestionFromSlug($slug, $lang='vn') {
		$result = $this->select("*", "`slug` = '$slug' and status=1 and lang='$lang'");
		if($result) {
			$questionInfo = new QuestionInfo ($result[0]['sid'],
											$result[0]['slug'],
											$result[0]['people'],
											$result[0]['lang'],	
											$result[0]['address'],
											$result[0]['tel'],
											$result[0]['email'],
											$result[0]['questions'],
											$result[0]['answers'],
											$result[0]['date_created'],
											$result[0]['file_upload'],
											$result[0]['status'],
											$result[0]['position'],										
											$result[0]['id']
											);
			return $questionInfo;
		}
		return '';
	}
	
}
?>