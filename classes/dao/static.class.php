<?php
/*************************************************************************
ClassStaticpage
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011   
**************************************************************************/

include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/staticinfo.class.php');

class StaticPage extends Model {
	function StaticPage($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."static";	
	}

/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/

	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$staticInfo = new Staticinfo ($result[0]['slug'],
										$result[0]['lang'],	
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['keywords'],
										$result[0]['vn_sapo'],
										$result[0]['en_sapo'],
										$result[0]['vn_details'],
										$result[0]['en_details'],
										$result[0]['status'],
										$result[0]['position'],
										$result[0]['home'],
										$result[0]['avatar'],
										$result[0]['properties'],										
										$key
										);
			return $staticInfo;
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
			$staticInfos = array();
			foreach($results as $key => $result) {
				$staticInfos[] = new Staticinfo (	$result['slug'],
													$result['lang'],
													$result['vn_name'],
													$result['en_name'],
													$result['keywords'],
													$result['vn_sapo'],
													$result['en_sapo'],
													$result['vn_details'],
													$result['en_details'],
													$result['status'],
													$result['position'],
													$result['home'],
													$result['avatar'],
													$result['properties'],
													$result['id']
													);
			}
			return $staticInfos;
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
/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getStaticPageFromSlug($slug, $lang="vn") {
		if(!$slug) return "";
		$result = $this->select('*', "`slug`='$slug' and status=1");
		if($result) {
			$staticInfo = new Staticinfo ($result[0]['slug'],
										$result[0]['lang'],	
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['keywords'],
										$result[0]['vn_sapo'],
										$result[0]['en_sapo'],
										$result[0]['vn_details'],
										$result[0]['en_details'],
										$result[0]['status'],
										$result[0]['position'],
										$result[0]['home'],
										$result[0]['avatar'],
										$result[0]['properties'],
										$result[0]['id']
										);
			return $staticInfo;
		}
		return "";
	}
	function getStaticPageFromId($id, $lang="vn") {
		if(!$id) return "";
		$result = $this->select('*', "`id`='$id' and status=1");
		if($result) {
			$staticInfo = new Staticinfo ($result[0]['slug'],
										$result[0]['lang'],	
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['keywords'],
										$result[0]['vn_sapo'],
										$result[0]['en_sapo'],
										$result[0]['vn_details'],
										$result[0]['en_details'],
										$result[0]['status'],
										$result[0]['position'],
										$result[0]['home'],
										$result[0]['avatar'],
										$result[0]['properties'],
										$result[0]['id']
										);
			return $staticInfo;
		}
		return "";
	}
	# cleanTrash
	function cleanTrash() {
	# Delete avatars from the hard disk
		$result = $this->select("avatar", "status=2");
		if ($result)
		foreach ($result as $image){
			unlink(ROOT_PATH."gallery/avatar_upload/static/storage/".$image['avatar']);
			unlink(ROOT_PATH."gallery/avatar_upload/static/avatar/".$image['avatar']);
		}
		$results = $this->delete("status=2");
		if ($results)
			return 1;
		return 0;
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
	
	function optionAllCategories($pk = 'id', $title = 'vn_name', $value='', $condition = 'properties=0', $sort = array('position' => 'ASC')){
		$str = '';
		$results = $this->select("`$pk`,`$title`", $condition, $sort);


			if($results) {
				foreach($results as $key => $result) {
					$str .= "<option value=\"".$result[$pk]."\"".($result[$pk]==$value?" selected":"").">".$result[$title]."</option>";
					$rs=$this->select("`$pk`,`$title`","properties='".$result['id']."'");
					if($rs) {
						foreach($rs as $key => $rsult) {
							$str .= "<option value=\"".$rsult[$pk]."\"".($rsult[$pk]==$value?" selected":"").">&nbsp;&nbsp;&nbsp;|---".$rsult[$title]."</option>";
							$rs_s=$this->select("`$pk`,`$title`","properties='".$rsult['id']."'");
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
	
	
	
	function getStaticFromavatar($avatar, $lang='vn', $start=0, $items_per_page = 5) {
		$results = $this->select('*',"avatar='$avatar' and status=1 and home=1 and lang='$lang'", array('position'=>'ASC'), $start, $items_per_page);
		if($results) {
			$staticInfos = array();
			foreach($results as $key => $result) {
				$staticInfos[] = new Staticinfo ($result['slug'],
													$result['lang'],
													$result['vn_name'],
													$result['en_name'],
													$result['keywords'],
													$result['vn_sapo'],
													$result['en_sapo'],
													$result['vn_details'],
													$result['en_details'],
													$result['status'],
													$result['position'],
													$result['home'],
													$result['avatar'],
													$result['properties'],
													$result['id']
													);
			}
			return $staticInfos;
		}
		return '';
	}
}
?>