<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-24
  Time: 21:47
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
    <title>添加商品分类</title>
</head>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<body>
<div class="page-container">
    <form  id="addcategory" class="form form-horizontal"action="/" method="POST">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品分类ID：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="cutId" name="cutId"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品分类名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="cut" name="cut"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">上级商品分类：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="upcut" id="upcut" class="input-text"value="">
                    <c:forEach items="${cut}" var="category">
                        <option value="${category.cut}">
                                ${category.cut}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> 商品分类描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="cutDescribe" name="cutDescribe"  >
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
<script src="/Shopping/H-ui.admin/static/h-ui/js/H-ui.js"></script>
<script src="/Shopping/H-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
    //判断表单数据是否正确
    var checkData = function() {
        var cutId = $("#cutId").val();
        if (cutId == "") {
            alert("商品分类ID不可为空");
            return false;
        }
        var cut=$("#cut").val();
        if(cut==""){
            alert("商品分类名称不可为空");
            return false;
        }
        return true;
    }
    //提交表单数据
    var mysubmit = function(){
        if (checkData()){
            var data= {
                cutId: $("#cutId").val(),
                cut: $("input[name='cut']").val(),
                upcut: $("#upcut").val(),
                cutDescribe: $("#cutDescribe").val()
            }
            $.ajax({
                type: "POST",
                url: "/Shopping/product/addcategory",
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
