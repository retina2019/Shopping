<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-12-19
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 引入C标签 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>购买商品信息</title>

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.css"/>
    <link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css"/>

    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
</head>
<body>
<div class="page-container">
    <form class="form form-horizontal"id="productmessage" method="POST" action="/">

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品编码:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="proId" class="input-text"value=${product.proId}><!-- prodcut对应的是controller里的对象名称 -->
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品名称:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="proName" class="input-text"value=${product.proName}><!-- product对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品价格:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="price" class="input-text"value=${product.price}><!-- product对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品购买数量:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="scale" class="input-text"><!-- product对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品总价合计:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="totalprice" class="input-text"><!-- product对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品购买时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"value="" id="transtime" name="transtime"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 订单编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="orderId" class="input-text">
            </div>
        </div>

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <input type="button" id="editsave" name="submit" class="btn btn-success radius"  value="提交订单"/>
            </div>
        </div>
    </form>
<%--    用户名：<input type="text" id="userName" >--%>
<%--    <a   onClick="usermessage('用户信息','/Shopping/javauser/userordermessage','${usermessage.userName}')" data-href="javascript:;" data-title="用户信息">--%>
<%--        用户信息--%>
<%--    </a>--%>
</div>
<script type="text/javascript">
    var checkData = function(){
        var proId1='${product.proId}';
        var proId= $("#proId").val();
        if(proId!=proId1){
            alert("商品编号不可更改");
            return false;
        }

        var proName = $("#proName").val();
        if(proName==""){
            alert("商品名称不可为空");
            return false;
        }

        var price=$("#price").val();
        if(price==""){
            alert("商品价格不为空");
            return false;
        }
        var scale=$("#scale").val();
        if(scale==""){
            alert("商品购买数量不可为空");
            return false;
        }
        var totalprice=$("#totalprice").val();
        var totalprice1=price*scale;
        if(totalprice!=totalprice1) {
            alert("商品价格合计有误");
            return false;
        }
        var orderId=$("#orderId").val();
        if(orderId==""){
            alert("订单编号不可为空");
            return false;
        }
        return true;
    }
    var submit = function(){
        if (checkData()){
            var data={
                orderId:$("#orderId").val(),
                proId:$("#proId").val(),
                proName:$("#proName").val(),
                price:$("#price").val(),
                scale:$("#scale").val(),
                totalprice:$("#totalprice").val(),
                transtime:$("#transtime").val()
            }
            $.ajax({
                type: "POST",
                url: "/Shopping/orders/addordermessage",
                /* dataType:"json", */
                data:JSON.stringify(data),
                contentType:"application/json",

                success : function(result, status, req) {
                    alert('success:');
                    console.log("save success");
                    window.parent.location.reload();
                },
                error : function(req, status, reason) {
                    alert('Error:' + reason);
                }
            });
        }
    }
    $("#editsave").bind('click',function(){
        submit();
    });

    // function usermessage(title,url){
    //     var userName=$("#userName").val();
    //     var myurl=url+"?userName="+userName;
    //      location.href = myurl;
    //     // var index = layer.open({
    //     //     type: 2,
    //     //     title: title,
    //     //     content: myurl
    //     // });
    //     // layer.full(index);
    // }
</script>
</body>
</html>
