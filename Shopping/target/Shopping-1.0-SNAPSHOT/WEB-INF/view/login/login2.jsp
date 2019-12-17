<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-12-13
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 引入C标签 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
    <script type="text/javascript" src="http://libs.useso.com/js/respond.js/1.4.2/respond.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/css3pie/2.0beta1/PIE_IE678.js"></script>
    <![endif]-->

    <!--[if IE 7]>
    <link href="http://www.bootcss.com/p/font-awesome/assets/css/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
    <![endif]-->
    <title>商家登录</title>
</head>
<body>
<link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css"/>
<div align="center">
    <form  id="shoplogin" action="/" method="POST">
        <div width="90%">
            <label width="50%" height="30" align="right"> 商户名：

                <input type="text"    id="shopName" name="shopName"  >

            </label>
        </div>
        <div width="90%">
            <label width="50%" height="30" align="right"> TEL：

                <input type="text"    id="tel" name="tel"  >

            </label>
        </div>
        <div width="50%" height="30" align="right">
            <div width="100%" height="40" align="center" colspan="2">
                <input id="shopbtn" type="button"  class="btn btn-primary radius" onclick="loginshop()" value="商家登录" >
                <a  href="javascript:;"class="btn btn-primary radius" onclick="shoplogin('商家登录','/Shopping/login/shoplogin',$('#shopName').val())" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 商家登录</a>

            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/zTree/v3/js/jquery.ztree.core-3.5.js"></script>

<script type="text/javascript" src="/Shopping/H-ui.admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript">
    function shoplogin(title,url,shopName){
        var index = layer.open({
            type: 2,
            title: title,
            content: url+"?shopName="+shopName
        });
        layer.full(index);
    }

</script>
</body>
</html>
