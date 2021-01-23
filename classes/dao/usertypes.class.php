<?php
/************************************************************************
Class UserType
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                  
Last updated: 29/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH."classes/dao/usertypeinfo.class.php");

class UserTypes extends Model{
	function UserTypes($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."user_types";	
	}
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$usertypeInfo = new UserTypeInfo($result[0]['vn_type'],
											$result[0]['en_type'],
											$result[0]['jp_type'],
											$result[0]['cn_type'],
											$result[0]['status'],
											$key
											);
			return $usertypeInfo;
		}
		return '';
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
			$usertypeInfos = array();
			foreach($results as $key => $result) {
				$usertypeInfos[] = new UserTypeInfo($result['vn_type'],
													$result['en_type'],
													$result['jp_type'],
													$result['cn_type'],
													$result['status'],			
													$result['id']
													);
			}
			return $usertypeInfos;
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
* Function: ParentName
* Parameter: Info object
* Return: vn_type
*-----------------------------------------------------------------------*/	

	function getParentName($pId, $lang = 'vn') {
		$result = $this->select("`".$lang."_type`", "`id` = '$pId'");
		if($result) {
			return $result[0][0];
		}
		return "/";
	}
	
	function optionAllUserType($pk = 'id', $title = 'vn_type', $value='', $condition = '1=1', $sort = array('id' => 'ASC')){
		$str = '';
		$results = $this->select("`$pk`,`$title`", $condition, $sort);
		if($results) {
			foreach($results as $key => $result) {
				$str .= "<option value=\"".$result[$pk]."\"".($result[$pk]==$value?" selected":"").">".$result[$title]."</option>";
				$rs=$this->select("`$pk`,`$title`","id='".$result['id']."'");
				if($rs) {
					foreach($rs as $key => $rsult) {
						$str .= "<option value=\"".$rsult[$pk]."\"".($rsult[$pk]==$value?" selected":"").">&nbsp;&nbsp;&nbsp;|---".$rsult[$title]."</option>";
						$rs_s=$this->select("`$pk`,`$title`","id='".$rsult['id']."'");
						if($rs_s) {
							foreach($rs_s as $key => $rsult_s) {
								$str .= "<option value=\"".$rsult_s[$pk]."\"".($rsult_s[$pk]==$value?" selected":"").">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---".$rsult_s[$title]."</option>";
							}
						}
					}
				}	
			}
		}
	return $str;
	}
	
	function comboListObjects($pk = 'id', $title = 'vn_type', $value='', $condition = '1=1', $sort = array('id' => 'ASC')){		
		$results = $this->select("`$pk`,`$title`", $condition, $sort);
		$str = '';
		if($results){
			foreach($results as $key => $result) {
				$str .= "<option value=\"".$result[$pk]."\"".($result[$pk]==$value?" selected":"").">".$result[$title]."</option>";
			}
		}				
		return $str;
	}
	
}
?>
