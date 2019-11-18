<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-13
  Time: 09:30
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
    <form  id="adduser" class="form form-horizontal"action="/" method="POST">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> userId：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="userId" name="userId"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="userName" name="userName"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 性别：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="radio" name="sex" value="1" >男
                <input type="radio" name="sex" value="2" >女
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password"  class="input-text" value=""  id="password-register-user" name="psd"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> TEL：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="tel" name="tel"  >
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
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="address" name="address"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 部门：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="depName" id="depName" class="input-text"value="">
                    <c:forEach items="${department}" var="department">
                        <option value="${department.depId}">
                                ${department.depName}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 注册时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"value="" id="registerTime" name="registerTime"  >
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
            return true
        } else {
            alert('电话号码格式错误，请输入正确号码，若是国定电话，请输入此格式：****-********');
            return false;
        }
    }
    var checkData = function(){
        var userId = $("#userId").val();
        if(userId==""){
            alert("ID不可为空");
            return false;
        }
        var userName = $("#userName").val();
        if(userName==""){
            alert("用户名不可为空");
            return false;
        }
        var sex= $('input:radio[name="sex"]:checked').val();
        if(sex==null){
            alert("请选中性别!");
            return false;
        }
        var password = $("#password-register-user").val();
        if(password==""){
            alert("密码不可为空");
            return false;
        }
        var state= $('input:checkbox[name="state"]:checked').val();
        if(state==null){
            alert("请选中一个状态!");
            return false;
        }
        var address = $("#address").val();
        if(address==""){
            alert("地址不可为空");
            return false;
        }
        var depName = $("#depName").val();
        if(depName==""){
            alert("部门不可为空");
            return false;
        }
        var registerTime = $("#registerTime").val();
        if(registerTime==""){
            alert("注册时间不可为空");
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
                userId:$("#userId").val(),
                userName:$("input[name='userName']").val(),
                sex:$('input:radio:checked').val(),
                password:$("#password-register-user").val(),
                tel:$("#tel").val(),
                state:$('input[name="state"]:checked').val(),
                address:$("#address").val(),
                depName:$("#depName").val(),
                registerTime:$("#registerTime").val()
            }
            $.ajax({
                type: "POST",
                url: "/Shopping/admin/admin",
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
