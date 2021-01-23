<?php
/*************************************************************************
Class Members
Avasoft CMS Project
Company: Avasoft Co., Ltd                                  
Name: Tran Thi Kim Que
Last updated: 08/03/2011
**************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH."classes/dao/memberinfo.class.php");
/*include_once('model.class.php');
include_once("memberinfo.class.php");*/

class Members extends Model {
	function Members($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."members";	
	}
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$memberInfo = new MemberInfo($result[0]['username'],
										$result[0]['password'],
										$result[0]['type'],
										$result[0]['fullname'],
										$result[0]['birthday'],
										$result[0]['about'],
										$result[0]['email'],
										$result[0]['country'],
										$result[0]['tinh'],
										$result[0]['company'],
										$result[0]['phai'],
										$result[0]['address'],
										$result[0]['tel'],
										$result[0]['fax'],
										$result[0]['cel'],
										$result[0]['date_created'],
										$result[0]['last_login'],
										$result[0]['status'],
										$result[0]['properties'],
										$key
										);
			return $memberInfo;
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
			$memberInfos = array();
			foreach($results as $key => $result) {
				$memberInfos[] = new MemberInfo($result['username'],
										$result['password'],
										$result['type'],
										$result['fullname'],
										$result['birthday'],
										$result['about'],
										$result['email'],
										$result['country'],
										$result['tinh'],
										$result['company'],
										$result['phai'],
										$result['address'],
										$result['tel'],
										$result['fax'],
										$result['cel'],
										$result['date_created'],
										$result['last_login'],
										$result['status'],
										$result['properties'],
										$result['id']
												);
			}
			return $memberInfos;
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
	function updateData($fields,$value='',$key='id') {
		$result = $this->update($fields," `$key` = '$value'");
		if($result)
			return $result;
		return "";
	}
	
	function changePassword($oId = 0, $password = '') {
		if(!$oId) return 0;
		if($this->update(array('password' => $password), "`id` = '$oId'")) return 1;
		return 0;
	}
	
	function lostPass($username = '', $password = '') {
		if(!$username) return 0;
		if($this->update(array('password' => $password), "`username` = '$username'")) return 1;
		return 0;
	}
		


/*-----------------------------------------------------------------------*
* Function: username
* Parameter: WHERE condition
* Return: 1 if id already exists, 0 if not exists
*-----------------------------------------------------------------------*/
	function getRecordFromUser($condition = '1=1') {
		$result = $this->select('id',$condition);
		if($result) return 1;
		return '';
	} 
	
	
	function authenticateUser($username,$pass) {
		$username = str_replace(" ",'',$username);
		$username = str_replace("\\",'',$username);
		$username = str_replace("\"",'',$username);
		$username = str_replace("'",'',$username);	
		$password = md5($pass);
		$result = $this->select('*',"`email` = '$username' AND `password` = '$password' and status=1");		
		if($result) {
			$this->update(array('last_login'=>date("Y-m-d H:i:s")), "id='".$result[0]['id']."'");
			return $result[0]['id'];
		}
		return 0;
	}
/*-----------------------------------------------------------------------*
* Function: getRecord
* Parameter: WHERE condition
* Return: 1 if id already exists, 0 if not exists
*-----------------------------------------------------------------------*/
	function getRecordFromU($username) {
		$result = $this->select('*',"`username` = '$username'");
		if($result) {
			$memberInfo = new MemberInfo($result[0]['username'],
										$result[0]['password'],
										$result[0]['type'],
										$result[0]['fullname'],
										$result[0]['birthday'],
										$result[0]['about'],
										$result[0]['email'],
										$result[0]['country'],
										$result[0]['tinh'],
										$result[0]['company'],
										$result[0]['phai'],
										$result[0]['address'],
										$result[0]['tel'],
										$result[0]['fax'],
										$result[0]['cel'],
										$result[0]['date_created'],
										$result[0]['last_login'],
										$result[0]['status'],
										$result[0]['properties'],
										$result[0]['id']
										);
			return $memberInfo;
		}
		return '';
	} 
	
function getRecordFromEmail($email) {
		$result = $this->select('*',"`email` = '$email'");
		if($result) {
			$memberInfo = new MemberInfo($result[0]['username'],
										$result[0]['password'],
										$result[0]['type'],
										$result[0]['fullname'],
										$result[0]['birthday'],
										$result[0]['about'],
										$result[0]['email'],
										$result[0]['country'],
										$result[0]['tinh'],
										$result[0]['company'],
										$result[0]['phai'],
										$result[0]['address'],
										$result[0]['tel'],
										$result[0]['fax'],
										$result[0]['cel'],
										$result[0]['date_created'],
										$result[0]['last_login'],
										$result[0]['status'],
										$result[0]['properties'],
										$result[0]['id']
										);
			return $memberInfo;
		}
		return '';
	} 
/*-------------------------------------------------------------------------*/
	function checkDuplicate($value = '', $key = 'username') {
		$value = str_replace(" ",'',$value);
		$value = str_replace("\\",'',$value);
		$value = str_replace("\"",'',$value);
		$value = str_replace("'",'',$value);
		$result = $this->select("`$key`","`$key` = '$value' ");
		if($result) return 1;
		return 0;
	}

/*-------------------------------------------------------------------------*/
	function checkQuestion($value = '', $value1 = '',$value2='', $key = 'username', $key1 = 'question', $key2 = 'answer') {
		
		$result = $this->select('*',"`$key` = '$value' AND `$key1` = '$value1' AND `$key2` = '$value2' ");
		if($result) return 1;
		return 0;
	}
		
/*-----------------------------------------------------------------------*
* Function: updateData
* Parameter: Info object
* Return: 1 if success, 0 if fail
*-----------------------------------------------------------------------*/	

	function changeStatus($id = 0, $status = '') {
		if(!$id) return 0;
		if($this->update(array('status' => $status), " `id` = '$id'")) return 1;
		return 0;
	}
	function checkOldPassword($name,$id, $oldpasspword) {
		global $messages;
		$this->messages = $messages;
		$password=md5($oldpasspword);
		//$true='';
		//$false = $name." - ".$this->messages['notValidCheckPass'].'<br />';
		if($this->select('*', "`id` = '$id' AND `password` = '$password' ")) return '';
		return $name." - ".$this->messages['notValidCheckPass'].'<br />';
		
	}
}
?>