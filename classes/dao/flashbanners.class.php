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
include_once(ROOT_PATH.'classes/dao/flashbannerinfo.class.php');
class Flashbanners extends Model {
	function Flashbanners($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."flashbanner";	
	}

/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$ads = new FlashInfo(
								$result[0]['logo_url'],
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
				$adsInfos[] = new FlashInfo (
											$result['logo_url'],
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
	
	

	
	
	function cleanTrash() {
	# Delete avatars from the hard disk
		$result = $this->select("logo_url", "status=2");
		if ($result)
		foreach ($result as $image){
			unlink(ROOT_PATH."gallery/avatar_upload/flash/storage/".$image['logo_url']);
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
		$results = $this->select('*', "status = 1 and gid = $gId", array('position'=>'ASC'));
		if($results) {
			$adsInfo = array();
			foreach($results as $key => $result) {
				$adsInfo[] = new AdsInfo ($result['gid'],
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