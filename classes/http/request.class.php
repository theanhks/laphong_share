<?php
/*************************************************************************
Class Request
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 06/06/2008
**************************************************************************/
class Request
{
	function Request() {
	
	}    
    function element($name, $default = 0)
    {
      $TEMP1_ = '';
      if(isset($_SERVER['REQUEST_METHOD']) and $_SERVER['REQUEST_METHOD']=="GET")
      {
         $TEMP1_ = (isset($_GET[$name])?$_GET[$name]:"");
      }
      else
      {
         $TEMP1_ = (isset($_POST[$name])?$_POST[$name]:"");
      }
      if($TEMP1_ == '') $TEMP1_ = $default;
      return $TEMP1_;
    }
	
    function gElement($name, $default = 0)
    {
      $TEMP1_ = '';
      if(isset($_SERVER['REQUEST_METHOD']) and $_SERVER['REQUEST_METHOD']=="GET")
      {
         $TEMP1_ = (isset($_GET[$name])?$_GET[$name]:"");
      }
      if($TEMP1_ == '') $TEMP1_ = $default;
      return $TEMP1_;
    }

    function pElement($name, $default = 0)
    {
      $TEMP1_ = '';
      if(isset($_SERVER['REQUEST_METHOD']) and $_SERVER['REQUEST_METHOD']=="POST")
      {
         $TEMP1_ = (isset($_POST[$name])?$_POST[$name]:"");
      }
      if($TEMP1_ == '') $TEMP1_ = $default;
      return $TEMP1_;
    }		
    
    function script_name()
    {
      $TEMP1_ = '';
      $TEMP2_ = '';
      $TEMP1_ = $_SERVER['REQUEST_URI'];
      $TEMP2_ = $_SERVER['QUERY_STRING'];
      $TEMP1_ = str_replace($TEMP2_,'',$TEMP1_);
      $TEMP1_ = split ('[/-]', $TEMP1_);
      return $TEMP1_[count($TEMP1_)-1];
    }

    function script_name_()
    {
      $TEMP1_ = '';
      $TEMP1_= $_SERVER['SCRIPT_FILENAME'];
      $TEMP1_=split ('[/-]', $TEMP1_);
      return $TEMP1_[count($TEMP1_)-1];
    }
    
    function query()
    {
      $TEMP1_ = '';
      $TEMP2_ = '';

      if(isset($_SERVER['REQUEST_METHOD']) and $_SERVER['REQUEST_METHOD']=="GET")
      {
        for($i=0;$i<count(array_keys($_GET));$i++)
        {
             $TEMP1_ = array_keys($_GET);
             $TEMP1_= $TEMP1_[$i];
             global ${$TEMP1_};
             $this->{$TEMP1_}=$_GET[$TEMP1_];
             if($i<count(array_keys($_GET))-1)
               $TEMP2_=$TEMP2_.$TEMP1_.'='.$_GET[$TEMP1_].'&';
             else
               $TEMP2_=$TEMP2_.$TEMP1_.'='.$_GET[$TEMP1_];
        }
      }
      else
      {
        for($i=0;$i<count(array_keys($_POST));$i++)
        {
             $TEMP1_ = array_keys($_POST);
             $TEMP1_= $TEMP1_[$i];
             global ${$TEMP1_};
             $this->{$TEMP1_}=$_POST[$TEMP1_];
             if($i<count(array_keys($_POST))-1)
               $TEMP2_=$TEMP2_.$TEMP1_.'='.$_POST[$TEMP1_].'&';
             else
               $TEMP2_=$TEMP2_.$TEMP1_.'='.$_POST[$TEMP1_];

        }
      }
	  return $TEMP2_;
    }
	function subDomain()
	{
		$split = split("\.",$_SERVER['HTTP_HOST']);
		$subdomain = $split[0];
		if($subdomain == "www") return 0;
		if(count($split) < 3) return 0;
		return $subdomain;	
	}
}
?>