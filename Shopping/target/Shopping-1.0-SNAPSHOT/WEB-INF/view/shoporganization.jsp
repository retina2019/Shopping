<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-12-15
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" href="/Shopping/H-ui.admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/zTree/v3/js/jquery.ztree.core-3.5.js"></script>
    <script language="JavaScript">
        var zTreeObj;
        var setting = {
            check:{
                enable:true
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey:"id",
                    pIdKey:"pId",
                    rootPId:0
                }
            },
            view: {
                expandSpeed: "fast",
                fontCss : {color:"blue"}
            }
        };
    </script>

</head>
<body>
<a href="javascript:;" name="submit" id="submitBtn"  onclick="organization()"><i class="Hui-iconfont">&#xe665;</i> 查看商品分类图</a><br/>
<a href="javascript:;" name="submitProduct" id="submitBtnProduct"  onclick="product()"><i class="Hui-iconfont">&#xe665;</i> 查看商品分布图</a>
<div >
    <ul id="treeDemo1" class="ztree"></ul>
    <ul id="treeDemo2" class="ztree"></ul>
</div>
<script type="text/javascript">
    var url = "/";
    var zTree;
    function organization() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/Shopping/shoporganization/getTreeDate",
            async: true,
            data: $("#treeDemo1").serialize(),//serialize()获取序列值，获取id为treeDemo2的序列值
            success: function (data) {
                $.fn.zTree.init($("#treeDemo1"), setting, data);
            },
            error: function () {
                alert("异常！")
            }
        })
    }
    function product() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/Shopping/shoporganization/getTreeDate2",
            async: true,
            data: $("#treeDemo2").serialize(),//serialize()获取序列值，获取id为treeDemo2的序列值
            success: function (data) {
                $.fn.zTree.init($("#treeDemo2"), setting, data);
            },
            error: function () {
                alert("异常！")
            }
        })
    }
</script>
</body>
</html>
