<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-12-11
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>主界面</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/layer/2.4/layer.js"></script>
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
</head>
<body >
<div align="center"><br>
    <H1>欢迎登入</H1>
    <form  id="login" name="form1" method="post" action="/Shopping/login/sendParams" >
        <table width="90%">
            <tr>
                <td width="50%" height="30" align="right">用户名：</td>
                <td width="50%" height="30" align="left"> <input  id="userName" type="text" name="userName" ></td>
            </tr>
            <tr>
                <td width="50%" height="30" align="right">密码：</td>
                <td width="50%" height="30" align="left"> <input id="psd" type="password" name="password" ></td>
            </tr>
            <tr>
                <td width="100%" height="40" align="center" colspan="2">
                    <input id="submitBtn" type="button" name="sub" value="后台管理人员登录" class="btn btn-primary radius" onclick="tijiao();">
                    <input id="submitBtn1" type="button" name="sub1" class="btn btn-primary radius" onclick="javauser_login('普通用户登录','/Shopping/login/javauser')" value="普通用户登录" >
                    <input type="button" id="submitBtn2" name="sub2" class="btn btn-success radius" onclick="shop_login('商家登录','/Shopping/login/shop')" value="商家登录"/><br/>
                    <a  href="javascript:;" onclick="customer_registor('注册普通用户','/Shopping/registor/user')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 普通用户注册</a>
                    <a  href="javascript:;" onclick="shop_registor('注册商家','/Shopping/registor/shoper')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 商家注册</a>
                    <a  href="javascript:;" onclick="administrator_registor('后台管理人员注册','/Shopping/registor/administrator')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 后台管理人员注册</a>
                </td>
            </tr>
        </table>
    </form>
<%--    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/layer/2.4/layer.js"></script>--%>
<%--    <script src="http://code.jquery.com/jquery-latest.js"></script>--%>
<%--    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/laypage/1.2/laypage.js"></script>--%>
<%--    &lt;%&ndash;    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/layer/2.4/layer.js"></script>&ndash;%&gt;--%>
<%--    <script src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.js"></script>--%>
<%--    <script src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>--%>
<%--    <script src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>--%>
<%--    <script src="/Shopping/H-ui.admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>--%>
    <script type="text/javascript">
        //判断表单数据是否正确
        var checkData = function(){
            var userName = $("#userName").val();
            if(userName==""){
                alert("用户名不可为空");
                return false;
            }
            var password = $("#psd").val();
            if(password==""){
                alert("密码不可为空");
                return false;
            }
            return true;

        }
        //提交表单数据
        var tijiao = function(){//定义submit ,submit的功能如下

            if (checkData()){//判断数据
                var data={//定义一个名为data的变量
                    userName:$("#userName").val(),//获取username值
                    password:$("#psd").val(),/* 获取password值 */
                }
                //$('#submitBtn').click(function() {/* 通过点击提交按钮，触发点击事件 */
                $('#login').submit();/* 提交表单数据 */
                //});
            }
        }
        //提交表单数据
        // var tijiao=function(){
        //     if (checkData()){
        //         var data={
        //             userName:$("#userName").val(),
        //             password:$("#password").val()
        //         }
        //         $.ajax({
        //             type: "POST",
        //             url: "/Shopping/login/sendParams",
        //             // dataType:"json",
        //             data:JSON.stringify(data),
        //             //contentType : "application/x-www-form-urlencoded",
        //             contentType:"application/json",
        //             success : function(result, status, req) {
        //                 alert('success:');
        //                 //$(".noticeInfo").css("display", "block");
        //                 console.log("save success");
        //                 //alert("刷新父级的时候会自动关闭弹层。");
        //                 window.parent.location.reload();
        //             },
        //             error : function(req, status, reason) {
        //                 alert('Error:' + reason);
        //                 //$(".noticeInfo").css("display", "block").text('Error:' + reason);
        //             }
        //         });
        //     }
        // }
        // $("#submitBtn").bind('click',function(){
        //     tijiao();
        // });
        function javauser_login(title,url){
            // var index = layer.open({
            //     type: 2,
            //     title: title,
            //     content: url
            // });
            //
            // layer.full(index);
            location.href = url;//当前页面打开URL页面

        }
        function shop_login(title,url){
            // var index = layer.open({//layer.open 根据type不同，类型也就不一样,有五种类型：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
            //     type: 2,
            //     title: title,
            //     content: url
            // });
            //
            //     layer.full(index);

            location.href = url;//当前页面打开URL页面
        }
        function customer_registor(title,url){
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        function shop_registor(title,url){
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        function administrator_registor(title,url){
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }

    </script>
</div>
</body>
</html>
