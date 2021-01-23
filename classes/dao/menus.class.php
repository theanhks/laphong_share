<?php
/*************************************************************************
Class Menus
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 07/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/menuinfo.class.php');
class Menus extends Model {
	function Menus($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."menus";	
	}
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$menuInfo = new MenuInfo ($result[0]['pid'],
									$result[0]['mgid'],
									$result[0]['slug'],
									$result[0]['vn_name'],
									$result[0]['en_name'],
									$result[0]['vn_url'],
									$result[0]['en_url'],
									$result[0]['status'],
									$result[0]['position'],
									$key
									);
			return $menuInfo;
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
			$menuInfos = array();
			foreach($results as $key => $result) {
				$menuInfos[] = new MenuInfo ($result['pid'],
											$result['mgid'],
											$result['slug'],
											$result['vn_name'],
											$result['en_name'],
											$result['vn_url'],
											$result['en_url'],
											$result['status'],
											$result['position'],
											$result['id']
											);
			}
			return $menuInfos;
		}
		return '';
	}
	

/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getMenusGroup($mgid) {
		$results = $this->select('*', "status =1 AND mgid=$mgid",array('position'=>'ASC'), '', '');
		if($results) {
			$menuInfos = array();
			foreach($results as $key => $result) {
				$menuInfos[] = new MenuInfo ($result['pid'],
											$result['mgid'],
											$result['slug'],
											$result['vn_name'],
											$result['en_name'],
											$result['vn_url'],
											$result['en_url'],
											$result['status'],
											$result['position'],
											$result['id']
											);
			}
			return $menuInfos;
		}
		return '';
	}
/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getFrontMenus($pid = 0) {
		$results = $this->select('*', "pid = $pid AND status =1",array('position'=>'ASC'),'','');
		if($results) {
			$menuInfos = array();
			foreach($results as $key => $result) {
				$menuInfos[] = new MenuInfo ($result['pid'],
											$result['mgid'],
											$result['slug'],
											$result['vn_name'],
											$result['en_name'],
											$result['vn_url'],
											$result['en_url'],
											$result['status'],
											$result['position'],
											$result['id']
											);
			}
			return $menuInfos;
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
	
	function getSubMenuName($pId) {
		$results = $this->select("*", "`pid` = '$pId' and status=1",array('position'=>'ASC'));
		if($results) {
			$menuInfos = array();
			foreach($results as $key => $result) {
				$menuInfos[] = new MenuInfo ($result['pid'],
											$result['mgid'],
											$result['slug'],
											$result['vn_name'],
											$result['en_name'],
											$result['vn_url'],
											$result['en_url'],
											$result['status'],
											$result['position'],
											$result['id']
											);
			}
			return $menuInfos;
		}
		return '';
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
	
	function addObjects($menu, $page=1, $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$result = $this->add($menu);
		if($result) {
			return $result;
		}
		return '';
	}
	
	function updateObjects($menu, $mid) {
		$result = $this->update($menu, "id = '$mid' ");
		if($result) {
			return $result;
		}
		return '';
	}
	
	function optionAllMenus($pk = 'id', $title = 'vn_name', $value='', $condition = 'pid=0', $sort = array('position' => 'ASC')){
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
	
	function getMenuFromSlug($slug = '0') {
		$result = $this->select('*',"`slug` = '$slug' and status=1");
		if($result) {
			$menuInfo = new MenuInfo ($result[0]['pid'],
									$result[0]['mgid'],
									$result[0]['slug'],
									$result[0]['vn_name'],
									$result[0]['en_name'],
									$result[0]['vn_url'],
									$result[0]['en_url'],
									$result[0]['status'],
									$result[0]['position'],
									$result[0]['id']
									);
			return $menuInfo;
		}
		return '';
	}
	
	function getMenuFromId($mId = '0') {
		$result = $this->select('*',"`id` = '$mId' and status=1");
		if($result) {
			$menuInfo = new MenuInfo ($result[0]['pid'],
									$result[0]['mgid'],
									$result[0]['slug'],
									$result[0]['vn_name'],
									$result[0]['en_name'],
									$result[0]['vn_url'],
									$result[0]['en_url'],
									$result[0]['status'],
									$result[0]['position'],
									$result[0]['id']
									);
			return $menuInfo;
		}
		return '';
	}
}
?>