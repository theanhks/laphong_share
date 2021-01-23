<script type="text/javascript" src="../fckeditor/fckeditor.js"></script>


<form name="frm_new_product" action="{PHP_FILE}?project={product_new.CAT}"  method="post" enctype="multipart/form-data" onSubmit="return check_frm_new_product()">

<script type="text/javascript">
											  var oFCKeditor = new FCKeditor('pro_des');
											  oFCKeditor.BasePath = "../fckeditor/";
											  oFCKeditor.Value = '';
											  oFCKeditor.Height = 200;
											  oFCKeditor.Create();
											</script>

</form>

<!-- TinyMCE -->
<script type="text/javascript" src="../tinymce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
theme_advanced_buttons1 : "mymenubutton,bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright,justifyfull,image,bullist,numlist,undo,redo,link,unlink",
theme_advanced_buttons2 : "",
theme_advanced_buttons3 : "",
theme_advanced_toolbar_location : "top",
theme_advanced_toolbar_align : "left",
theme_advanced_statusbar_location : "bottom",
editor_selector : "mceSimple"
	});
	tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		plugins : "pagebreak,style,table,save,advhr,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",
		theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
		theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
		theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
		
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		file_browser_callback : "ajaxfilemanager",
		editor_selector : "mceAdvanced"
	});
	
		function ajaxfilemanager(field_name, url, type, win) {
			var ajaxfilemanagerurl = "../../../tinymce/plugins/ajaxfilemanager/ajaxfilemanager.php?editor=tinymce";
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
                url: "../../../tinymce/plugins/ajaxfilemanager/ajaxfilemanager.php?editor=tinymce",
                width: 782,
                height: 440,
                inline : "yes",
                close_previous : "no"
            },{
                window : win,
                input : field_name
            });
       	}	
</script>
<!-- /TinyMCE -->

</head>
<body>

<form method="post" action="http://tinymce.moxiecode.com/dump.php?example=true">

	<!-- Gets replaced with TinyMCE, remember HTML in a textarea should be encoded -->
	<textarea name="content1" class="mceSimple" style="width:100%">
		&lt;p&gt;
	
	</textarea>
<br />
<textarea name="content2" class="mceAdvanced" style="width:100%">
fghflhj
</textarea>

<br />
<textarea name="content3" class="Advanced" style="width:100%">
fghflhj
</textarea>


	<br />
	<input type="submit" name="save" value="Submit" />
	<input type="reset" name="reset" value="Reset" />
</form>
