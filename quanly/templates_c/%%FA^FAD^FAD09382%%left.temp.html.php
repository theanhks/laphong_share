<?php /* Smarty version 2.6.19, created on 2020-08-13 05:23:05
         compiled from admin/left.temp.html */ ?>
<header role="banner">
    <button type="button" class="drawer-toggle drawer-hamburger">
        <span class="sr-only">toggle navigation</span>
        <span class="drawer-hamburger-icon"></span>
    </button>
    <nav class="drawer-nav" role="navigation">
        <div class="productMenu">
            <ul class="cap1">
                <li class="level1<?php if ($this->_tpl_vars['op'] == 'manage'): ?> open<?php endif; ?>">
                    <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['manage']; ?>
"><i class="fa fa-check" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['manage']; ?>
</a>
                    <ul class="cap2">
                        <?php if ($this->_tpl_vars['authUser']->isFounder()): ?>
                        <li class="level2<?php if ($this->_tpl_vars['part'] == 'staticPage'): ?> open<?php endif; ?>">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['static_page']; ?>
" class="submenu"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['static_page']; ?>
</a>
                            <ul class="cap3">
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'staticPage' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=staticPage&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_static_page']; ?>
"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['add_static_page']; ?>
</a>
                                </li>
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'staticPage' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=staticPage&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_static_page']; ?>
"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['list_static_page']; ?>
</a>
                                </li>
                            </ul>
                        </li>
                        <!--menu-->
                        <!--<li class="level2"><a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['menu']; ?>
" class="submenu"><?php echo $this->_tpl_vars['amessages']['menu']; ?>
</a>
                        <ul>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'menu' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=menu&amp;act=addGroup" title="<?php echo $this->_tpl_vars['amessages']['add_group_menu']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_group_menu']; ?>
</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'menu' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=menu&amp;act=listGroup" title="<?php echo $this->_tpl_vars['amessages']['list_group_menu']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_group_menu']; ?>
</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'menu' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=menu&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_menu']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_menu']; ?>
</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'menu' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=menu&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_menu']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_menu']; ?>
</a></li>
                        <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=menu&amp;act=list&amp;plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
"><?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
</a></li>
                        </ul>
                        </li>-->
                        <!--end menu-->
                        <!-- quản ly banner-->
                        <li class="level2<?php if ($this->_tpl_vars['part'] == 'category'): ?> open<?php endif; ?>">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['category']; ?>
" class="submenu"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['category']; ?>
</a>
                            <ul class="cap3">
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'category' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=category&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_category']; ?>
"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['add_category']; ?>
</a>
                                </li>
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'category' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=category&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_category']; ?>
"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['list_category']; ?>
</a>
                                </li>
                            </ul>
                        </li>
                        <li class="level2<?php if ($this->_tpl_vars['part'] == 'entry'): ?> open<?php endif; ?>">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['entry']; ?>
" class="submenu"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['entry']; ?>
</a>
                            <ul class="cap3">
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'entry' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=entry&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_entry']; ?>
"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['add_entry']; ?>
</a>
                                </li>
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'entry' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=entry&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_entry']; ?>
"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['list_entry']; ?>
</a>
                                </li>
                            </ul>
                        </li>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['authUser']->isFounder() || $this->_tpl_vars['authUser']->isStaff()): ?>
                        <li class="level2<?php if ($this->_tpl_vars['part'] == 'productcategory'): ?> open<?php endif; ?>">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['productcategory']; ?>
" class="submenu"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['productcategory']; ?>
</a>
                            <ul class="cap3">
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'productcategory' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=productcategory&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_productcategory']; ?>
"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['add_productcategory']; ?>
</a>
                                </li>
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'productcategory' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=productcategory&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_productcategory']; ?>
"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['list_productcategory']; ?>
</a>
                                </li>
                            </ul>
                        </li>
                        <li class="level2<?php if ($this->_tpl_vars['part'] == 'product'): ?> open<?php endif; ?>">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['product']; ?>
