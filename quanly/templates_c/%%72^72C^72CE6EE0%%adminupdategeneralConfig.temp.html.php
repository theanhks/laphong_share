<?php /* Smarty version 2.6.19, created on 2020-08-09 20:46:21
         compiled from admin/adminupdategeneralConfig.temp.html */ ?>
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
	<?php $this->assign('formId', 'updateConfig'); ?>
	<?php $this->assign('rightPanel', 'hidden'); ?>
	<div id="contextual" class="<?php echo $this->_tpl_vars['rightPanel']; ?>
">
		<div class="levBtn" style="display: none;">
			<p><a href="#"><img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/btn_arrow_02.gif" alt="" width="18" height="19" /></a></p>
		</div>
		<div class="contextType" style="display: none;">
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
</a> &raquo; <?php echo $this->_tpl_vars['amessages']['update_config']; ?>
</h2>
			<ul id="tablist">
				<li class="current"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=admin&amp;part=generalConfig&amp;act=update" title="<?php echo $this->_tpl_vars['amessages']['update_config']; ?>
"><?php echo $this->_tpl_vars['amessages']['update_config']; ?>
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
			<div class="formType style01">
				<form action="<?php echo $this->_tpl_vars['script']; ?>
" method="post" id="<?php echo $this->_tpl_vars['formId']; ?>
" name="<?php echo $this->_tpl_vars['formId']; ?>
" enctype="multipart/form-data">
					<fieldset>
						<p>
							<label for="items_per_row">Số sản phẩm hiển thị</label>
							<input type="text" name="products_per_page" value="<?php echo $this->_tpl_vars['products_per_page']; ?>
" />
						</p>
						<p class="hidden-config">
							<label for="related_product_per_page">Số sản phẩm khác hiển thị</label>
							<input type="text" name="related_product_per_page" value="<?php echo $this->_tpl_vars['related_product_per_page']; ?>
" />
						</p>
						<p class ="hidden-config">
							<label for="items_per_row">Số sản phẩm chính hiển thị</label>
							<input type="text" name="products_spmoi_per_page" value="<?php echo $this->_tpl_vars['products_spmoi_per_page']; ?>
" />
						</p>
						<p class="hidden-config">
							<label for="products_spkhuyenmai_per_page">Số sản phẩm khuyến mãi hiển thị</label>
							<input type="text" name="products_spkhuyenmai_per_page" value="<?php echo $this->_tpl_vars['products_spkhuyenmai_per_page']; ?>
" />
						</p>
						<p class="hidden">
							<label for="items_per_row">Số sản phẩm bán chạy hiển thị</label>
							<input type="text" name="products_spbanchay_per_page" value="<?php echo $this->_tpl_vars['products_spbanchay_per_page']; ?>
" />
						</p>
						<p class="hidden">
							<label for="items_per_row">Số sản phẩm menu hiển thị</label>
							<input type="text" name="products_menu_per_page" value="<?php echo $this->_tpl_vars['products_menu_per_page']; ?>
" />
						</p>
						<p class="hidden">
							<label for="items_per_row">Số sản phẩm menu hiển thị trang chủ</label>
							<input type="text" name="products_menu_home_per_page" value="<?php echo $this->_tpl_vars['products_menu_home_per_page']; ?>
" />
						</p>
						<p class="hidden">
							<label for="items_per_row">Số lượng ưu đãi hiển thị</label>
							<input type="text" name="uudai_per_page" value="<?php echo $this->_tpl_vars['uudai_per_page']; ?>
" />
						</p>
						<p class="hidden">
							<label for="items_per_row">Số lượng tin tuyển dụng hiển thị</label>
							<input type="text" name="tuyendung_per_page" value="<?php echo $this->_tpl_vars['tuyendung_per_page']; ?>
" />
						</p>
						<p class ="hidden-config">
							<label for="items_per_row">Số sản phẩm bán chạy hiển thị</label>
							<input type="text" name="products_spgiasocmoingay_per_page" value="<?php echo $this->_tpl_vars['products_spgiasocmoingay_per_page']; ?>
" />
						</p>
						<p class ="hidden-config">
							<label for="items_per_row">Số tin tức trên 1 trang</label>
							<input type="text" name="item_news_per_row" value="<?php echo $this->_tpl_vars['item_news_per_row']; ?>
" />
						</p>
						<p class ="hidden-config">
							<label for="items_per_row">Số tin liên quan</label>
							<input type="text" name="related_news_per_page" value="<?php echo $this->_tpl_vars['related_news_per_page']; ?>
" />
						</p>
						<p class="hidden-config">
							<label for="item_news_index">Số tin tức hiện ở tin mới </label>
							<input type="text" name="item_news_index" value="<?php echo $this->_tpl_vars['item_news_index']; ?>
" />
						</p>
						<p class="hidden-config">
							<label for="mailcontent">Số tin tức hiện ở tin mới</label>
							<input type="text" name="image_row_items" value="<?php echo $this->_tpl_vars['image_row_items']; ?>
