<?php
/*************************************************************************
Class Users
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com
Author: Mai Minh
Last updated: 30/09/2009
**************************************************************************/
/* Edit log:
- 30/09/2009 08:00 - Mai Minh: Initialize
*/

include_once(ROOT_PATH."classes/dao/model.class.php");
include_once(ROOT_PATH."classes/dao/userinfo.class.php");

class Users extends Model {
	function Users($database = '') {
		if(!$database) {
			global $db;
			$this->_db = $db;
		} else $this->_db = $database;
		$this->table = DB_PREFIX."user";	
	}	

	function getUserInfo($userId = 0) {
		if(!$userId) return 0;
		$result = $this->select('*',"id = '$userId'");
		if($result) {
			$row = $result[0];
			$userInfo = new UserInfo( $row['username'], $row['password'], $row['email'], $row['about'], $row['fname'], $row['lname'], $row['company'], $row['tax'], $row['address'], $row['address2'], $row['tel'], $row['fax'], $row['cell'], $row['type'], $row['date_created'], $row['last_login'], $row['status'], $row['properties'], $row['id'] );
			return $userInfo;
		}
		return 0;
	}
	
	function authenticateUser($username,$password) {
		$username = str_replace(" ",'',$username);
		$username = str_replace("\\",'',$username);
		$username = str_replace("\"",'',$username);
		$username = str_replace("'",'',$username);	
		$password = md5($password);
		$result = $this->select('*',"`username` = '$username' AND `password` = '$password'");
		if($result) {
			$this->update(array('last_login'=>date("Y-m-d H:i:s")), "id='".$result[0]['id']."'");
			return $result[0]['id'];
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
/*-----------------------------------------------------------------------*
* Function: getObject
* Parameter: key
* Return: Info object
*-----------------------------------------------------------------------*/
	function getObject($key = '0') {
		$result = $this->select('*',"`id` = '$key'");
		if($result) {
			$userInfo = new UserInfo($result[0]['username'],
									$result[0]['password'],
									$result[0]['email'],
									$result[0]['about'],
									$result[0]['fname'],
									$result[0]['lname'],																		
									$result[0]['company'],
									$result[0]['tax'],
									$result[0]['address'],
									$result[0]['address2'],
									$result[0]['tel'],
									$result[0]['fax'],
									$result[0]['cell'],
									$result[0]['type'],
									$result[0]['date_created'],
									$result[0]['last_login'],
									$result[0]['status'],
									$result[0]['properties'],
									$key
									);
			return $userInfo;
		}
		return '';
	}
/*-----------------------------------------------------------------------*
* Function: getObjects
* Parameter: WHERE condition
* Return: Array of Info objects
*-----------------------------------------------------------------------*/
	function getObjects($page = 1, $condition = '`id` = 0', $sort = array(), $items_per_page = DEFAULT_ADMIN_ROWS_PER_PAGE) {
		if(!$page) $page = 1;
		$start = ($page -1) * $items_per_page;
		$results = $this->select('*', $condition, $sort, $start, $items_per_page);
		if($results) {
			$userInfos = array();
			foreach($results as $key => $result) {
				$userInfos[] = new UserInfo($result['username'],
											$result['password'],
											$result['email'],
											$result['about'],
											$result['fname'],
											$result['lname'],																		
											$result['company'],
											$result['tax'],
											$result['address'],
											$result['address2'],
											$result['tel'],
											$result['fax'],
											$result['cell'],
											$result['type'],
											$result['date_created'],
											$result['last_login'],
											$result['status'],
											$result['properties'],
											$result['id']
											);
			}
			return $userInfos;
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
* Function: updatePosition
* Parameter: Info object
* Return: 1 if key already exists, 0 if not exists
*-----------------------------------------------------------------------*/	
	function changePassword($oId = 0, $password = '') {
		if(!$oId) return 0;
		if($this->update(array('password' => $password), "`id` = '$oId'")) return 1;
		return 0;
	}
	
	function duplicateEmail($email,$userId=0) {
		
		$result = $this->select('id',"email=$email and ($userId?id<>'$userId':'')");
		if($result) {
			mysql_free_result($result);
			return 1;
		}
		return 0;
	}
	function getRecordFromUser($condition = '1=1') {
		$result = $this->select('id',$condition);
		if($result) return 1;
		return '';
	} 
function getRecordFromU($username) {
		$result = $this->select('username',"`username` = '$username'");
		if($result) return 1;
		return '';
	} 
function lostPass($username = '', $password = '') {
		if(!$username) return 0;
		if($this->update(array('password' => $password), "`username` = '$username'")) return 1;
		return 0;
	}
/*	function getItemPages($sql,$where='(1=1)',$items_per_page = ADMIN_ROWS_PER_PAGE) {
		$pages = 1;		
		$result = $this->query($sql.$where);
		$rows = mysql_num_rows($result);
		if($rows > 0) {
			$pages = ceil($rows/$items_per_page);
			return $pages;
		}
		return 1;
	}
	function getUsers($page=1,$query="(1=1)",$items_per_page = ADMIN_ROWS_PER_PAGE) {
		$users = array();
		$start = ($page-1)*$items_per_page;		
		$result = $this->query("SELECT * FROM ".$this->table." WHERE $query LIMIT $start,$items_per_page");
		if(mysql_num_rows($result)) {
			while($row=mysql_fetch_Array($result)) {
				$users[] = new UserInfo( $row['username'], $row['password'], $row['email'], $row['about'], $row['fname'], $row['lname'], $row['company'], $row['tax'], $row['address'], $row['address2'], $row['tel'], $row['fax'], $row['cell'], $row['type'], $row['date_created'], $row['last_login'], $row['status'], $row['id'] );
			}
			mysql_free_result($result);
			return $users;
		}
		return "";
	}
	function deleteUser($userId=0) {
		$sql = "UPDATE ".DB_PREFIX."users SET status='2' WHERE id='$userId'";
		if($this->query($sql)) return 1;
		return 0;
	}
	function enableUser($userId=0) {
		$sql = "UPDATE ".DB_PREFIX."users SET status='1' WHERE id='$userId'";
		if($this->query($sql)) return 1;
		return 0;
	}
	function updateUser($userId,$user) {
		$sql = "UPDATE ".DB_PREFIX."users SET
		id='".$user->getId()."',
		username='".$user->getUserName()."',
		".($user->getPassword()?"password='".md5($user->getPassword())."',":"")."
		type='".$user->getUserType()."',
		fname='".$user->getFirstName()."',
		lname='".$user->getLastName()."',
		email='".$user->getEmail()."',
		company='".addslashes($user->getCompany())."',
		tax='".addslashes($user->getTax())."',		
		address='".addslashes($user->getAddress())."',
		tel='".addslashes($user->getTel())."',
		fax='".addslashes($user->getFax())."',
		cell='".addslashes($user->getCell())."',
		status='".$user->getStatus()."'
		WHERE id='".$userId."'";
		if($this->query($sql)) return 1;
		return 0;
	}
	function cleanTrash() {
		$sql = "DELETE FROM ".DB_PREFIX."users WHERE status='2'";
		if($this->query($sql)) return 1;
		return 0;
	}
	function addUser(&$user) {
		$sql = "INSERT INTO ".DB_PREFIX."users (id,username,password,type,fname,lname,about,email,company,tax,address,address2,tel,fax,cell,date_created,status)
		 VALUES (NULL,'".$user->getUserName()."','".md5($user->getPassword())."','".$user->getUserType()."','".addslashes($user->getFirstName())."','".addslashes($user->getLastName())."','".addslashes($user->getAbout())."','".$user->getEmail()."','".addslashes($user->getCompany()). "','".addslashes($user->getTax())."','". addslashes($user->getAddress())."','". addslashes($user->getAddress2()). "','". addslashes($user->getTel())."','".addslashes($user->getFax())."','".addslashes($user->getCell())."','".date("Y-m-d H:i:s")."','".$user->getStatus()."')";
		if($this->query($sql)) return 1;
		return 0;
	}
	function duplicateUsername($username,$userId=0) {
		$sql = "SELECT id FROM ".DB_PREFIX."users WHERE username='$username'".($userId?" AND id<>'$userId'":"");
		$result = $this->query($sql);
		if(mysql_num_rows($result)) {
			mysql_free_result($result);
			return 1;
		}
		return 0;
	*/		
	
}
?>