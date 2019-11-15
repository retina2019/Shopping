<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-11-07
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="/Shopping/H-ui.admin/lib/laypage/1.2/laypage.js"></script>
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
                    <input id="submitBtn" type="button" name="sub" value="用户登录" class="btn btn-primary radius" onclick="tijiao();">
<%--                    <input type="button" id="submitBtn" name="sub" class="btn btn-success radius"  value="用户登录"/>--%>
                    <a  href="javascript:;" onclick="customer_registor('注册普通用户','/Shopping/registor/user')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 普通用户注册</a>
                    <a  href="javascript:;" onclick="shop_registor('注册商家','/Shopping/registor/shoper')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 商家注册</a>
                </td>
            </tr>
        </table>
    </form>

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
        <%--var submit = function(){--%>
        <%--    if (checkData()){--%>
        <%--        var data={--%>
        <%--            userName:$("#userName").val(),--%>
        <%--            password:$("#password").val()--%>
        <%--        }--%>
        <%--        $.ajax({--%>
        <%--            type: "POST",--%>
        <%--            url: "/Shopping/login/sendParams",--%>
        <%--            /* dataType:"json", */--%>
        <%--            data:JSON.stringify(data),--%>
        <%--            contentType:"application/json",--%>

        <%--            success : function(result, status, req) {--%>
        <%--                alert('success:');--%>
        <%--                console.log("save success");--%>
        <%--                window.parent.location.reload();--%>
        <%--            },--%>
        <%--            error : function(req, status, reason) {--%>
        <%--                alert('Error:' + reason);--%>
        <%--            }--%>
        <%--        });--%>
        <%--        &lt;%&ndash;var data1={&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    userName:'#{usermessage.userName}',&ndash;%&gt;--%>
        <%--        &lt;%&ndash;    password:'#{usermessage.password}'&ndash;%&gt;--%>
        <%--        &lt;%&ndash;}&ndash;%&gt;--%>
        <%--        &lt;%&ndash;if(data==data1){&ndash;%&gt;--%>
        <%--            $("#submitBtn").bind('click', function () {--%>
        <%--                submit();--%>

        <%--            })--%>
        <%--    //     }--%>
        <%--     }--%>
        <%--}--%>
        <%--var userName=$("#userName").val();--%>
        <%--var userName1='#{usermessage.useName}';--%>
        <%--var password=$("#password").val();--%>
        <%--var password1='#{usermessage.password}';--%>
        <%--if(userName==userName1) {--%>
        <%--    if (password == password1) {--%>

        //     }
        // }


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

    </script>
</div>
</body>
</html>
