<?php
/*************************************************************************
Class Ads
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/partsinfo.class.php');
class Parts extends Model {
	function Parts($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."parts";	
	}

/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$part = new PartsInfo($result[0]['vn_name'],
								$result[0]['en_name'],
								$result[0]['status'],
								$key
								);
			return $part;
		}
		return '';
	}
	function getObjects($page = 1, $condition = '1>0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page - 1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$partInfos = array();
			foreach($results as $key => $result) {
				$partInfos[] = new PartsInfo ($result['vn_name'],
												$result['en_name'],
												$result['status'],
												$result['id']
												);
			}
			return $partInfos;		
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
	function updateData($object,$cId) {
		$result = $this->update($object,"id =$cId ");
		if($result)
			return $result;
		return "";
	}
	
	function getParentName($pId, $lang = 'vn') {
		$result = $this->select("`".$lang."_name`", "`id` = '$pId'");
		if($result) {
			return $result[0][0];
		}
		return "/";
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
/*-----------------------------------------------------------------------*
* Function: getAdsFront
* Parameter: WHERE status=1 and gid=$agId
* Return: Array of Info objects
*-----------------------------------------------------------------------
	function getPartsFront($gId,$items = '0') {
		$results = $this->select('*', "status = 1 and gid = $gId", array('position'=>'ASC'), 0, $items);
		if($results) {
			$partInfos = array();
			foreach($results as $key => $result) {
				$partInfos[] = new PartsInfo ($result['gid'],
												$result['logo_url'],
												$result['url'],
												$result['position'], 
												$result['status'], 
												$result['id']
												);
			}
			return $partInfos;		
		}
		return '';
	}*/
	
}
?>