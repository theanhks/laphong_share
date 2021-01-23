<?php /* Smarty version 2.6.19, created on 2020-08-02 17:20:38
         compiled from admin/adminedituser.temp.html */ ?>
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
<div class="contentabc">
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
</a> &raquo; <?php echo $this->_tpl_vars['amessages']['edit_user']; ?>
</h2>
            <ul id="tablist">
                <li class="current"><a href="" title="<?php echo $this->_tpl_vars['amessages']['edit_user']; ?>
"><?php echo $this->_tpl_vars['amessages']['edit_user']; ?>
</a> </li>
                <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=admin&part=user&act=list" title="<?php echo $this->_tpl_vars['amessages']['list_user']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_user']; ?>
</a> </li>
                <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=admin&part=user&act=list&plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
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
                            <label for="status"><?php echo $this->_tpl_vars['amessages']['user_type']; ?>
 *</label>
                            <span><?php echo $this->_tpl_vars['amessages']['user_type_help']; ?>
</span>
                            <select name="type">
                                <option value="-1">/</option>
                                <?php echo $this->_tpl_vars['listUserType']; ?>

                            </select>
                        </p>
                        <p>
                            <label for="username"><?php echo $this->_tpl_vars['amessages']['username']; ?>
 *</label>
                            <span><?php echo $this->_tpl_vars['amessages']['username_help']; ?>
</span>
                            <input type="text" name="username" value="<?php echo $this->_tpl_vars['listObject']->getUserName(); ?>
" />
                        </p>
                        <p>
                            <label for="pass"><?php echo $this->_tpl_vars['amessages']['pass']; ?>
*</label>
                            <span><?php echo $this->_tpl_vars['amessages']['pass_help']; ?>
</span>
                            <input type="password" name="pass" value="<?php echo $this->_tpl_vars['listObject']->getPassword(); ?>
" disabled="disabled" />
                        </p>
                        <p>
                            <label for="fname"><?php echo $this->_tpl_vars['amessages']['firstname']; ?>
*</label>
                            <span><?php echo $this->_tpl_vars['amessages']['fullname_help']; ?>
</span>
                            <input type="text" name="fname" value="<?php echo $this->_tpl_vars['listObject']->getFName(); ?>
" />
                        </p>
                        <p>
                            <label for="lname"><?php echo $this->_tpl_vars['amessages']['lastname']; ?>
*</label>
                            <span><?php echo $this->_tpl_vars['amessages']['lastname_help']; ?>
</span>
                            <input type="text" name="lname" value="<?php echo $this->_tpl_vars['listObject']->getLName(); ?>
" />
                        </p>
                        <p>
                            <label for="about"><?php echo $this->_tpl_vars['amessages']['about']; ?>
 </label>
                            <span><?php echo $this->_tpl_vars['amessages']['about_help']; ?>
</span>
                            <input type="text" name="about" value="<?php echo $this->_tpl_vars['listObject']->getAbout(); ?>
" />
                        </p>
                        <p>
                            <label for="email"><?php echo $this->_tpl_vars['amessages']['email']; ?>
 *</label>
                            <span><?php echo $this->_tpl_vars['amessages']['email_help']; ?>
</span>
                            <input type="text" name="email" value="<?php echo $this->_tpl_vars['listObject']->getEmail(); ?>
" />
                        </p>
                        <p>
                            <label for="company"><?php echo $this->_tpl_vars['amessages']['company']; ?>
 </label>
                            <span><?php echo $this->_tpl_vars['amessages']['company_help']; ?>
</span>
                            <input type="text" name="company" value="<?php echo $this->_tpl_vars['listObject']->getCompany(); ?>
" />
                        </p>
                        <p>
                            <label for="tax"><?php echo $this->_tpl_vars['amessages']['tax']; ?>
 </label>
                            <input type="text" name="tax" value="<?php echo $this->_tpl_vars['listObject']->getTax(); ?>
" />
                        </p>
                        <p>
                            <label for="address"><?php echo $this->_tpl_vars['amessages']['address']; ?>
 </label>
                            <span><?php echo $this->_tpl_vars['amessages']['address_help']; ?>
</span>
                            <input type="text" name="address" value="<?php echo $this->_tpl_vars['listObject']->getAddress(); ?>
" />
                        </p>
                        <p>
                            <label for="address"><?php echo $this->_tpl_vars['amessages']['address2']; ?>
 </label>
                            <span><?php echo $this->_tpl_vars['amessages']['address2_help']; ?>
</span>
                            <input type="text" name="address2" value="<?php echo $this->_tpl_vars['listObject']->getAddress2(); ?>
" />
                        </p>
                        <p>
                            <label for="tel"><?php echo $this->_tpl_vars['amessages']['tel']; ?>
 </label>
                            <span><?php echo $this->_tpl_vars['amessages']['tel_help']; ?>
</span>
                            <input type="text" name="tel" value="<?php echo $this->_tpl_vars['listObject']->getTel(); ?>
" />
                        </p>
                        <p>
                            <label for="fax"><?php echo $this->_tpl_vars['amessages']['fax']; ?>
 </label>
                            <span><?php echo $this->_tpl_vars['amessages']['fax_help']; ?>
</span>
                            <input type="text" name="fax" value="<?php echo $this->_tpl_vars['listObject']->getFax(); ?>
" />
                        </p>
                        <p>
                            <label for="cell"><?php echo $this->_tpl_vars['amessages']['cell']; ?>
 </label>
                            <span><?php echo $this->_tpl_vars['amessages']['cell_help']; ?>
</span>
                            <input type="text" name="cell" value="<?php echo $this->_tpl_vars['listObject']->getCell(); ?>
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
                            <input type="hidden" name="searchTerms" value="<?php echo $this->_tpl_vars['searchTerms']; ?>
"/>
                            <input type="hidden" name="searchStatus" value="<?php echo $this->_tpl_vars['searchStatus']; ?>
"/>
                            <input type="hidden" name="oId" value="<?php echo $this->_tpl_vars['listObject']->getId(); ?>
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
<div class="push"></div>
</div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['usertemplate'])."/footer.temp.html", 'smarty_include_vars' => array('title' => 'footer')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>