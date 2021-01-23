<?php /* Smarty version 2.6.19, created on 2020-08-09 08:28:22
         compiled from admin/manageaddproduct.temp.html */ ?>
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
</a> &raquo; <?php echo $this->_tpl_vars['amessages']['add_product']; ?>
</h2>
            <ul id="tablist">
                <li class="current"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=product&amp;act=add&amp;pId=<?php echo $this->_tpl_vars['pId']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['add_product']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_product']; ?>
</a> </li>
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
                        if (jQuery(\'#price\').val()!="") 
                        {
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
                            <label for="gId"><?php echo $this->_tpl_vars['amessages']['productcategory']; ?>
 *</label>
                            <span><?php echo $this->_tpl_vars['amessages']['parent_help']; ?>
</span>
                            <select name="category">
                                <option value="-1">All</option><?php echo $this->_tpl_vars['listCategory']; ?>

                            </select>
                        </p>
                        <!--<p>
                            <label for="vn_name">Mã sản phẩm*</label>
                            <span>Nhập vào mã của sản phẩm</span>
                            <input type="text" name="code_sp" value="<?php echo $this->_tpl_vars['code_sp']; ?>
" />
                        </p>-->
                        <p>
                            <label for="vn_name"><?php echo $this->_tpl_vars['amessages']['vn_name']; ?>
*</label>
                            <span><?php echo $this->_tpl_vars['amessages']['vn_name_help']; ?>
</span>
                            <input type="text" name="vn_name" value="<?php echo $this->_tpl_vars['vn_name']; ?>
" />
                        </p>
                        <p>
                            <label for="vn_name"><?php echo $this->_tpl_vars['amessages']['en_name']; ?>
*</label>
                            <span><?php echo $this->_tpl_vars['amessages']['en_name_help']; ?>
</span>
                            <input type="text" name="en_name" value="<?php echo $this->_tpl_vars['en_name']; ?>
" />
                        </p>
                        <p class ="hidden">
                            <label for="num_product"><?php echo $this->_tpl_vars['amessages']['num_product']; ?>
 *</label>
                            <input type="text" name="num_product" value="<?php echo $this->_tpl_vars['num_product']; ?>
" />
                        </p>
                        <p class ="hidden">
                            <label for="en_name"><?php echo $this->_tpl_vars['amessages']['price']; ?>
</label>
                            <input type="text" name="price" id="price" value="<?php echo $this->_tpl_vars['price']; ?>
"  onblur=" return CheckFormID()" />
                        </p>
                        <p class ="hidden">
                            <label  for="en_name"><?php echo $this->_tpl_vars['amessages']['sprice']; ?>
</label> 
                            <input type="text" name="s_price"  id="s_price" value="<?php echo $this->_tpl_vars['s_price']; ?>
"  />
                        </p>
                        <div id="upload">
                            <p>
                                <label for="en_name"><?php echo $this->_tpl_vars['amessages']['avatar']; ?>
 (Tiếng Việt) </label>
                                <span class="error" style="color:red"><?php echo $this->_tpl_vars['amessages']['size']; ?>
: <?php echo $this->_tpl_vars['amessages']['productsize']; ?>
</span>
                                <input type="file" name="avatar" value="<?php echo $this->_tpl_vars['avatar']; ?>
" />
                            </p>
                            <p>
                                <label for="en_name"><?php echo $this->_tpl_vars['amessages']['avatar']; ?>
 (Tiếng Anh) </label>
                                <span class="error" style="color:red"><?php echo $this->_tpl_vars['amessages']['size']; ?>
: <?php echo $this->_tpl_vars['amessages']['productsize']; ?>
</span>
                                <input type="file" name="file3" value="<?php echo $this->_tpl_vars['file3']; ?>
" />
                            </p>
                            <p class ="hidden">
                                <div id="uploadortherimage">
                                    <label for="details"><?php echo $this->_tpl_vars['amessages']['uploadimg']; ?>
</label>
                                    <span>Upload những hình ảnh khác của sản phẩm</span>
                                    <span id="listfiles">     	
                                        <input name="files[]" type="file"> <br>
                                    </span>
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
                            <!-- màu sắc -->
                            <p class = "hidden">
                                <label for="details">Thêm qui cách in </label>
                                <span>Số Lượng</span>
                                <span id="mausac">     	
                                    <input name="color[]" type="text"> <br>
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
                            <!-- kích thước -->
                            <p class = "hidden">
                                <label for="details">Thêm số lượng</label>
                                <span>kích thước</span>
                                <span id="kichthuoc">     	
                                    <input name="kichthuoc[]" type="text"> <br>
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
                        </div>
                        <!--<p>
                            <label for="frontpage">Lựa chọn sản phẩm</label>
                            <input type="radio" name="hot" id="hot"  value="0" style="width:20px; margin-left:30px" />Chọn là sản phẩm mới (icon mới)
                            <input type="radio"name="hot" id="saleoff" value="1" style="width:20px; margin-left:30px" />Chọn là sản phẩm khuyến mãi (icon sale off)
                        </p>
                        <p>
                            <label for="frontpage">Chọn sản phẩm này là sản phẩm hot ở trang chủ</label>
                            <input type="checkbox" style="width:50px;" name="newhot" id="newhot" <?php if ($this->_tpl_vars['newhot'] == 1): ?>checked="checked"<?php endif; ?> value="1" />
                        </p>-->
                        <!--<div id="option">
                            <ul>
                                <li><label for="spmoi">Còn Hàng</label><input type="checkbox" name="spmoi" id="spmoi" value="1" /></li>
                                <li><label for="spkhuyenmai">Hết Hàng</label><input type="checkbox" name="spkhuyenmai" id="spkhuyenmai" value="1" /></li>
                                <li><label for="giasocmoingay"><?php echo $this->_tpl_vars['amessages']['giasocmoingay']; ?>
</label><input type="checkbox" name="giasocmoingay" id="giasocmoingay" value="1" /></li>
                                <li><label for="spquantam"><?php echo $this->_tpl_vars['amessages']['spquantam']; ?>
</label><input type="checkbox" name="spquantam" id="spquantam" value="1" /></li>
                                <p>&nbsp;</p>
                                <li><label for="iconnew"><?php echo $this->_tpl_vars['amessages']['iconnew']; ?>
</label><input type="checkbox" name="iconnew" id="iconnew" value="1" /></li>
                                <li><label for="iconhot"><?php echo $this->_tpl_vars['amessages']['iconhot']; ?>
</label><input type="checkbox" name="iconhot" id="iconhot" value="1" /></li>  
                                <div class="clr">
                                    <label for="giamgia"><?php echo $this->_tpl_vars['amessages']['giamgia']; ?>
</label>
                                    <input type="text" name="giamgia" id="giamgia" value="<?php echo $this->_tpl_vars['giamgia']; ?>
" />
                                </div>              
                            </ul>
                            <?php echo '
                            <style>
                                #option li{ float:none; clear:both}
                                #option label{ display:inline; margin-left:10px}
                                #option input[type=\'checkbox\']{ float:left; width:auto}
                            </style>
                            '; ?>

                        </div>-->
                        <!--<p>
                            <label for="size"><?php echo $this->_tpl_vars['amessages']['size']; ?>
 *</label>
                            <input type="text" name="size" value="<?php echo $this->_tpl_vars['size']; ?>
" />
                        </p>-->
                        <p >
                            <label for="en_name"><?php echo $this->_tpl_vars['amessages']['vn_sapo']; ?>
</label>
                            <textarea name="vn_nsx" rows="5" cols="5" class="mceSimple"><?php echo $this->_tpl_vars['vn_nsx']; ?>
</textarea>
                        </p>
                        <p>
                            <label for="en_name"><?php echo $this->_tpl_vars['amessages']['vn_sapo']; ?>
 </label>
                            <textarea name="en_nsx" rows="5" cols="5" class="mceSimple"><?php echo $this->_tpl_vars['en_nsx']; ?>
</textarea>
                        </p>
                        <!--<p>
                            <label for="en_nhanhieu"><?php echo $this->_tpl_vars['amessages']['en_nhanhieu']; ?>
</label>
                            <textarea name="en_nhanhieu" rows="5" cols="5" class="mceSimple"><?php echo $this->_tpl_vars['en_nhanhieu']; ?>
</textarea>
                        </p>-->
                        <p class ="hidden">
                            <label for="vn_name">Mô tả sản phầm  *</label>
                            <span>Mô tả sản phầm *</span>
                            <textarea name="vn_details" rows="20" cols="5" class="mceAdvanced"><?php echo $this->_tpl_vars['vn_details']; ?>
</textarea>
                        </p>
                        <p class ="hidden">
                            <label for="vn_name">Hướng dẫn sử dụng *</label>
                            <span>Hướng dẫn sử dụng *</span>
                            <textarea name="en_details" rows="20" cols="5" class="mceAdvanced"><?php echo $this->_tpl_vars['en_details']; ?>
</textarea>
                        </p>
                        <p style = "display: none;">
                            <label for="vn_nhanhieu"><?php echo $this->_tpl_vars['amessages']['vn_nhanhieu']; ?>
</label>
                            <textarea name="vn_nhanhieu" rows="20" cols="5" class="mceAdvanced"><?php echo $this->_tpl_vars['vn_nhanhieu']; ?>
</textarea>
                        </p>
                        <p style="display:none">
                            <label for="company">Tình trạng sản phẩm</label>
                            <span>Chọn tình trạng của sản phẩm (còn hàng hay hết hàng)</span>
                            <input name="product_on" value="0" checked="checked" type="radio" style="width:20px; margin-left:30px">
                            Còn hàng
                            <input name="product_on" value="1" type="radio" style="width:20px; margin-left:30px">
                            Hết hàng
                        </p>
                        <!--<p>
                            <label for="company">Thuế VAT</label>
                            <span>Lựa chọn option phù hợp với sản phẩm của bạn</span>
                            <input name="vat_on" value="0" checked="checked" type="radio" style="width:20px; margin-left:30px">
                            Đã bao gồm thuế VAT
                            <input name="vat_on" value="1" type="radio" style="width:20px; margin-left:30px">
                            Chưa bao gồm thuế VAT
                        </p>-->
                        <!--<p>
                            <label for="company">Chọn sản phẩm khuyến mãi</label>
                            <span>Chọn sản phẩm khuyến mãi.</span>
                            <input name="sprice_on" id="sprice_on"  value="1" type="checkbox" style="width:50px">
                        </p>-->
                        <p>
                            <input class="checkbox" name="newhot" id="newhot"  value="1" type="checkbox" <?php if ($this->_tpl_vars['newhot'] == 1): ?>checked="checked"<?php endif; ?> />
                            <label for="company">Sản phẩm bán chạy</label>
                        </p>
                        <p class="hidden-config">
                            <input class="checkbox" type="checkbox" name="spmoi" id="spmoi" <?php if ($this->_tpl_vars['home'] == 1): ?>checked="checked"<?php endif; ?> value="1" />
                            <label for="frontpage">Chọn sản phẩm này Hot </label>
                        </p>
                        <p>
                            <label for="en_name">Vị trí sản phẩm</label>
                            <span>Nhập vào vị trí hiện thị của sản phẩm.</span>
                            <input type="text" name="position" value="<?php echo $this->_tpl_vars['position']; ?>
" />
                        </p>
                        <!--<p>
                            <label for="vn_name"><?php echo $this->_tpl_vars['amessages']['position']; ?>
 *</label>
                            <span><?php echo $this->_tpl_vars['amessages']['position_help']; ?>
</span>
                            <input type="text" name="position" value="<?php echo $this->_tpl_vars['position']; ?>
" />
                        </p>-->
                        <!--<p class="radioType">
                            <input type="checkbox" name="setwatermark" id="setwatermark" checked="checked" value="1" />
                            <label for="frontpage">Watermark</label>
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