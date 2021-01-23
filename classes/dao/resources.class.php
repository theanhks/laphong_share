<?php
/*************************************************************************
Class Resource
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 15/07/2008
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH."classes/dao/resourceinfo.class.php");

class Resource extends Model {
	function Resource($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."resource";	
	}
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$resourceInfo = new ResourceInfo ($result[0]['aid'],
										$result[0]['file_name'],
										$result[0]['file_size'],
										$result[0]['resource_type'],
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['cn_name'],
										$result[0]['vn_description'],
										$result[0]['en_description'],
										$result[0]['cn_description'],
										$result[0]['date_created'],
										$result[0]['url'],
										$result[0]['properties'],
										$result[0]['status'],
										$result[0]['position'],
										$result[0]['thumbnail_format'],
										$key
										);
			return $resourceInfo;
		}
		return '';
	}

/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObjects($page = 1, $condition = '`pid` = 0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE,$album=0) {
		if($page==1){
			$page = 1;
			$start = ($page -1) * $items_per_page;
		}else{
			$start = ($page -1) * $items_per_page-$album;
		}
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$resourceInfos = array();
			foreach($results as $key => $result) {
				$resourceInfos[] = new ResourceInfo ($result['aid'],
										$result['file_name'],
										$result['file_size'],
										$result['resource_type'],
										$result['vn_name'],
										$result['en_name'],
										$result['cn_name'],
										$result['vn_description'],
										$result['en_description'],
										$result['cn_description'],
										$result['date_created'],
										$result['url'],
										$result['properties'],
										$result['status'],
										$result['position'],
										$result['thumbnail_format'],
										$result['id']
										);
			}
			return $resourceInfos;
		}
		return '';
	}
/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getIdFromSlug($condition = '1>0') {
		$results = $this->select('id', $condition);
		if($results) {
			return $results['0'];
		}
		return '';
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
/*-----------------------------------------------------------------------*
* Function: addData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function addData($object) {
		$result = $this->add($object);
		if($result)
			return $result;
		return "";
	}
	
	function updateData($object,$cId) {
		$result = $this->update($object,"id =$cId ");
		if($result)
			return $result;
		return "";
	}
	
	function getResourceFront($condition = '`aid` = 0', $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		
		$results = $this->select('*', "status =1 AND ".$condition, array(), 0, $items_per_page);
		if($results) {
			$resourceInfos = array();
			foreach($results as $key => $result) {
				$resourceInfos[] = new ResourceInfo ($result['aid'],
										$result['file_name'],
										$result['file_size'],
										$result['resource_type'],
										$result['vn_name'],
										$result['en_name'],
										$result['cn_name'],
										$result['vn_description'],
										$result['en_description'],
										$result['cn_description'],
										$result['date_created'],
										$result['url'],
										$result['properties'],
										$result['status'],
										$result['position'],
										$result['thumbnail_format'],
										$result['id']
										);
			}
			return $resourceInfos;
		}
		return '';
	}
	
	function cleanTrash() {
	# Delete avatars from the hard disk
		$result = $this->select("file_name", "status=2");
		if ($result)
		foreach ($result as $image){
			unlink(ROOT_PATH."gallery/album/storage/".$image['file_name']);
			unlink(ROOT_PATH."gallery/album/avatar/".$image['file_name']);
			unlink(ROOT_PATH."gallery/album/thumb/".$image['file_name']);
			unlink(ROOT_PATH."gallery/album/medium/".$image['file_name']);
		}
		$results = $this->delete("status=2");
		if ($results)
			return 1;
		return 0;
	}
	
	function getResourceFromSlug($slug) {
		$result = $this->select('*',"`properties` = '$slug' and status=1");
		if($result) {
			$resourceInfo = new ResourceInfo ($result[0]['aid'],
										$result[0]['file_name'],
										$result[0]['file_size'],
										$result[0]['resource_type'],
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['cn_name'],
										$result[0]['vn_description'],
										$result[0]['en_description'],
										$result[0]['cn_description'],
										$result[0]['date_created'],
										$result[0]['url'],
										$result[0]['properties'],
										$result[0]['status'],
										$result[0]['position'],
										$result[0]['thumbnail_format'],
										$result[0]['id']
										);
			return $resourceInfo;
		}
		return '';
	}
	function changePosition($oId = 0, $position = 0) {
		if(!$oId) return 0;
		if($this->update(array('position' => $position), "`id` = '$oId'")) return 1;
		return 0;
	}
}
?>