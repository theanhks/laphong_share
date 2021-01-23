<?php
/*************************************************************************
Admin Functions
----------------------------------------------------------------
DeraCMS Project
Company: Derasoft Co., Ltd                                  
Email: info@derasoft.com                                    
Last updated: 29/09/2009
**************************************************************************/

function optionPager($url, $pages = 1, $page = 1){
	$str = '';
	for($i = 1;$i <= $pages;$i++) {
		$str .= '<option value="'.$url.$i.'"'.($page==$i?' selected':'').'>'.$i.'</option>';
	}
	return $str;
}

/*-----------------------------------------------------------------------*
* Function: linkPager
* Parameter: URL, pages, page, open_tag, close_tag, seperator
* Return: Info object
*-----------------------------------------------------------------------*/
function linkPager($url, $pages = 1, $page = 1, $open_tag = '<li>', $close_tag = '</li>', $separator = ''){
	$str = '';
	$start = $page - 3;
	if($start < 1) $start = 1;
	$end = $page + 3;
	if($end > $pages) $end = $pages;
	$str .= $open_tag.'<a href="'.sprintf($url,1).'"><<</a>'.$close_tag.$separator;
	for($i = $start;$i <= $end;$i++) {
		if($i == $page) {
			$str .= $open_tag.'<strong>'.$i.'</strong>'.$close_tag.$separator;
		} else {
			$str .= $open_tag.'<a href="'.sprintf($url,$i).'">'.$i.'</a>'.$close_tag;
		}
	}
	$str .= $open_tag.'<a href="'.sprintf($url,$pages).'">>></a>'.$close_tag;
	return $str;
}

function optionStatus($value = '-1', $lang = DEFAULT_ADMIN_LANGUAGE){
	global $amessages;
	$str = '';
	$str = '<option value="1"'.($value==1?" selected":"").'>'.$amessages['status_text'][1].'</option>
	<option value="0"'.($value==0?" selected":"").'>'.$amessages['status_text'][0].'</option>
	<option value="2"'.($value==2?" selected":"").'>'.$amessages['status_text'][2].'</option>';
	return $str;
}
function optionLang($value = '-1', $lang = DEFAULT_ADMIN_LANGUAGE){
	global $amessages;
	$str = '';
	$str = '<option value="vn"'.($value=='vn'?" selected":"").'>'.$amessages['search_lang'][1].'</option>	
	<option value="en"'.($value=='en'?" selected":"").'>'.$amessages['search_lang'][0].'</option>';
	return $str;
}
function optionNewsUpdateItemsPerRow($value=3){
	$str = '';
	$str = '<option value="3"'.($value==3?" selected":"").'>3</option>
	<option value="4"'.($value==4?" selected":"").'>4</option>
	<option value="5"'.($value==5?" selected":"").'>5</option>
	<option value="6"'.($value==6?" selected":"").'>6</option>
	<option value="7"'.($value==7?" selected":"").'>7</option>;
	<option value="8"'.($value==8?" selected":"").'>8</option>;
	<option value="9"'.($value==9?" selected":"").'>9</option>;
	<option value="10"'.($value==10?" selected":"").'>10</option>';
	return $str;
}
function optionItemsPerRow($value=5){
	$str = '';
	$str = '<option value="5"'.($value==5?" selected":"").'>5</option>
	<option value="10"'.($value==10?" selected":"").'>10</option>
	<option value="15"'.($value==15?" selected":"").'>15</option>
	<option value="20"'.($value==20?" selected":"").'>20</option>
	<option value="25"'.($value==25?" selected":"").'>25</option>';
	return $str;
}
function optionPopup($value = 1){
	global $amessages;
	$str = '';
	$str = '<option value="1"'.($value==1?" selected":"").'>'.$amessages['yes'].'</option>
	<option value="0"'.($value=='0'?" selected":"").'>'.$amessages['No'].'</option>';
	return $str;
}
function listGender($value = '0', $lang = DEFAULT_ADMIN_LANGUAGE){
	global $amessages;
	$str = '';
	$str = '<option value="0"'.($value=='0'?' selected="selected" ':'').'>'.$amessages['nu'].'</option>
	<option value="1"'.($value=='1'?' selected="selected" ':'').'>'.$amessages['nam'].'</option>';
	return $str;
}
function optionGalleryItems($value=8){
	$str = '';
	$str = '<option value="8"'.($value==8?" selected":"").'>8</option>
	<option value="12"'.($value==12?" selected":"").'>12</option>
	<option value="16"'.($value==16?" selected":"").'>16</option>
	<option value="20"'.($value==20?" selected":"").'>20</option>
	<option value="24"'.($value==24?" selected":"").'>24</option>';
	return $str;
}

function removeSign($str) {  
	$str = strip_tags($str);
	$str = mb_strtolower($str,'utf-8');
	$str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);  //|á|à|ả|ã|ạ|ấ|ầ|ẩ|ẫ|ậ|ắ|ằ|ẳ|ẵ|ặ
	$str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);  
	$str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);  
	$str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);  
	$str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);  
	$str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);  
	$str = preg_replace("/(đ)/", 'd', $str);
	$str = preg_replace("/(:|;)/","",$str);
	$str = preg_replace("/(́|̀|̉|̃|̣)/","",$str);
	$str = str_replace("_","",$str);
	$str = str_replace("?","",$str);
	$str = str_replace('"',"",$str); 
	$str = str_replace(")","",$str); 
	$str = str_replace("/","",$str);
	$str = str_replace("%","",$str);
	$str = str_replace("&","",$str);
	$str = str_replace("–","",$str);
	$str = str_replace("_","",$str);
	$str = str_replace(".","",$str);
	$str = str_replace(",","",$str);
	$str = str_replace("-","",$str);
	$str = str_replace("(","",$str);
	$str = str_replace("!","",$str); 
	$str = str_replace(" ","-",$str); 
	$str = str_replace("----","-",$str);
	$str = str_replace("---","-",$str);
	$str = str_replace("--","-",$str);
	$str = preg_replace(array('/[^a-zA-Z0-9 -]/'), array(''), $str) ;
 	return $str; 
 }
 function refineChar($htmlStr)
	{
		$xmlStr=str_replace("\r","",$htmlStr); 
		$xmlStr=str_replace("\n","",$htmlStr); 
		$xmlStr=str_replace("'","\'",$htmlStr); 
		$xmlStr=str_replace('"','&quot;',$htmlStr); 	
		return $xmlStr;
	}
 ?>