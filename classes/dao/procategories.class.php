<?php
/*************************************************************************
Class ProductCategories
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Email: Tran Thi Kim Que                                    
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH."classes/dao/procategoryinfo.class.php");

class ProductCategories extends Model {
	var $table;			# Default table name
	# Constructor
	function ProductCategories($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."product_categories";	
	}
	
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$pro_cateInfo = new ProCategoryInfo ($result[0]['slug'],
												$result[0]['pid'],
												$result[0]['vn_name'],
												$result[0]['en_name'],
												$result[0]['vn_details'],
												$result[0]['en_details'],
												$result[0]['avatar'],
												$result[0]['position'],
												$result[0]['status'],
												$key
												);
			return $pro_cateInfo;
		}
		return '';
	}
	function getObjects($page = 1, $condition = '`pid` = 0 and status <> 0 ', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$pro_cateInfos = array();
			foreach($results as $key => $result) {
				$pro_cateInfos[] = new ProCategoryInfo ($result['slug'],
														$result['pid'],
														$result['vn_name'],
														$result['en_name'],
														$result['vn_details'],
														$result['en_details'],
														$result['avatar'],
														$result['position'],
														$result['status'],
														$result['id']
														);
			}
			return $pro_cateInfos;
		}
		return '';
	}

function getParentObject($pcid = '0') {
		$result = $this->select('*',"`id` = '$pcid'");
		if($result) {
			$pro_cateInfo = new ProCategoryInfo ($result[0]['slug'],
												$result[0]['pid'],
												$result[0]['vn_name'],
												$result[0]['en_name'],
												$result[0]['vn_details'],
												$result[0]['en_details'],
												$result[0]['avatar'],
												$result[0]['position'],
												$result[0]['status'],
												$pcid
												);
			return $pro_cateInfo;
		}
		return '';
	}
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

function getProductCategory($condition = 0) {
		$results = $this->select('*', "status =1 AND pid =$condition",  array('position'=>'ASC'),'','');
		if($results) {
			$pro_cateInfos = array();
			foreach($results as $key => $result) {
				$pro_cateInfos[] = new ProCategoryInfo ($result['slug'],
														$result['pid'],
														$result['vn_name'],
														$result['en_name'],
														$result['vn_details'],
														$result['en_details'],
														$result['avatar'],
														$result['position'],
														$result['status'],
														$result['id']
														);
			}
			return $pro_cateInfos;
		}
		return '';
	}

	function getSubProCategory($pId = '0') {

		$results = $this->select('*', "pid = '$pId' and status = 1", array('position'=>'ASC'));
		if($results) {
			$pro_cateInfos = array();
			foreach($results as $key => $result) {
				$pro_cateInfos[] = new ProCategoryInfo ($result['slug'],
														$result['pid'],
														$result['vn_name'],
														$result['en_name'],
														$result['vn_details'],
														$result['en_details'],
														$result['avatar'],
														$result['position'],
														$result['status'],
														$result['id']
				
														);
			}
			return $pro_cateInfos;
		}
		return '';
	}
	
	function changePosition($oId = 0, $position = 0) {
		if(!$oId) return 0;
		if($this->update(array('position' => $position), "`id` = '$oId'")) return 1;
		return 0;
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
	
	function getParentName($pId, $lang = 'vn') {
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
	# Return a ProductCategory Id from provided ID
	function getProductCategorySlugFromId($pcId='') {
		if(!$pcId) return 0;
		$result = $this->select('slug',"`id` = '$pcId'");
		if($result) {
			return $result[0];
		}
		return '';
	}
	
	function getProCateFromSlug($key = '0') {
		$result = $this->select('*',"`slug` = '$key'");
		if($result) {
			$pro_cateInfo = new ProCategoryInfo ($result[0]['slug'],
												$result[0]['pid'],
												$result[0]['vn_name'],
												$result[0]['en_name'],
												$result[0]['vn_details'],
												$result[0]['en_details'],
												$result[0]['avatar'],
												$result[0]['position'],
												$result[0]['status'],
												$result[0]['id']
												);
			return $pro_cateInfo;
		}
		return '';
	}
	function optionAllCategories($pk = 'id', $title = 'vn_title', $value='', $condition = 'pid = 0 and status = 1', $sort = array('position' => 'ASC')){
		$str = '';
		$results = $this->select("`$pk`,`$title`", $condition, $sort);
			if($results) {
				foreach($results as $key => $result) {
					$str .= "<option value=\"".$result[$pk]."\"".($result[$pk]==$value?" selected":"").">".$result[$title]."</option>";
					$rs=$this->select("`$pk`,`$title`","pid='".$result['id']."' and status = 1 ",$sort);
					if($rs) {
						foreach($rs as $key => $rsult) {
							$str .= "<option value=\"".$rsult[$pk]."\"".($rsult[$pk]==$value?" selected":"").">&nbsp;&nbsp;&nbsp;|---".$rsult[$title]."</option>";
							$rs_s=$this->select("`$pk`,`$title`","pid='".$rsult['id']."'",$sort);
							if($rs_s) {
								foreach($rs_s as $key => $rsult_s) {
									$str .= "<option value=\"".$rsult_s[$pk]."\"".($rsult_s[$pk]==$value?" selected":"").">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---".$rsult_s[$title]."</option>";
								$rs_s1=$this->select("`$pk`,`$title`","pid='".$rsult_s['id']."'",$sort);	
									if($rs_s1) {
										foreach($rs_s1 as $key => $rsult_s1) {
											$str .= "<option value=\"".$rsult_s1[$pk]."\"".($rsult_s1[$pk]==$value?" selected":"").">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|---".$rsult_s1[$title]."</option>";
										}
									}
								}
							}
						}
					}	
				}
			}
		return $str;
		}
	
	function getObjectsSub($page = 1, $pId = '0', $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$results = $this->select('*', "status = 1 and pid = '$pId'", array('id'=>'ASC'), $start, $items_per_page);
		if($results) {
			$pro_cateInfos = array();
			foreach($results as $key => $result) {
				$pro_cateInfos[] = new ProCategoryInfo ($result['slug'],
														$result['pid'],
														$result['vn_name'],
														$result['en_name'],
														$result['vn_details'],
														$result['en_details'],
														$result['avatar'],
														$result['position'],
														$result['status'],
														$result['id']
														);
			}
			return $pro_cateInfos;
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
	
	function getSubCategoryArray($pId, $lang = 'vn') {
		$results = $this->select("id", "`pid` = '$pId'",array('position'=>'ASC'));
		if($results) {
			$categoryInfos = array();
			foreach($results as $key => $result) {
				$a= $result['id'];
				$categoryInfos[]=$result['id'];
			$results1 = $this->select("id", "`pid` = '$a'",array('position'=>'ASC'));	
			foreach($results1 as $key => $result_1) {
					$b = $result_1['id'];
					$categoryInfos[]=$result_1['id'];
					$results2 = $this->select("id", "`pid` = '$b'",array('position'=>'ASC'));					
			foreach($results2 as $key => $result_2) {
				$c = $result_2['id'];
				$categoryInfos[]=$result_2['id'];
					$results3 = $this->select("id", "`pid` = '$c'",array('position'=>'ASC'));
				foreach($results3 as $key => $result_3) {
					$d=$result_3['id'];
					$categoryInfos[]=$result_3['id'];
				
				}
			}		
			}
			}
			$categoryInfos[]=$pId;
			return $categoryInfos;
		}
		return($pId);
	}

	function getProCate($value = 'id', $key = '1=1') {
		$result = $this->select("`$value`", $key);
		if ($result)
			return $result[0][0];
		return '';
	}
	// duong dan cac cap breadcrumb
	function getPathParrent($id) {
		  $arrPath = array();
		  $objectCategorys = $this->getObject($id);
		  $cid = $objectCategorys->getPPCId();
		  if($cid!=0){
		   $arrPath = $this->getPathParrent($cid); 
		  }
		  $arrPath[] = $objectCategorys;
		  return $arrPath;
 	}
	function cleanTrash() {
	# Delete avatars from the hard disk
		$result = $this->select("id,avatar", "status=2");
		if ($result)
		foreach ($result as $image){
			if($image['id']){	
				$subItems=$this->getSubProCategory($image['id']);
				foreach ($subItems as $subItem){
					$oId=$subItem->getId();
					$this->update(array('status'=>'2'),"`id` = '$oId'");
					unlink(ROOT_PATH."gallery/avatar_upload/productcat/storage/".$subItem->getAvatar());
					unlink(ROOT_PATH."gallery/avatar_upload/productcat/avatar/".$subItem->getAvatar());
				}
			}
			unlink(ROOT_PATH."gallery/avatar_upload/productcat/storage/".$image['avatar']);
			unlink(ROOT_PATH."gallery/avatar_upload/productcat/avatar/".$image['avatar']);
		}
		$results = $this->delete("status=2");
		if ($results)
			return 1;
		return 0;
	}	

	
}
?>