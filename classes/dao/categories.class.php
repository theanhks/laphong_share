<?php
/*************************************************************************
Class Categories
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: kimque@ava.vn                                   
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH."classes/dao/categoryinfo.class.php");

class Categories extends Model {
	function Categories($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."category";	
	}
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$categoryInfo = new CategoryInfo ($result[0]['pid'],
											$result[0]['slug'],
											$result[0]['vn_name'],
											$result[0]['en_name'],
											$result[0]['vn_sapo'],
											$result[0]['en_sapo'],
											$result[0]['vn_details'],
											$result[0]['en_details'],
											$result[0]['avatar'],
											$result[0]['status'],
											$result[0]['position'],
											$result[0]['properties'],
											$key
											);
			return $categoryInfo;
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
			$categoryInfos = array();
			foreach($results as $key => $result) {
				$categoryInfos[] = new CategoryInfo ($result['pid'],
													$result['slug'],
													$result['vn_name'],
													$result['en_name'],
													$result['vn_sapo'],
													$result['en_sapo'],
													$result['vn_details'],
													$result['en_details'],
													$result['avatar'],
													$result['status'],
													$result['position'],
													$result['properties'],
													$result['id']
													);
			}
			return $categoryInfos;
		}
		return '';
	}
	

########## All categories ################	
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
				foreach($results3 as $key => $result_3) {
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

########## All categories ################	
	function getSubCategory($pId) {
		$results = $this->select("*", "`pid` = '$pId' and status=1");
		if($results) {
			$categoryInfos = array();
			foreach($results as $key => $result) {
				$categoryInfos[] = new CategoryInfo ($result['pid'],
													$result['slug'],
													$result['vn_name'],
													$result['en_name'],
													$result['vn_sapo'],
													$result['en_sapo'],
													$result['vn_details'],
													$result['en_details'],
													$result['avatar'],
													$result['status'],
													$result['position'],
													$result['properties'],
													$result['id']
													);
			}
			return $categoryInfos;
		}
		return '';
	}
	
	function getCategoryFromId($Id) {
		$result = $this->select("*", "`id` = '$Id' and status=1");		
		if($result) {
			$categoryInfo = new CategoryInfo ($result[0]['pid'],
										$result[0]['slug'],
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['vn_sapo'],
										$result[0]['en_sapo'],
										$result[0]['vn_details'],
										$result[0]['en_details'],
										$result[0]['avatar'],
										$result[0]['status'],
										$result[0]['position'],
										$result[0]['properties'],
										$result[0]['id']
										);
			return $categoryInfo;
		}
		return '';
	}
	
	function getCategoryFromSlug($slug) {
		$result = $this->select("*", "`slug` = '$slug' and status=1");
		if($result) {
			$categoryInfo = new CategoryInfo ($result[0]['pid'],
										$result[0]['slug'],
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['vn_sapo'],
										$result[0]['en_sapo'],
										$result[0]['vn_details'],
										$result[0]['en_details'],
										$result[0]['avatar'],
										$result[0]['status'],
										$result[0]['position'],
										$result[0]['properties'],
										$result[0]['id']
										);
			return $categoryInfo;
		}
		return '';
	}
	
	
	function getCategoryFromCId($cid) {
		$result = $this->select("*", "`id` = '$cid' and status=1");
		if($result) {
			$categoryInfo = new CategoryInfo ($result[0]['pid'],
										$result[0]['slug'],
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['vn_sapo'],
										$result[0]['en_sapo'],
										$result[0]['vn_details'],
										$result[0]['en_details'],
										$result[0]['avatar'],
										$result[0]['status'],
										$result[0]['position'],
										$result[0]['properties'],
										$result[0]['id']
										);
			return $categoryInfo;
		}
		return '';
	}
	
	/*function getCateFromSlug($slug) {
		$result = $this->select("*", "`slug` = '$slug' and status=1 ");
		if($result) {
			$categoryInfo = new CategoryInfo ($result[0]['pid'],
										$result[0]['slug'],
										$result[0]['vn_name'],
										$result[0]['vn_name'],
										$result[0]['china_name'],
										$result[0]['vn_details'],
										$result[0]['vn_details'],
										$result[0]['china_details'],
										$result[0]['avatar'],
										$result[0]['status'],
										$result[0]['position'],
										$result[0]['properties'],
										$result[0]['id']
										);
			return $categoryInfo;
		}
		return '';
	}*/
