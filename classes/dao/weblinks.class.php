<?php
/*************************************************************************
Class Ads
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen
Last updated:15/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/weblinksinfo.class.php');
class Weblinks extends Model {
	function Weblinks($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."weblinks";	
	}

/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$links = new WeblinksInfo($result[0]['pid'],
									$result[0]['url'],
									$result[0]['vn_name'],
									$result[0]['en_name'],
									$result[0]['cn_name'],
									$result[0]['vn_sapo'],
									$result[0]['en_sapo'],
									$result[0]['cn_sapo'],
									$result[0]['avatar'],
									$result[0]['position'],
									$result[0]['status'],
									$key
									);
			return $links;
		}
		return '';
	}
	function getObjects($page = 1, $condition = '1>0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page - 1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$linksInfos = array();
			foreach($results as $key => $result) {
				$linksInfos[] = new WeblinksInfo($result['pid'],
												$result['url'],
												$result['vn_name'],
												$result['en_name'],
												$result['cn_name'],
												$result['vn_sapo'],
												$result['en_sapo'],
												$result['cn_sapo'],
												$result['avatar'],
												$result['position'], 
												$result['status'], 
												$result['id']
												);
			}
			return $linksInfos;		
		}
		return '';
	}


function getFrontWeblinks($condition = '1>0') {
		$results = $this->select('*', $condition,'','','');
		if($results) {
			$linksInfos = array();
			foreach($results as $key => $result) {
				$linksInfos[] = new WeblinksInfo($result['url'],
												$result['url'],
												$result['vn_name'],
												$result['en_name'],
												$result['cn_name'],
												$result['vn_sapo'],
												$result['en_sapo'],
												$result['cn_sapo'],
												$result['avatar'],
												$result['position'], 
												$result['status'], 
												$result['id']
												);
			}
			return $linksInfos;		
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
	function cleanTrash() {
	# Delete avatars from the hard disk
		$result = $this->select("avatar", "status=2");
		if ($result)
		foreach ($result as $image){
			unlink(ROOT_PATH."gallery/avatar_upload/weblinks/storage/".$image['avatar']);
			unlink(ROOT_PATH."gallery/avatar_upload/weblinks/avatar/".$image['avatar']);
		}
		$results = $this->delete("status=2");
		if ($results)
			return 1;
		return 0;
	}
	
	function getParentName($pId, $lang = 'vn') {
		$result = $this->select("`".$lang."_name`", "`id` = '$pId'");
		if($result) {
			return $result[0][0];
		}
		return "/";
	}
	function comboListObjects($pk = 'id', $title = 'vn_name', $value='', $condition = '1=1', $sort = array('position' => 'ASC')){		
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