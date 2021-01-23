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
include_once(ROOT_PATH."classes/dao/albumproductinfo.class.php");

class albumProducts extends Model {
	var $table;			# Default table name
	# Constructor
	function albumProducts($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."albumproduct";	
	}
	
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$pro_cateInfo = new albumProduct ($result[0]['slug'],
												$result[0]['idpro'],
												$result[0]['vn_name'],
												$result[0]['en_name'],
												$result[0]['position'],
												$result[0]['status'],
												$key
												);
			return $pro_cateInfo;
		}
		return '';
	}
	
	function getObjects($page = 1, $condition = '`pid` = 0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$pro_cateInfos = array();
			foreach($results as $key => $result) {
				$pro_cateInfos[] = new albumProduct ($result['slug'],
														$result['idpro'],
														$result['vn_name'],
														$result['en_name'],
														$result['position'],
														$result['status'],
														$result['id']
														);
			}
			return $pro_cateInfos;
		}
		return '';
	}

function getProductCategory($condition = 0) {
		$results = $this->select('*', "status =1 AND pid =$condition",  array('position'=>'ASC'),'','');
		if($results) {
			$pro_cateInfos = array();
			foreach($results as $key => $result) {
				$pro_cateInfos[] = new albumProduct ($result['slug'],
														$result['idpro'],
														$result['vn_name'],
														$result['en_name'],
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
				$pro_cateInfos[] = new albumProduct ($result['slug'],
														$result['idpro'],
														$result['vn_name'],
														$result['en_name'],
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
			$pro_cateInfo = new albumProduct ($result[0]['slug'],
												$result[0]['idpro'],
												$result[0]['vn_name'],
												$result[0]['en_name'],
												$result[0]['position'],
												$result[0]['status'],
												$result[0]['id']
												);
			return $pro_cateInfo;
		}
		return '';
	}
	function optionAllCategories($pk = 'id', $title = 'vn_name', $value='', $condition = 'pid=0', $sort = array('position' => 'ASC')){
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
	
	function getObjectsSub($page = 1, $pId = '0', $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$results = $this->select('*', "status = 1 and pid = '$pId'", array('id'=>'ASC'), $start, $items_per_page);
		if($results) {
			$pro_cateInfos = array();
			foreach($results as $key => $result) {
				$pro_cateInfos[] = new albumProduct ($result['slug'],
														$result['idpro'],
														$result['vn_name'],
														$result['en_name'],
														$result['position'],
														$result['status'],
														$result['id']
														);
			}
			return $pro_cateInfos;
		}
		return '';
	}
}
?>