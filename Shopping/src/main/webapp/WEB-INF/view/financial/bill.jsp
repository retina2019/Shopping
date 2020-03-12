<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2020-02-08
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 引入C标签 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>发票管理</title>
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/style.css" />

    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe625;</i> 首页
    <span class="c-gray en">&gt;</span> 财务管理
    <span class="c-gray en">&gt;</span> 发票管理
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
        <i class="Hui-iconfont">&#xe68f;</i>
    </a>
</nav>
<div class="page-container">
    <div class="text-c"> 查询条件：
        <input type="text" name="" id="orderId" placeholder="订单号" style="width:120px" class="input-text">
        <input type="text" name="" id="companyName" placeholder="公司名称" style="width:120px" class="input-text">
        <input type="text" name="" id="tfn" placeholder="税号" style="width:120px" class="input-text">
        <input type="text" name="" id="items" placeholder="收费项目" style="width:120px" class="input-text">
        <input type="text" name="" id="remarks" placeholder="备注" style="width:120px" class="input-text"><br/>
        <input type="text" name="" id="userId" placeholder="用户编号" style="width:120px" class="input-text">
        <select name="" id="state" placeholder="状态" style="width:120px" class="input-text">
            <option value="0">待处理</option>
            <option value="1">不通过</option>
            <option value="1">开票中</option>
            <option value="1">开票完成</option>
        </select>
        <input type="text" name="" id="applytimebegin" placeholder="申请时间起" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'applytimeend\')||\'%y-%M-%d\'}' })"class="input-text Wdate" style="width:120px;">
        <input type="text"  placeholder="申请时间止"onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'applytimebegin\')}',maxDate:'%y-%M-%d' })" id="applytimeend"class="input-text Wdate" style="width:120px;">
        <a href="javascript:;" name="submit" id="submitBtn" class="btn btn-success btn btn-success radius " onclick="bill_query()"><i class="Hui-iconfont">&#xe665;</i> 搜索</a>
        <a  href="javascript:;"  class="btn btn-primary radius" onclick="bill_add('发票添加','/Shopping/bills/addBill')"><i class="Hui-iconfont">&#xe600;</i> 添加</a>

    </div>
    <div class="mt-20">
        <table id="billtable"  class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr>
                <th><input name="" type="checkbox" value=""></th>
                <th>用户</th>
                <th>订单编号</th>
                <th>公司名称</th>
                <th>税号</th>
                <th>收费项目</th>
                <th>金额</th>
                <th>状态</th>
                <th>申请时间</th>
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
    var url = "/Shopping/bills/getList";
    var getParamsUrl = function(){

        var orderId=$("#orderId").val();
        var companyName=$("#companyName").val();
        var tfn=$("#tfn").val();
        var items=$("#items").val();
        var remarks=$("#remarks").val();
        var userId=$("#userId").val();
        var state=$("#state").val();
        var applytimebegin=$("#applytimebegin").val();
        var applytimeend=$("#applytimeend").val();
        console.log(this);
        return url+"?orderId="+orderId+"&companyName="+companyName+"&tfn="+tfn+"&items="+items+"&remarks="+remarks+"&userId="+userId+"&state="+state+"&applytimebegin="+applytimebegin+"&applytimeend="+applytimeend;
    }
    var table;
    function bill_query(){
        var myurl = getParamsUrl();

        if(null!=table)table.destroy();

        table = $('#billtable').DataTable( {
            "processing": true,
            "serverSide": true,
            "ajax": $.fn.dataTable.pipeline( {
                url: myurl//后台处理URL
            } ),
            "columns": [
                {
                    data:'orderId',
                    render:function(data, type, full, meta) {
                        return '<input  type="checkbox" name="id" value="'+data.orderId+'" />'
                    }
                },
                {"data":"userId"},
                {"data":"orderId"},
                {"data":"companyName"},
                {"data":"tfn"},
                {"data":"items"},
                {"data":"price"},
                {"data":"state",
                    render:function(data,type,full,meta){
                        var a="";
                        if(data==0){
                            a="待处理";
                        }else if(data==1){
                            a="不通过";
                        }else if(data==2){
                            a="开票中";
                        }else if(data==3){
                            a="开票完成"}
                        return a;
                    }
                },
                { "data":"applytime",
                    render:function(data, type, full, meta) {
                        var dateStr="";
                        var applytime=data;
                        if(applytime && applytime!=""){
                            dateStr = new Date(applytime);
                        }
                        return dateStr;
                    }} ,//转换成用户想看的日期类型
                {"data":null,"render":function (data,type,row,meta) {

                        var html='<button type="button" class="ml-5" onclick="bill_edit('+data.orderId+')">编辑</button>'+
                            '&nbsp;&nbsp;<button type="button" class="ml-5" onclick="bill_del(this,'+data.orderId+')">删除</button>'
                        return html;
                    }}
            ]

        } );
    }
    function bill_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    function bill_edit(id){
        var url="/Shopping/bills/editBill";
        var title="发票编辑"
        var index = layer.open({
            type: 2,
            title: title,
            content: url+"?orderId="+id
        });
        layer.full(index);
    }
    function bill_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            var data={"orderId":id};
            $.ajax({
                type: 'POST',
                url: '/Shopping/bills/deleteBill',
                data:JSON.stringify(data),
                dataType: 'text',
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
    //当上面的代码都加载完毕就执行bill_query（）；
    $(document).ready(function() {
        bill_query();
    });
</script>
</body>
</html>