" class="submenu"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['product']; ?>
</a>
                            <ul class="cap3">
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'product' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=product&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_product']; ?>
"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['add_product']; ?>
</a>
                                </li>
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'product' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=product&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_product']; ?>
"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['list_product']; ?>
</a>
                                </li>
                            </ul>
                        </li>
                        <li class="level2<?php if ($this->_tpl_vars['part'] == 'ads' || $this->_tpl_vars['part'] == 'ads_home'): ?> open<?php endif; ?>">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['ads']; ?>
" class="submenu"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['ads']; ?>
</a>
                            <ul class="cap3">
                                <!--<li><a<?php if ($this->_tpl_vars['part'] == 'ads' && $this->_tpl_vars['act'] == 'addGroup'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=addGroup" title="<?php echo $this->_tpl_vars['amessages']['add_ads_group']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_ads_group']; ?>
</a></li>
                                <li><a<?php if ($this->_tpl_vars['part'] == 'ads' && $this->_tpl_vars['act'] == 'listGroup'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=listGroup" title="<?php echo $this->_tpl_vars['amessages']['list_ads_group']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_ads_group']; ?>
</a></li>
                                <li><a<?php if ($this->_tpl_vars['part'] == 'ads_home' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads_home&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_ads']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_ads_home']; ?>
</a></li>
                                <li><a<?php if ($this->_tpl_vars['part'] == 'ads_home' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads_home&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_ads']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_ads_home']; ?>
</a></li>-->
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'ads' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_ads']; ?>
"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['add_ads']; ?>
</a>
                                </li>
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'ads' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_ads']; ?>
"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['list_ads']; ?>
</a>
                                </li>
                            </ul>
                        </li>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['authUser']->isFounder()): ?>
                        <li style="display:none" class="level2<?php if ($this->_tpl_vars['part'] == 'tamgia'): ?> open<?php endif; ?>">
                            <a href="javascript:void(0);" title="Tầm giá" class="submenu"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;Tầm giá</a>
                            <ul>
                                <li><a<?php if ($this->_tpl_vars['part'] == 'tamgia' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=tamgia&amp;act=add" title="Thêm">Thêm</a></li>
                                <li><a<?php if ($this->_tpl_vars['part'] == 'tamgia' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=tamgia&amp;act=list" title="Danh sách">Danh sách</a></li>
                            </ul>
                        </li>
                        <!--end product-->
                        <!--ORDER-->
                        <li class="level2<?php if ($this->_tpl_vars['part'] == 'order'): ?> open<?php endif; ?>" style="">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['order']; ?>
" class="submenu"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;Quản lý đặt hàng</a>
                            <ul class="cap3">
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'order' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=order&amp;act=list" title="Danh sách đặt hàng"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;&nbsp;Danh sách đặt hàng</a>
                                </li>
                            </ul>
                        </li>
                        <!--ORDER-->
                        <!--Dat ban-->
                        <li class="level2<?php if ($this->_tpl_vars['part'] == 'book'): ?> open<?php endif; ?>" style="">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['book']; ?>
" class="submenu"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;Quản lý đặt bàn</a>
                            <ul class="cap3">
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'book' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=book&amp;act=list" title="Danh sách đặt bàn"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;&nbsp;Danh sách đặt bàn</a>
                                </li>
                                <li>
                                    <a<?php if ($this->_tpl_vars['part'] == 'book' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=book&amp;act=add" title="Thêm mới đặt bàn"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbsp;Thêm mới đặt bàn</a>
                                </li>
                            </ul>
                        </li>
                        <!--Dat ban-->
                        <li class="hidden level2<?php if ($this->_tpl_vars['part'] == 'gallery'): ?> open<?php endif; ?>" style="display: none;">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['gallery']; ?>
" class="submenu">Bảng giá</a>
                            <ul>
                                <li style="display:none"><a<?php if ($this->_tpl_vars['part'] == 'gallery' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=gallery&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_album']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_album']; ?>
</a></li>
                                <li style="display:none"><a<?php if ($this->_tpl_vars['part'] == 'gallery' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=gallery&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_album']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_album']; ?>
</a></li>
                                <li style="display:none"><a<?php if ($this->_tpl_vars['part'] == 'gallery' && $this->_tpl_vars['act'] == 'upload'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=gallery&amp;act=upload" title="Thêm file download">Thêm tập tin</a></li>
                                <li><a<?php if ($this->_tpl_vars['part'] == 'resource' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=resource&amp;act=list" title="Danh sách file download">Danh sách Bảng giá</a></li>
                            </ul>
                        </li>
                        <!--<li class="level2<?php if ($this->_tpl_vars['part'] == 'questions'): ?> open<?php endif; ?>"><a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['questions']; ?>
" class="submenu"><?php echo $this->_tpl_vars['amessages']['questions']; ?>
</a>
                        <ul>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'subject' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=subject&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_subject']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_subject']; ?>
</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'subject' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=subject&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_subject']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_subject']; ?>
</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'questions' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=questions&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_questions']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_questions']; ?>
</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'questions' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=questions&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_questions']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_questions']; ?>
</a></li>
                        <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=questions&amp;act=list&amp;plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
"><?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
</a></li>
                        </ul>
                        </li>-->
                        <!--<li class="level2<?php if ($this->_tpl_vars['part'] == 'ads'): ?> open<?php endif; ?>"><a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['ads']; ?>
" class="submenu">Quản lý hình ảnh</a>
                        <ul>
                        <li><a <?php if ($this->_tpl_vars['part'] == 'ads' && $this->_tpl_vars['act'] == 'list' && $this->_tpl_vars['gid'] == '2'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&gid=2" title="Quản lý Popup">Quản lý Popup</a></li>
                        <li><a <?php if ($this->_tpl_vars['part'] == 'ads' && $this->_tpl_vars['act'] == 'list' && $this->_tpl_vars['gid'] == '3'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&gid=3" title="Quản lý Backgroud">Quản lý Backgroud</a></li>
                        <li><a <?php if ($this->_tpl_vars['part'] == 'ads' && $this->_tpl_vars['act'] == 'list' && gid == '1'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=ads&amp;act=list&gid=1" title="Quản lý Logo">Quản lý Logo</a></li>
                        </ul>
                        </li>-->
                        <li class="level2<?php if ($this->_tpl_vars['part'] == 'member'): ?> open<?php endif; ?>">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['member']; ?>
" class="submenu"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['member']; ?>
</a>
                            <ul class="cap3">
                            <li>
                                <a<?php if ($this->_tpl_vars['part'] == 'member' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=member&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_member']; ?>
"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['add_member']; ?>
</a>
                            </li>
                            <li>
                                <a<?php if ($this->_tpl_vars['part'] == 'member' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=member&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_member']; ?>
"><i class="fa fa-list-alt" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['list_member']; ?>
</a>
                            </li>
                            </ul>
                        </li>
                        <!--<li class="level2<?php if ($this->_tpl_vars['part'] == 'banner'): ?> open<?php endif; ?>"><a href="javascript:void(0);" title="Quản lý Banner" class="submenu">Tuyển dụng</a>
                        <ul>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'textbanner' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=textbanner&amp;act=add" title="Thêm vị trí tuyển dụng">Thêm vị trí tuyển dụng</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'textbanner' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=textbanner&amp;act=list" title="Danh sách vị trí tuyển dụng ">Danh sách vị trí tuyển dụng</a></li>
                        </ul>
                        </li>-->
                        <!--khach hang-->
                        <!--<li class="level2<?php if ($this->_tpl_vars['part'] == 'banner'): ?> open<?php endif; ?>"><a href="javascript:void(0);" title="Bảng báo giá" class="submenu">Đối tác</a>
                        <ul>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'imgbanner' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=imgbanner&amp;act=add" title="Thêm khách hàng ">Thêm đối tác</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'imgbanner' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=imgbanner&amp;act=list" title="Danh sách khách hàng">Danh sách đối tác</a></li>
                        </ul>
                        </li>-->
                        <!--album product-->
                        <!--<li class="level2<?php if ($this->_tpl_vars['part'] == 'albumproduct'): ?> open<?php endif; ?>"><a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['productcategory']; ?>
" class="submenu"><?php echo $this->_tpl_vars['amessages']['albumproduct']; ?>
</a>
                        <ul>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'albumproduct' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=albumproduct&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_albumproduct']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_albumproduct']; ?>
</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'albumproduct' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=albumproduct&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_albumproduct']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_albumproduct']; ?>
</a></li>
                        <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=albumproduct&amp;act=list&amp;plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
"><?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
</a></li>
                        </ul>
                        </li>-->
                        <!--end album product-->
                        <!--images product-->
                        <li style="display:none"  class="level2<?php if ($this->_tpl_vars['part'] == 'imgproduct'): ?> open<?php endif; ?>">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['imgproduct']; ?>
" class="submenu"><?php echo $this->_tpl_vars['amessages']['imgproduct']; ?>
</a>
                            <ul>
                                <li><a<?php if ($this->_tpl_vars['part'] == 'imgproduct' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=imgproduct&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_imgproduct']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_imgproduct']; ?>
</a></li>
                                <li><a<?php if ($this->_tpl_vars['part'] == 'imgproduct' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=imgproduct&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_imgproduct']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_imgproduct']; ?>
</a></li>
                                <li><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=imgproduct&amp;act=list&amp;plus=cleanTrash" title="<?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
"><?php echo $this->_tpl_vars['amessages']['clean_trash']; ?>
</a></li>
                            </ul>
                        </li>
                        <!--end album product-->
                        <li class="hidden level2<?php if ($this->_tpl_vars['part'] == 'support'): ?> open<?php endif; ?>" style="display: none;">
                            <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['support']; ?>
" class="submenu"><?php echo $this->_tpl_vars['amessages']['support']; ?>
 trực tuyến</a>
                            <ul>
                                <!--<li><a<?php if ($this->_tpl_vars['part'] == 'group_support' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=group_support&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_group_support']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_group_support']; ?>
</a></li>
                                <li><a<?php if ($this->_tpl_vars['part'] == 'group_support' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=group_support&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_group_support']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_group_support']; ?>
</a></li> -->
                                <li><a<?php if ($this->_tpl_vars['part'] == 'support' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=support&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_support']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_support']; ?>
</a></li>
                                <li><a<?php if ($this->_tpl_vars['part'] == 'support' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=support&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_support']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_support']; ?>
</a></li>
                            </ul>
                        </li>
                        <!-- END SUPPORT -->
                        <!--<li class="level2<?php if ($this->_tpl_vars['part'] == 'weblinks'): ?> open<?php endif; ?>"><a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['weblinks']; ?>
" class="submenu"><?php echo $this->_tpl_vars['amessages']['weblinks']; ?>
</a>
                        <ul>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'weblinks' && $this->_tpl_vars['act'] == 'add'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=weblinks&amp;act=add" title="<?php echo $this->_tpl_vars['amessages']['add_weblinks']; ?>
"><?php echo $this->_tpl_vars['amessages']['add_weblinks']; ?>
</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'weblinks' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=weblinks&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_weblinks']; ?>
"><?php echo $this->_tpl_vars['amessages']['list_weblinks']; ?>
</a></li>
                        </ul>
                        </li>-->
                        <!--quan ly email-->
                        <!--<li class="level2<?php if ($this->_tpl_vars['part'] == 'customers'): ?> open<?php endif; ?>"><a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['customers']; ?>
" class="submenu">Quản lý email</a>
                        <ul>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'email' && $this->_tpl_vars['act'] == 'send'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=email&amp;act=send" title="<?php echo $this->_tpl_vars['amessages']['send_email']; ?>
"><?php echo $this->_tpl_vars['amessages']['send_email']; ?>
</a></a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'customer' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=customer&amp;act=list" title="Danh sách email">Danh sách email</a></li>
                        <li><a<?php if ($this->_tpl_vars['part'] == 'mail' && $this->_tpl_vars['act'] == 'list'): ?> class="current3"<?php endif; ?> href="<?php echo $this->_tpl_vars['script']; ?>
?op=manage&amp;part=mail&amp;act=list" title="Email templates">Email templates</a></li>
                        </ul>
                        </li>-->
                        <!--end quan ly email-->
                        <?php endif; ?>
                    </ul>
                </li>
                <li class="level1">
                    <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['system']; ?>
"><i class="fa fa-sun-o" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['system']; ?>
</a>
                    <ul class="cap2">
                        <li class="level2<?php if ($this->_tpl_vars['part'] == 'password'): ?> open<?php endif; ?>">
                            <a href="<?php echo $this->_tpl_vars['script']; ?>
?op=system&amp;part=password&amp;act=change" title="<?php echo $this->_tpl_vars['amessages']['change_password']; ?>
"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['change_password']; ?>
</a>
                        </li>
                    </ul>
                </li>
                <?php if ($this->_tpl_vars['authUser']->isFounder()): ?>
                <li class=" level1<?php if ($this->_tpl_vars['op'] == 'admin'): ?> open<?php endif; ?>">
                    <a href="javascript:void(0);" title="<?php echo $this->_tpl_vars['amessages']['administration']; ?>
"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['administration']; ?>
</a>
                    <ul class="cap2">
                        <li class="hidden level2"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=admin&amp;part=user&amp;act=list" title="<?php echo $this->_tpl_vars['amessages']['list_user']; ?>
"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['list_user']; ?>
</a></li>
                        <li class="level2"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=admin&amp;part=generalConfig&amp;act=update" title="<?php echo $this->_tpl_vars['amessages']['general_config']; ?>
"><i class="fa fa-caret-right" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['general_config']; ?>
</a></li>
                    </ul>
                </li>
                <?php endif; ?>
                <li class="level1"><a href="<?php echo $this->_tpl_vars['script']; ?>
?op=logout" title="<?php echo $this->_tpl_vars['amessages']['logout']; ?>
"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $this->_tpl_vars['amessages']['logout']; ?>
</a></li>
            </ul>
        </div>
    </nav>
</header>
<main role="main">
    <div class="header_admin">
        <div class="logo"><img src="templates/<?php echo $this->_tpl_vars['usertemplate']; ?>
/images/logo.png" alt="" /></div>
        <div class="add_header">
            <h5>Công ty tnhh tin học <font style="color: #f6a71b;">AN</font> <font style="color: #6bbe46;">VẠN</font> <font style="color: #289cd7;">AN</font></h5>
            <p><span><i class="fa fa-map-marker" aria-hidden="true"></i></span> 115 Đường số 2, Cư xá Đài Ra Đa Phú Lâm, Phường 13, Quận 6, TP.HCM - <span><i class="fa fa-phone-square" aria-hidden="true"></i></span> (028) 62 81 82 83 - (028) 62 911 911 - <span><i class="fa fa-mobile" aria-hidden="true"></i></span> 0773 911 911 - <span><i class="fa fa-envelope" aria-hidden="true"></i></span> ava@ava.vn - <span><i class="fa fa-globe" aria-hidden="true"></i></span> www.ava.vn - www.thietkewebsite.net.vn</p>
        </div>
        <div class="admin_user" style="width: 47px; height: 47px; float: right; margin: 10px 15px 0 0; border:1px solid #ddd; border-radius: 5px; background: white;">
            <i style="width: 100%; float: left; display: block; text-align: center; font-size: 28px; color: green;" class="fa fa-user" aria-hidden="true"></i>
            <p style="width: 100%; float: left; display: block; text-align: center; overflow: hidden; text-transform: uppercase; font-size: 12px; margin-top:2px;"><?php if ($this->_tpl_vars['authUser']): ?><?php echo $this->_tpl_vars['authUser']->getUserName(); ?>
<?php else: ?>Guest<?php endif; ?></p>
        </div>
    </div>
    <div class="out_header_admin"></div>
</main>