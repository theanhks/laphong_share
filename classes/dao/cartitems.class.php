<?php
/*************************************************************************
Class CartItems
----------------------------------------------------------------
Derasoft CMS Project
Created: 28/11/2008
Last updated: 01/12/2008
Author: Mai Minh (http://maiminh.vnweblogs.com)
**************************************************************************/
include_once("model.class.php");
include_once("cartiteminfo.class.php");

class CartItems extends Model {
	# Constructor
	function CartItems($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."cart_items";	
	}	
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$cartItemInfo = new CartItemInfo (	$result[0]['sid'],
												$result[0]['pid'],
												$result[0]['slug'],
												$result[0]['product_name'],
												$result[0]['product_code'],
												$result[0]['product_size'],
												$result[0]['product_color'],
												$result[0]['quantity'],
												$result[0]['price'],
												$result[0]['s_price'],
												$result[0]['avatar'],
												$result[0]['time_stamp'],
												$key
												);
			return $cartItemInfo;
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
			$cartItemInfos = array();
			foreach($results as $key => $result) {
				$cartItemInfos[] = new CartItemInfo (	$result['sid'],
														$result['pid'],
														$result['slug'],
														$result['product_name'],
														$result['product_code'],
														$result['product_size'],
														$result['product_color'],
														$result['quantity'],
														$result['price'],
														$result['s_price'],
														$result['avatar'],
														$result['time_stamp'],
														$result['id']
														);
			}
			return $cartItemInfos;
		}
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
	
	
	function getParentName($pId, $lang = 'vn') {
		$result = $this->select("`".$lang."_name`", "`id` = '$pId'");
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
/*-----------------------------------------------------------------------*
* Function: deleteData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function deleteData($iId) {
		$result = $this->delete("id =$iId ");
		if($result)
			return 1;
		return 0;
	}

	function isItemInCart($sId,$pId=0) {
		$result = $this->select('pid',"pid='$pId' and sid='$sId'");
		if($result) {
			return 1;
		}
		return 0;		
	}
	
	# Empty Cart
	function emptyCart($sId) {
		$result = $this->delete("sid =$sId ");
		if($result)
			return 1;
		return 0;
	}
	
	# Empty Cart
	function getCartItemsNumber($sessionId='') {
		$result = $this->select("count(`id`)", "sid='$sessionId'");
		if($result)
			return $result[0][0];
		return '';
	}
	
	function getSumQuantity($sessionId='') {
		$result = $this->select("sum(`quantity`)", "sid='$sessionId'");
		if($result)
			return $result[0][0];
		return '';
	}	
	# Update the cartItem quantity with provided ID
	function updateCartItemQuantity($quantity,$iId) {
		# Update database
		$result = $this->update($quantity,"id=$iId");
		if($result) return 1;
		return 0;
	}	
	function getSumPrice($sId = 0) {
		$result = $this->select("sum(`price`)","sid='$sId'");
		if($result) {
			return $result[0][0];
		}
		return '';		
	}	
	function getTestPId($pId = '0', $sId = 0) {
		$result = $this->select('*',"`pid` = '$pId' and sid='$sId'");
		if($result) 
			return 1;
		return '';
	}	
	function getCartItem($pId = '0', $sId = '0') {
		$result = $this->select('*',"`pid` = '$pId' and sid = '$sId'");
		if($result) {
			$cartItemInfo = new CartItemInfo (	$result[0]['sid'],
												$result[0]['pid'],
												$result[0]['slug'],
												$result[0]['product_name'],
												$result[0]['product_code'],
												$result[0]['product_size'],
												$result[0]['product_color'],
												$result[0]['quantity'],
												$result[0]['price'],
												$result[0]['s_price'],
												$result[0]['avatar'],
												$result[0]['time_stamp'],
												$result[0]['id']
												);
			return $cartItemInfo;
		}
		return '';
	}
}
?>