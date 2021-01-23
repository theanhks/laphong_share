<?php /* Smarty version 2.6.19, created on 2020-08-02 13:01:47
         compiled from admin/manageeditcategory.temp.html */ ?>
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
	<?php $this->assign('formId', 'addItem'); ?>
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
</a> &raquo; <?php echo $this->_tpl_vars['amessages']['add_category']; ?>
</h2>
			<ul id="tablist">
				<li class="current"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=category&amp;act=add&amp;pId=<?php echo $this->_tpl_vars['pId']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['add_category']; ?>
"><?php echo $this->_tpl_vars['amessages']['edit_category']; ?>
</a> </li>
				<li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=category&act=list" title="<?php echo $this->_tpl_vars['amessages']['list_category']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_category']; ?>
</a> </li>
				<li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=category&act=list&plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
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
							<label for="pId"><?php echo $this->_tpl_vars['amessages']['parent']; ?>
 *</label>
							<span><?php echo $this->_tpl_vars['amessages']['parent_help']; ?>
</span>
							<select name="pId">
							<option value="0">/</option>
								<?php echo $this->_tpl_vars['listCategories']; ?>

							</select>
						</p>
						<p>
							<label for="vn_name"><?php echo $this->_tpl_vars['amessages']['vn_name']; ?>
 *</label>
							<input type="text" name="vn_name" value="<?php echo $this->_tpl_vars['listObject']->getName('vn'); ?>
" />
						</p>
						<p>
							<label for="en_name"><?php echo $this->_tpl_vars['amessages']['en_name']; ?>
 *</label>
							<input type="text" name="en_name" value="<?php echo $this->_tpl_vars['listObject']->getName('en'); ?>
" />
						</p>
						<p style ="display: none;">
							<label for="sapo"><?php echo $this->_tpl_vars['amessages']['vn_description']; ?>
 *</label>
							<textarea name="vn_sapo" id="vn_sapo" rows="5" cols="5" class="mceSimple"><?php echo $this->_tpl_vars['listObject']->getSapo('vn'); ?>
</textarea>
						</p>
						<p style ="display: none;">
							<label for="en_sapo"><?php echo $this->_tpl_vars['amessages']['en_description']; ?>
 *</label>
							<textarea name="en_sapo" id="en_sapo" rows="5" cols="5" class="mceSimple"><?php echo $this->_tpl_vars['listObject']->getSapo('en'); ?>
</textarea>
						</p>
						<p>
							<label for="vn_details"><?php echo $this->_tpl_vars['amessages']['vn_details']; ?>
 *</label>
							<textarea name="vn_details" id="vn_details" rows="30" cols="5" class="mceAdvanced"><?php echo $this->_tpl_vars['listObject']->getDetails('vn'); ?>
</textarea>
						</p>
						<p>
							<label for="en_details"><?php echo $this->_tpl_vars['amessages']['en_details']; ?>
 *</label>
							<textarea name="en_details" id="en_details" rows="30" cols="5" class="mceAdvanced"><?php echo $this->_tpl_vars['listObject']->getDetails('en'); ?>
</textarea>
						</p>
						<!--<p>
						<?php if ($this->_tpl_vars['listObject']->getAvatar()): ?><img src="<?php echo $this->_tpl_vars['ROOTPATH']; ?>
/gallery/avatar_upload/category/avatar/<?php echo $this->_tpl_vars['listObject']->getAvatar(); ?>
" /><?php endif; ?>
						</p>-->
						<p class="hidden">
							<label for="details"><?php echo $this->_tpl_vars['amessages']['avatar']; ?>
</label>
							<input type="file" name="avatar" value="" />
							<input type="hidden" name="news_avatar" value="<?php echo $this->_tpl_vars['listObject']->getAvatar(); ?>
" />
						</p>
						<!--<p>
						<label for="company">Set "HOT"</label>
						<input name="home" id="home"  value="1" type="checkbox" style="width:50px;" <?php if ($this->_tpl_vars['listObject']->getProperties() == 1): ?>checked="checked"<?php endif; ?> /> </p>-->
						<p>
							<label for="vn_name"><?php echo $this->_tpl_vars['amessages']['position']; ?>
 </label>
							<span><?php echo $this->_tpl_vars['amessages']['position_help']; ?>
</span>
							<input type="text" name="position" value="<?php echo $this->_tpl_vars['listObject']->getPosition(); ?>
" />
						</p>
						<!--
						<p class="radioType">
						<input type="radio" name="radio3" id="radio3" />
						<label for="radio3">radio 3</label>
						<input type="radio" name="radio3" id="radio4" />
						<label for="radio4">radio 4</label>
						</p>
						<p class="radioType">
						<input type="checkbox" name="checkbox2" id="checkbox2" />
						<label for="checkbox2">checkbox 2</label>
						</p>
						-->
						<p class="btnType">
							<input type="hidden" name="op" value="<?php echo $this->_tpl_vars['op']; ?>
" />
							<input type="hidden" name="part" value="<?php echo $this->_tpl_vars['part']; ?>
" />
							<input type="hidden" name="act" value="<?php echo $this->_tpl_vars['act']; ?>
" />
							<input type="hidden" name="oId" value="<?php echo $this->_tpl_vars['listObject']->getId(); ?>
" />
							<input type="hidden" name="searchTerms" value="<?php echo $this->_tpl_vars['searchTerms']; ?>
"/>
							<input type="hidden" name="searchStatus" value="<?php echo $this->_tpl_vars['searchStatus']; ?>
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