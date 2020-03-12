<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-29
  Time: 14:27
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
    <title>编辑商品信息</title>

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
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品编码:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="proId" class="input-text"value=${product.proId}><!-- prodcut对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品分类：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="cutId" id="cutId" class="input-text">
                    <c:forEach items="${category}" var="cut">
                        <option value="${cut.cutId}">
                                ${cut.cut}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品名称:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="proName" class="input-text"value=${product.proName}><!-- product对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">物流:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="logistical" class="input-text"value=${product.logistical}><!-- product对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>状态:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select id="state" value=${product.state}>
                    <option value="0" >上架</option>
                    <option value="1">下架</option>
                </select>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">是否推荐:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select id="introduction" value=${product.introduction}>
                    <option value="0" >是</option>
                    <option value="1">否</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品价格:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="price" class="input-text"value=${product.price}><!-- product对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品销量:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="scale" class="input-text"value=${product.scale}><!-- product对应的是controller里的对象名称 -->
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品库存:</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="quantity" class="input-text"value=${product.quantity}><!-- product对应的是controller里的对象名称 -->
            </div>
        </div>

    </form>
    <form class="form form-horizontal" action="/Shopping/product/photo" method="post" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商品图片：</label>
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
    var checkData = function(){
        var proId1='${product.proId}';
        var proId= $("#proId").val();
        if(proId!=proId1){
            alert("商品编号不可更改");
            return false;
        }
        var cutId=$("#cutId").val();
            if(cutId==""){
            alert("商品分类不可为空");
            return false;
            }
        var proName = $("#proName").val();
        if(proName==""){
            alert("商品名称不可为空");
            return false;
        }
        var state=$("#state").val();
        if(state==""){
            alert("商品状态不可为空");
            return false;
        }
        var price=$("#price").val();
        if(price==""){
        alert("商品价格不为空");
        return false;
        }
        var scale=$("#scale").val();
        if(scale==""){
            alert("商品销量不可为空");
            return false;
        }
        return true;
        }
    var submit = function(){
        if (checkData()){
            var data={
                proId:$("#proId").val(),
                cutId:$("#cutId").val(),
                proName:$("#proName").val(),
                logistical:$("#logistical").val(),
                state:$("#state").val(),
                photo:$("#photo").val(),
                introduction:$("#introduction").val(),
                price:$("#price").val(),
                scale:$("#scale").val(),
                quantity:$("#quantity").val()
            }
            $.ajax({
                type: "POST",
                url: "/Shopping/product/submitProductEdit",
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
