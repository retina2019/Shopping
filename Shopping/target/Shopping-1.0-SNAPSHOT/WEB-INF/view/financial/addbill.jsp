<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2020-02-09
  Time: 15:47
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
    <title>添加发票信息</title>
</head>
<body>
<link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css"/>

<script type="text/javascript" src="/Shopping/H-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<div class="page-container">
    <form  id="addbill" class="form form-horizontal"action="/" method="POST" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 订单编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="orderId" name="orderId"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 公司名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="companyName" name="companyName"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 税号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="tfn" name="tfn"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 收费项目：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="items" name="items"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 金额：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="price" name="price"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> 备注：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="remarks" name="remarks"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> <span class="c-red">*</span>用户编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="userId" name="userId"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="radio"   name="state" value="0"/>待处理
                <input type="radio"   name="state" value="1"/>不通过
                <input type="radio" name="state" value="2"/>开票中
                <input type="radio" name="state" value="3"/>开票完成
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 发票申请时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"value="" id="applytime" name="applytime"  >
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <input id="svsb" type="button" class="btn btn-success radius"  value="保存并提交" >

                <input type="reset" class="btn btn-success radius" >

            </div>
        </div>
    </form>
</div>
<script src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.js"></script>
<script src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script src="/Shopping/H-ui.admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script src="/Shopping/H-ui.admin/static/h-ui/js/H-ui.js"></script>
<script src="/Shopping/H-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
    //判断表单数据是否正确
    var checkData = function() {
            var orderId = $("#orderId").val();
            if (orderId == "") {
                alert("订单号不可为空");
                return false;
            }
            var companyName = $("#companyName").val();
            if (companyName == "") {
                alert("公司名称不可为空");
                return false;
            }
            var tfn=$("#tfn").val();
            if(tfn==""){
                alert("税号不可为空");
                return false;
            }
            var items=$("#items").val();
            if (items==""){
                alert("收费项目不可为空");
                return false;
            }
            var price=$("#price").val();
            if (price==""){
                alert("金额不可为空");
                return false;
            }
            var userId=$("#userId").val();
            if(userId==""){
                alert("用户号不可为空");
                return false;
            }
            var state= $('input:radio[name="state"]:checked').val();
            if(state==null){
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
                url: "/Shopping/bills/addBillMessage",
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
    $("#svsb").bind('click',function(){
        submit();
    });
</script>
</body>
</html>
