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
function tzvn()
{
   $iTime = time();
   $ar = localtime($iTime);
   $iTztime = gmmktime($ar[2], $ar[1], $ar[0], $ar[4]+1, $ar[3], $ar[5]+1900, $ar[8]);
   return $iTime-($iTztime-$iTime)+3600*7;
}
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

function linkPager1($url, $pages = 1, $page = 1, $open_tag = '<li>', $close_tag = '</li>', $separator = ''){	
	$str = '';
	$start = $page - 3;
	if($start < 1) $start = 1;
	$end = $page + 3;
	if($end > $pages) $end = $pages;
	$str .= '<a href="'.sprintf($url,1).'"><< &nbsp;</a>';
	//if($page>1)
	$str .= '<a href="'.sprintf($url,$page-1).'">Trang trước &nbsp;</a>';
	for($i = $start;$i <= $end;$i++) {
		if($i == $page) {
			$str .= '<strong><font color="red">'.$i.'</font></strong> &nbsp;';
		} else {
			$str .= '<a href="'.sprintf($url,$i).'">'.$i.'</a>&nbsp;';
		}
	}
	//if($page<$end)
	$str .= '<a href="'.sprintf($url,$page+1).'">&nbsp;Trang sau &nbsp;</a>';
	$str .= '<a href="'.sprintf($url,$pages).'">>></a>';
	return $str;
}

function linkPager1_dimoda($url, $pages = 1, $page = 1, $open_tag = '', $close_tag = '', $separator = ''){
	global $messages;
	$str = '';
	$start = $page - 3;
	if($start < 1) $start = 1;
	$end = $page + 3;
	if($end > $pages) $end = $pages;
	//$str .= '<a  title="'.$messages["trangdau"].'" class="" href="'.sprintf($url,1).'"><i class="fa fa-angle-double-left" ></i>'.$messages["trangdau"].'</a>';
	if($page>1)
	$str .= '<a title="'.$messages["trangtruoc"].'" class="" href="'.sprintf($url,$page-1).'">&laquo;</a>';
	for($i = $start;$i <= $end;$i++) {
		if($i == $page) {
			$str .= ' <a class="active">'.$i.'</a>';
		} else {
			$str .= '<a class="" href="'.sprintf($url,$i).'">'.$i.'</a>';
		}
	}
	if($page<$end)
	$str .= '<a title="'.$messages["trangsau"].'" class="pageLink" href="'.sprintf($url,$page+1).'">&raquo;</a>';
	//$str .= '<a title="'.$messages["trangcuoi"].'" class="pageLink" href="'.sprintf($url,$pages).'"><i class="fa fa-angle-double-right" ></i>'.$messages["trangcuoi"].'</a>';
	return $str;
}




function linkPager1_en($url, $pages = 1, $page = 1, $open_tag = '<li>', $close_tag = '</li>', $separator = ''){
	$str = '';
	$start = $page - 3;
	if($start < 1) $start = 1;
	$end = $page + 3;
	if($end > $pages) $end = $pages;
	$str .= '<a href="'.sprintf($url,1).'"><< &nbsp;</a>';
	if($page>1)
	$str .= '<a href="'.sprintf($url,$page-1).'">Prev &nbsp;</a>';
	for($i = $start;$i <= $end;$i++) {
		if($i == $page) {
			$str .= '<strong><font color="red">'.$i.'</font></strong> &nbsp;';
		} else {
			$str .= '<a href="'.sprintf($url,$i).'">'.$i.'</a>&nbsp;';
		}
	}
	if($page<$end)
	$str .= '<a href="'.sprintf($url,$page+1).'">&nbsp;Next &nbsp;</a>';
	$str .= '<a href="'.sprintf($url,$pages).'">>></a>';
	return $str;
}

