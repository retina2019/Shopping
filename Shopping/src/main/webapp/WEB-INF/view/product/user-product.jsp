<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-12-18
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 引入C标签 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商品管理</title>
</head>
<link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/style.css" />

<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe625;</i> 首页
    <span class="c-gray en">&gt;</span> 商品管理
    <span class="c-gray en">&gt;</span> 商品管理
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
        <i class="Hui-iconfont">&#xe68f;</i>
    </a>
</nav>
<div class="page-container">

    <div>
        <input type="text" name="" id="proId" placeholder="商品编号/条码编号" style="width:120px" class="input-text">
        <input type="text" name="" id="cutId" placeholder="商品分类编号" style="width:120px" class="input-text">
        <select name="" id="state" placeholder="状态" style="width:120px" class="input-text">
            <option value="0">上架</option>
            <option value="1">下架</option>
        </select>
        <a href="javascript:;" name="submit" id="submitBtn" class="btn btn-success btn btn-success radius " onclick="product_search()"><i class="Hui-iconfont">&#xe665;</i> 搜索</a>
        <form action="/Shopping/product/download_excel1">
            <input type="button"class="btn btn-success btn btn-success radius " value="无条件报表导出" onclick="download1()"/>
        </form>
        <form action="/Shopping/product/download_excel2">
            <input type="button" class="btn btn-primary radius"value="按条件报表导出" onclick="download2()"/>
        </form>

    </div>
    <div class="mt-20">
        <table id="example"  class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr>
                <th><input name="" type="checkbox" value=""></th>
                <th>商品编号/条形编号</th>
                <th>商品分类</th>
                <th>商品名称</th>
                <th>商品状态</th>
                <th>图片</th>
                <th>价格</th>
                <th>购买数量</th>
                <th>库存</th>
                <th>操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<script type="text/javascript" src="/Shopping/H-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTable.pipeline.js"></script><%--后端分页方法--%>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">

    var url = "/Shopping/product/getList";
    var getParamsUrl = function(){

        var proId=$("#proId").val();
        var cutId=$("#cutId").val();
        var state=$("#state").val();
        console.log(this);
        return url+"?proId="+proId+"&cutId="+cutId+"&state="+state;
    }
    var table;
    function product_search(){
        var myurl = getParamsUrl();

        if(null!=table)table.destroy();

        table = $('#example').DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax": $.fn.dataTable.pipeline( {
                url: myurl//后台处理URL
            } ),
            "columns": [
                {
                    data: 'proId',
                    render:function(data, type, full, meta) {
                        return '<input  type="checkbox" name="id" value="'+data.proId+'" />'
                    }
                },
                { "data": "proId" },
                { "data": "cutId" },
                { "data": "proName" },
                { "data": "state","render":function (data,type,row,meta) {
                        var a="";
                        if(data==0){a="上架"}
                        if(data==1){a="下架"}
                        return a;
                    } } ,
                { "data": "photo"} ,
                { "data": "price" } ,
                { "data": "scale" } ,
                { "data": "quantity" } ,
                {"data":null,"render":function (data,type,row,meta) {

                        var html='<button type="button" class="ml-5" onclick="product_edit(\''+data.proId+'\')">购买</button>'
                        return html;
                    }}
            ]

        } );
    }

    function product_edit(id){
        var url="/Shopping/orders/addorder";
        var title="购买商品"
        var index = layer.open({
            type: 2,
            title: title,
            content: url+"?proId="+id
        });
        layer.full(index);
    }

    $(document).ready(function() {
        product_search();
    });

    function download1(){
        var url="download_excel1?proId=112901&name=商品信息表";
        window.open(url);
    }
    function download2(){
        var proId=$("#proId").val();
        var cutId=$("#cutId").val();
        var state=$("#state").val();
        console.log(this);
        var url="download_excel2?proId="+proId+"&cutId="+cutId+"&state="+state+"&name=商品信息表";
        window.open(url);
    }
</script>



</body>

</html>
