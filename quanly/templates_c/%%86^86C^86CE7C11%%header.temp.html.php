<?php /* Smarty version 2.6.19, created on 2020-08-05 15:53:24
         compiled from admin/header.temp.html */ ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-language" content="vi" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Control Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="deracms, control panel" />
<meta name="description" content="Control Panel - Content Management System" />
<meta name="Robots" content="index,all"/>


<link rel="stylesheet" type="text/css" href="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/css/stylef.css" media="all" />
<!--<link rel="stylesheet" type="text/css" href="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/css/bootstrap.min.css">-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript" src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/js/bootstrap.min.js"></script>
<script type="text/javascript" src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/js/danhmuc-menu-jquery.js"></script>

<script type="text/javascript" src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/scripts/jquery.js"></script>
<script type="text/javascript" src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/scripts/forms.js"></script>

<script type="text/javascript" src="<?php echo $this->_tpl_vars['ROOTPATH']; ?>
/addons/jscripts/tiny_mce/tiny_mce.js"></script>
<?php echo '
<script type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		elements : \'abshosturls\',
		theme_advanced_buttons1 : "formatselect,fontselect,fontsizeselect,mymenubutton,bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright,justifyfull,bullist,numlist,link,unlink,forecolor,emotions,code",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_font_sizes: "10px,12px,13px,14px,16px,18px,20px",
		font_size_style_values : "10px,12px,13px,14px,16px,18px,20px",
		editor_selector : "mceSimple"
	});
	tinyMCE.init({
		mode : "textareas",
		elements : \'abshosturls\',
		theme : "advanced",
		plugins : "pagebreak,style,table,save,advhr,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",
		theme_advanced_buttons1 : "styleselect,formatselect,fontselect,fontsizeselect,|,bold,italic,underline,strikethrough,justifyleft,justifycenter,justifyright,justifyfull,|,preview,fullscreen",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,file,cleanup,code,|,forecolor,backcolor",
		theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,ltr,rtl",
		theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
		theme_advanced_buttons5 : "",
		
		relative_urls : false,
		remove_script_host : false,	
		convert_urls : true,		
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		file_browser_callback : "ajaxfilemanager",
		theme_advanced_font_sizes: "10px,12px,13px,14px,16px,18px,20px",
		font_size_style_values : "10px,12px,13px,14px,16px,18px,20px",
		force_p_newlines : true,
		editor_selector : "mceAdvanced"
	});

	
	function ajaxfilemanager(field_name, url, type, win) {
		var ajaxfilemanagerurl = "../../../../../addons/jscripts/tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php?editor=tinymce";
		switch (type) {
			case "image":
				break;
			case "media":
				break;
			case "flash": 
				break;
			case "file":
				break;
			default:
				return false;
		}
		tinyMCE.activeEditor.windowManager.open({
			url: "../../../../../addons/jscripts/tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php?editor=tinymce",
			width: 500,
			height: 440,
			inline : "yes",
			close_previous : "no"
		},{
			window : win,
			input : field_name
		});
	}	
</script>
'; ?>



<link href="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/css/sandbox.css" rel="stylesheet">
    <link href="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/css/main.css" rel="stylesheet">
<link href="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/dist/css/drawer.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/iScroll/5.2.0/iscroll.js"></script>
<script src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/dist/js/drawer.min.js" charset="utf-8"></script>
<?php echo '
<script>
    $(document).ready(function() {
        $(\'.drawer\').drawer();
    });
</script>
'; ?>



</head>
<body class="drawer drawer--left">

