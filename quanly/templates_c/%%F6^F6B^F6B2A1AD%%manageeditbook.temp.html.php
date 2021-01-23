<?php /* Smarty version 2.6.19, created on 2020-08-13 09:48:41
         compiled from admin/manageeditbook.temp.html */ ?>
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
            <form action="" method="post" name="form2" enctype="multipart/form-data">
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
</a> &raquo; Thêm đặt bàn</h2>
            <ul id="tablist">
                <li class="current"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=book&amp;act=add" title="Thêm mới đặt bàn">Thêm mới đặt bàn</a> </li>
                <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=book&act=list" title="<?php echo $this->_tpl_vars['amessages']['list_book']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_book']; ?>
</a> </li>
                <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=book&act=list&plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
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
" method="post" id="addItem" name="<?php echo $this->_tpl_vars['formId']; ?>
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
                            <label for="vn_name">Tên khách hàng*</label>
                            <span><?php echo $this->_tpl_vars['amessages']['name']; ?>
</span>
                            <input type="text" name="name" value="<?php echo $this->_tpl_vars['listObject']->getName(); ?>
" />
                        </p>

                        <p class ="hidden">
                            <label for="en_name">Email</label>
                            <input type="text" name="email" id="email" value="<?php echo $this->_tpl_vars['listObject']->getEmail(); ?>
"  />
                        </p>

                        <p class ="hidden">
                            <label for="en_name">Số điện thoại</label>
                            <input type="text" name="tel" id="tel" value="<?php echo $this->_tpl_vars['listObject']->getTel(); ?>
"  />
                        </p>

                        <p class ="hidden">
                            <label for="en_name">Ngày đặt</label>
                            <input type="date" name="date" id="date" value="<?php echo $this->_tpl_vars['listObject']->getDate(); ?>
"  />
                        </p>

                        <p class ="hidden">
                            <label for="en_name">Giờ đặt</label>
                            <input type="time" name="time" id="time" value="<?php echo $this->_tpl_vars['listObject']->getTime(); ?>
"  />
                        </p>

                        <p class ="hidden">
                            <label for="en_name">Ghi chú</label>
                            <input type="text" name="note" id="note" value="<?php echo $this->_tpl_vars['listObject']->getNote(); ?>
"  />
                        </p>

                        <p class ="hidden">
                            <label for="en_name">Số lượng</label>
                            <input type="text" name="quantity" id="quantity" value="<?php echo $this->_tpl_vars['listObject']->getQuantity(); ?>
"  />
                        </p>

                        <p class="btnType">
                            <input type="hidden" name="op" value="<?php echo $this->_tpl_vars['op']; ?>
" />
                            <input type="hidden" name="id" value="<?php echo $this->_tpl_vars['listObject']->getId(); ?>
" />
                            <input type="hidden" name="part" value="<?php echo $this->_tpl_vars['part']; ?>
" />
                            <input type="hidden" name="act" value="<?php echo $this->_tpl_vars['act']; ?>
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