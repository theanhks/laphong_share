<?php
/*************************************************************************
Class Upload
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd                                  
Name: Vo Quoc Nguyen
Last updated: 17/10/2009
**************************************************************************/
include_once(ROOT_PATH."classes/data/textfilter.class.php");

class Upload
{
	var $uploadDir;
	var $fileName;
	var $fileSize;
	var $tempLocation;
	var $maxFileSize;
	var $type;

/*-----------------------------------------------------------------------*
* Function: Constructor
* Parameter: DB , Table, Fields
* Return: No return
*-----------------------------------------------------------------------da*/	
	function Upload($files) {
		$this->fileName = $files['name'];
		$this->fileSize = $files['size'];
		$this->tempLocation = $files['tmp_name'];
		$thum = substr($this->fileName,-4,4);
		if($thum == 'jpeg'||$thum=='docx'|| $thum='xlsx'){
			$thum = substr($this->fileName,-5,5);
			$nametamp = substr($this->fileName,0,-4);
			$name = TextFilter::urlize($nametamp,false,'-');	
			$this->type = strtolower(substr($this->fileName,-4));
		}else{
			$nametamp = substr($this->fileName,0,-3);
			$name = TextFilter::urlize($nametamp,false,'-');	
			$this->type = strtolower(substr($this->fileName,-3));
		}
		$this->name = addslashes(rand()."_".$name.$thum);
	}
	
	function moveFile($uploadDir){	
		$tmp_file = $this->tempLocation;
		$size = $this->fileSize;
		if($this->checkType() !="") {
			move_uploaded_file($tmp_file,$uploadDir.$this->name);
			
		}
		return '0';
	}

	function checkType() {
		if(preg_match("/".ALLOW_FILE_TYPES."/",strtolower($this->type))){
			return '1';
		}
		return "";
	}
	
	function getType() {
		return $this->type;
	}
	
	function getNameFile() {
		return $this->name;
	}
#SetMaxFileSize

