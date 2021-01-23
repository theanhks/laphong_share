<?php
/*************************************************************************
Class Ads
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen
Last updated:15/10/2009
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/explorationinfo.class.php');
class Exploration extends Model {
	function Exploration($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."exploration";	
	}

/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$exp = new ExplorationInfo($result[0]['pid'],
										$result[0]['vn_name'],
										$result[0]['en_name'],
										$result[0]['cn_name'],
										$result[0]['amount'],
										$result[0]['position'],
										$result[0]['status'],
										$result[0]['properties'],
										$key
										);
			return $exp;
		}
		return '';
	}
	function getObjects($page = 1, $condition = '1>0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page - 1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$expInfos = array();
			foreach($results as $key => $result) {
				$expInfos[] = new ExplorationInfo ($result['pid'],
													$result['vn_name'],
													$result['en_name'],
													$result['cn_name'],
													$result['amount'],
													$result['position'],
													$result['status'],
													$result['properties'],
													$result['id']
													);
			}
			return $expInfos;		
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
	
	/*-----------------------------------------------------------------------*
* Function: getAmountFromPId
* Parameter: WHERE pId
* Return: array
*-----------------------------------------------------------------------*/	
	function getAmountFromPId($pId) {
		$result = $this->select("*", "pid=$pId",array('position'=>'ASC'));
		if($result) {
			$expInfos = array();
			foreach($result as $key => $results) {
				$expInfos[] = new ExplorationInfo ($results['pid'],
													$results['vn_name'],
													$results['en_name'],
													$results['cn_name'],
													$results['amount'],
													$results['position'],
													$results['status'],
													$results['properties'],
													$results['id']
													);
			}
			return $expInfos;		
		}
		return '';
	}
	
	function getExpFromId($Id) {
		$result = $this->select("*", "pid=$Id and status=1", array('position'=>'ASC'));
		if($result) {
			$expInfos = array();
			foreach($result as $key => $results) {
				$expInfos[] = new ExplorationInfo ($results['pid'],
													$results['vn_name'],
													$results['en_name'],
													$results['cn_name'],
													$results['amount'],
													$results['position'],
													$results['status'],
													$results['properties'],
													$results['id']
													);
			}
			return $expInfos;		
		}
		return '';
	}
	
	function getSum($field='*', $pId=0) {
		$result = $this->select( "$field", "pid=$pId");
		$sum = 0;
		foreach($result as $key=>$value)
		{
			$sum = $sum + $value['amount'];
		}
		return $sum;
	}
	
	function getSumAmountFromPId($pId=0) {
		$result = $this->select( 'sum(`amount`)', "pid=$pId");
		if ($result) return $result[0][0];
		else return '';
	}
	
	function optionAllExploration($pk = 'id', $title = 'vn_name', $value='', $condition = 'pid=0', $Id='0', $sort = array('position' => 'ASC')){
	$str = '';
	$results = $this->select("`$pk`,`$title`", $condition, $sort);
		if($results ) {
			foreach($results as $key => $result) {
				$str .= "<option value=\"".$result[$pk]."\"".($result[$pk]==$value?" selected":"").">".$result[$title]."</option>";
				//echo $Id;
				$rs=$this->select("`$pk`,`$title`","pid='".$result['id']."' and pid !='".$Id."'");
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
}
?>