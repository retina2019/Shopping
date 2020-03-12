<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2020-02-11
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑发票信息</title>

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
    <form class="form form-horizontal"id="billedit" method="POST" action="/">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>订单编号:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="orderId" class="input-text"value=${bill.orderId}><!-- bill对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>公司名称:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="companyName" class="input-text"value=${bill.companyName}><!-- bill对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>税号:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="tfn" class="input-text"value=${bill.tfn}><!-- bill对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>收费项目:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="items" class="input-text"value=${bill.items}><!-- bill对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>金额:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="price" class="input-text"value=${bill.price}><!-- bill对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">备注:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="remarks" class="input-text"value=${bill.remarks}><!-- bill对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>用户编号:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="userId" class="input-text"value=${bill.userId}><!-- bill对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select id="state" name="state" value=${bill.state}>
                    <option value="0" >待处理</option>
                    <option value="1">不通过</option>
                    <option value="2">开票中</option>
                    <option value="3">开票完成</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 发票申请时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"value=${bill.applytime} id="applytime"   >
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <input type="button" id="editsave" name="submit" class="btn btn-success radius"  value="编辑并保存"/>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    var checkData = function(){
        var orderId1='${bill.orderId}';
        var orderId= $("#orderId").val();
        if(orderId!=orderId1){
            alert("订单编号不可更改");
            return false;
        }
        var compangyName=$("#companyName").val();
        if(compangyName==""){
            alert("公司名称不可为空");
            return false;
        }
        var tfn=$("#tfn").val();
        if(tfn==""){
            alert("税号不可为空");
            return false;
        }
        var items=$("#items").val();
        if(items==""){
            alert("收费项目不可为空");
            return false;
        }
        var price=$("#price").val();
        if(price==""){
            alert("金额不可为空");
            return false;
        }
        var userId=$("#userId").val();
        if(userId==""){
            alert("用户不可为空");
            return false;
        }
            var state= $("#state").val();
            if(state==""){
                alert("请选中状态!");
                return false;
            }
            var applytime=$("#applytime").val();
            if(applytime==""){
                alert("发票申请时间不可为空");
                return false;
            }
        return true;
        }
    var submit = function(){
        if (checkData()){
            var data={
                orderId:$("#orderId").val(),
                companyName:$("#companyName").val(),
                tfn:$("#tfn").val(),
                items:$("#items").val(),
                price:$("#price").val(),
                remarks:$("#remarks").val(),
                userId:$("#userId").val(),
                state:$("#state").val(),
                applytime:$("#applytime").val()
            }
            $.ajax({
                type: "POST",
                url: "/Shopping/bills/submitBillEdit",
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
</script>
</body>
</html>
