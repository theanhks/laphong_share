<?php /* Smarty version 2.6.19, created on 2020-08-08 18:26:11
         compiled from admin/manageeditproduct.temp.html */ ?>
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
        <div class="contextType"></div>
    </div>
    <div id="content">
        <div class="highlight">
            <h2><a href=""><?php echo $this->_tpl_vars['amessages']['control_panel']; ?>
</a> &raquo; <?php if ($this->_tpl_vars['act'] == 'edit'): ?><?php echo $this->_tpl_vars['amessages']['edit_product']; ?>
<?php else: ?><?php echo $this->_tpl_vars['amessages']['copy_product']; ?>
<?php endif; ?></h2>
            <ul id="tablist">
                <li class="current"><a title="<?php echo $this->_tpl_vars['amessages']['edit_product']; ?>
"><?php if ($this->_tpl_vars['act'] == 'edit'): ?><?php echo $this->_tpl_vars['amessages']['edit_product']; ?>
<?php else: ?><?php echo $this->_tpl_vars['amessages']['copy_product']; ?>
<?php endif; ?></a> </li>
                <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=product&act=list" title="<?php echo $this->_tpl_vars['amessages']['list_product']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_product']; ?>
</a> </li>
                <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=product&act=list&plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
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
                <?php echo ' 
                <script language="javascript">		 
                    function CheckFormID() {         
                        if (jQuery(\'#price\').val()!="") {
                            var age =jQuery(\'#price\').val();
                            if(isNaN(age))
                            {
                                alert("Bạn phải nhập giá sản phẩm là kiểu số");	
                                jQuery(\'#price\').focus();
                                return false;	
                            }
                        }
                        return true;      
                    }
                </script> 
                '; ?>

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
                            <label for="gId"><?php echo $this->_tpl_vars['amessages']['productcategory']; ?>
 *</label>
                            <span><?php echo $this->_tpl_vars['amessages']['parent_help']; ?>
</span>
                            <select name="category">
                                <option value="-1">All</option>
                                <?php echo $this->_tpl_vars['listCategory']; ?>

                            </select>
                        </p>
                        <!--<p>
                            <label for="vn_name">Mã sản phẩm *</label>
                            <span>Nhập vào mã của sản phẩm</span>
                            <input type="text" name="code_sp" value="<?php echo $this->_tpl_vars['listObject']->getPayment(); ?>
" />
                        </p>-->
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
                        <p class ="hidden">
                            <label for="num_product"><?php echo $this->_tpl_vars['amessages']['num_product']; ?>
 *</label>
                            <input type="text" name="num_product" value="<?php echo $this->_tpl_vars['listObject']->getNumProduct(); ?>
" />
                        </p>
                        <!--<p>
                            <label for="size"><?php echo $this->_tpl_vars['amessages']['size']; ?>
 *</label>
                            <input type="text" name="size" value="<?php echo $this->_tpl_vars['listObject']->getViewed(); ?>
" />
                        </p>-->
                        <p>
                            <label for="en_name"><?php echo $this->_tpl_vars['amessages']['avatar']; ?>
 (Tiếng việt) </label>
                            <span class="error" style="color:red"><?php echo $this->_tpl_vars['amessages']['size']; ?>
: <?php echo $this->_tpl_vars['amessages']['productsize']; ?>
</span>
                            <?php if ($this->_tpl_vars['listObject']->getAvatar()): ?>
                            <span><img src="<?php echo $this->_tpl_vars['ROOTPATH']; ?>
/gallery/avatar_upload/products/avatar/<?php echo $this->_tpl_vars['listObject']->getAvatar(); ?>
" /></span>
                            <!--<span><input type="checkbox" style="width:50px;" value="1" id="delete_avatar" name="delete_avatar">&nbsp;<label style="float:left">Xóa</label></span>-->
                            <?php endif; ?>
                            <input type="file" name="avatar" value="<?php echo $this->_tpl_vars['avatar']; ?>
" />
                            <input type="hidden" name="avatar_old" value="<?php echo $this->_tpl_vars['listObject']->getAvatar(); ?>
" />
                        </p>
                        <p>
                            <label for="en_name"><?php echo $this->_tpl_vars['amessages']['avatar']; ?>
 (Tiếng anh) </label>
                            <span class="error" style="color:red"><?php echo $this->_tpl_vars['amessages']['size']; ?>
: <?php echo $this->_tpl_vars['amessages']['productsize']; ?>
</span>
                            <?php if ($this->_tpl_vars['listObject']->getFile3()): ?>
                            <span><img src="<?php echo $this->_tpl_vars['ROOTPATH']; ?>
/gallery/avatar_upload/products/avatar/<?php echo $this->_tpl_vars['listObject']->getFile3(); ?>
" /></span>
                            <!--<span><input type="checkbox" style="width:50px;" value="1" id="delete_avatar" name="delete_avatar">&nbsp;<label style="float:left">Xóa</label></span>-->
                            <?php endif; ?>
                            <input type="file" name="file3" value="<?php echo $this->_tpl_vars['file3']; ?>
" />
                            <input type="hidden" name="file3_old" value="<?php echo $this->_tpl_vars['listObject']->getFile3(); ?>
" />
                        </p>
                        <p class ="hidden">
                            <label for="en_name">Qui cách in *</label>
                            <span id="mausac">   
                            <?php $this->assign('imagesItems', $this->_tpl_vars['listObject']->getProperties(0)); ?>
                            <?php if ($this->_tpl_vars['imagesItems']): ?>        
                            <?php $_from = $this->_tpl_vars['imagesItems']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['imagesItem']):
?>
                            <?php if ($this->_tpl_vars['imagesItem'] == ''): ?>
                            <?php else: ?>
                            <input type="text" name="color[]" value="<?php echo $this->_tpl_vars['imagesItem']; ?>
" />
                            <?php endif; ?>
                            <?php endforeach; endif; unset($_from); ?>
                            <?php endif; ?>
                            </span>
                            <?php echo '
                            <script>
                            jQuery(document).ready(function() {		
                            jQuery("[name=btnThem_mau_sac]").click(function(){
                            jQuery("#mausac").append("<input type=\'text\' name=\'color[]\'> <br/>");
                            });
                            });
                            </script>
                            '; ?>

                            <input name="btnThem_mau_sac" themfile="1" value="Thêm" type="button" style=" width:100px; background-color:none"> 
                        </p>
                        <p class ="hidden">
                            <span id="kichthuoc"> 
                            <label for="en_name">Số lượng *</label>
                            <?php $this->assign('imagesItems1', $this->_tpl_vars['listObject']->getFile(2)); ?>
                            <?php if ($this->_tpl_vars['imagesItems1']): ?>        
                            <?php $_from = $this->_tpl_vars['imagesItems1']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['imagesItem']):
?>
                            <?php if ($this->_tpl_vars['imagesItem'] == ''): ?>
                            <?php else: ?>
                            <input type="text" name="kichthuoc[]" value="<?php echo $this->_tpl_vars['imagesItem']; ?>
" />
                            <?php endif; ?>
                            <?php endforeach; endif; unset($_from); ?>
                            <?php endif; ?>
                            </span>
                            <?php echo '
                            <script>
                            jQuery(document).ready(function() {		
                            jQuery("[name=btnThem_kich_thuoc]").click(function(){
                            jQuery("#kichthuoc").append("<input type=\'text\' name=\'kichthuoc[]\'> <br/>");
                            });
                            });
                            </script>
                            '; ?>

                            <input name="btnThem_kich_thuoc" themfile="1" value="Thêm" type="button" style=" width:100px; background-color:none"> 
                        </p>
                        <p>
                            <div id="uploadortherimage">
                                <label for="details"><?php echo $this->_tpl_vars['amessages']['uploadimg']; ?>
</label>
                                <span>Upload những hình ảnh khác của sản phẩm</span>
                                <?php if ($this->_tpl_vars['listObject']->getFile1()): ?>
                                <?php $this->assign('imagesItems', $this->_tpl_vars['listObject']->getFile(1)); ?>
                                <table width="100%" cellpadding="0" border="0" >
                                    <tr>
                                        <?php $_from = $this->_tpl_vars['imagesItems']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['imagesItem']):
