<?php
//Easy Counter code begins

$ec_username = 'quetran'; // <--- your username

if (!$ec_fsock = fsockopen('www.easycounter.com', 80, $errno, $errstr, 2)) {
  echo '<img src="http://www.easycounter.com/images/error.png">';
} else {
  fputs($ec_fsock, "GET /php.counter.php?username=".urlencode($ec_username)." HTTP/1.0\r\n".
  "Host:www.easycounter.com\r\n\r\n");
  $ec_buffer = '';
  while (!feof($ec_fsock)) $ec_buffer .= fgets($ec_fsock, 1024);
  echo substr($ec_buffer, strpos($ec_buffer, "\n\r\n")+3);
  fclose($ec_fsock);
}

//Easy Counter code ends
?>

<a href="http://www.histats.com" alt="page hit counter" target="_blank" >
<embed src="http://s10.histats.com/464.swf"  flashvars="jver=1&acsid=1429534&domi=4"  quality="high"  width="112" height="61" name="464.swf"  align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" wmode="transparent" /></a>
<img  src="http://sstatic1.histats.com/0.gif?1429534&101" alt="free page hit counter" border="0">
<!-- Histats.com  END  -->
