<?php
/*************************************************************************
Class News
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/entryinfo.class.php');

class Entries extends Model {
	function Entries($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."news";	
	}
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/

	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$entryInfo = new Entryinfo ($result[0]['cid'],
										$result[0]['slug'],
										$result[0]['lang'],
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['keywords'],
										$result[0]['vn_sapo'],
										$result[0]['en_sapo'],
										$result[0]['vn_details'],
										$result[0]['en_details'],
										$result[0]['status'],
										$result[0]['home'],
										$result[0]['date_created'],
										$result[0]['avatar'],
										$result[0]['position'],
										$result[0]['popup'],
										$key
										);
			return $entryInfo;
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
			$entryInfos = array();
			foreach($results as $key => $result) {
				$entryInfos[] = new EntryInfo ($result['cid'],
											$result['slug'],
											$result['lang'],
											$result['vn_name'],
											$result['en_name'],
											$result['keywords'],
											$result['vn_sapo'],
											$result['en_sapo'],
											$result['vn_details'],
											$result['en_details'],
											$result['status'],
											$result['home'],
											$result['date_created'],
											$result['avatar'],
											$result['position'],
											$result['popup'],
											$result['id']
											);
			}
			return $entryInfos;
		}
		return '';
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
	
	function cleanTrash() {
	# Delete avatars from the hard disk
		$result = $this->select("avatar", "status=2");
		if ($result)
		foreach ($result as $image){
			unlink(ROOT_PATH."gallery/avatar_upload/entry/storage/".$image['avatar']);
			unlink(ROOT_PATH."gallery/avatar_upload/entry/avatar/".$image['avatar']);
			unlink(ROOT_PATH."gallery/avatar_upload/entry/thubnail/".$image['avatar']);
		}
		$results = $this->delete("status=2");
		if ($results)
			return 1;
		return 0;
	}
	
	function changePosition($oId = 0, $position = 0) {
		if(!$oId) return 0;
		if($this->update(array('position' => $position), "`id` = '$oId'")) return 1;
		return 0;
	}	

	function getParentName($cId, $lang = 'vn') {
		$result = $this->select("`".$lang."_title`", "`cid` = '$cId'");
		if($result) {
			return $result[0][0];
		}
		return "/";
	}

	function addData(&$data) {
		if($this->add($data)) return 1;
		return 0;
	}

	function updateData(&$data,$id) {
		if($this->update($data, "`id` = '$id'")) return 1;
		return 0;
	}
	function getRecord($id) {
		$result = $this->select('id',"`id` = '$id'");
		if($result) return 1;
		return "";
	}	

	function getEntryFromId($id) {
		$result = $this->select('*',"`id` = '$id' AND status=1");
		if($result) {
			$entryInfo = new Entryinfo ($result[0]['cid'],
										$result[0]['slug'],
										$result[0]['lang'],
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['keywords'],
										$result[0]['vn_sapo'],
										$result[0]['en_sapo'],
										$result[0]['vn_details'],
										$result[0]['en_details'],
										$result[0]['status'],
										$result[0]['home'],
										$result[0]['date_created'],
										$result[0]['avatar'],
										$result[0]['position'],
										$result[0]['popup'],
										$result[0]['id']
										);
			return $entryInfo;
		}
		return '';
	}

}
?>