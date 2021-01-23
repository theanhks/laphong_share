<?php
/*************************************************************************
Class Products
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/productinfo.class.php");

class Products extends Model {
	var $table;			# Default table name
	# Constructor
	function Products($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."product_host";	
	}
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$productInfo = new ProductInfo (
											$result[0]['slug'],
											$result[0]['vn_name'],
											$result[0]['en_name'],
											$result[0]['vn_details'],
											$result[0]['en_details'],
											$result[0]['vn_nsx'],
											$result[0]['en_nsx'],
											$result[0]['vn_nhanhieu'],
											$result[0]['en_nhanhieu'],
											$result[0]['price'],	
											$result[0]['s_price'],
											$result[0]['avatar'],	
											$result[0]['file1'],
											$result[0]['file2'],
											$result[0]['file3'],
											$result[0]['file4'],
											$result[0]['file5'], 
											$result[0]['position'],    
											$result[0]['date_published'],
											$result[0]['num_product'],
											$result[0]['category'],
											$result[0]['status'],	
											$result[0]['payment'],
											$result[0]['viewed'],	
											$result[0]['home'],	
											$result[0]['properties'],	
											$result[0]['id']
											);
			return $productInfo;
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
			$productInfos = array();
			foreach($results as $key => $result) {
				$productInfos[] = new ProductInfo (
											$result['productname'],
											$result['productinfo'],
											$result['productdescription'], 
											$result['productdate'],
											$result['productcode'],
											$result['productcatid'],
											$result['productviewcounter'],	
											$result['checkhome'],	
											$result['manufacturer'],	//NSX
											$result['productid']
											);
			}
			return $productInfos;
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
	
	function addData($pro, $page=1, $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$result = $this->add($pro);
		if($result) {
			return $result;
		}
		return '';
	}
	
	function updateData($pro, $mid) {
		$result = $this->update($pro, "id = '$mid' ");
		if($result) {
			return $result;
		}
		return '';
	}
		
	function increaseViewed($pId) {
		$sql = $this->update(array('viewed'=>'viewed'+1), "id='$pId'");
		if($sql) return 1;
		return 0;
	}
	
	
	function cleanTrash() {
	# Delete avatars from the hard disk
		$result = $this->select("avatar,file1", "status=2");
		if ($result)
		foreach ($result as $image){
			unlink(ROOT_PATH."gallery/avatar_upload/products/storage/".$image['avatar']);
			unlink(ROOT_PATH."gallery/avatar_upload/products/avatar/".$image['avatar']);
			unlink(ROOT_PATH."gallery/avatar_upload/products/thumb/".$image['avatar']);
			unlink(ROOT_PATH."gallery/avatar_upload/products/medium/".$image['avatar']);
			$photos=unserialize($image['file1']);
			foreach ($photos as $photo1){
				unlink(ROOT_PATH."gallery/avatar_upload/products/storage/".$photo1);
				unlink(ROOT_PATH."gallery/avatar_upload/products/avatar/".$photo1);
				unlink(ROOT_PATH."gallery/avatar_upload/products/thumb/".$photo1);
				unlink(ROOT_PATH."gallery/avatar_upload/products/medium/".$photo1);	
			}
		}
		$results = $this->delete("status=2");
		if ($results)
			return 1;
		return 0;
	}
	
	function getProductCategoryFromId($pId = 0) {
		$result = $this->select("category", "id='$pId'");
		if($result) {
			return $result[0]['category'];
		}
		return "";
	}
	function getProductFromSlug($slug = 0) {
		$result = $this->select("*", "status =1 AND slug='$slug'");
		if($result) {
			$productInfo = new ProductInfo ($result[0]['slug'],
											$result[0]['vn_name'],
											$result[0]['en_name'],
											$result[0]['vn_details'],
											$result[0]['en_details'],
											$result[0]['vn_nsx'],
											$result[0]['en_nsx'],
											$result[0]['vn_nhanhieu'],
											$result[0]['en_nhanhieu'],
											$result[0]['price'],	
											$result[0]['s_price'],
											$result[0]['avatar'],	
											$result[0]['file1'],
											$result[0]['file2'],
											$result[0]['file3'],
											$result[0]['file4'],
											$result[0]['file5'], 
											$result[0]['position'],    
											$result[0]['date_published'],
											$result[0]['num_product'],
											$result[0]['category'],
											$result[0]['status'],	
											$result[0]['payment'],
											$result[0]['viewed'],	
											$result[0]['home'],	
											$result[0]['properties'],	
											$result[0]['id']
											);
			return $productInfo;
		}
		return '';
	}
	
	
	function getCategory($cate="1=1") {
		$results = $this->select('*',"category = $cate and status = 1");
		if($results) 
			return 1;
		return '';
	}
	
}
?>