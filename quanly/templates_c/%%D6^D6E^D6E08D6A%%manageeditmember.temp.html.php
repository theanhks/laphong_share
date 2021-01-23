<?php /* Smarty version 2.6.19, created on 2020-08-02 12:48:38
         compiled from admin/manageeditmember.temp.html */ ?>
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
</a> &raquo; <?php echo $this->_tpl_vars['amessages']['edit_member']; ?>
</h2>
        <ul id="tablist">
            <li class="current"><a href="" title="<?php echo $this->_tpl_vars['amessages']['edit_member']; ?>
"><?php echo $this->_tpl_vars['amessages']['edit_member']; ?>
</a> </li>
            <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=member&act=list" title="<?php echo $this->_tpl_vars['amessages']['list_member']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_member']; ?>
</a> </li>
            <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=member&act=list&plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
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
                        <label for="fname">Họ tên*</label>
                        <span>Nhập vào họ tên đầy đủ</span>
                        <input type="text" name="fullname" value="<?php echo $this->_tpl_vars['listObject']->getFullname(); ?>
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
                   <!-- <p>
                        <label for="username"><?php echo $this->_tpl_vars['amessages']['username']; ?>
 *</label>
                        <span><?php echo $this->_tpl_vars['amessages']['username_help']; ?>
</span>
                        <input type="text" name="username" value="<?php echo $this->_tpl_vars['listObject']->getUsername(); ?>
" disabled="disabled" />
                    </p>-->
                    <p>
                        <label for="pass"><?php echo $this->_tpl_vars['amessages']['old_pass']; ?>
*</label>
                        <span><?php echo $this->_tpl_vars['amessages']['pass_help']; ?>
</span>
                        <input type="password" name="old_pass" value="<?php echo $this->_tpl_vars['listObject']->getPass(); ?>
"  disabled="disabled"/>
                    </p>
                    <p>
                        <label for="pass"><?php echo $this->_tpl_vars['amessages']['new_pass']; ?>
 *</label>
                        <span><?php echo $this->_tpl_vars['amessages']['pass_help']; ?>
</span>
                        <input type="password" name="new_pass" value="" />
                    </p>
                    <p>
                        <label for="pass"><?php echo $this->_tpl_vars['amessages']['confirm']; ?>
 *</label>
                        <span><?php echo $this->_tpl_vars['amessages']['confirm_help']; ?>
</span>
                        <input type="password" name="confirm" value="" />
                    </p>

                   <!-- <p>
                        <label for="status">Giới tính *</label>
                        <select name="phai">
                            <?php echo $this->_tpl_vars['listGender']; ?>

                        </select>
                    </p>
                    <label for="about"><?php echo $this->_tpl_vars['amessages']['about']; ?>
</label>
                    <span><?php echo $this->_tpl_vars['amessages']['about_help']; ?>
</span>
                    <input type="text" name="about" value="<?php echo $this->_tpl_vars['listObject']->getAbout(); ?>
" />
                    </p>-->
                    <p>
                        <label for="tel"><?php echo $this->_tpl_vars['amessages']['tel']; ?>
 </label>
                        <span><?php echo $this->_tpl_vars['amessages']['tel_help']; ?>
</span>
                        <input type="text" name="tel" value="<?php echo $this->_tpl_vars['listObject']->getTel(); ?>
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


                 <!--   <p>
                        <label for="fax"><?php echo $this->_tpl_vars['amessages']['fax']; ?>
 </label>
                        <span><?php echo $this->_tpl_vars['amessages']['fax_help']; ?>
</span>
                        <input type="text" name="fax" value="<?php echo $this->_tpl_vars['listObject']->getFax(); ?>
" />
                    </p>-->
                    <!--<p>
                       <label for="company"><?php echo $this->_tpl_vars['amessages']['company']; ?>
 </label>
                       <span><?php echo $this->_tpl_vars['amessages']['company_help']; ?>
</span>
                       <input type="text" name="company" value="<?php echo $this->_tpl_vars['listObject']->getCompany(); ?>
" />
                       </p>
                       <p>
                       <label for="company">Tỉnh </label>
                       <span>Nhập vào tỉnh của bạn</span>
                       <input type="text" name="tinh" value="<?php echo $this->_tpl_vars['listObject']->getTinh(); ?>
