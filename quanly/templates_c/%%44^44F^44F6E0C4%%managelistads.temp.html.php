<?php /* Smarty version 2.6.19, created on 2020-08-02 03:13:47
         compiled from admin/managelistads.temp.html */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'number_format', 'admin/managelistads.temp.html', 105, false),)), $this); ?>
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
	<?php $this->assign('formId', 'listAds'); ?>
	<?php $this->assign('rightPanel', 'hidden'); ?>
	<div id="contextual" class="<?php echo $this->_tpl_vars['rightPanel']; ?>
">
		<div class="levBtn">
			<p><a href="#"><img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/btn_arrow_02.gif" alt="" width="18" height="19" /></a></p>
		</div>
		<div class="contextType">
			<form action="<?php echo $this->_tpl_vars['script']; ?>
" method="post" name="form2">
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
							option selected="selected" value="">------------</option>
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
</a> &raquo; <?php echo $this->_tpl_vars['amessages']['control_panel']; ?>
</h2>
			<ul id="tablist">
				<li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=add&amp;gId=<?php if (isset ( $this->_tpl_vars['gId'] )): ?><?php echo $this->_tpl_vars['gId']; ?>
<?php endif; ?>" title="<?php echo $this->_tpl_vars['amessages']['add_ads']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_ads']; ?>
</a> </li>
				<li class="current"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=ads&act=list" title="<?php echo $this->_tpl_vars['amessages']['list_ads']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_ads']; ?>
</a> </li>
				<li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&part=ads&act=list&plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
"><?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
</a> </li>
			</ul>
			<div class="searchType">
				<form action="<?php echo $this->_tpl_vars['script']; ?>
" method="post" name="searchMenu" id="searchMenu">
					<p>
						<span><?php echo $this->_tpl_vars['amessages']['keyword']; ?>
</span>
						<input type="text" value="<?php if (isset ( $this->_tpl_vars['searchTerms'] )): ?><?php echo $this->_tpl_vars['searchTerms']; ?>
<?php endif; ?>" name="searchTerms" />
					</p>
					<p>
						<span><?php echo $this->_tpl_vars['amessages']['status']; ?>
</span>
						<select name="searchStatus">
							<?php echo $this->_tpl_vars['listStatus']; ?>

						</select>
					</p>
					<p>
						<input type="hidden" name="op" value="<?php echo $this->_tpl_vars['op']; ?>
" />
						<input type="hidden" name="part" value="<?php echo $this->_tpl_vars['part']; ?>
" />
						<input type="hidden" name="act" value="<?php echo $this->_tpl_vars['act']; ?>
" />
						<input type="submit" value="<?php echo $this->_tpl_vars['amessages']['display']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['display']; ?>
" name="btnDisplay" class="btnDisplay" />
					</p>
				</form>
			</div>
			<?php if ($this->_tpl_vars['infoText']): ?>
			<div class="<?php echo $this->_tpl_vars['infoClass']; ?>
">
				<h4>Result:</h4>
				<p><?php echo $this->_tpl_vars['infoText']; ?>
</p>
			</div>
			<?php endif; ?>
			<form id="<?php echo $this->_tpl_vars['formId']; ?>
" name="<?php echo $this->_tpl_vars['formId']; ?>
" action="<?php echo $this->_tpl_vars['script']; ?>
" method="post">
				<div class="tableContent">
					<table width="100%" border="1" cellspacing="1" cellpadding="5">
						<thead>
							<tr>
								<th class="first_bx"><input class="box3" type="checkbox" name="all" id="all" value="1" onclick="toggleAllChecks('<?php echo $this->_tpl_vars['formId']; ?>
');" /></th>
								<th class="first_no"><?php echo $this->_tpl_vars['amessages']['no']; ?>
</th>
								<th class="first_id">
									<a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&amp;searchTerms=<?php echo $this->_tpl_vars['searchTerms']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
&amp;searchGroupAds=<?php echo $this->_tpl_vars['searchGroupAds']; ?>
&amp;orderBy=id&amp;orderDir=<?php if ($this->_tpl_vars['orderBy'] == 'id' && $this->_tpl_vars['orderDir'] == 'ASC'): ?>DESC<?php else: ?>ASC<?php endif; ?>" title="<?php echo $this->_tpl_vars['amessages']['click_here_to_sort_by']; ?>
 <?php echo $this->_tpl_vars['amessages']['id']; ?>
