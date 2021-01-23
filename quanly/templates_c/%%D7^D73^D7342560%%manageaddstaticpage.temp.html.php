<?php /* Smarty version 2.6.19, created on 2020-08-07 14:49:18
         compiled from admin/manageaddstaticpage.temp.html */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['usertemplate'])."/header.temp.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['usertemplate'])."/left.temp.html", 'smarty_include_vars' => array('title' => 'left')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div class="contentabc">
	<?php $this->assign('formId', 'addEntry'); ?>
	<?php $this->assign('rightPanel', 'hidden'); ?>
	<div id="contextual" class="<?php echo $this->_tpl_vars['rightPanel']; ?>
">
		<div class="levBtn">
			<p><a href="#"><img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/btn_arrow_02.gif" alt="" width="18" height="19" /></a></p>
		</div>
		<div class="contextType">
			<form action="" method="post" name="form2">
				<fieldset>
					<p>
						<label for="textbox">Textbox</label>
						<input type="text" value="" name="textbox" id="textbox" />
					</p>
					<p>
						<label for="textarea">Textarea</label>
						<textarea name="textarea" id="textarea" rows="5" cols="5"></textarea>
					</p>
					<p>
						<label for="combobox">Combobox</label>
						<select name="combobox" id="combobox" >
							<option selected="selected" value="">------------</option>
						</select>
					</p>
					<p class="radioType">
						<input type="radio" name="radio" id="radio" />
						<label for="radio">radio 1</label>
						<input type="radio" name="radio" id="radio2" />
						<label for="radio2">radio 2</label>
					</p>
					<p class="radioType">
						<input type="checkbox" name="checkbox" id="checkbox" />
						<label for="checkbox">checkbox 1</label>
					</p>
				</fieldset>
			</form>
		</div>
	</div>
	<div id="content">
		<div class="highlight">
			<h2><a href=""><?php echo $this->_tpl_vars['amessages']['control_panel']; ?>
</a> &raquo; <?php echo $this->_tpl_vars['amessages']['add_static_page']; ?>
</h2>
			<ul id="tablist">
				<li class="current"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=staticPage&amp;act=add&amp;pId=<?php echo $this->_tpl_vars['pId']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['add_category']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_static_page']; ?>
</a> </li>
				<li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=staticPage&act=list" title="<?php echo $this->_tpl_vars['amessages']['list_category']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_static_page']; ?>
</a> </li>
				<li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=staticPage&act=list&plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
"><?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
</a> </li>
			</ul>
			<?php if ($this->_tpl_vars['infoText']): ?>
			<div class="<?php echo $this->_tpl_vars['infoClass']; ?>
">
				<h4>Result:</h4>
				<p><?php echo $this->_tpl_vars['infoText']; ?>
</p>
			</div>
			<?php endif; ?>
			<div class="formType style02 styava">
				<form action="<?php echo $this->_tpl_vars['script']; ?>
" method="post" id="<?php echo $this->_tpl_vars['formId']; ?>
" name="<?php echo $this->_tpl_vars['formId']; ?>
" enctype="multipart/form-data">
					<fieldset>
						<!--<p>
						<label for="status"><?php echo $this->_tpl_vars['amessages']['language']; ?>
 *</label>
						<span><?php echo $this->_tpl_vars['amessages']['language_help']; ?>
</span>
						<select name="addLang">
						<?php echo $this->_tpl_vars['listLang']; ?>

						</select>
						</p>-->
						<p>
							<label for="status"><?php echo $this->_tpl_vars['amessages']['status']; ?>
 *</label>
							<span><?php echo $this->_tpl_vars['amessages']['status_help']; ?>
</span>
							<select name="addStatus">
								<?php echo $this->_tpl_vars['listStatus']; ?>

							</select>
						</p>
						<p>
							<label for="status"><?php echo $this->_tpl_vars['amessages']['category']; ?>
 *</label>
							<select name="pId">
							<option value="0">All</option>
								<?php echo $this->_tpl_vars['listPid']; ?>

							</select>
						</p>
						<p>
							<label for="slug"><?php echo $this->_tpl_vars['amessages']['vn_name']; ?>
*</label>
							<input type="text" name="vn_name" value="<?php echo $this->_tpl_vars['vn_name']; ?>
" />
						</p>
						<p>
							<label for="slug"><?php echo $this->_tpl_vars['amessages']['en_name']; ?>
*</label>
							<input type="text" name="en_name" value="<?php echo $this->_tpl_vars['en_name']; ?>
" />
						</p>
						<!--<p>
						<label for="slug">Tiêu đề tiếng Anh *</label>
						<span>Nhập vào tiêu đề tiếng Anh</span>
						<input type="text" name="position" value="<?php echo $this->_tpl_vars['position']; ?>
" />
						</p>
						-->
						<!--<p>
						<label for="sapo"><?php echo $this->_tpl_vars['amessages']['vn_sapo']; ?>
 *</label>
						<textarea name="vn_sapo" id="vn_sapo" class="mceAdvanced" rows="10" cols="5"></textarea>
						</p>-->
						<!--<p>
						<label for="sapo"><?php echo $this->_tpl_vars['amessages']['en_sapo']; ?>
 *</label>
						<textarea name="en_sapo" id="en_sapo" class="mceAdvanced" rows="10" cols="5"></textarea>
						</p>-->
						<p>
							<label for="details"><?php echo $this->_tpl_vars['amessages']['vn_details']; ?>
 *</label>
							<textarea name="vn_details" id="vn_details" class="mceAdvanced" rows="20" cols="5"></textarea>
						</p>
						<p>
							<label for="details"><?php echo $this->_tpl_vars['amessages']['en_details']; ?>
 *</label>
							<textarea name="en_details" id="en_details" class="mceAdvanced" rows="20" cols="5"></textarea>
						</p>
						<!--<p>
						<label for="details">Hình đại diện</label>
						<span><?php echo $this->_tpl_vars['amessages']['details_help']; ?>
</span>
						<input type="file" name="avatar" value="" />
						</p>-->
						<p>
							<label for="details"><?php echo $this->_tpl_vars['amessages']['position']; ?>
 </label>
							<span><?php echo $this->_tpl_vars['amessages']['position_help']; ?>
</span>
							<input type="text" name="position" id="position" value="<?php echo $this->_tpl_vars['position']; ?>
" />
						</p>
						<!--<p class="radioType">
						<input type="checkbox" name="frontend" id="frontend" <?php if ($this->_tpl_vars['home'] == 1): ?>checked="checked"<?php endif; ?> value="1" />
						<label for="frontpage">Đưa vào mục xuất khẩu </label>
						</p>
						-->
						<p class="btnType">
							<input type="hidden" name="op" value="<?php echo $this->_tpl_vars['op']; ?>
" />
							<input type="hidden" name="part" value="<?php echo $this->_tpl_vars['part']; ?>
" />
							<input type="hidden" name="act" value="<?php echo $this->_tpl_vars['act']; ?>
" />
							<input class="bo w90" type="reset" value="<?php echo $this->_tpl_vars['amessages']['reset']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['reset']; ?>
" name="btnReset" />
							<input class="luu w90" type="submit" value="<?php echo $this->_tpl_vars['amessages']['save']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['save']; ?>
" name="btnSubmit" />
						</p>
					</fieldset>
				</form>
			</div>
		</div>
	</div>	
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['usertemplate'])."/footer.temp.html", 'smarty_include_vars' => array('title' => 'footer')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>