?>
                                        <td><img src="<?php echo $this->_tpl_vars['ROOTPATH']; ?>
/gallery/avatar_upload/products/avatar/<?php echo $this->_tpl_vars['imagesItem']; ?>
" title="images" width="100" height="100" /></td>
                                        <?php endforeach; endif; unset($_from); ?>
                                    </tr>
                                    <tr>
                                        <?php $_from = $this->_tpl_vars['imagesItems']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['value']):
?>
                                        <td><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=product&amp;act=edit&amp;searchStatus=<?php echo $this->_tpl_vars['listObject']->getStatus(); ?>
&amp;searchCategory=<?php echo $this->_tpl_vars['listObject']->getCategory(); ?>
&amp;oId=<?php echo $this->_tpl_vars['listObject']->getId(); ?>
&img=<?php echo $this->_tpl_vars['i']; ?>
&anchor=img_delete#img_delete" title="xóa images"><img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/delete-icon.png" title="Xóa hình" align="middle"/></a></td>
                                        <?php endforeach; endif; unset($_from); ?>
                                    </tr>
                                </table>
                                <?php endif; ?>
                                <span id="listfiles"><input name="files[]" type="file"> <br> </span>
                                <?php echo '
                                <script>
                                    jQuery(document).ready(function() {		
                                        jQuery("[name=btnThem]").click(function(){
                                            jQuery("#listfiles").append("<input type=\'file\' name=\'files[]\'> <br/>");
                                        });
                                    });
                                </script>
                                '; ?>

                                <input name="btnThem" themfile="1" value="Thêm" type="button" style=" width:100px; background-color:none"> 
                            </div>
                        </p>
                        <p class ="hidden">
                            <label for="en_name">Giá</label>            
                            <input type="text" name="price" id="price" value="<?php echo $this->_tpl_vars['listObject']->getPrice(); ?>
