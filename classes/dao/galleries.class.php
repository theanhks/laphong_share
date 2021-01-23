<?php
/*************************************************************************
Class Categories
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen
Last updated: 07/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH."classes/dao/galleryinfo.class.php");

class Gallery extends Model {
	function Gallery($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."album";	
	}
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$galleryInfo = new GalleryInfo ($result[0]['slug'],
											$result[0]['pid'],
											$result[0]['vn_name'],
											$result[0]['en_name'],
											$result[0]['cn_name'],
											$result[0]['vn_description'],
											$result[0]['en_description'],
											$result[0]['cn_description'],
											$result[0]['private'],
											$result[0]['status'],
											$result[0]['date_created'],
											$result[0]['resources'],
											$result[0]['children'],
											$result[0]['avatar_id'],
											$result[0]['position'],
											$key
										);
			return $galleryInfo;
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
			return $results['0']['id'];
		}
		return '';
	}
/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObjects($page = 1, $condition = '`pid` = 0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$galleryInfos = array();
			foreach($results as $key => $result) {
				$galleryInfos[] = new GalleryInfo ($result['slug'],
													$result['pid'],
													$result['vn_name'],
													$result['en_name'],
													$result['cn_name'],
													$result['vn_description'],
													$result['en_description'],
													$result['cn_description'],
													$result['private'],
													$result['status'],
													$result['date_created'],
													$result['resources'],
													$result['children'],
													$result['avatar_id'],
													$result['position'],
													$result['id']
													);
			}
			return $galleryInfos;
		}
		return '';
	}

	function getAlbumName($pId, $lang = 'vn') {
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
		$result = $this->update($fields,"id = $cId");
		if($result)
			return $result;
		return "";
	}
	
	function optionAllGallery($pk = 'id', $title = 'vn_name', $value='', $condition = 'pid=0', $sort = array('id' => 'ASC')){
	$str = '';
	$results = $this->select("`$pk`,`$title`", $condition, $sort);
		if($results) {
			foreach($results as $key => $result) {
				$str .= "<option value=\"".$result[$pk]."\"".($result[$pk]==$value?" selected":"").">".$result[$title]."</option>";
				$rs=$this->select("`$pk`,`$title`","pid='".$result['id']."'");
				if($rs) {
					foreach($rs as $key => $rsult) {
						$str .= "<option value=\"".$rsult[$pk]."\"".($rsult[$pk]==$value?" selected":"").">&nbsp;&nbsp;&nbsp;|---".$rsult[$title]."</option>";
						$rs_s=$this->select("`$pk`,`$title`","pid='".$rsult['id']."'");
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
	
	function getParentName($cId, $lang = 'vn') {
		$result = $this->select("`".$lang."_name`", "`id` = '$cId'");
		if($result) {
			return $result[0][0];
		}
		return "/";
	}
	
	function getParentId($Id, $lang = 'vn') {
		$result = $this->select("`pid`", "`id` = '$Id'");
		if($result) {
			return $result[0][0];
		}
		return "/";
	}
	
	function isGalleryEnabled($gId=0) {
		if(!$gId) return 0;
		$results = $this->select('status', "id='$gId'");
		if($results) {
			$row = $results[0][0];
			if($row == 1) return 1;
			return 0;
		}
		return 0;
	}	
	
	
	function getSubGallery($pId) {
		$results = $this->select("*", "`pid` = '$pId' and status=1");
		if($results) {
			$galleryInfos = array();
			foreach($results as $key => $result) {
				$galleryInfos[] = new GalleryInfo ($result['slug'],
													$result['pid'],
													$result['vn_name'],
													$result['en_name'],
													$result['cn_name'],
													$result['vn_description'],
													$result['en_description'],
													$result['cn_description'],
													$result['private'],
													$result['status'],
													$result['date_created'],
													$result['resources'],
													$result['children'],
													$result['avatar_id'],
													$result['position'],
													$result['id']
													);
			}
			return $galleryInfos;
		}
		return '';
	}
	function getAlbumFromId($Id) {
		$results = $this->select("*", "`id` = '$Id' and status=1");
		if($results) {
			$galleryInfos = array();
			foreach($results as $key => $result) {
				$galleryInfos[] = new GalleryInfo ($result['slug'],
													$result['pid'],
													$result['vn_name'],
													$result['en_name'],
													$result['cn_name'],
													$result['vn_description'],
													$result['en_description'],
													$result['cn_description'],
													$result['private'],
													$result['status'],
													$result['date_created'],
													$result['resources'],
													$result['children'],
													$result['avatar_id'],
													$result['position'],
													$result['id']
													);
			}
			return $galleryInfos;
		}
		return '';
	}
	function getGalleryFromSlug($slug = '0') {
		$result = $this->select('*',"`slug` = '$slug'");
		if($result) {
			$galleryInfo = new GalleryInfo ($result[0]['slug'],
											$result[0]['pid'],
											$result[0]['vn_name'],
											$result[0]['en_name'],
											$result[0]['cn_name'],
											$result[0]['vn_description'],
											$result[0]['en_description'],
											$result[0]['cn_description'],
											$result[0]['private'],
											$result[0]['status'],
											$result[0]['date_created'],
											$result[0]['resources'],
											$result[0]['children'],
											$result[0]['avatar_id'],
											$result[0]['position'],
											$result[0]['id']
										);
			return $galleryInfo;
		}
		return '';
	}
	
	function countAlbum($pId=0) {
		$result = $this->select('*',"`pid` = '$pId' and status=1");
		if($result) return count($result);
		return 0;
	}
	function changePosition($oId = 0, $position = 0) {
		if(!$oId) return 0;
		if($this->update(array('position' => $position), "`id` = '$oId'")) return 1;
		return 0;
	}
	/*#######################################*/
	function getSubCategory1($pId, $lang = 'vn') {
		$results = $this->select("id", "status =1 AND `pid` = '$pId'",array('position'=>'ASC'));
		if($results) {
			$categoryInfos = array();
			foreach($results as $key => $result) {
				$a= $result['id'];
				$categoryInfos[]=$result['id'];
			$results1 = $this->select("id", "status =1 AND `pid` = '$a'",array('position'=>'ASC'));	
			foreach($results1 as $key => $result_1) {
					$b = $result_1['id'];
					$categoryInfos[]=$result_1['id'];
					$results2 = $this->select("id", "status =1 AND `pid` = '$b'",array('position'=>'ASC'));					
			foreach($results2 as $key => $result_2) {
				$c = $result_2['id'];
				$categoryInfos[]=$result_2['id'];
					$results3 = $this->select("id", "status =1 AND `pid` = '$c'",array('position'=>'ASC'));
				foreach($results3 as $key => $result_3){
					$d=$result_3['id'];
					$categoryInfos[]=$result_3['id'];
				}
			}		
			}
			}
			return implode(",",$categoryInfos).",$pId";
		}
		return($pId);
	}
	
}
?>