" />
						</p>
						<p>
							<label for="mailcontent">Tên công ty.</label>
							<input type="text" name="company_vn" value="<?php echo $this->_tpl_vars['company_vn']; ?>
" />
						</p>
						<p>
							<label for="mailcontent">Tên công ty tiếng anh.</label>
							<input type="text" name="company_en" value="<?php echo $this->_tpl_vars['company_en']; ?>
" />
						</p>
						<p>
							<label for="mailcontent">Thông tin tài khoản.</label>
							<input type="text" name="account" value="<?php echo $this->_tpl_vars['account']; ?>
" />
						</p>
						<p class="hidden-config">
							<label for="item_news_index">Số tin  tức ở cột left </label>
							<input type="text" name="item_news_index" value="<?php echo $this->_tpl_vars['item_news_index']; ?>
" />
						</p>
						<p>
							<label for="items_per_row"><?php echo $this->_tpl_vars['amessages']['admin_mail']; ?>
</label>
							<input type="text" name="admin_mail" value="<?php echo $this->_tpl_vars['admin_mail']; ?>
" />
						</p>
						<p>
							<label for="mailcontent">Số điện  thoại</label>
							<input type="text" name="tel" value="<?php echo $this->_tpl_vars['tel']; ?>
" />
						</p>
						<p>
							<label for="mailcontent">Số điện  thoại Hotline1</label>
							<input type="text" name="hotline1" value="<?php echo $this->_tpl_vars['hotline1']; ?>
" />
						</p>
						<p class ="hidden">
							<label for="mailcontent">Số điện  thoại Hotline2</label>
							<input type="text" name="hotline2" value="<?php echo $this->_tpl_vars['hotline2']; ?>
" />
						</p>
						<p class="hidden">
							<label for="mailcontent">Số điện  thoại Hotline3</label>
							<input type="text" name="hotline3" value="<?php echo $this->_tpl_vars['hotline3']; ?>
" />
						</p>
						<p class="hidden">
							<label for="mailcontent">Số fax</label>
							<input type="text" name="fax" value="<?php echo $this->_tpl_vars['fax']; ?>
" />
						</p>
						<p class="hidden">
							<label for="mailcontent">Mã số thuế</label>
							<input type="text" name="tax" value="<?php echo $this->_tpl_vars['tax']; ?>
" />
						</p>
						<p class="hidden">
							<label for="mailcontent">Địa chỉ tiếng việt</label>
							<input type="text" name="address_vn" value="<?php echo $this->_tpl_vars['address_vn']; ?>
" />
						</p>
						<p class ="hidden">
							<label for="mailcontent">Địa chỉ tiếng Anh</label>
							<input type="text" name="address_en" value="<?php echo $this->_tpl_vars['address_en']; ?>
" />
						</p>
						<p>
							<label for="mailcontent">Facebook</label>
							<input type="text" name="facebook" value="<?php echo $this->_tpl_vars['facebook']; ?>
" />
						</p>
						<p style="display:none">
							<label for="mailcontent">Youtube</label>
							<input type="text" name="youtube" value="<?php echo $this->_tpl_vars['youtube']; ?>
" />
						</p>
						<p style="display:none">
							<label for="mailcontent">Google</label>
							<input type="text" name="google" value="<?php echo $this->_tpl_vars['google']; ?>
" />
						</p>
						<p>
							<label for="mailcontent">Zalo</label>
							<input type="text" name="zingme" value="<?php echo $this->_tpl_vars['zingme']; ?>
" />
						</p>
						<p style="display:none">
							<label for="mailcontent">Twitter</label>
							<input type="text" name="twitter" value="<?php echo $this->_tpl_vars['twitter']; ?>
" />
						</p>
						<!--
						<p>
							<label for="mailcontent">Người đại diện (Vietnamese)</label>
							<input type="text" name="nguoidaidien_vn" value="<?php echo $this->_tpl_vars['nguoidaidien_vn']; ?>
" />
						</p>-->
						<!--<p>
							<label for="mailcontent">Người đại diện (English)</label>
							<input type="text" name="nguoidaidien_en" value="<?php echo $this->_tpl_vars['nguoidaidien_en']; ?>
" />
						</p>-->
						<!--<p>
							<label for="mailcontent">Chức vụ người đại diện (Vietnamese)</label>
							<input type="text" name="chucvu_vn" value="<?php echo $this->_tpl_vars['chucvu_vn']; ?>
" />
						</p>-->
						<!--<p>
							<label for="mailcontent">chức vụ người đại diện (English)</label>
							<input type="text" name="chucvu_en" value="<?php echo $this->_tpl_vars['chucvu_en']; ?>
" />
						</p>-->
						<p>
							<label for="items_per_row">Website</label>
							<input type="text" name="website" value="<?php echo $this->_tpl_vars['website']; ?>
