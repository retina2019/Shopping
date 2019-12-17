<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-12-15
  Time: 22:18
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
    <title>编辑商铺分类</title>

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.css"/>
    <link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css"/>

    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<div class="page-container">
    <form class="form form-horizontal"id="shopcategoryedit" method="POST" action="/">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商铺分类ID:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="shopcutId" class="input-text"value=${shopcategory.shopcutId}><!-- shopcategory对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商铺分类:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="shopcut" class="input-text"value=${shopcategory.shopcut}><!-- shopcategory对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">上级商铺分类：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="upshopcut" id="upshopcut" class="input-text"value="">
                    <c:forEach items="${shopcut}" var="shopcategory">
                        <option value="${shopcategory.shopcut}">
                                ${shopcategory.shopcut}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">店铺分类描述:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="shopcutDescribe" class="input-text"value=${shopcategory.shopcutDescribe}><!-- shopcategory对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <input type="button" id="editcategory" name="submit" class="btn btn-success radius"  value="编辑并保存"/>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    var checkData = function(){
        var shopcutId1='${shopcategory.shopcutId}';
        var shopcutId= $("#shopcutId").val();
        if(shopcutId!=shopcutId1){
            alert("ID号不可更改");
            return false;
        }
        var shopcut = $("#shopcut").val();
        if(shopcut==""){
            alert("商铺名称不可为空");
            return false;
        }
        return true;
    }
    var submit = function(){
        if (checkData()){
            var data={
                shopcutId:$("#shopcutId").val(),
                shopcut:$("#shopcut").val(),
                upshopcutId:$("#upshopcutId").val(),
                upshopcut:$("#upshopcut").val(),
                shopcutDescribe:$("#shopcutDescribe").val()
            }
            $.ajax({
                type: "POST",
                url: "/Shopping/shop/submitshopcutEdit",
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
    $("#editcategory").bind('click',function(){
        submit();
    });

</script>
</body>
</html>
