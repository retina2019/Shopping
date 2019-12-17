<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-13
  Time: 11:03
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
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>ID:</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" id="userId" class="input-text"value=${usermessage.userId}><!-- usermessage对应的是controller里的对象名称 -->
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>用户名:</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" id="userName"class="input-text" value=${usermessage.userName}>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>性别:</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select id="sex" value=${usermessage.sex}>
                <option value="1" >男</option>
                <option value="2">女</option>
            </select>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>密码:</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="password" id="password"class="input-text" value=${usermessage.password}>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> TEL：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text"  class="input-text"  id="tel" name="tel" value=${usermessage.tel}>
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"> 地址：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text"  class="input-text"   id="address" name="address" value=${usermessage.address} >
        </div>
    </div>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 注册时间：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})" id="registerTime" name="registerTime" value=${usermessage.registerTime} >
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
                return true
            } else {
                alert('电话号码格式错误，请输入正确号码，若是国定电话，请输入此格式：****-********');
                return false;
            }
        }
    var checkData = function(){
        var userId1='${usermessage.userId}';
        var userId= $("#userId").val();
        if(userId!=userId1){
            alert("ID号不可更改");
            return false;
        }
        var userName = $("#userName").val();
        if(userName==""){
            alert("用户名不可为空");
            return false;
        }
        var sex = $("#sex").val();
        if(sex==""){
            alert("性别不可为空");
            return false;
        }
        var password=$("#password").val();
        if(password==""){
            alert("密码不可为空")
            return false;
        }
        var registerTime=$("#registerTime").val();
        if(registerTime==""){
            alert("注册时间不可为空")
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
                userId:$("#userId").val(),
                userName:$("#userName").val(),
                sex:$("#sex").val(),
                password:$("password").val(),
                tel:$("#tel").val(),
                address:$("#address").val(),
                registerTime:$("#registerTime").val(),
            }
            $.ajax({
                type: "POST",
                url: "/Shopping/user/submitEdit",
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
