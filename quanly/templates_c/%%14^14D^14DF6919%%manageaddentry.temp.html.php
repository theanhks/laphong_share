<?php /* Smarty version 2.6.19, created on 2020-08-07 18:41:06
         compiled from admin/manageaddentry.temp.html */ ?>
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
</a> &raquo; <?php echo $this->_tpl_vars['amessages']['add_entry']; ?>
</h2>
			<ul id="tablist">
				<li class="current"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=entry&amp;act=add&amp;pId=<?php echo $this->_tpl_vars['pId']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['add_entry']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_entry']; ?>
</a> </li>
				<li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=entry&act=list" title="<?php echo $this->_tpl_vars['amessages']['list_entry']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_entry']; ?>
</a> </li>
				<li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=entry&act=list&plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
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
						<!--
						<input type="text" name="addLang1" value="<?php echo $this->_tpl_vars['addLang']; ?>
" style="width:100px" />addLang<br />
						<input type="text" name="addStatus1" value="<?php echo $this->_tpl_vars['addStatus']; ?>
" style="width:100px" />addStatus<br />
						<input type="text" name="title1" value="<?php echo $this->_tpl_vars['title']; ?>
" style="width:100px" />title<br />
						<input type="text" name="cId1" value="<?php echo $this->_tpl_vars['cId']; ?>
" style="width:100px" />cId<br />
						<input type="text" name="keyword1" value="<?php echo $this->_tpl_vars['keyword']; ?>
" style="width:100px" />keyword<br />
						<input type="text" name="sapo1" value="<?php echo $this->_tpl_vars['sapo']; ?>
" style="width:100px" />sapo<br />
						<input type="text" name="details1" value="<?php echo $this->_tpl_vars['details']; ?>
" style="width:100px" />details<br />-->
						<!--<p>
						<label for="status"><?php echo $this->_tpl_vars['amessages']['language']; ?>
 *</label>
						<span><?php echo $this->_tpl_vars['amessages']['language_help']; ?>
</span>
						<select name="lang">
						<?php echo $this->_tpl_vars['listLang']; ?>

						</select>
						</p>-->
						<p>
							<label for="status"><?php echo $this->_tpl_vars['amessages']['status']; ?>
 *</label>
							<span><?php echo $this->_tpl_vars['amessages']['status_help']; ?>
</span>
							<select name="status">
								<?php echo $this->_tpl_vars['listStatus']; ?>

							</select>
						</p>
						<p>
							<label for="pId"><?php echo $this->_tpl_vars['amessages']['category']; ?>
 *</label>
							<span><?php echo $this->_tpl_vars['amessages']['category_help']; ?>
</span>
							<select name="cId">
							<option value="-1">All</option>
								<?php echo $this->_tpl_vars['listCategories']; ?>

							</select>
						</p>
						<p>
							<label for="vn_name"><?php echo $this->_tpl_vars['amessages']['vn_name']; ?>
 *</label>
							<input type="text" name="vn_name" value="<?php echo $this->_tpl_vars['vn_name']; ?>
" />
						</p>
						<p>
							<label for="title"><?php echo $this->_tpl_vars['amessages']['en_name']; ?>
 *</label>
							<input type="text" name="en_name" value="<?php echo $this->_tpl_vars['en_name']; ?>
" />
						</p>
						<p class ="hidden">
							<label for="vn_sapo"><?php echo $this->_tpl_vars['amessages']['vn_sapo']; ?>
 *</label>
							<textarea name="vn_sapo" id="vn_sapo" rows="10" cols="5" class="mceAdvanced"><?php echo $this->_tpl_vars['vn_sapo']; ?>
</textarea>
						</p>
						<p class ="hidden">
							<label for="en_sapo"><?php echo $this->_tpl_vars['amessages']['en_sapo']; ?>
 *</label>
							<textarea name="en_sapo" id="en_sapo" rows="10" cols="5" class="mceAdvanced"><?php echo $this->_tpl_vars['en_sapo']; ?>
</textarea>
						</p>
						<p>
							<label for="vn_details"><?php echo $this->_tpl_vars['amessages']['vn_details']; ?>
 *</label>
							<textarea name="vn_details" id="vn_details" rows="40" cols="40" class="mceAdvanced"><?php echo $this->_tpl_vars['vn_details']; ?>
</textarea>
						</p>
						<p>
							<label for="en_details"><?php echo $this->_tpl_vars['amessages']['en_details']; ?>
 *</label>
							<textarea name="en_details" id="en_details" rows="20" cols="5" class="mceAdvanced"><?php echo $this->_tpl_vars['en_details']; ?>
</textarea>
						</p>
						<p>
							<label for="avatar"><?php echo $this->_tpl_vars['amessages']['avatar']; ?>
</label>
							<input type="file" name="avatar" value="" />
						</p>
						<p>
							<label for="vn_name">Thời gian</label>
							<input type="text" name="keywords" value="" />
						</p>
						<p>
							<label for="position"><?php echo $this->_tpl_vars['amessages']['position']; ?>
 </label>
							<input type="text" name="position" value="<?php echo $this->_tpl_vars['position']; ?>
" />
						</p>
						<!--<p class="radioType">
						<input type="radio" name="radio3" id="radio3" />
						<label for="radio3">radio 3</label>
						<input type="radio" name="radio3" id="radio4" />
						<label for="radio4">radio 4</label>
						</p>-->
						<!--<p class="radioType">
						<input type="checkbox" name="setwatermark" id="watermark" checked="checked" value="1"/>
						<label for="frontpage">Watermark </label>
						</p>-->
						<!--<p class="radioType">
						<input type="checkbox" name="frontend" id="frontend" <?php if ($this->_tpl_vars['home'] == 1): ?>checked="checked"<?php endif; ?> value="1" />
						<label for="frontpage">Chọn tin này hiện thị ở trang chủ</label>
						</p>-->
						<p class="btnType">
							<input type="hidden" name="op" value="<?php echo $this->_tpl_vars['op']; ?>
" />
							<input type="hidden" name="part" value="<?php echo $this->_tpl_vars['part']; ?>
" />
							<input type="hidden" name="act" value="<?php echo $this->_tpl_vars['act']; ?>
" />
							<input type="hidden" name="searchTerms" value="<?php echo $this->_tpl_vars['searchTerms']; ?>
"/>
							<input type="hidden" name="searchStatus" value="<?php echo $this->_tpl_vars['searchStatus']; ?>
"/>
							<input type="hidden" name="searchLang" value="<?php echo $this->_tpl_vars['searchLang']; ?>
"/>
							<input type="hidden" name="searchLang" value="<?php echo $this->_tpl_vars['searchCategory']; ?>
"/>
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