" />
						</p>
						<!--<p>
							<label for="items_per_row">Dòng chữ chạy</label>
							<input type="text" name="marquee" value="<?php echo $this->_tpl_vars['marquee']; ?>
" />
						</p>-->
						<p class="hidden-config">
							<label for="mailcontent">Từ khóa để tìm kiếm website.</label>
							<input type="text" name="keywords" value="<?php echo $this->_tpl_vars['keywords']; ?>
" />
						</p>
						<p>
							<label for="mailcontent">Nội dung mô tả website.</label>
							<input type="text" name="description" value="<?php echo $this->_tpl_vars['description']; ?>
" />
						</p>
						<p>
							<label for="uptime_vn">Thời gian hoạt động tiếng việt</label>
							<input type="text" name="uptime_vn" value="<?php echo $this->_tpl_vars['uptime_vn']; ?>
" />
						</p>
						<p>
							<label for="mailcontent">Thời gian hoạt động tiếng anh</label>
							<input type="text" name="uptime_en" value="<?php echo $this->_tpl_vars['uptime_en']; ?>
" />
						</p>
						<p>
							<label for="youtube">Youtube</label>
							<input type="text" name="youtube" value="<?php echo $this->_tpl_vars['youtube']; ?>
" />
						</p>
						<p>
							<label for="twitter">Twitter</label>
							<input type="text" name="twitter" value="<?php echo $this->_tpl_vars['twitter']; ?>
" />
						</p>
						<p>
							<label for="twitter">Bản đồ</label>
							<input type="text" name="map" value="<?php echo $this->_tpl_vars['map']; ?>
" />
						</p>
						<p>
							<label for="twitter">Số sản phẩm hiển thị của danh mục sản phẩm</label>
							<input type="text" name="products_category_per_page" value="<?php echo $this->_tpl_vars['products_category_per_page']; ?>
" />
						</p>
						<p>
							<label for="twitter">Số tiền (hoặc %) giảm khi đặt trên website</label>
							<input type="text" name="price_promotion" value="<?php echo $this->_tpl_vars['price_promotion']; ?>
" />
						</p>
						<p>
							<label for="twitter">Số tiền để freship hàng</label>
							<input type="text" name="price_free_ship" value="<?php echo $this->_tpl_vars['price_free_ship']; ?>
" />
						</p>
						<p>
							<label for="twitter">Thời gian bắt đầu áp dụng khuyến mãi</label>
							<input type="text" name="promotion_time_start" value="<?php echo $this->_tpl_vars['promotion_time_start']; ?>
" />
						</p>
						<p>
							<label for="twitter">Thời gian kết thúc áp dụng khuyến mãi</label>
							<input type="text" name="promotion_time_end" value="<?php echo $this->_tpl_vars['promotion_time_end']; ?>
" />
						</p>
						<!--<p>
							<label for="mailcontent">Popup Trang chủ</label>
							<span>Nếu bạn chọn chế độ hiện thị thì Popup sẽ được hiện thị lên trang chủ. Ngược lại là tắt popup</span>
							<input name="popup_home" value="1" type="radio" style="width:50px" <?php if ($this->_tpl_vars['popup_home'] == 1): ?> checked="checked" <?php endif; ?>>
							Hiển thị 
							<input name="popup_home" value="0" type="radio" style="width:50px"  <?php if ($this->_tpl_vars['popup_home'] == 0): ?> checked="checked" <?php endif; ?>>
							Ẩn popup
						</p>
						<p>
							<label for="mailcontent">Chế độ Hiện thị giá tổng quát</label>
							<span>Nếu bạn chọn chế độ hiện thị thì tất cả các sản phẩm điều được hiện thị giá</span>
							<input name="sprice_active" value="1" type="radio" style="width:50px" <?php if ($this->_tpl_vars['sprice_active'] == 1): ?> checked="checked" <?php endif; ?>>
							Hiển thị 
							<input name="sprice_active" value="0" type="radio" style="width:50px"  <?php if ($this->_tpl_vars['sprice_active'] == 0): ?> checked="checked" <?php endif; ?>>
							Ẩn giá
						</p>
						<p>
							<label for="mailcontent">Cấu hình hiện thị banner</label>
							<span>Bạn chọn chế độ hiện thị banner một trong các lựa chọn sau</span>
							<input name="banner_active" value="1" type="radio" style="width:50px" <?php if ($this->_tpl_vars['banner_active'] == 1): ?> checked="checked" <?php endif; ?>>
							Flash
							<input name="banner_active" value="2" type="radio" style="width:50px"  <?php if ($this->_tpl_vars['banner_active'] == 2): ?> checked="checked" <?php endif; ?>>
							Images
							<input name="banner_active" value="0" type="radio" style="width:50px"  <?php if ($this->_tpl_vars['banner_active'] == 0): ?> checked="checked" <?php endif; ?>>
							Text
						</p>-->
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
							<input class="luu w90" type="submit" value="<?php echo $this->_tpl_vars['amessages']['send']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['send']; ?>
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