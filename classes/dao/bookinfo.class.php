<?php
/*************************************************************************
Class MemberInfo
----------------------------------------------------------------
Avasoft CMS Project
Company: Avasoft Co., Ltd
Name: Tran Thi Kim Que
Last updated: 08/03/2011
 **************************************************************************/
class BookInfor {
    var $id;
    var $name;
    var $email;
    var $tel;
    var $date;
    var $time;
    var $note;
    var $quantity;
    var $status ;
    function BookInfor ($name='', $email='', $tel='', $date='', $time='', $note='', $quantity='' ,$status =1, $id = 0)
    {
        $this->id = $id;
        $this->name = $name;
        $this->email = $email;
        $this->tel = $tel;
        $this->date = $date;
        $this->time = $time;
        $this->note =$note;
        $this->quantity = $quantity;
        $this->status = $status;
    }

    function getId() {
        return $this->id;
    }
    function setId($nValue) {
        $this->id=$nValue;
    }
    function getName() {
        return $this->name;
    }
    function setName($nValue) {
        $this->name=$nValue;
    }

    function getEmail() {
        return $this->email;
    }
    function setEmail($nValue) {
        $this->email = $nValue;
    }

    function getTel() {
        return $this->tel;
    }
    function setTel($nValue) {
        $this->tel = $nValue;
    }

    function getDate() {
        return $this->date;
    }

    function setDate($nValue) {
        $this->date = $nValue;
    }

    function getTime() {
        return $this->time;
    }
    function setTime($nValue) {
        $this->time = $nValue;
    }

    function getNote() {
        return $this->note;
    }
    function setNote($nValue) {
        $this->note = $nValue;
    }

    function getQuantity() {
        return $this->quantity;
    }
    function setQuantity($nValue) {
        $this->quantity = $nValue;
    }

    function getStatus() {
        return $this->status;
    }
    function setStatus($nValue) {
        $this->status = $nValue;
    }
    function isEnabled() {
        return ($this->status == 1?1:0);
    }
    function isDeleted() {
        return ($this->status == 2?1:0);
    }
    function isDisabled() {
        return ($this->status == 0?1:0);
    }

    function getStatusText() {
        global $amessages;
        return $amessages['status_text'][$this->status];
    }
}
?>