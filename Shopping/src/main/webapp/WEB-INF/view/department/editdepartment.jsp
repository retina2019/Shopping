<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-15
  Time: 14:00
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
    <title>编辑部门信息</title>

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.css"/>
    <link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css"/>

    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<div class="page-container">
    <form class="form form-horizontal"id="departmentedit" method="POST" action="/">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>部门ID:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="depId" class="input-text"value=${department.depId}><!-- departmentmessage对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>部门名称:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="depName" class="input-text"value=${department.depName}><!-- departmentmessage对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">上级部门：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" name="updepName" id="updepName" class="input-text"value="${department.updepName}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">部门描述:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="depDescribe" class="input-text"value=${department.depDescribe}><!-- departmentmessage对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 部门创建时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})" id="newDate" name="newDate" value=${department.newDate} >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">部门关闭时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})" id="offDate" name="offDate" value=${department.offDate} >
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
        var depId1='${department.depId}';
        var depId= $("#depId").val();
        if(depId!=depId1){
            alert("ID号不可更改");
            return false;
        }
        var depName = $("#depName").val();
        if(depName==""){
            alert("部门名称不可为空");
            return false;
        }
        var newDate = $("#newDate").val();
        if(newDate==""){
            alert("部门创建时间不可为空");
            return false;
        }
        return true;
    }
    var submit = function(){
        if (checkData()){
            var data={
                depId:$("#depId").val(),
                depName:$("#depName").val(),
                updepName:$("#updepName").val(),
                depDescribe:$("#depDescribe").val(),
                newDate:$("#newDate").val(),
                offDate:$("#offDate").val()
            }
            $.ajax({
                type: "POST",
                url: "/Shopping/department/submitdepartmentEdit",
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