function optionStatus($value = '-1', $lang = DEFAULT_ADMIN_LANGUAGE){
	global $amessages;
	$str = '';
	$str = '<option value="-1"'.($value==-1?" selected":"").'>'.$amessages['status_text'][-1].'</option>
	<option value="0"'.($value==0?" selected":"").'>'.$amessages['status_text'][0].'</option>
	<option value="1"'.($value==1?" selected":"").'>'.$amessages['status_text'][1].'</option>
	<option value="2"'.($value==2?" selected":"").'>'.$amessages['status_text'][2].'</option>';
	return $str;
}
function optionLang($value = '-1', $lang = DEFAULT_ADMIN_LANGUAGE){
	global $amessages;
	$str = '';
	$str = '<option value="-1"'.($value==-1?" selected":"").'>'.$amessages['search_lang'][-1].'</option>
	<option value="en"'.($value=='en'?" selected":"").'>'.$amessages['search_lang'][0].'</option>
	<option value="vn"'.($value=='vn'?" selected":"").'>'.$amessages['search_lang'][1].'</option>';
	return $str;
}

function listDays( $value=1) {
        $r = range(1, 31);
		$str='';
        foreach ($r as $day){
            $str .= "<option value=\"$day\"".($value==$day? ' selected="selected" ':'').">".$day."</option>\n";
        }
        return $str;
    }
function listMonth($value=1){
       $str='';
        for ($i = 1; $i <= 12; $i++)
        {
                $str .= "<option value=\"$i\"".($value==$i? ' selected="selected" ':'');
                $month = date("F", mktime(0, 0, 0, $i+1, 0, 0, 0));
                $str .= '>'.$month.'</option>';
        }
     
        return $str;
}
function listMonth_vn($value=1){
       $str='';
        for ($i = 1; $i <= 12; $i++)
        {
                $str .= "<option value=\"$i\"".($value==$i? ' selected="selected" ':'');
                $month = "Tháng ".$i;
                $str .= '>'.$month.'</option>';
        }
     
        return $str;
}
 function listYear($start_year, $end_year, $value=1)
    {
		$r = range($start_year, $end_year);
		$str='';
        foreach( $r as $year ) {
		            $str .= "<option value=\"$year\"".($value==$year? ' selected="selected" ':'').">".$year."</option>\n";
                 }
        return $str;
    }

/*function listGender($value = '0', $lang = DEFAULT_ADMIN_LANGUAGE){
	global $amessages;
	$str = '';
	$str = '<option value="0"'.($value=='0'?' selected="selected" ':'').'>'.$amessages['gender'][0].'</option>
	<option value="1"'.($value=='1'?' selected="selected" ':'').'>'.$amessages['gender'][1].'</option>
	<option value="2"'.($value=='2'?' selected="selected" ':'').'>'.$amessages['gender'][2].'</option>';
	return $str;
}*/
# doi chu hoa thanh chu thường viết hoa chữ cái đầu tiên
function Uclower($str=''){
	$bar = ucfirst($str);
	$bar = ucfirst(strtolower($str));
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
 function parseToXML($htmlStr){ 
	$xmlStr=str_replace('<','&lt;',$htmlStr); 
	$xmlStr=str_replace('>','&gt;',$xmlStr); 
	$xmlStr=str_replace('"','&quot;',$xmlStr); 
	$xmlStr=str_replace("'",'&#39;',$xmlStr); 
	$xmlStr=str_replace("&",'&amp;',$xmlStr); 
	return $xmlStr; 
}
function refineChar($htmlStr)
	{
		$xmlStr=str_replace("\r","",$htmlStr); 
		$xmlStr=str_replace("\n","",$htmlStr); 
		$xmlStr=str_replace("'","\'",$htmlStr); 
		$xmlStr=str_replace('"','&quot;',$htmlStr); 	
		return $xmlStr;
	}
/*

 function parseToXML($htmlStr){ 
	$array = array('<', '>', '"', "'",'&');
	if (in_array($htmlStr, $array)) {
    	exit();
	}	
}*/
?>