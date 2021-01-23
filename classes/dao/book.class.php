<?php
/*************************************************************************
Class Members
Avasoft CMS Project
Company: Avasoft Co., Ltd
Name: Tran Thi Kim Que
Last updated: 08/03/2011
 **************************************************************************/
include_once(ROOT_PATH.'classes/dao/model.class.php');
include_once(ROOT_PATH."classes/dao/bookinfo.class.php");
/*include_once('model.class.php');
include_once("memberinfo.class.php");*/

class Book extends Model {
    function Book($database = '') {
        if(!$database) {
            global $db;
            $this->_db = $db;
        } else $this->_db = $database;
        $this->table = DB_PREFIX."book";
    }
    /*-----------------------------------------------------------------------*
    * Function: getObject
    * Parameter: key
    * Return: Info object
    *-----------------------------------------------------------------------*/
    function getObject($key = '0') {
        $result = $this->select('*',"`id` = '$key'");
        if($result) {
            $bookInfo = new BookInfor($result[0]['name'],
                $result[0]['email'],
                $result[0]['tel'],
                $result[0]['date'],
                $result[0]['time'],
                $result[0]['note'],
                $result[0]['quantity'],
                $result[0]['status'],
                $result[0]['id']
            );
            return $bookInfo;
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
            $bookInfo = array();
            foreach($results as $key => $result) {
                $bookInfo[] = new BookInfor($result['name'],
                    $result['email'],
                    $result['tel'],
                    $result['date'],
                    $result['time'],
                    $result['note'],
                    $result['quantity'],
                    $result['status'],
                    $result['id']
                );

            }
            return $bookInfo;
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
    function updateData($fields,$value='',$key='id') {
        $result = $this->update($fields," `$key` = '$value'");
        if($result)
            return $result;
        return "";
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

}
?>