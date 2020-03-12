<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-12-16
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="/favicon.ico" >
    <link rel="Shortcut Icon" href="/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>普通用户登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
</head>
<body>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe616;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>

                        用户名:<input type="text" id="userName"class="input-text" value=${usermessage.userName}>
<%--                   <a data-href="/Shopping/javauser/usermessage" data-title="用户信息" href="javascript:void(0)">用户信息</a>--%>
                        <a   onClick="usermessage('用户信息','/Shopping/javauser/usermessage','${usermessage.userName}')" data-href="javascript:;" data-title="用户信息">
                        用户信息
                        </a>

                </ul>
            </dd>

            <dt><i class="Hui-iconfont">&#xe616;</i> 商品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="/Shopping/product/revertAllcut" data-title="商品分类" href="javascript:void(0)">商品分类</a></li>

                </ul>
                <ul>
                    <li><a data-href="/Shopping/product/userproduct" data-title="商品管理" href="javascript:void(0)">商品管理</a></li>
                </ul>
            </dd>
            <dt><i class="Hui-iconfont">&#xe616;</i>销售管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="/Shopping/orders/order" data-title="订单管理" href="javascript:void(0)">订单管理</a></li>
                </ul>

            </dd>
        </dl>
    </div>
</aside>
<div class="dislpayArrow hidden-xs">
    <a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="我的桌面" data-href="/Shopping/welcome.html">我的桌面</span>
                    <em></em>
                </li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group">
            <a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;">
                <i class="Hui-iconfont">&#xe6d4;</i>
            </a>
            <a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;">
                <i class="Hui-iconfont">&#xe6d7;</i>
            </a>
        </div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe" >
            <div style="display:none" class="loading" ></div>
            <iframe scrolling="yes" frameborder="0" src="/Shopping/welcome.html"></iframe>
        </div>
    </div>

</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前 </li>
        <li id="closeall">关闭全部 </li>
    </ul>
</div>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
    function usermessage(title,url){
        var userName=$("#userName").val();
        var myurl=url+"?userName="+userName;
        // location.href = myurl;
        var index = layer.open({
            type: 2,
            title: title,
            content: myurl
        });
        layer.full(index);
    }
</script>

</body>
</html>