// duong dan cac cap breadcrumb
	function getPathParrent($id) {
		  $arrPath = array();
		  $objectCategorys = $this->getObject($id);
		  $cid = $objectCategorys->getPId();
		  if($cid!=0){
		   $arrPath = $this->getPathParrent($cid); 
		  }
		  $arrPath[] = $objectCategorys;
		  return $arrPath;
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
* Function: existData
* Parameter: key as string
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function existData($key) {
		$numItems = $this->getNumItems('id',"id = '$key'");
		if ($numItems['rows']) return 1;
		return 0;
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
	####################
	function getParentAllFromCid($cId,$name='vn_name') {
	while($cId!=0) {
	$result = $this->select("`pid`,`$name`", "`id` = '$cId'");
	$resultname[]=$result[0]["$name"];
	if ($result[0]['pid']==0){
		$kq =array($cId,$resultname);
		return $kq;
	}
		$temp = $this->getParentAllFromCid($result[0]['pid'],$name);
		$cId=$temp[0];
	}
	return '/';
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
/*function cleanTrash() {
	# Delete avatars from the hard disk
		$result = $this->select("avatar", "status=2");
		if ($result)
		foreach ($result as $image){
			unlink(ROOT_PATH."gallery/avatar_upload/category/storage/".$image['avatar']);
			unlink(ROOT_PATH."gallery/avatar_upload/category/avatar/".$image['avatar']);
		}
		$results = $this->delete("status=2");
		if ($results)
			return 1;
		return 0;
	}
*/	
	function cleanTrash() {
	# Delete avatars from the hard disk
		$result = $this->select("id,avatar", "status=2");
		if ($result)
		foreach ($result as $image){
			if($image['id']){	
				$subItems=$this->getSubCategory($image['id']);
				//print_r($subItems);
				foreach ($subItems as $subItem){
					$oId=$subItem->getId();
					$this->update(array('status'=>'2'),"`id` = '$oId'");
					unlink(ROOT_PATH."gallery/avatar_upload/category/storage/".$subItem->getAvatar());
					unlink(ROOT_PATH."gallery/avatar_upload/category/avatar/".$subItem->getAvatar());
				}
			}
			unlink(ROOT_PATH."gallery/avatar_upload/category/storage/".$image['avatar']);
			unlink(ROOT_PATH."gallery/avatar_upload/category/avatar/".$image['avatar']);
		}
		$results = $this->delete("status=2");
		if ($results)
			return 1;
		return 0;
	}	
	
	# end action
	
	function getParentName($pId, $lang = 'vn') {
		$result = $this->select("`".$lang."_name`", "`id` = '$pId'");
		if($result) {
			return $result[0][0];
		}
		return "/";
	}
	function getParentId($pId, $lang = 'en') {
		$result = $this->select("id", "`id` = '$pId'");
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

	function optionAllCategories($pk = 'id', $title = 'en_title', $value='', $condition = 'pid=0', $sort = array('position' => 'ASC')){
		$str = '';
		$results = $this->select("`$pk`,`$title`", $condition, $sort);
			if($results) {
				foreach($results as $key => $result) {
					$str .= "<option value=\"".$result[$pk]."\"".($result[$pk]==$value?" selected":"").">".$result[$title]."</option>";
					$rs=$this->select("`$pk`,`$title`","pid='".$result['id']."'",$sort);
					if($rs) {
						foreach($rs as $key => $rsult) {
							$str .= "<option value=\"".$rsult[$pk]."\"".($rsult[$pk]==$value?" selected":"").">&nbsp;&nbsp;&nbsp;|---".$rsult[$title]."</option>";
							$rs_s=$this->select("`$pk`,`$title`","pid='".$rsult['id']."'",$sort);
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
	
	
	/*function optionAllCategories($pid = 0, $value = '', $sort = array('position' => 'ASC'), $level = 0){
		$str = '&nbsp;';		
		$objectCategory = $this->getSubCategory($pid);
		if(count($objectCategory)>0):
			$pace = '';
			for($i=$level; $i>0; --$i):
				$pace .= '&nbsp;&nbsp;&nbsp;'; 
			endfor;	
			++$level;			
			foreach($objectCategory as $object):		
				$str .= "<option value='".$object->getId()."'".($object->getId()==$value?"selected=\"selected\"":"").">" . $pace . $object->getName($lang). "</option>";				
				$str .= $this->optionAllCategories($object->getId(), $value, $sort, $level);
			endforeach;
		endif;	
		return $str;
	}		
	*/
	
	function getParentSlug($cId) {
		$result = $this->select('slug', "id=$cId");
		if($result) 
			#return 1;
			return $result[0][0];
		#else return 0;
		else return -1;
	}

	function getCategoryNameFromId($lang = 'vn', $cId) {
		$result = $this->select('"$lang"._name', "id=$cId");
		if($result) 
			return 1;
		else return 0;
	}
	/***************************************/
	

}
?>