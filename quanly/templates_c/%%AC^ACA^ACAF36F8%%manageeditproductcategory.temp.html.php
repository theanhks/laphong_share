<?php /* Smarty version 2.6.19, created on 2020-08-23 19:24:41
         compiled from admin/manageeditproductcategory.temp.html */ ?>
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
    </div>
    <div id="content">
        <div class="highlight">
            <h2><a href=""><?php echo $this->_tpl_vars['amessages']['control_panel']; ?>
</a> &raquo; <?php echo $this->_tpl_vars['amessages']['edit_productcategory']; ?>
</h2>
            <ul id="tablist">
                <li class="current"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=productcategory&amp;act=edit&amp;oId=<?php echo $this->_tpl_vars['pcId']; ?>
&amp;pId=<?php echo $this->_tpl_vars['pId']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['edit_productcategory']; ?>
"><?php echo $this->_tpl_vars['amessages']['edit_productcategory']; ?>
</a> </li>
                <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=productcategory&act=list" title="<?php echo $this->_tpl_vars['amessages']['list_productcategory']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_productcategory']; ?>
</a> </li>
                <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=productcategory&act=list&plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
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
                            <label for="status"><?php echo $this->_tpl_vars['amessages']['parent']; ?>
 *</label>
                            <span><?php echo $this->_tpl_vars['amessages']['status_help']; ?>
</span>
                            <select name="pId">
                            <option value="0">/</option>
                                <?php echo $this->_tpl_vars['listParent']; ?>

                            </select>
                        </p>
                        <p>
                            <label for="vn_name"><?php echo $this->_tpl_vars['amessages']['vn_name']; ?>
 *</label>
                            <span><?php echo $this->_tpl_vars['amessages']['vn_name_help']; ?>
</span>
                            <input type="text" name="vn_name" value="<?php echo $this->_tpl_vars['listObject']->getName('vn'); ?>
" />
                        </p>
                        <p>
                            <label for="en_name"><?php echo $this->_tpl_vars['amessages']['en_name']; ?>
</label>
                            <span><?php echo $this->_tpl_vars['amessages']['en_name_help']; ?>
</span>
                            <input type="text" name="en_name" value="<?php echo $this->_tpl_vars['listObject']->getName('en'); ?>
" />
                        </p>
                  
                        <p style="display:none">
                            <label for="en_name"><?php echo $this->_tpl_vars['amessages']['en_name']; ?>
</label>
                            <span><?php echo $this->_tpl_vars['amessages']['en_name_help']; ?>
</span>
                            <textarea name="en_details" cols="10" rows="10" class="mceSimple"><?php echo $this->_tpl_vars['listObject']->getDetails('en'); ?>
</textarea>
                        </p>
                        <p>
                            <label for="details"><?php echo $this->_tpl_vars['amessages']['avatar']; ?>
 banner</label>
                            <span><?php echo $this->_tpl_vars['amessages']['details_help']; ?>
</span>
                            <img width="" height="100" src="<?php echo $this->_tpl_vars['ROOTPATH']; ?>
/gallery/avatar_upload/productcat/avatar/<?php echo $this->_tpl_vars['listObject']->getAvatar(); ?>
" />
                            <input type="file" name="avatar" value="" />
                            <input type="hidden" name="news_avatar" value="<?php echo $this->_tpl_vars['listObject']->getAvatar(); ?>
" />
                        </p>
						
						  <p>
                            <label for="details"><?php echo $this->_tpl_vars['amessages']['avatar']; ?>
 sidebar</label>
                            <span><?php echo $this->_tpl_vars['amessages']['details_help']; ?>
</span>
                            <img width="" height="100" src="<?php echo $this->_tpl_vars['ROOTPATH']; ?>
/gallery/avatar_upload/productcat/avatar/<?php echo $this->_tpl_vars['listObject']->getDetails('vn'); ?>
" />
                            <input type="file" name="vn_details" value="" />
                            <input type="hidden" name="news_avatar_en" value="<?php echo $this->_tpl_vars['listObject']->getDetails('vn'); ?>
" />
                        </p>
						
                        <!--<div id="option">
                        <ul>
                        <li><label for="home"><?php echo $this->_tpl_vars['amessages']['home']; ?>
</label><input type="checkbox" name="home" id="home" <?php if ($this->_tpl_vars['home_old'] == 1): ?>checked="checked"<?php endif; ?> value="1" /></li>
                        </ul>
                        <?php echo '
                        <style>
                        #option li{ float:none; clear:both}
                        #option label{ display:inline; margin-left:10px}
                        #option input[type=\'checkbox\']{ float:left; width:auto}
                        </style>
                        '; ?>

                        </div>-->
                        <p>
                            <label for="vn_name"><?php echo $this->_tpl_vars['amessages']['position']; ?>
 </label>
                            <span><?php echo $this->_tpl_vars['amessages']['position_help']; ?>
</span>
                            <input type="text" name="position" value="<?php echo $this->_tpl_vars['listObject']->getPosition(); ?>
" />
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