<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-12-11
Time: 09:42
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单管理</title>
</head>
<link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/style.css" />

<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTable.pipeline.js"></script><%--后端分页方法--%>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/static/h-ui/js/H-ui.min.js"></script>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe625;</i> 首页
    <span class="c-gray en">&gt;</span> 商城管理
    <span class="c-gray en">&gt;</span> 订单管理
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
        <i class="Hui-iconfont">&#xe68f;</i>
    </a>
</nav>
<div class="page-container">
    <div>
        <input type="text" name="" id="tel" placeholder="用户手机" style="width:120px" class="input-text">
        <input type="text" name="" id="userId" placeholder="用户编号" style="width:120px" class="input-text">
        <input type="text" name="" id="userName" placeholder="用户昵称" style="width:120px" class="input-text">
        <input type="text" name="" id="orderId" placeholder="订单ID" style="width:120px" class="input-text">
        <input type="text" name="" id="payNo" placeholder="支付单号" style="width:120px" class="input-text">
        <input type="text" name="" id="verification" placeholder="核销码" style="width:120px" class="input-text">
        <input type="text" name="" id="proId" placeholder="商品编号" style="width:120px" class="input-text">
        <input type="text" name="" id="proName" placeholder="商品名称" style="width:120px" class="input-text">
        <input type="text" name="" id="expand" placeholder="扩展属性" style="width:120px" class="input-text">
        <select name="state" id="state" placeholder="状态" style="width:120px" class="input-text">

            <option value="1">待发货</option>
            <option value="2">已发货</option>
            <option value="3">已收货</option>
        </select>
        <input type="text" name="" id="transbegin" placeholder="交易时间起" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'transend\')||\'%y-%M-%d\'}' })"class="input-text Wdate" style="width:120px;">
        <input type="text"  placeholder="交易时间止"onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'transbegin\')}',maxDate:'%y-%M-%d' })" id="transend"class="input-text Wdate" style="width:120px;">
        <input type="text" name="" id="updatebegin" placeholder="更新时间起" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'updateend\')||\'%y-%M-%d\'}' })"class="input-text Wdate" style="width:120px;">
        <input type="text"  placeholder="更新时间止"onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'updatebegin\')}',maxDate:'%y-%M-%d' })" id="updateend"class="input-text Wdate" style="width:120px;">
        <a href="javascript:;" name="submit" id="submitBtn" class="btn btn-success btn btn-success radius " onclick="order_search()"><i class="Hui-iconfont">&#xe665;</i> 搜索</a>
        <a  href="javascript:;" name="" id="" class="btn btn-primary radius" onclick="order_add('添加订单','/MysqlProject/order/addOrder')"><i class="Hui-iconfont">&#xe600;</i> 添加</a>
    </div>
    <div class="mt-20">
        <table id="tab"  class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr>
                <th><input name="" type="checkbox" value=""></th>
                <th>用户信息</th>
                <th>商品数/订单号</th>
                <th>商品名称</th>
                <th>状态</th>
                <th>价格</th>
                <th>实收</th>
                <th>交易时间</th>
                <th>更新时间</th>
                <th>操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<script type="text/javascript">
    var url = "/Shopping/order/getList";
    var getParamsUrl = function(){
        var tel=$("#tel").val();
        var userId=$("#userId").val();
        var userName=$("#userName").val();
        var orderId=$("#orderId").val();
        var payNo=$("#payNo").val();
        var verification=$("#verification").val();
        var proId=$("#proId").val();
        var proName=$("#proName").val();
        var expand=$("#expand").val();
        var state=$("#state").val();
        var transbegin=$("#transbegin").val();
        var transend=$("#transend").val();
        var updatebegin=$("#updatebegin").val();
        var updateend=$("#updateend").val();
        return url+"?tel="+tel+"&userId="+userId+"&userName="+userName+"&orderId="+orderId+"&payNo="+payNo+"&verification="+verification+"&proId="+proId+"&proName="+proName+"&expand="+expand+"&state="+state+"&transbegin="+transbegin+"&transend="+transend+"&updatebegin="+updatebegin+"&updateend="+updateend;
    }
    var table;
    function order_search(){
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
                    data: 'orderId',
                    render:function(data, type, full, meta) {
                        return '<input  type="checkbox" name="id" value="'+data.orderId+'" />'
                    }
                },
                { "data": "userId" },
                { "data": "orderId" },
                { "data": "proName" },
                { "data": "state",
                    render:function(data,type,full,meta){
                        var a="";
                        if(data==1){
                            a="待发货";
                        }else if(data==2){
                            a="已发货";
                        }else if(data==3){
                            a="已收货";
                        }
                        return a;
                    }
                },
                { "data": "price" },
                { "data": "net" } ,
                { "data": "transtime",
                    render:function(data, type, full, meta) {
                        var dateStr="";
                        var transtime=data;
                        if(transtime && transtime!=""){
                            dateStr = new Date(transtime);
                        }
                        return dateStr;
                    }} ,//转换成用户想看的日期类型
                { "data": "updatetime" ,
                    render:function(data, type, full, meta) {
                        var dateStr="";
                        var updatetime=data;
                        if(updatetime && updatetime!=""){
                            dateStr = new Date(updatetime);
                        }
                        return dateStr;
                    }} ,//转换成用户想看的日期类型
                {"data":null,"render":function (data,type,row,meta) {

                        var html='<button type="button" class="ml-5" onclick="order_edit('+data.orderId+')">编辑</button>'+
                            '&nbsp;&nbsp;<button type="button" class="ml-5" onclick="order_del(this,'+data.orderId+')">删除</button>'
                        return html;
                    }}
            ]

        } );
    }
    function order_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    function order_edit(id){
        var title="订单编辑";
        var url='/Shopping/order/editOrder';
        var index = layer.open({
            type: 2,
            title: title,
            content: url+"?orderId="+id
        });
        layer.full(index);
    }
    function order_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            var data={"orderId":id};
            $.ajax({
                type: 'POST',
                url: '/Shopping/order/deleteOrder',
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
    //当上面的代码都加载完毕就执行order_search（）；
    $(document).ready(function() {
        order_search();
    });
</script>
</body>
</html>
