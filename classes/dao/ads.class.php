<?php
/*************************************************************************
Class Ads
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: kimque@ava.vn                                   
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/adsinfo.class.php');
class Ads extends Model {
	function Ads($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."ads";	
	}

/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$ads = new AdsInfo($result[0]['gid'],
								$result[0]['vn_name'],
								$result[0]['en_name'],
								$result[0]['logo_url'],
								$result[0]['url'],
								$result[0]['position'],
								$result[0]['status'],
								$key
									);
			return $ads;
		}
		return '';
	}
	function getObjectGid($key = '0') {
		$result = $this->select('*',"`gid` = '$key'",'',0,1);
		if($result) {
			$ads = new AdsInfo($result[0]['gid'],
								$result[0]['vn_name'],
								$result[0]['en_name'],
								$result[0]['logo_url'],
								$result[0]['url'],
								$result[0]['position'],
								$result[0]['status'],
								$key
									);
			return $ads;
		}
		return '';
	}
	
	function getObjects($page = 1, $condition = '1>0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page - 1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$adsInfos = array();
			foreach($results as $key => $result) {
				$adsInfos[] = new AdsInfo ($result['gid'],
											$result['vn_name'],
											$result['en_name'],
											$result['logo_url'],
											$result['url'],
											$result['position'], 
											$result['status'], 
											$result['id']
										);
			}
			return $adsInfos;		
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
	
	function getParentName($pId, $lang = 'vn') {
		$result = $this->select("`".$lang."_name`", "`id` = '$pId'");
		if($result) {
			return $result[0][0];
		}
		return "/";
	}
	
	function cleanTrash() {
	# Delete avatars from the hard disk
		$result = $this->select("logo_url", "status=2");
		if ($result)
		foreach ($result as $image){
			unlink(ROOT_PATH."gallery/avatar_upload/ads/avatar/".$image['logo_url']);
			unlink(ROOT_PATH."gallery/avatar_upload/ads/storage/".$image['logo_url']);
		}
		$results = $this->delete("status=2");
		if ($results)
			return 1;
		return 0;
	}
	
/*-----------------------------------------------------------------------*
* Function: getAdsFront
* Parameter: WHERE status=1 and gid=$agId
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getAdsFront($gId) {
		$results = $this->select('*', "status = 1 and gid = $gId", array('position'=>'ASC'),'');
		if($results) {
			$adsInfo = array();
			foreach($results as $key => $result) {
				$adsInfo[] = new AdsInfo ($result['gid'],
										$result['vn_name'],
										$result['en_name'],
										$result['logo_url'],
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
	
}
?>