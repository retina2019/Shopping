<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-29
  Time: 10:14
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
    <title>添加商品信息</title>
</head>
<body>
<link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css"/>
<div class="page-container">
    <form  id="addproduct" class="form form-horizontal"action="/" method="POST" enctype="multipart/form-data">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="proId" name="proId"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品分类：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="cutId" id="cutId" class="input-text"value="">
                    <c:forEach items="${category}" var="cut">
                        <option value="${cut.cutId}">
                                ${cut.cut}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="proName" name="proName"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> 物流：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="logistical" name="logistical"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="radio"   name="state" value="0"/>上架
                <input type="radio"   name="state" value="1"/>下架
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">是否推荐：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="radio"   name="introduction" value="0"/>是
                <input type="radio"   name="" value="1"/>否
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="price" name="price"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品销量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="scale" name="scale"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品入库数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text"  id="quantity" name="quantity"  >
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
        var proId = $("#proId").val();
        if (proId == "") {
            alert("商品编号不可为空");
            return false;
        }
        var cutId = $("#cutId").val();
        if (cutId == "") {
            alert("商品分类不可为空");
            return false;
        }
        var proName = $("#proName").val();
        if (proName == "") {
            alert("商品名称不可为空");
            return false;
        }
        var state= $('input:radio[name="state"]:checked').val();
        if(state==null){
            alert("请选中状态!");
            return false;
        }
        var introduction= $('input:radio[name="introduction"]:checked').val();
        if(introduction==null){
            alert("是否推荐!");
            return false;
        }
        var price = $("#price").val();
        if (price == "") {
            alert("商品价格不可为空");
            return false;
        }
        var scale = $("#scale").val();
        if (scale == "") {
            alert("商品销量不可为空");
            return false;
        }
        var quantity = $("#quantity").val();
        if (quantity == "") {
            alert("商品库存不可为空");
            return false;
        }
        return true;
    }
    //提交表单数据
    var mysubmit = function(){
        if (checkData()){
            var data={
                proId:$("#proId").val(),
                cutId:$("#cutId").val(),
                proName:$("#proName").val(),
                logistical:$("#logistical").val(),
                state:$('input[name="state"]:checked').val(),
                photo:$("#photo").val(),
                introduction:$('input[name="introduction"]:checked').val(),
                price:$("#price").val(),
                scale:$("#scale").val(),
                quantity:$("#quantity").val()
            }
            $.ajax({
                type: "POST",
                url: "/Shopping/product/addProductMessage",
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