	function setMaxFileSize($size,$sizeType=UPLOAD_SIZE_BYTES)	{
		if ($sizeType == UPLOAD_SIZE_BYTES) {
			$bytes = $this->toBytes($size);
			$this->maxFileSize = $bytes;
		} else {
			$this->maxFileSize = intval($size);
		}
	}
#CheckSize
	function checkSize() {
		$maxFileSize = $this->maxFileSize;
		$fileSize = $this->fileSize;
		if ($fileSize > $maxFileSize) {
			return false;
		} else {
			return true;
		}
	}

function getWidth($uploadDir,$name)	{
	$filepath = $uploadDir.$name;
	$size_info=getimagesize($filepath);  
   	return  $size_info[0];
}
function getHight($uploadDir,$name)	{
	$filepath = $uploadDir.$name;
	$size_info=getimagesize($filepath);  
   	return $size_info[1];
}

function getPhenotype($uploadDir,$name)	{
		$filepath = $uploadDir.$name;
		$size_info=getimagesize($filepath);
		if($size_info[0]>$size_info[1])
			return 1; // hinh nam
		 if($size_info[0]<$size_info[1])
			return 2; // hinh dung
		return 0; // hinh vuong
	}


	
//funtion resize
function resize($uploadDir,$thumb_path,$image_name,$thumb_name,$width=RESIZE_WIDTH,$hight=RESIZE_HIGHT,$square=0,$quality=90) 
{
	$image_path=$uploadDir;
	$checkimage =$this ->getPhenotype($uploadDir,$image_name);
	$width_size= ($this->getWidth($uploadDir,$image_name)*$hight)/$this->getHight($uploadDir,$image_name);
	$hight_size= ($this->getHight($uploadDir,$image_name)*$width)/$this->getWidth($uploadDir,$image_name);
	if($checkimage==1){//hinh nam
		if($width_size > $width){
			$dimension = $width;
			if($hight_size>$hight)
				$dimension = ($hight*$this->getWidth($uploadDir,$image_name))/$this->getHight($uploadDir,$image_name);
		}else{
			if($hight_size>$hight)
				$dimension = ($hight*$this->getWidth($uploadDir,$image_name))/$this->getHight($uploadDir,$image_name);
			else
				$dimension =$width;
		}
	}else{
		if($checkimage==2){// hinh dung
			if($hight_size>$hight)
				$dimension =$hight;
			else
				if($width_size>$width)
					$dimension =($width*$this->getHight($uploadDir,$image_name))/$this->getWidth($uploadDir,$image_name);
				else
					$dimension =$hight;
		}else{
			$dimension =$width;
		}
	}	
	#echo $image_path.'-'.$image_name;		
	#$image_name=$this->name;
		$type = strtolower(substr($image_name,-3));
	switch ($type) {
		case 'jpg':
		    $src = imagecreatefromjpeg("$image_path/$image_name"); 	
			break;
		case 'gif':
		    $src = imagecreatefromgif("$image_path/$image_name"); 	
			break;
		case 'png':
		    $src = imagecreatefrompng("$image_path/$image_name");
			break;
		case 'peg':
				$src = imagecreatefromjpeg("$image_path/$image_name"); 	
				break;
		case 'bmp':
		    $src = imagecreatefromjpeg("$image_path/$image_name"); 	
			break;
	}
    $ow=imagesx($src);
    $oh=imagesy($src);
	$src_x = 0;
	$src_y = 0;
	if($ow>$oh) {
		if($ow>$dimension) {
			$nw = $dimension;
			$nh = (int)$oh*$nw/$ow;
		} else {
			$nw = $ow;
			$nh = (int)$oh*$nw/$ow;
		}
	} else {
		if($oh>$dimension) {
			$nh = $dimension;
			$nw = (int)$ow*$nh/$oh;
		} else {
			$nh = $oh;
			$nw = (int)$ow*$nh/$oh;
		}
	}
	if($square) {
		$length = min($ow,$oh);
		$src_x = ceil( $ow / 2 ) - ceil( $length / 2 );
		$src_y = ceil( $oh / 2 ) - ceil( $length / 2 );
		$nlength = max($nw,$nh);
		$nw = $nlength;
		$nh = $nlength;
		$ow = $length;
		$oh = $length;
	}
	$dst = imagecreatetruecolor($nw,$nh);    
		
	$white = imagecolorallocate($dst, 255, 255, 255);
	imagefill($dst,0,0,$white);
	
	imagecopyresampled($dst,$src,0,0,$src_x,$src_y,$nw,$nh,$ow,$oh); 
	imagejpeg($dst, "$thumb_path/$thumb_name",$quality);
	imagedestroy($src);
	imagedestroy($dst);
    return true; 
	
	/*
	$img = imagecreatefrompng('image.png');

	$width = imagesx($img);
	$height = imagesy($img);
	
	$background = imagecreatetruecolor($width,$height);
	$white = imagecolorallocate($background, 255, 255, 255);
	imagefill($background,0,0,$white);
	
	imagecopyresampled($background,$img,0,0,0,0,$width,$height,$width,$height);
	
	imagejpeg($background, 'image2.jpg', 100);
	imagedestroy($img);
	imagedestroy($background);  
	*/
}
	

#GetSize File	 
	function getFileSize($sizeType=UPLOAD_SIZE_BYTES) {
		$bytes = $this->fileSize;
		if ($sizeType == UPLOAD_SIZE_BYTES) return $this->toBytes($bytes);
		return $bytes;
	}

/*-----------------------------------------------------------------------*
* Function: toMBytes
* Parameter: bytes, decimal
* Constants:  UPLOAD_SIZE_MBYTES | UPLOAD_SIZE_BYTES
* Return: file size 
*-----------------------------------------------------------------------*/

	function toMBytes($bytes,$decimal=2) {
		$kb = ($bytes * 8) / 1024;
		$mb = ($kb /1024) / 8;
		return round($mb,$decimal);
	}
	
	function toKBytes($bytes,$decimal=2) {
		$kb = ($bytes * 1) / 1024;
		return round($kb,$decimal);
	}

/*-----------------------------------------------------------------------*
* Function: toBytes
* Parameter: Mega bytes
* Constants:  UPLOAD_SIZE_MBYTES | UPLOAD_SIZE_BYTES
* Return: file size 
*-----------------------------------------------------------------------*/

	function toBytes($mb) {
		$bytes = ((($mb * 8) * 1024) * 1024) / 8;
		return $bytes;
	}
	function isImage($str) {
		$ext = strtolower(substr($str,-3));
		if(preg_match("/jpg|png|bmp|gif|peg/",$ext)) return 1;
		return 0;
	}
	function isVideo($str) {
		$ext = strtolower(substr($str,-3));
		if(preg_match("/wmv|mpg|mp4|mov|avi/",$ext)) return 1;
		return 0;
	}
	function isMusic($str) {
		$ext = strtolower(substr($str,-3));
		if(preg_match("/wma|wav|mp3|asf|/",$ext)) return 1;
		return 0;
	}
	function isFile($str) {
		$ext = strtolower(substr($str,-3));
		if(preg_match("/doc|zip|rar|/",$ext)) return 1;
		return 0;
	}
	
}
?>