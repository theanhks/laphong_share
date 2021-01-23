<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
/*************************************************************************
ClassStaticpage
----------------------------------------------------------------
AvaCMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011   
**************************************************************************/

include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH.'classes/dao/voteinfo.class.php');

class Poll extends Model {
	function Poll($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."poll";	
	}

/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/

	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$voteInfo = new VoteInfo ($result[0]['idproduct'],
										$result[0]['iduser'],	
										$result[0]['chatluong_vote'],
										$result[0]['hinhdang_vote'],
										$result[0]['gia_vote'],
										$result[0]['name'],
										$result[0]['title'],
										$result[0]['comment'],
										$result[0]['status'],	
										$result[0]['date_created'],							
										$key
										);
			return $voteInfo;
		}
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
			$voteInfos = array();
			foreach($results as $key => $result) {
				$voteInfos[] = new VoteInfo ($result['idproduct'],
													$result['iduser'],	
													$result['chatluong_vote'],
													$result['hinhdang_vote'],
													$result['gia_vote'],
													$result['name'],
													$result['title'],
													$result['comment'],
													$result['status'],
													$result['date_created'],
													$result['id']
													);
			}
			return $voteInfos;
		}
		return '';
	}
	
/*-----------------------------------------------------------------------*
* Function: get so lan vote va diem
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/

	function getVoteProduct($idproduct) {
		$results = $this->getObjects(1, "idproduct=$idproduct");
		if($results) {
			#print_r($results);
			#$sodiem=0;
			$percent=0;
			foreach($results as $key => $result) {
				$this->update(array('chatluong_vote' => $result->getVote('chatluong')+1), " id = '$idproduct' ");
				#$sodiem += ($result->getVote('chatluong')+$result->getVote('hinhdang')+$result->getVote('gia'))/3;
			}
			$voteProduct = array();
			#$solan=count($results);
			#$sodiempro=round($sodiem/$solan);
			#$voteProduct = array('solan'=>$solan,'sodiem'=>$sodiempro);
			return $voteProduct;
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
* Function: check user vote product
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	

	function checkUserVoteProduct($idpro,$userId) {
		
		$result = $this->select('id',"`idproduct`=$idpro and `iduser`='$userId'");
		if($result) {			
			return 1;
			mysql_free_result($result);
		}
		return 0;
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
	function getPercent(){
		$total=0;
		$results = $this->getObjects(1, "status=1 AND gia_vote=1");
		#$records=(count($results));
		foreach($results as $key => $result) {
			$total+=$result->getVote('chatluong');
		}	
		return $total;	
	}
}
?>