"><?php echo $this->_tpl_vars['amessages']['id']; ?>
<?php if ($this->_tpl_vars['orderBy'] == 'id'): ?>&nbsp;<img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/ico_<?php if ($this->_tpl_vars['orderDir'] == 'DESC'): ?>down<?php else: ?>up<?php endif; ?>.gif" alt="" width="12" height="12" /><?php endif; ?></a>
								</th>
								<th>
									<a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&amp;searchTerms=<?php echo $this->_tpl_vars['searchTerms']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
&amp;searchGroupAds=<?php echo $this->_tpl_vars['searchGroupAds']; ?>
&amp;orderBy=gid&amp;orderDir=<?php if ($this->_tpl_vars['orderBy'] == 'gid' && $this->_tpl_vars['orderDir'] == 'ASC'): ?>DESC<?php else: ?>ASC<?php endif; ?>" title="<?php echo $this->_tpl_vars['amessages']['click_here_to_sort_by']; ?>
 <?php echo $this->_tpl_vars['amessages']['group_ads']; ?>
"><?php echo $this->_tpl_vars['amessages']['group_ads']; ?>
<?php if ($this->_tpl_vars['orderBy'] == 'gid'): ?>&nbsp;<img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/ico_<?php if ($this->_tpl_vars['orderDir'] == 'DESC'): ?>down<?php else: ?>up<?php endif; ?>.gif" alt="" width="12" height="12" /><?php endif; ?></a>
								</th>
								<th class="first_at"><?php echo $this->_tpl_vars['amessages']['img']; ?>
</th>
								<th class="first_tt">
									<a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&amp;searchTerms=<?php echo $this->_tpl_vars['searchTerms']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
&amp;searchGroupAds=<?php echo $this->_tpl_vars['searchGroupAds']; ?>
&amp;orderBy=status&amp;orderDir=<?php if ($this->_tpl_vars['orderBy'] == 'status' && $this->_tpl_vars['orderDir'] == 'ASC'): ?>DESC<?php else: ?>ASC<?php endif; ?>" title="<?php echo $this->_tpl_vars['amessages']['click_here_to_sort_by']; ?>
 <?php echo $this->_tpl_vars['amessages']['status']; ?>
"><?php echo $this->_tpl_vars['amessages']['status']; ?>
<?php if ($this->_tpl_vars['orderBy'] == 'status'): ?>&nbsp;<img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/ico_<?php if ($this->_tpl_vars['orderDir'] == 'DESC'): ?>down<?php else: ?>up<?php endif; ?>.gif" alt="" width="12" height="12" /><?php endif; ?></a>
								</th>
								<th class="first_vt">
									<a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&amp;searchTerms=<?php echo $this->_tpl_vars['searchTerms']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
&amp;searchGroupAds=<?php echo $this->_tpl_vars['searchGroupAds']; ?>
&amp;orderBy=position&amp;orderDir=<?php if ($this->_tpl_vars['orderBy'] == 'position' && $this->_tpl_vars['orderDir'] == 'ASC'): ?>DESC<?php else: ?>ASC<?php endif; ?>" title="<?php echo $this->_tpl_vars['amessages']['click_here_to_sort_by']; ?>
 <?php echo $this->_tpl_vars['amessages']['position']; ?>
"><?php echo $this->_tpl_vars['amessages']['position']; ?>
<?php if ($this->_tpl_vars['orderBy'] == 'position'): ?>&nbsp;<img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/ico_<?php if ($this->_tpl_vars['orderDir'] == 'DESC'): ?>down<?php else: ?>up<?php endif; ?>.gif" alt="" width="12" height="12" /><?php endif; ?></a>
								</th>
								<th class="first_hd"><?php echo $this->_tpl_vars['amessages']['actions']; ?>
</th>
							</tr>
						</thead>
						<tbody>
							<?php if ($this->_tpl_vars['listObjects']): ?>
							<?php $this->assign('i', $this->_tpl_vars['start']); ?>
							<?php $_from = $this->_tpl_vars['listObjects']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['object']):
?>
							<?php $this->assign('i', $this->_tpl_vars['i']+1); ?>
							<tr<?php if ($this->_tpl_vars['i']%2 == 0): ?> class="bgType"<?php endif; ?>>
								<td class="first_bx"><input class="box3" type="checkbox" name="oIds[]" id="oIds" value="<?php echo $this->_tpl_vars['object']->getId(); ?>