" onblur="return CheckFormID()" />
                        </p>
                        <p class ="hidden">
                            <label for="en_name">Giá cũ</label>            
                            <input type="text" name="s_price" id="s_price" value="<?php echo $this->_tpl_vars['listObject']->getSPrice(); ?>
" />
                        </p>
                        <p>
                            <label for="en_name"><?php echo $this->_tpl_vars['amessages']['vn_sapo']; ?>
 *</label>            
                            <textarea name="vn_nsx" rows="20" cols="20" class="mceSimple"><?php echo $this->_tpl_vars['listObject']->getNSX('vn'); ?>
</textarea>
                        </p>
                        <p>
                            <label for="en_name"><?php echo $this->_tpl_vars['amessages']['en_sapo']; ?>
 *</label>
                            <textarea name="en_nsx" rows="5" cols="5" class="mceSimple"><?php echo $this->_tpl_vars['listObject']->getNSX('en'); ?>
</textarea>
                        </p>
                        <!--<p>
                            <label for="en_nhanhieu"><?php echo $this->_tpl_vars['amessages']['en_nhanhieu']; ?>
 *</label>
                            <textarea name="en_nhanhieu" rows="5" cols="5" class="mceSimple"><?php echo $this->_tpl_vars['listObject']->getNhanhieu('en'); ?>
</textarea>
                        </p>-->
                        <!--<p>
                            <label for="vn_name">Thông số kỹ thuật *</label>
                            <span>Nhập vào các thông số kỹ thuật của sản phẩm</span>
                            <textarea name="en_details" rows="20" cols="5" class="mceAdvanced"><?php echo $this->_tpl_vars['listObject']->getDetails('en'); ?>
</textarea>
                        </p>-->
                        <p class ="hidden" id="img_delete">
                            <label for="vn_name">Mô tả sản phẩm *</label>
                            <textarea name="vn_details" rows="40" cols="40" class="mceAdvanced"><?php echo $this->_tpl_vars['listObject']->getDetails('vn'); ?>
