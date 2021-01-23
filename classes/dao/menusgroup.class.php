<?php
/*************************************************************************
Class MenusGroup
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 08/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH."classes/dao/menugroupinfo.class.php");

class MenusGroup extends Model {
	function MenusGroup($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."menu_groups";	
	}
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$mgInfo = new MenuGroupInfo ($result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['status'],
										$key
										);
			return $mgInfo;
		}
		return '';
	}

/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObjects($page = 1, $condition = '1=1', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$mgInfos = array();
			foreach($results as $key => $result) {
				$mgInfos[] = new MenuGroupInfo ($result['vn_name'],
												$result['en_name'],
												$result['status'],
												$result['id']
												);
			}
			return $mgInfos;
		}
		return '';
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
		return "";
	}
	
	function addObjects(&$menu) {
		$result = $this->add($menu);
		if($result) {
			return $result;
		}
		return '';
	}
	
	function updateObjects($menu, $mid) {
		$result = $this->update($menu, "id = $mid ");
		if($result) {
			return $result;
		}
		return '';
	}
	
	function isMenuGroupEnabled($mgId=0) {
		if(!$mgId) return 0;
		$results = $this->select('status', "id='$mgId'");
		if($results) {
			$row = $results[0][0];
			if($row == 1) return 1;
			return 0;
		}
		return 0;
	}
}
?>