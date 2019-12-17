<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-13
  Time: 09:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.css"/>
    <link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css"/><!--
<link type="text/css" rel="stylesheet" href="font/font-awesome.min.css"/> -->
    <!--[if IE 7]>
    <link href="http://www.bootcss.com/p/font-awesome/assets/css/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
    <![endif]-->
    <title>添加用户</title>
</head>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<body>
<div class="page-container">
    <form  id="addshop" class="form form-horizontal"action="/" method="POST">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> shopId：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="shopId" name="shopId"  >
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商家类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="shopcutId" id="shopcutId" class="input-text"value="">
                    <c:forEach items="${shopcategory}" var="shopcut">
                        <option value="${shopcut.shopcutId}">
                                ${shopcut.shopcut}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商家区域：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="seat" name="seat"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="shopName" name="shopName"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商户地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="address" name="address"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商铺电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="tel" name="tel"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商铺特色：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="turnover" name="turnover"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> 商铺评价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="reviews" name="reviews"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="checkbox"   name="state" value="3"/>在职
                <input type="checkbox"   name="state" value="4"/>离职
                <input type="checkbox"   name="state" value="5"/>退休
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商铺注册时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"value="" id="addtime" name="addtime"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> 商铺修改时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"value="" id="modifytime" name="modifytime"  >
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
                <input id="svsb" type="button" class="btn btn-success radius"  value="保存并提交" >

                <input type="reset" class="btn btn-success radius" >

            </div>
        </div>
    </form>
</div>
<script src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.js"></script>
<script src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script src="/Shopping/H-ui.admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<!-- <script type="text/javascript" src="/WebProject/H-ui.admin/js/Validform_v5.3.2_min.js"></script>  -->
<script src="/Shopping/H-ui.admin/static/h-ui/js/H-ui.js"></script>
<script src="/Shopping/H-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
    //判断表单数据是否正确
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
        var shopId = $("#shopId").val();
        if(shopId==""){
            alert("ID不可为空");
            return false;
        }
        var shopcutId=$("#shopcutId").val()
        if(shopcutId==""){
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
        var state= $('input:checkbox[name="state"]:checked').val();
        if(state==null){
            alert("请选中一个状态!");
            return false;
        }
        var addTime=$("#addTime").val();
        if(addTime==""){
            alert("商铺注册时间不可为空")
            return false;
        }
        if(!checkTel()){
            return false;
        }
        return true;
    }
    //提交表单数据
    var mysubmit = function(){
        if (checkData()){
            var data={
                shopId:$("#shopId").val(),
                shopcutId:$("#shopcutId").val(),
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
                url: "/Shopping/shop/shop",
                // dataType:"json",
                data:JSON.stringify(data),
                //contentType : "application/x-www-form-urlencoded",
                contentType:"application/json",
                success : function(result, status, req) {
                    alert('success:');
                    //$(".noticeInfo").css("display", "block");
                    console.log("save success");
                    //alert("刷新父级的时候会自动关闭弹层。");
                    window.parent.location.reload();
                },
                error : function(req, status, reason) {
                    alert('Error:' + reason);
                    //$(".noticeInfo").css("display", "block").text('Error:' + reason);
                }
            });
        }
    }
    $("#svsb").bind('click',function(){
        mysubmit();
    });
</script>
</body>
</html>
