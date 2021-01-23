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
include_once(ROOT_PATH.'classes/dao/orderiteminfo.class.php');

class OrderItem extends Model {
	function OrderItem($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."order_items";
	}

/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$order = new OrderItemInfo($result[0]['oid'],
										$result[0]['pid'],
										$result[0]['slug'],
										$result[0]['product_name'],
										$result[0]['product_size'],
										$result[0]['product_color'],
										$result[0]['price'],
										$result[0]['quantity'],
										$result[0]['date_created'],
										$result[0]['status'],
										$key
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
				$orderInfo[] = new OrderItemInfo($result['oid'],
												$result['pid'],
												$result['slug'],
												$result['product_name'],
												$result['product_size'],
												$result['product_color'],
												$result['price'],
												$result['quantity'],
												$result['date_created'],
												$result['status'],
												$result['id']
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
	function getOrderItemFromOId($oId = '0') {
		$results = $this->select('*', "oid = '$oId '");
		if($results) {
			$orderInfo = array();
			foreach($results as $key => $result) {
				$orderInfo[] = new OrderItemInfo($result['oid'],
												$result['pid'],
												$result['slug'],
												$result['product_name'],
												$result['product_size'],
												$result['product_color'],
												$result['price'],
												$result['quantity'],
												$result['date_created'],
												$result['status'],
												$result['id']
												);
			}
			return $orderInfo;
			
		}
		return '';
	}
	
}

?>
