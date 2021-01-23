<?php /* Smarty version 2.6.19, created on 2020-08-02 15:16:37
         compiled from admin/login.temp.html */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['usertemplate'])."/header.temp.html", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div class="login_home">
	<form action="<?php echo $this->_tpl_vars['script']; ?>
" method="post" name="formLogin">
		<b>Đăng nhập</b>
		<?php if ($this->_tpl_vars['error']): ?><p class="error" style="color: red; margin-top: 10px;">Sai tên người dùng hoặc mật khẩu !!!</p><?php endif; ?>
		<p>
			<span><?php echo $this->_tpl_vars['amessages']['username']; ?>
</span>
			<input type="text" value="" name="username" id="username" />
		</p>
		<p>
			<span><?php echo $this->_tpl_vars['amessages']['password']; ?>
</span>
			<input type="password" value="" name="password" id="password" />
		</p>
		<input type="submit" value="<?php echo $this->_tpl_vars['amessages']['submit']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['submit']; ?>
" name="btnSubmit" />
		<input class="re" type="reset" value="<?php echo $this->_tpl_vars['amessages']['reset']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['reset']; ?>
" name="btnReset" />
		<input type="hidden" value="login" name="op" />
		<input type="hidden" value="admin" name="site" />
	</form>
</div>