<?php
/*************************************************************************
Class AdsGroups
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Name: Nguyen Anh Ngoc                                    
Last updated: 14/10/2009
**************************************************************************/	

include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/orderinfo.class.php');

class Order extends Model {
	function Order($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."orders";
	}

/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$order = new OrderInfo($result[0]['code'],
									$result[0]['cid'],
									$result[0]['name'],
									$result[0]['email'],
									$result[0]['address'],
									$result[0]['province'],
									$result[0]['tel'],
									$result[0]['cell'],
									$result[0]['rname'],
									$result[0]['raddress'],
									$result[0]['rprovince'],
									$result[0]['rtel'],
									$result[0]['rcell'],
									$result[0]['rdate'],
									$result[0]['gift_box'],
									$result[0]['comment'],
									$result[0]['date_created'],
									$result[0]['last_updated'],
									$result[0]['status'],
									$result[0]['id'],
									$result[0]['deposited']
									);
			return $order;
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
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObjects($page = 1, $condition = '1>0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$orderInfo = array();
			foreach($results as $key => $result) {
				$orderInfo[] = new OrderInfo($result['code'],
											$result['cid'],
											$result['name'],
											$result['email'],
											$result['address'],
											$result['province'],
											$result['tel'],
											$result['cell'],
											$result['rname'],
											$result['raddress'],
											$result['rprovince'],
											$result['rtel'],
											$result['rcell'],
											$result['rdate'],
											$result['gift_box'],
											$result['comment'],
											$result['date_created'],
											$result['last_updated'],
											$result['status'],
											$result['id'],
											$result['deposited']
											);
			}
			return $orderInfo;
			
		}
		return '';
	}
/*-----------------------------------------------------------------------*
* Function: addData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/
	function addData($object) {
			 $this->add($object,'id','NULL');
	}
/*-----------------------------------------------------------------------*
* Function: updateData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function updateData($object,$agId) {
			 $this->update($object,"id =$agId");
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
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getIdFromCode($key = '0') {
		$result = $this->select('*',"`code` = '$key'");
		if($result) {
			$order = new OrderInfo($result[0]['code'],
									$result[0]['cid'],
									$result[0]['name'],
									$result[0]['email'],
									$result[0]['address'],
									$result[0]['province'],
									$result[0]['tel'],
									$result[0]['cell'],
									$result[0]['rname'],
									$result[0]['raddress'],
									$result[0]['rprovince'],
									$result[0]['rtel'],
									$result[0]['rcell'],
									$result[0]['rdate'],
									$result[0]['gift_box'],
									$result[0]['comment'],
									$result[0]['date_created'],
									$result[0]['last_updated'],
									$result[0]['status'],
									$result[0]['id'],
									$result[0]['deposited']
									);
			return $order;
		}
		return '';
	}
	
	function getOrderSearch($key = '0', $cell = '0') {
		$result = $this->select('*',"`code` = '$key' and (tel = '$cell' or cell = '$cell')");
		if($result) {
			$order = new OrderInfo($result[0]['code'],
									$result[0]['cid'],
									$result[0]['name'],
									$result[0]['email'],
									$result[0]['address'],
									$result[0]['province'],
									$result[0]['tel'],
									$result[0]['cell'],
									$result[0]['rname'],
									$result[0]['raddress'],
									$result[0]['rprovince'],
									$result[0]['rtel'],
									$result[0]['rcell'],
									$result[0]['rdate'],
									$result[0]['gift_box'],
									$result[0]['comment'],
									$result[0]['date_created'],
									$result[0]['last_updated'],
									$result[0]['status'],
									$result[0]['id'],
									$result[0]['deposited']
									);
			return $order;
		}
		return '';
	}

	function getParentName($pId, $lang = 'vn') {
		$result = $this->select("`code`", "`id` = '$pId'");
		if($result) {
			return $result[0][0];
		}
		return "/";
	}
	
}

?>
