<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-13
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 引入C标签 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑用户信息</title>

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
    <form class="form form-horizontal"id="useredit" method="POST" action="/">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>shopId:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="shopId" class="input-text"value=${shopmessage.shopId}><!-- shopmessage对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商家类型:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="shopcut" class="input-text"value=${shopmessage.shopcut}><!-- shopmessage对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商家区域:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="seat" class="input-text"value=${shopmessage.seat}><!-- shopmessage对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商户名:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="shopName"class="input-text" value=${shopmessage.shopName}>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商户地址:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="address"class="input-text" value=${shopmessage.address}>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商铺电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="tel" name="tel" value=${shopmessage.tel}>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> 商铺特色：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="turnover" name="tel" value=${shopmessage.turnover}>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> 商铺评价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="reviews" name="tel" value=${shopmessage.reviews}>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select id="state" value=${shopmessage.state}>
                    <option value="3" >在职</option>
                    <option value="4">离职</option>
                    <option value="5">退休</option>
                </select>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 店铺注册时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})" id="addtime" name="addtime" value=${shopmessage.addtime} >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">店铺修改时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})" id="modifytime" name="modifytime" value=${shopmessage.modifytime} >
            </div>
        </div>
    </form>
    <form class="form form-horizontal" action="/Shopping/shop/photo" method="post" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商铺图片：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file" id="photo" name="photo">
                <input type="submit" class="btn btn-default btn-uploadstar radius ml-10" id="" name="" value="上传">
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
    var checkTel = function(){
        var isPhone = /^1(3|4|5|6|7|8|9)\d{9}$/;
        var isMob=/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
        var value=document.getElementById("tel").value.trim();
        if(isMob.test(value)||isPhone.test(value)){
            return true;
        } else {
            alert('电话号码格式错误，请输入正确号码，若是国定电话，请输入此格式：****-********');
            return false;
        }
    }
    var checkData = function(){

        var shopId=$("#shopId").val();
        if(shopId==""){
            alert("ID号不可为空");
            return false;
        }
        var shopcut=$("#shopcut").val()
        if(shopcut==""){
            alert("商户类型不可为空");
            return false;
        }
        var seat=$("seat").val();
        if(seat==""){
            alert("商户区域不可为空");
            return false;
        }
        var shopName = $("#shopName").val();
        if(shopName==""){
            alert("商户名不可为空");
            return false;
        }
        var address=$("#address").val();
        if(address==""){
            alert("商户地址不可为空");
            return false;
        }
        var tel=$("#tel").val();
        if(tel==""){
            alert("商铺电话不可为空");
            return false;
        }
        var state = $("#state").val();
        if(state==""){
            alert("状态不可为空");
            return false;
        }
        var addtime=$("#addtime").val();
        if(addtime==""){
            alert("商铺注册时间不可为空")
            return false;
        }
        if(!checkTel()){
            return false;
        }
        return true;
    }
    var submit = function(){
        if (checkData()){
            var data={
                shopId:$("#shopId").val(),
                shopcut:$("#shopcut").val(),
                seat:$("#seat").val(),
                shopName:$("#shopName").val(),
                address:$("#address").val(),
                tel:$("#tel").val(),
                photo:$("#photo").val(),
                turnover:$("#turnover").val(),
                reviews:$("#reviews").val(),
                state:$("#state").val(),
                addtime:$("#addtime").val(),
                modifytime:$("#modifytime").val()
            }
            $.ajax({
                type: "POST",
                url: "/Shopping/shop/submitshopEdit",
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
