<?php
#Database settings
define('DB_PREFIX', 'n_');					# Table prefix
define('QUERY_ERROR', '1');					# Show query if failed - Only for debug
define('QUERY_DEBUG', '1');					# Database debug - Show query if failed - Only for debug
# Template settings
define('TEMPLATE_COMPILE', true);			# Force rcompile template files
define('TEMPLATE_DEBUG', true);			# Template debug
define('DEFAULT_TEMPLATE','html');		# Default template
define('ADMIN_TEMPLATE_COMPILE', true);		# Force rcompile admin template files
define('ADMIN_TEMPLATE_DEBUG', true);		# Admin template debug
define('ADMIN_DEFAULT_TEMPLATE','admin');	# Default CMS template
# URL settings
define('TEMPLATE_PATH','/templates/');
define('URL_TYPE',2);						# URL type: 1- query string, 2- SEO
define('SUB_DOMAIN', 1);					# Support sub domain
define('PROTOCOL', 'http://');				# Protocol 'http://' or 'https://'
define('ECOMMERCE_PROTOCOL', 'http://');	# Order, payment protocol 'http://' or 'https://'
#define('DOMAIN', 'http://avaserver.homeip.net:8080/');		# Main domain name
define('DOMAIN', 'http://laphong.newver.local');		# Main domain name
define('FOLDER', '');	
define('ROOTPATH',FOLDER);
# Main folder name
define('ADMIN_FOLDER', 'quanly');				# Admin folder name
define('SCRIPT', '');				# Script name
define('ADMIN_SCRIPT', 'index.php');		# Admin script name	
define('ADMIN_ROOTPATH',DOMAIN.FOLDER.'/'.ADMIN_FOLDER);
#product
define('PRO_IMAGE_AVATAR_WIDTH',200);
define('PRO_IMAGE_AVATAR_HEIGHT', 200);
define('PRO_IMAGE_THUMB_WIDTH', 400);
define('PRO_IMAGE_THUMB_HEIGHT', 400);
define('PRO_IMAGE_MEDIUM_WIDTH',800);
define('PRO_IMAGE_MEDIUM_HEIGHT', 800);
# Language settings
define('DEFAULT_CHARSET','utf-8');			# Default charset
define('DEFAULT_LANGUAGE','vn');			# Default language
define('DEFAULT_ADMIN_LANGUAGE','vn');		# Default language
# Operatiom settings
define('DEFAULT_OP', 'index');				# Default operation if error
define('DEFAULT_ADMIN_OP', 'index');		# Default operation if error
define('DEFAULT_ROWS_PER_PAGE',20);			# Number rows per page in front page
define('DEFAULT_ITEMS_PER_ROW',3);			# Number items per row in front page
define('DEFAULT_ADMIN_ROWS_PER_PAGE',20);	# Number rows per page in Admin panel
# Photo settings
define('ALLOW_FILE_TYPES','jpg$|bmp$|jpeg$|gif$|png$|wma$|wmv$|flv$|mp3$|mpg$|mp4$|mov$|wav$|doc$|docx$|xls$|xlsx$|ppt$|pptx$|txt$|zip$|rar$|pdf$|swf$');
define('DEFAULT_PHOTO_FORMAT','jpg');		# Photo format
define('DEFAULT_THUMBNAIL_SIZE','150');		# Default thumbnail width or height
define('DEFAULT_THUMBNAIL_SQUARE','1');		# Create square thumbnail
define('DEFAULT_AVATAR_SIZE','100');		# Default avatar width or height
define('DEFAULT_AVATAR_SQUARE','1');		# Create square avatar
define('DEFAULT_DIR_CHMODE',777);			# Default chmod for new directory
define('GALLERY_FOLDER','gallery');			# Gallery root folder
# Email settings
define('SMTP_MAIL','1');							# 1 - Send email using SMTP, 0 - Send email using PHP_MAIL
define('SMTP_HOST','smtp.gmail.com');			# SMTP host
#define('SMTP_HOST','fix.vn');			# SMTP host
define('SMTP_PORT','587');							# SMTP port
#define('SMTP_PORT','465');							# SMTP port
define('SMTP_SSL','0');								# 1 - SMTP SSL, 0 Normal
define('SMTP_USER','laphong.noreply@gmail.com');		# SMTP username
#define('SMTP_USER','contact@fix.vn');		# SMTP username
define('SMTP_PASSWORD','Abc123!#');				# SMTP password
#define('SMTP_PASSWORD','Ava2020Vien');				# SMTP password
define('SMTP_SECURE','tls');
define('ADMIN_EMAIL','beatboxta2405@gmail.com');
# Other settings
define('SESSION_TIME','30');				# Number of minutes session remaining
define('EXCECUTE_DAYS','3');				# Maximum days allowed to exceute an action, e.g forgot password or process order
# Upload settings
define('UPLOAD_SIZE_BYTES',1);				# File Size: Bytes
define('UPLOAD_SIZE_MBYTES',2);				# File Size: Megabytes
define('UPLOAD_ERROR_NOFILE',1);			# Error Code: No file selected
define('UPLOAD_ERROR_SIZE',2);				# Error Code: File exceeds the file size limit
define('UPLOAD_ERROR_TYPE',3);				# Error Code: File Type is invalid
define('UPLOAD_ERROR_MOVING',4);			# Error Code: Error moving file
define('key_map','MrR9ZR4xcGdpFO5fz8jIRSYnuziD63Jl'); //vietbando map
# User level
define('GUEST','0');
define('MEMBER','1');
define('VIP','2');
define('STAFF','6');
define('WEBMASTER','7');
define('ADMIN','8');
define('FOUNDER','9');
#facebook
define('FACEBOOK_ID','415348248994213');
define('FACEBOOK_SECRET','727d7a3fcfc266bc9744ad25a8435680');
define('FACEBOOK_URL','https://graph.facebook.com/');
define('FACEBOOK_VERSION','2.12');

?>