" /></td>
								<td class="first_no"><p><?php echo ((is_array($_tmp=$this->_tpl_vars['i'])) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
</p></td>
								<td class="first_id"><p><?php echo $this->_tpl_vars['object']->getId(); ?>
</p></td>
								<td><?php echo $this->_tpl_vars['groupads']->getParentName($this->_tpl_vars['object']->getGroup()); ?>
</td>
								<td class="first_at">
									<?php if ($this->_tpl_vars['object']->isFlash()): ?>
									<img src="<?php echo $this->_tpl_vars['ROOTPATH']; ?>
/admincp/templates/admin/images/swf.gif" border="0" />
									<?php else: ?>
									<?php if ($this->_tpl_vars['object']->isVideo()): ?>
									<img src="<?php echo $this->_tpl_vars['ROOTPATH']; ?>
/admincp/templates/admin/images/icon_video.jpg" border="0" />
									<?php else: ?>
									<img src="<?php echo $this->_tpl_vars['ROOTPATH']; ?>
/gallery/avatar_upload/ads/avatar/<?php echo $this->_tpl_vars['object']->getLogoUrl(); ?>
" border="0" />
									<?php endif; ?><?php endif; ?>
									<?php if ($this->_tpl_vars['groupads']->getParentName($this->_tpl_vars['object']->getGroup()) == 'Music'): ?>
									<img src="templates/admin/images/music.gif" border="0" />
									<?php endif; ?>
								</td>
								<td class="first_tt"><p><?php if ($this->_tpl_vars['object']->isDeleted()): ?><span style="color: #FF0000"><?php echo $this->_tpl_vars['object']->getStatusText(); ?>
</span><?php else: ?><?php echo $this->_tpl_vars['object']->getStatusText(); ?>
<?php endif; ?></p></td>
								<td class="first_vt">
									<input class="btmSL" type="text" name="position_<?php echo $this->_tpl_vars['object']->getId(); ?>
" id="position_<?php echo $this->_tpl_vars['object']->getId(); ?>
" value="<?php echo $this->_tpl_vars['object']->getPosition(); ?>
" />
									<input class="btnOK" type="button" name="update" value="OK" onClick="javascript:changePosition('<?php echo $this->_tpl_vars['formId']; ?>
','<?php echo $this->_tpl_vars['object']->getId(); ?>
');" />
								</td>
								<td class="first_hd">
									<!--<a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&amp;searchTerms=<?php echo $this->_tpl_vars['searchTerms']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
&amp;searchGroupAds=<?php echo $this->_tpl_vars['searchGroupAds']; ?>
&amp;orderBy=<?php echo $this->_tpl_vars['orderBy']; ?>
&amp;orderDir=<?php echo $this->_tpl_vars['orderDir']; ?>
&amp;plus=down&amp;oId=<?php echo $this->_tpl_vars['object']->getId(); ?>
&amp;position=<?php echo $this->_tpl_vars['object']->getPosition(); ?>
&amp;page=<?php echo $this->_tpl_vars['page']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['down']; ?>
"><img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/ico_down.gif" alt="<?php echo $this->_tpl_vars['amessages']['down']; ?>
" width="16" height="16" /></a>
									<a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&amp;searchTerms=<?php echo $this->_tpl_vars['searchTerms']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
&amp;searchGroupAds=<?php echo $this->_tpl_vars['searchGroupAds']; ?>
&amp;orderBy=<?php echo $this->_tpl_vars['orderBy']; ?>
&amp;orderDir=<?php echo $this->_tpl_vars['orderDir']; ?>
&amp;plus=up&amp;oId=<?php echo $this->_tpl_vars['object']->getId(); ?>
&amp;position=<?php echo $this->_tpl_vars['object']->getPosition(); ?>
&amp;page=<?php echo $this->_tpl_vars['page']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['up']; ?>
"><img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/ico_up.gif" alt="<?php echo $this->_tpl_vars['amessages']['up']; ?>
" width="16" height="16" /></a>
									-->
									<a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=edit&amp;searchTerms=<?php echo $this->_tpl_vars['searchTerms']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['object']->getStatus(); ?>
&amp;searchGroupAds=<?php echo $this->_tpl_vars['object']->getGroup(); ?>
&amp;orderBy=<?php echo $this->_tpl_vars['orderBy']; ?>
&amp;orderDir=<?php echo $this->_tpl_vars['orderDir']; ?>
&amp;oId=<?php echo $this->_tpl_vars['object']->getId(); ?>
" title="<?php echo $this->_tpl_vars['amessages']['edit']; ?>
">
										<i class="fa fa-wrench" aria-hidden="true"></i>
									</a>
									<?php if ($this->_tpl_vars['object']->isEnabled()): ?>
									<a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&amp;searchTerms=<?php echo $this->_tpl_vars['searchTerms']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
&amp;searchGroupAds=<?php echo $this->_tpl_vars['searchGroupAds']; ?>
&amp;orderBy=<?php echo $this->_tpl_vars['orderBy']; ?>
&amp;orderDir=<?php echo $this->_tpl_vars['orderDir']; ?>
&amp;plus=disableItem&amp;oId=<?php echo $this->_tpl_vars['object']->getId(); ?>
&amp;page=<?php echo $this->_tpl_vars['page']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['disable']; ?>
">
										<i class="fa fa-minus" aria-hidden="true"></i>
									</a>
									<?php else: ?>
									<a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&amp;searchTerms=<?php echo $this->_tpl_vars['searchTerms']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
&amp;searchGroupAds=<?php echo $this->_tpl_vars['searchGroupAds']; ?>
&amp;orderBy=<?php echo $this->_tpl_vars['orderBy']; ?>
&amp;orderDir=<?php echo $this->_tpl_vars['orderDir']; ?>
&amp;plus=activateItem&amp;oId=<?php echo $this->_tpl_vars['object']->getId(); ?>
&amp;page=<?php echo $this->_tpl_vars['page']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['activate']; ?>
">
										<i class="fa fa-check" aria-hidden="true"></i>
									</a>
									<?php endif; ?>
									<a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&amp;searchTerms=<?php echo $this->_tpl_vars['searchTerms']; ?>
&amp;searchStatus=<?php echo $this->_tpl_vars['searchStatus']; ?>
&amp;searchGroupAds=<?php echo $this->_tpl_vars['searchGroupAds']; ?>
&amp;orderBy=<?php echo $this->_tpl_vars['orderBy']; ?>
&amp;orderDir=<?php echo $this->_tpl_vars['orderDir']; ?>
&amp;plus=deleteItem&amp;oId=<?php echo $this->_tpl_vars['object']->getId(); ?>
&amp;page=<?php echo $this->_tpl_vars['page']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['delete']; ?>
">
										<i class="fa fa-trash" aria-hidden="true"></i>
									</a>
								</td>
							</tr>
							<?php endforeach; endif; unset($_from); ?>
							<?php endif; ?>
						</tbody>
					</table>
					<div class="paging">
						<ul>
							<li class="first">Trang</li>
								<?php echo $this->_tpl_vars['adminPager']; ?>

							<li class="first"><?php echo $this->_tpl_vars['amessages']['total']; ?>
 <?php echo ((is_array($_tmp=$this->_tpl_vars['rows'])) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
 Tin / <?php echo ((is_array($_tmp=$this->_tpl_vars['pages'])) ? $this->_run_mod_handler('number_format', true, $_tmp) : number_format($_tmp)); ?>
 Trang</li>
						</ul>
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
							<input type="hidden" name="searchGroupAds" value="<?php echo $this->_tpl_vars['searchGroupAds']; ?>
"/>
							<input type="hidden" name="orderBy" value="<?php echo $this->_tpl_vars['orderBy']; ?>
"/>
							<input type="hidden" name="orderDir" value="<?php echo $this->_tpl_vars['orderDir']; ?>
"/>
							<input type="hidden" name="page" value="<?php echo $this->_tpl_vars['page']; ?>
"/>
							<input type="hidden" name="oId" value=""/>
							<input type="hidden" name="position" value=""/>
							<input type="hidden" name="plus" id="plus" value=""/>
							<span><input class="active" type="submit" value="<?php echo $this->_tpl_vars['amessages']['activate']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['activate']; ?>
" name="btnActivate" onClick="javascript:actionSubmit('<?php echo $this->_tpl_vars['formId']; ?>
','activateItems');" /></span>
							<span><input class="vohieu" type="submit" value="<?php echo $this->_tpl_vars['amessages']['disable']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['disable']; ?>
" name="btnDisable" onClick="javascript:actionSubmit('<?php echo $this->_tpl_vars['formId']; ?>
','disableItems');" /></span>
							<span><input class="xoa" type="submit" value="<?php echo $this->_tpl_vars['amessages']['delete']; ?>
" title="<?php echo $this->_tpl_vars['amessages']['delete']; ?>
" name="btnDelete" onClick="javascript:actionSubmit('<?php echo $this->_tpl_vars['formId']; ?>
','deleteItems');" /></span>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['usertemplate'])."/footer.temp.html", 'smarty_include_vars' => array('title' => 'footer')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>