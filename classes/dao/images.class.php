<?php
/*************************************************************************
Class Images
----------------------------------------------------------------
Derasoft CMS Project
Company: Derasoft Co., Ltd
Name: Vo Quoc Nguyen
Last updated: 15/10/2009
**************************************************************************/
class Images {
	var $image_path;
	var $thumb_path;
	var $image_name;
	var $thumb_name;
	var $dimension;
	var $square;
	var $quality;
	var $logo_path; 

/*-----------------------------------------------------------------------*
* Function: Resize
* Parameter:
* Return:
*-----------------------------------------------------------------------*/
	function resize($image_path,$thumb_path,$image_name,$thumb_name,$dimension,$square=false,$quality=90)
	{
		$type = strtolower(substr($image_name,-3));

		switch ($type) {
			case 'jpg':
				$src = imagecreatefromjpeg($image_path.'/'.$image_name);
				break;
			case 'gif':
				$src = imagecreatefromgif($image_path.'/'.$image_name);
				break;
			case 'peg':
				$src = imagecreatefromjpeg($image_path.'/'.$image_name);
				break;
			case 'png':
				$src = imagecreatefrompng($image_path.'/'.$image_name);
				break;
			case 'bmp':
				$src = imagecreatefrombmp($image_path.'/'.$mage_name);
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
		imagecopyresampled($dst,$src,0,0,$src_x,$src_y,$nw,$nh,$ow,$oh);
		imagejpeg($dst,$thumb_path.'/'.$thumb_name,$quality);
		imagedestroy($src);
		imagedestroy($dst);
		return true;
	}

	/*-----------------------------------------*
	* Function: Watermark
	* Parameter:
	* Return:
	*-----------------------------------------*/
	function watermark($image_path,$logo_path, $quality=90) {
		$resultImage = imagecreatefromjpeg($image_path);
		imagealphablending($resultImage, TRUE);
		$finalWaterMarkImage = imagecreatefrompng($logo_path);
		$finalWaterMarkWidth = imagesx($finalWaterMarkImage);
		$finalWaterMarkHeight = imagesy($finalWaterMarkImage);

		imagecopy($resultImage,$finalWaterMarkImage,0,0,0,0,$finalWaterMarkWidth,$finalWaterMarkHeight);

		imagejpeg($resultImage,$image_path,$quality);

		imagedestroy($resultImage);
		imagedestroy($finalWaterMarkImage);

	}

	function ConvertBMP2GD($src, $dest = false) {
		if(!($src_f = fopen($src, "rb"))) {
			return false;
		}
		if(!($dest_f = fopen($dest, "wb"))) {
			return false;
		}
		$header = unpack("vtype/Vsize/v2reserved/Voffset", fread($src_f,14));
		$info = unpack("Vsize/Vwidth/Vheight/vplanes/vbits/Vcompression/Vimagesize/Vxres/Vyres/Vncolor/Vimportant",
		fread($src_f, 40));
		extract($info);
		extract($header);
		if($type != 0x4D42) { // signature "BM"
			return false;
		}
		$palette_size = $offset - 54;
		$ncolor = $palette_size / 4;
		$gd_header = "";
		// true-color vs. palette
		$gd_header .= ($palette_size == 0) ? "\xFF\xFE" : "\xFF\xFF";
		$gd_header .= pack("n2", $width, $height);
		$gd_header .= ($palette_size == 0) ? "\x01" : "\x00";
		if($palette_size) {
			$gd_header .= pack("n", $ncolor);
		}
		// no transparency
		$gd_header .= "\xFF\xFF\xFF\xFF";
		fwrite($dest_f, $gd_header);
		if($palette_size) {
			$palette = fread($src_f, $palette_size);
			$gd_palette = "";
			$j = 0;
			while($j < $palette_size) {
				$b = $palette{$j++};
				$g = $palette{$j++};
				$r = $palette{$j++};
				$a = $palette{$j++};
				$gd_palette .= "$r$g$b$a";
			}
			$gd_palette .= str_repeat("\x00\x00\x00\x00", 256 - $ncolor);
			fwrite($dest_f, $gd_palette);
		}
		$scan_line_size = (($bits * $width) + 7) >> 3;
		$scan_line_align = ($scan_line_size & 0x03) ? 4 - ($scan_line_size & 0x03) : 0;
		for($i = 0, $l = $height - 1; $i < $height; $i++, $l--) {
			// BMP stores scan lines starting from bottom
			fseek($src_f, $offset + (($scan_line_size + $scan_line_align) *	$l));
			$scan_line = fread($src_f, $scan_line_size);
			if($bits == 24) {
				$gd_scan_line = "";
				$j = 0;
				while($j < $scan_line_size) {
					$b = $scan_line{$j++};
					$g = $scan_line{$j++};
					$r = $scan_line{$j++};
					$gd_scan_line .= "\x00$r$g$b";
				}
			}
			else if($bits == 8) {
				$gd_scan_line = $scan_line;
			}
			else if($bits == 4) {
				$gd_scan_line = "";
				$j = 0;
				while($j < $scan_line_size) {
					$byte = ord($scan_line{$j++});
					$p1 = chr($byte >> 4);
					$p2 = chr($byte & 0x0F);
					$gd_scan_line .= "$p1$p2";
				}
				$gd_scan_line = substr($gd_scan_line, 0, $width);
			}
			else if($bits == 1) {
				$gd_scan_line = "";
				$j = 0;
				while($j < $scan_line_size) {
					$byte = ord($scan_line{$j++});
					$p1 = chr((int) (($byte & 0x80) != 0));
					$p2 = chr((int) (($byte & 0x40) != 0));
					$p3 = chr((int) (($byte & 0x20) != 0));
					$p4 = chr((int) (($byte & 0x10) != 0));
					$p5 = chr((int) (($byte & 0x08) != 0));
					$p6 = chr((int) (($byte & 0x04) != 0));
					$p7 = chr((int) (($byte & 0x02) != 0));
					$p8 = chr((int) (($byte & 0x01) != 0));
					$gd_scan_line .= "$p1$p2$p3$p4$p5$p6$p7$p8";
				}
				$gd_scan_line = substr($gd_scan_line, 0, $width);
			}
			fwrite($dest_f, $gd_scan_line);
		}
		fclose($src_f);
		fclose($dest_f);
		return true;
	}
	
	function imagecreatefrombmp($filename) {
		$tmp_name = tempnam("/tmp", "GD");
		if(ConvertBMP2GD($filename, $tmp_name)) {
			$img = imagecreatefromgd($tmp_name);
			unlink($tmp_name);
			return $img;
		}
		return false;
	}
}
?>