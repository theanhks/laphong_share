<?php global $DB; global $config ;
// ------------------------------------------------ //
// MySQL DATABASE SETUP (ignore if not using MySQL) //
// ------------------------------------------------ //
// MySQL database username:

$DB['username'] = $config["db_user"];
// MySQL database password:
$DB['password'] = $config["db_pwd"];
// MySQL database name:
$DB['name'] = $config["db_name"];
// MySQL database hostname:
$DB['host'] = $config["db_server"];
// MySQL database ext (default is "ep")
$DB['ext'] = "ep";

// -- Do Not Edit Below This Point -- //

if (eregi("config_mysql.php",$_SERVER['PHP_SELF'])) {
    Header("Location: index.php");
    die();
}