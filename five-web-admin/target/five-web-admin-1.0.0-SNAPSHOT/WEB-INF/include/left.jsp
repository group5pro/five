<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- LEFT SIDEBAR -->
<div id="sidebar-nav" class="sidebar">
    <div class="sidebar-scroll">
        <nav>
            <ul class="nav">
                <li>
                    <a href="#user" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i> <span>用户管理</span>
                        <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="user" class="collapse ">
                        <ul class="nav">
                            <li><a href="/user/list" class="">用户列表</a></li>
                            <li><a href="/user/form" class="">新增用户</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#product" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i>
                        <span>商品管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="product" class="collapse ">
                        <ul class="nav">
                            <li><a href="/product/list" class="">商品列表</a></li>
                            <li><a href="/product/category" class="">商品分类</a></li>
                            <li><a href="/product/form" class="">新增商品</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- END LEFT SIDEBAR -->