<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-13
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 引入C标签 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Hello world</title>
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/style.css" />

</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe625;</i> 首页
    <span class="c-gray en">&gt;</span> 系统管理
    <span class="c-gray en">&gt;</span> 商家管理
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
        <i class="Hui-iconfont">&#xe68f;</i>
    </a>
</nav>
<div class="page-container">
    <div class="text-c"> 查询条件：
        <input type="text" name="" id="userId" placeholder="id号" style="width:120px" class="input-text">
        <input type="text" name="" id="userName" placeholder="用户名" style="width:120px" class="input-text">
        <select name="sex" id="state" placeholder="状态" style="width:120px" class="input-text">
            <option value="3">在职</option>
            <option value="4">离职</option>
            <option value="5">退休</option>
        </select>
        <button name="" onclick="user_query()" id="queryuser" class="btn btn-success btn btn-success radius r" type="submit"><i class="Hui-iconfont">&#xe665;</i> 查询</button>
    </div>
    <div class="mt-20">
        <table id="tab"  class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr>
                <th><input name="" type="checkbox" value=""></th>
                <th>ID</th>
                <th>商户名</th>
                <th>密码</th>
                <th>联系方式</th>
                <th>状态</th>
                <th>地址</th>
                <th>注册时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>

</div>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTable.pipeline.js"></script><%--后端分页方法--%>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">
    var url = "/Shopping/user/getshopList";
    var getParamsUrl = function(){
        var userId=$("#userId").val();
        var userName=$("#userName").val();
        var state=$("#state").val();
        var myurl= url+"?userId="+userId+"&userName="+userName+"&state="+state;
        return myurl;
    }
    var table;
    function user_query(){
        var myurl = getParamsUrl();

        if(null!=table)table.destroy();

        table = $('#tab').DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax": $.fn.dataTable.pipeline( {
                url: myurl//后台处理URL
            } ),
            "columns": [
                {
                    data: 'userId',
                    render:function(data, type, full, meta) {
                        return '<input  type="checkbox" name="id" value="'+data.userId+'" />'
                    }
                },
                { "data": "userId"},
                { "data": "userName" },
                {"data":"password"},
                { "data": "tel" },
                { "data": "state" ,"render":function(data,type,row,meta){
                        var a="";
                        if (data==3){a="在职"}
                        if(data==4){a="离职"}
                        if(data==5){a="退休"}
                        return a;
                    }
                },
                { "data": "address" },
                {"data":"registerTime",render:function(data, type, full, meta) {
                        var dateStr="";
                        var registerTime=data;
                        if(registerTime && registerTime!=""){
                            dateStr = new Date(registerTime);
                        }
                        return dateStr;
                    }},
                {"data":null,"render":function (data,type,row,meta) {

                        var html='<button type="button" class="ml-5" onclick="user_edit('+data.userId+')">编辑</button>'+
                            '&nbsp;&nbsp;<button type="button" class="ml-5" onclick="user_del(this,'+data.userId+')">删除</button>'
                        return html;
                    }}
            ]

        } );
    }
    function user_edit(id){
        var title="商户编辑";
        var url="/Shopping/user/editshoper";
        var index = layer.open({
            type: 2,
            title: title,
            content: url+"?userId="+id
        });
        layer.full(index);
    }
    function user_del(obj,id){
        var data={"userId":id}
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '/Shopping/user/deleteshoper',
                //dataType: 'json',
                data:JSON.stringify(data),
                dataType: 'text',//直接返回字符串用text
                contentType:"application/json",
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }
    $(document).ready(function() {
        user_query();
    });
</script>
</body>
</html>
