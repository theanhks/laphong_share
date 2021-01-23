<?php
/*************************************************************************
Class URL
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 06/06/2008
**************************************************************************/
class Url
{
	function Url() {
	}    
	function getLink($op = "index",$lang="vn",$content="",$id) {
		$link = ROOTPATH;
		if (URL_TYPE == 1) $link .= "/index.php?op=$op&lang=$lang&slug=$content";
		else $link .="/$lang/products/".($content?"$content":"")."-".$id.".html";
		return $link;
	}
	function getBranchLink($op = "index",$lang="vn",$module = "detail",$content="introduction",$slug="") {
		$link = "http://".DOMAIN."/".(FOLDER?FOLDER."/":"");
		if (URL_TYPE == 1) $link .= "index.php?op=$op&lang=$lang&slug=$slug&module=$module&content=$content";
		else $link .= "$lang/$op/$slug/$module/$content".".html";
		return $link;
	}	
}
?>