" />
                       </p>
                       <p>
                       <label for="company">Quốc gia </label>
                       <span>Nhập vào đất nước của bạn</span>
                       <input type="text" name="country " value="<?php echo $this->_tpl_vars['listObject']->getCountry(); ?>
" />
                       </p>
                       <p><label for="company">Dịch vụ </label>
                        <input name="chk_service" id="chk_service" value="1" type="checkbox" style="width:50px" <?php if ($this->_tpl_vars['chk_service_old'] == 1): ?> checked="checked" <?php endif; ?>>
                         </p>
                         <p><label for="company">Sản phẩm </label>
                        <input name="chk_product" id="chk_product" value="1" type="checkbox" style="width:50px" <?php if ($this->_tpl_vars['chk_product'] == 1): ?> checked="checked" <?php endif; ?>>
                         </p>
                         <p><label for="company">Bạn chỉ là khách viếng thăm? </label>
                        <input name="chk_visistor" value="1" type="radio" style="width:50px" <?php if ($this->_tpl_vars['chk_visistor'] == 1): ?> checked="checked" <?php endif; ?>>
                                       Có
                                       <input name="chk_visistor" value="0" type="radio" style="width:50px" <?php if ($this->_tpl_vars['chk_visistor'] == 0): ?> checked="checked" <?php endif; ?>>
                                      Không
                         </p>

                           <p><label for="company">Bạn muốn xây các loại công trình? </label>
                                          <input name="chk_project" id="chk_project" value="1" type="checkbox" style="width:50px" <?php if ($this->_tpl_vars['chk_project'] == 1): ?> checked="checked" <?php endif; ?>>
                                         P1
                                         <input name="chk_project" id="chk_project" value="2" type="checkbox" style="width:50px" <?php if ($this->_tpl_vars['chk_project'] == 2): ?> checked="checked" <?php endif; ?>>
                                       P2
                                       <input name="chk_project" id="chk_project" value="3" type="checkbox" style="width:50px" <?php if ($this->_tpl_vars['chk_project'] == 3): ?> checked="checked" <?php endif; ?>>
                                       P3
                                       <input name="chk_project" id="chk_project" value="4" type="checkbox" style="width:50px" <?php if ($this->_tpl_vars['chk_project'] == 4): ?> checked="checked" <?php endif; ?>>
                                       P4
                                       <input name="chk_project" id="chk_project" value="5" type="checkbox" style="width:50px" <?php if ($this->_tpl_vars['chk_project'] == 5): ?> checked="checked" <?php endif; ?>>
                                       P5
                                       <input name="chk_project" id="chk_project" value="6" type="checkbox" style="width:50px" <?php if ($this->_tpl_vars['chk_project'] == 6): ?> checked="checked" <?php endif; ?>>
                                       P6
                         </p>
                               <p><label for="company">Bạn mong muốn là nhân viên VIETCONS trong tương lai?</label>
                       <input name="chk_isvietcons" value="1" type="radio" style="width:50px" <?php if ($this->_tpl_vars['chk_isvietcons'] == 1): ?> checked="checked" <?php endif; ?>>
                       Có
                       <input name="chk_isvietcons" value="0" type="radio" style="width:50px" <?php if ($this->_tpl_vars['chk_isvietcons'] == 0): ?> checked="checked" <?php endif; ?>>
                       Không
                         </p>
                         <p><label for="company">Bạn muốn là đối tác công ty VIETCONS ?</label>
                       <input name="chk_ispartner" value="1"  type="radio" style="width:50px" <?php if ($this->_tpl_vars['chk_ispartner'] == 1): ?> checked="checked" <?php endif; ?>>
                       Có
                       <input name="chk_ispartner" value="0" type="radio" style="width:50px" <?php if ($this->_tpl_vars['chk_ispartner'] == 0): ?> checked="checked" <?php endif; ?>>
                       Không
                         </p>	 -->
                    <p class="btnType">
                        <input type="hidden" name="op" value="<?php echo $this->_tpl_vars['op']; ?>
" />
                        <input type="hidden" name="part" value="<?php echo $this->_tpl_vars['part']; ?>
" />
                        <input type="hidden" name="act" value="<?php echo $this->_tpl_vars['act']; ?>
" />
                        <input type="hidden" name="oId" value="<?php echo $this->_tpl_vars['listObject']->getId(); ?>
"/>
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
<div class="push"></div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['usertemplate'])."/footer.temp.html", 'smarty_include_vars' => array('title' => 'footer')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>