</textarea>
                        </p>
                        <p class ="hidden" id="img_delete">
                            <label for="vn_name">Hướng dẫn sử dụng *</label>
                            <textarea name="en_details" rows="40" cols="40" class="mceAdvanced"><?php echo $this->_tpl_vars['listObject']->getDetails('en'); ?>
</textarea>
                        </p>
                        <p style="display:none">
                            <label for="vn_nhanhieu"><?php echo $this->_tpl_vars['amessages']['vn_nhanhieu']; ?>
 *</label>
                            <textarea name="vn_nhanhieu" rows="20" cols="5" class="mceAdvanced"><?php echo $this->_tpl_vars['listObject']->getNhanhieu('vn'); ?>
</textarea>
                        </p>
                        <!--<p>
                            <label for="company">Tình trạng sản phẩm</label>
                            <span>Chọn tình trạng của sản phẩm (còn hàng hay hết hàng)</span>
                            <input name="product_on" value="0" <?php if ($this->_tpl_vars['product_on_old'] == 0): ?>checked="checked"<?php endif; ?> type="radio" style="width:20px; margin-left:30px">
                            Còn hàng
                            <input name="product_on" value="1" <?php if ($this->_tpl_vars['product_on_old'] == 1): ?>checked="checked"<?php endif; ?> type="radio" style="width:20px; margin-left:30px">
                            Hết hàng
                        </p>-->
                        <!--<p>
                            <label for="company">Thuế VAT</label>
                            <span>Lựa chọn option phù hợp với sản phẩm của bạn</span>
                            <input name="vat_on" value="0" <?php if ($this->_tpl_vars['vat_on_old'] == 0): ?>checked="checked"<?php endif; ?> type="radio" style="width:20px; margin-left:30px">
                            Đã bao gồm thuế VAT
                            <input name="vat_on" value="1" <?php if ($this->_tpl_vars['vat_on_old'] == 1): ?>checked="checked"<?php endif; ?> type="radio" style="width:20px; margin-left:30px">
                            Chưa bao gồm thuế VAT 
                        </p>-->
                        <!--<p>
                            <label for="frontpage">Lựa chọn sản phẩm</label>
                            <input type="radio" style="width:20px; margin-left:30px" name="hot" id="hot" <?php if ($this->_tpl_vars['hot_old'] == 0): ?>checked="checked"<?php endif; ?> value="0" />Chọn là sản phẩm mới (icon mới)
                            <input type="radio" style="width:20px; margin-left:30px" name="hot" id="hot" <?php if ($this->_tpl_vars['hot_old'] == 1): ?>checked="checked"<?php endif; ?> value="1" />Chọn là sản phẩm khuyến mãi (icon sale off)
                        </p>-->
                        <p>
                            <input class="checkbox" name="newhot" id="newhot"  value="1" type="checkbox" <?php if ($this->_tpl_vars['listObject']->getPayment() == 1): ?>checked="checked"<?php endif; ?> /> 
                            <label for="company">Sản phẩm bán chạy</label>
                        </p>
                        <p class="hidden-config">
                            <input class="checkbox" name="spmoi" id="home"  value="1" type="checkbox" <?php if ($this->_tpl_vars['listObject']->getHome() == 1): ?>checked="checked"<?php endif; ?> />
                            <label for="company">Chọn sản phẩm này Hot</label>
                        </p>           			
                        <p>
                            <label for="en_name">Vị trí sản phẩm</label>
                            <span>Nhập vào vị trí hiện thị của sản phẩm.</span>
                            <input type="text" name="position" value="<?php echo $this->_tpl_vars['listObject']->getPosition(); ?>
" />
                        </p>
                        <!--<p class="radioType">
                            <input type="checkbox" name="setwatermark" id="setwatermark" checked="checked" value="1" />
                            <label for="frontpage">Watermark </label>
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
                            <input type="hidden" name="searchCategory" value="<?php echo $this->_tpl_vars['searchCategory']; ?>
"/>
                            <input type="hidden" name="oId" value="<?php echo $this->_tpl_vars['listObject']->getId(); ?>
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