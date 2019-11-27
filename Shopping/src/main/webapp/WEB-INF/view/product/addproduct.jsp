<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-27
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 引入C标签 -->
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
    <title>添加商品</title>

</head>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<body>
<div class="page-container">
    <form  id="addproduct" class="form form-horizontal" action="/" method="GET">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品编号/条形编号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value="" id="proId" name="proId"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品分类：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <select name="cut" id="cut" class="input-text"value="">
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
                <input type="text"  class="input-text" value=""  id="proName" name="proName"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商品特色：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="proRange" name="proRange"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> 选择物流：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="logistical" name="logistical"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 商品状态：</label>
            <div class="formControls col-xs-8 col-sm-9">

                <input type="checkbox"   name="states" value="0">上架
                <input type="checkbox"   name="states" value="1">下架

            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商品图片：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file"   value=""  id="photo" name=""  >
                <input type="button" class="btn btn-default btn-uploadstar radius ml-10" id="" name="" value="上传" >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">商品是否推荐：</label>
            <div class="formControls col-xs-8 col-sm-9">

                <input type="checkbox"   name="introduction" value="0">是
                <input type="checkbox"   name="introduction" value="1">否

            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>  原价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="orig" name="orig"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> <span class="c-red">*</span> 现价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value=""  id="current" name="current"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> <span class="c-red">*</span> 重量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="scale" name="scale"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> <span class="c-red">*</span> 库存数量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value=""  id="quantity" name="quantity"  >
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"> 入库日期：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text Wdate" onfocus="WdatePicker({skin:'whyGreen',maxDate:'%y-%M-%d'})"value="" id="warehousetime" name="warehousetime"  >
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <input id="svproduct" type="button" class="btn btn-success radius"  value="保存并提交" >

                <input type="reset" class="btn btn-success radius" >

            </div>
        </div>
    </form>
</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.js"></script>
<script src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script src="/Shopping/H-ui.admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script src="/Shopping/H-ui.admin/static/h-ui/js/H-ui.js"></script>
<script src="/Shopping/H-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
    //判断表单数据是否正确
    var checkFile=function(){
        var path = $("#photo").val();
        if (path.length == 0) {
            alert("请上传照片");
            return false;
        } else {
            var extStart = path.lastIndexOf('.'),
                ext = path.substring(extStart, path.length).toUpperCase();
            if (ext !== '.PNG' && ext !== '.JPG' && ext !== '.JPEG' && ext !== '.GIF') {
                alert("Please enter the correct picture format!");
                resetFile();
                return false;
            }
            alert("ok 输入正确");
        }
    }
    var checkData = function(){
        var proId = $("#proId").val();
        if(proId==""){
            alert("商品编号/条形编号不可为空");
            return false;
        }
        var cut = $("#cut").val();
        if(cut==""){
            alert("商品分类不可为空");
            return false;
        }
        var proName = $("#proName").val();
        if(proName==""){
            alert("商品名称不可为空");
            return false;
        }
        var states= $('input:checkbox[name="states"]:checked').val();
        if(states==null){
            alert("请选中一个状态!");
            return false;
        }
        var orig = $("#orig").val();
        if(orig==""){
            alert("原价不可为空");
            return false;
        }
        var current = $("#current").val();
        if(current==""){
            alert("现价不可为空");
            return false;
        }
        var scale = $("#scale").val();
        if(scale==""){
            alert("重量不可为空");
            return false;
        }
        var quantity = $("#quantity").val();
        if(quantity==""){
            alert("库存数量不可为空");
            return false;
        }

        return true;
    }
    var mysubmit = function(){
        if (checkData()){
            var data={
                proId:$("#proId").val(),
                cut:$("#cut").val(),
                proName:$("#proName").val(),
                proRange:$("#proRange").val(),
                logistical:$("#logistical").val(),
                states:$('input[name="states"]:checked').val(),
                photo:$("#photo").val(),
                introduction:$('input[name="introduction"]:checked').val(),
                orig:$("#orig").val(),
                current:$("#current").val(),
                scale:$("#scale").val(),
                quantity:$("#quantity").val(),
                warehousetime:$("#warehousetime").val()
            }
            $.ajax({

                type: "POST",
                url: "/Shopping/product/addMessage",
                //dataType:"json",
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


    $("#svproduct").bind('click',function(){
        mysubmit();

    });
</script>
</body>
</html>
