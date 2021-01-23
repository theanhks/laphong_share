<?php
/*************************************************************************
Class Systems
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 21/07/2008
**************************************************************************/
include_once(ROOT_PATH."classes/dao/mysql.class.php");
include_once(ROOT_PATH."classes/dao/configs.class.php");

class Systems extends DB {
	var $table;
	function Systems() {
		$this->table = DB_PREFIX."config";		
	}
	function getConfig($key = "general") {
		$result = $this->query("SELECT * FROM ".$this->table." WHERE config_key = '$key'");
		if(mysql_num_rows($result)) {
			$row = mysql_fetch_array($result);
			mysql_free_result($result);
			$config = new Config ($key,$row['config_value']);
			return $config;
		}
		return "";
	}
	function updateConfig($config) {
		if ($this->query("UPDATE ".$this->table." SET config_value='".serialize($config->getProperties())."' WHERE config_key='".$config->getKey()."'")) return 1;
		return 0;
	}	
}	
?>