<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-24
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- 引入C标签 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商品分类管理</title>
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/style.css" />
</head>
<body>
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe625;</i> 首页
    <span class="c-gray en">&gt;</span> 商品管理
    <span class="c-gray en">&gt;</span> 商品分类
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
        <i class="Hui-iconfont">&#xe68f;</i>
    </a>
</nav>
<div class="page-container">
    <div class="text-c"> 查询条件：
        <input type="text" name="" id="cutId" placeholder="商品分类号" style="width:120px" class="input-text">
        <a  href="javascript:;" onclick="cut_query('查询商品分类','/Shopping/product/revertAllcut')" class="btn btn-success btn btn-success radius r"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
	<span class="l">
   	    <span class="l">
            <a  href="javascript:;" onclick="cut_add('添加商品分类','/Shopping/product/addCut')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增</a>
		</span>
	</span>
    </div>
    <div class="mt-20">
        <form method="get" action="/Shopping/product/revertAllcut" >
            <table id="tab"  class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr>
                    <th><input name="" type="checkbox" value=""></th>
                    <th>商品分类编号</th>
                    <th>商品分类名称</th>
                    <th>上级分类名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${category}" var="cut"><!--forEach 通过listcut遍历表格  -->
                <tr>
                    <td><input name="" type="checkbox" value=""></td>
                    <td>${cut.cutId}</td><!--注意这里的属性要与model中的属性相一致-->
                    <td>${cut.cut}</td>
                    <td>${cut.upcut}</td>
                    <td class="f-14 td-manage">
                        <a style="text-decoration:none" class="ml-5" onClick="cut_edit('商品分类编辑','/Shopping/product/editCut','${cut.cutId}')" href="javascript:;" title="编辑">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>
                        <a style="text-decoration:none" class="ml-5" onClick="cut_del(this,'${cut.cutId}')" href="javascript:;" title="删除">
                            <i class="Hui-iconfont">&#xe6e2;</i>
                        </a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
</div>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="/Shopping/H-ui.admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('.table-sort').dataTable({//Datatables是一款jquery表格插件。它是一个高度灵活的工具，可以将任何HTML表格添加高级的交互功能。
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,4]}// 制定列不参与排序
            ]
        });
    });

    function cut_query(title,url){
        var cutId=$("#cutId").val();
        var myurl=url+"?cutId="+cutId;
        location.href = myurl;
    }
    function cut_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    function cut_edit(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url+"?cutId="+id
        });
        layer.full(index);
    }
    function cut_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            var data={"cutId":id};
            $.ajax({
                type: 'POST',
                url: "/Shopping/product/deleteCut",
                data:JSON.stringify(data),
                //dataType: 'json',//一般返回的是json格式
                dataType: 'text',//直接返回字符串用text
                contentType:"application/json",
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }
</script>
</body>
</html>
