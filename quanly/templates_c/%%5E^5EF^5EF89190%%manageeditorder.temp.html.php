<?php /* Smarty version 2.6.19, created on 2020-08-08 17:52:44
         compiled from admin/manageeditorder.temp.html */ ?>
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
<?php $this->assign('formId', 'editItem'); ?>
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
</a> &raquo; <?php echo $this->_tpl_vars['amessages']['edit_support']; ?>
</h2>
<ul id="tablist">
<li class="current"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=order&amp;act=edit&amp;oId=<?php echo $this->_tpl_vars['Id']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['edit_order']; ?>
"><?php echo $this->_tpl_vars['amessages']['edit_order']; ?>
</a> </li>
<li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=order&act=list" title="<?php echo $this->_tpl_vars['amessages']['list_order']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_order']; ?>
</a> </li>
<li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=order&act=list&plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
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
<div class="formType">
<form action="<?php echo $this->_tpl_vars['script']; ?>
" method="post" id="<?php echo $this->_tpl_vars['formId']; ?>
" name="<?php echo $this->_tpl_vars['formId']; ?>
">
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
<label for="slug"><?php echo $this->_tpl_vars['amessages']['name']; ?>
*</label>
<span><?php echo $this->_tpl_vars['amessages']['fullname_help']; ?>
</span>
<input type="text" name="name" value="<?php echo $this->_tpl_vars['listObject']->getName(); ?>
" />
</p>
<p>
<label for="vn_details"><?php echo $this->_tpl_vars['amessages']['tel']; ?>
 *</label>
<span><?php echo $this->_tpl_vars['amessages']['tel_help']; ?>
</span>
<input type="text" name="tel" value="<?php echo $this->_tpl_vars['listObject']->getTel(); ?>
" />
</p>
<p>
<label for="vn_name"><?php echo $this->_tpl_vars['amessages']['email']; ?>
 *</label>
<span><?php echo $this->_tpl_vars['amessages']['position_help']; ?>
</span>
<input type="text" name="email" value="<?php echo $this->_tpl_vars['listObject']->getEmail(); ?>
" />
</p>
<p>
<label for="vn_name"><?php echo $this->_tpl_vars['amessages']['address']; ?>
</label>
<span><?php echo $this->_tpl_vars['amessages']['address_help']; ?>
</span>
<input type="text" name="address" value="<?php echo $this->_tpl_vars['listObject']->getAddress(); ?>
" />
</p>
<p>
<label for="en_details"><?php echo $this->_tpl_vars['amessages']['province']; ?>
</label>
<span><?php echo $this->_tpl_vars['amessages']['province_help']; ?>
</span>
<input type="text" name="province" value="<?php echo $this->_tpl_vars['listObject']->getProvince(); ?>
" />
</p>
<p>
<label for="en_details"><?php echo $this->_tpl_vars['amessages']['deposited']; ?>
</label>
<span><?php echo $this->_tpl_vars['amessages']['deposited_help']; ?>
</span>
<input type="text" name="deposited" value="<?php echo $this->_tpl_vars['listObject']->getDeposited(); ?>
" />
</p>
<p>
<label for="en_details"><?php echo $this->_tpl_vars['amessages']['comment']; ?>
</label>
<span><?php echo $this->_tpl_vars['amessages']['deposited_help']; ?>
</span>
<textarea name="comment"><?php echo $this->_tpl_vars['listObject']->getComment(); ?>
</textarea>
</p>

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
<span><input type="reset" value="<?php echo $this->_tpl_vars['amessages']['reset']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['reset']; ?>
" name="btnReset" /></span>
<span><input type="submit" value="<?php echo $this->_tpl_vars['amessages']['save']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['save']; ?>
" name="btnSubmit" /></span>
</p>
</fieldset>
</form>
</div>
</div>
</div>
</div>
<div class="push"></div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['usertemplate'])."/footer.temp.html", 'smarty_include_vars' => array('title' => 'footer')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>