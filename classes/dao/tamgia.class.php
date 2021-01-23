<?php
/*************************************************************************
Class TamGia
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/	

include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/tamgiainfo.class.php');

class TamGia extends Model {
	function TamGia($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."tamgia";
	}
	
	function updatetamgiaproductlist()
	{
		global $product ;
		
		$productlist = $product->select('id, price', "1=1", "", 0, 0);
		//print_r($productlist) ;
		//echo "<br/><br/>" ;
		//exit() ;
		if ($productlist)
		{
			foreach($productlist as $productone)
			{
				$tamgiaid = $this->findtamgia($productone["price"]) ;
				$resultone = $product->updatetamgiaid($productone["id"], $tamgiaid) ;
				//echo "[".$productone["id"]."-".$productone["price"]."-".$tamgiaid."]<br/>" ;
			}
		}
		
		//echo "done!" ;
		//exit() ;
	}
	
	function findtamgia($price)
	{
		//$price = 11000000 ;
		if (!$price) $price = 0 ;
		
		$result = $this->select('*',"
		
		(priceto>0 AND `pricefrom`<= '$price' AND `priceto`> '$price')
		OR
		(priceto<pricefrom AND `pricefrom`<= '$price')
		
		");
		
		if($result) {
			return $result[0]["id"] ;
			/*
			if (sizeof($result)==1)
			{
				return $result[0]
			}
			print_r($result) ;
			exit() ;
			*/
		}
		//echo "XXXX" ;
		//exit() ;
		return 0 ;
	}

/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$tamgia = new TamGiaInfo($result[0]['vn_name'],
									$result[0]['en_name'],
									$result[0]['status'],
									$result[0]['code'],
									$result[0]['pricefrom'],
									$result[0]['priceto'],
									$key
									);
			return $tamgia;
		}
		return '';
	}
	
	function getObjectByCode($code) {
		$result = $this->select('*',"`code` = '$code'");
		if($result) {
			$tamgia = new TamGiaInfo($result[0]['vn_name'],
									$result[0]['en_name'],
									$result[0]['status'],
									$result[0]['code'],
									$result[0]['pricefrom'],
									$result[0]['priceto'],
									$key
									);
			return $tamgia;
		}
		return '';
	}
	function getTamgiabyId($key = '0'){
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$tamgia = new TamGiaInfo($result[0]['vn_name'],
									$result[0]['en_name'],
									$result[0]['status'],
									$result[0]['code'],
									$result[0]['pricefrom'],
									$result[0]['priceto'],
									$key
									);
			return $tamgia;
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
	
	function getRecordByCode($code) {
		$result = $this->select('id',"`code` = '$code'");
		if($result) return $result[0]["id"];
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
			$adsInfo = array();
			foreach($results as $key => $result) {
				$adsInfo[] = new TamGiaInfo($result['vn_name'],
									$result['en_name'],
									$result['status'],
									$result['code'],
									$result['pricefrom'],
									$result['priceto'],
									$result['id']
									);
			}
			return $adsInfo;
			
		}
		return '';
	}
/*-----------------------------------------------------------------------*
* Function: addData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/
	function addData($object) {
			 return $this->add($object,'id','NULL');
	}
/*-----------------------------------------------------------------------*
* Function: updateData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function updateData($object,$agId) {
			 return $this->update($object,"id =$agId");
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
	
	function getParentName($pId, $lang = 'vn') {
		$result = $this->select("`".$lang."_name`", "`id` = '$pId'");
		if($result) {
			return $result[0][0];
		}
		return "/";
	}
/*-----------------------------------------------------------------------*
* Function: updateData
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/
	function isAdGroupEnabled($agId=0) {
		if(!$agId) return 0;
		$results = $this->select('status', "id='$agId'");
		if($results) {
			$row = $results[0][0];
			if($row == 1) return 1;
			return 0;
		}
		return 0;
	}	
}

?>
