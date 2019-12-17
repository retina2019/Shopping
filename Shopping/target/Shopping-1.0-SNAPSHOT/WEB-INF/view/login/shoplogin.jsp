<%--
  Created by IntelliJ IDEA.
  User: stone
  Date: 2019-12-15
  Time: 12:30
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
    <script src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.js"></script>
    <script src="/Shopping/H-ui.admin/lib/jquery/1.9.1/jquery.min.js"></script>
    <script src="/Shopping/H-ui.admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
    <script src="/Shopping/H-ui.admin/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/Shopping/H-ui.admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
</head>
<body >
<div align="center"><br>
    <H1>商家登入</H1>
    <form  id="shoplogin" name="form1" method="post" action="/Shopping/shop/sendParams" >
        <table width="90%">
            <tr>
                <td width="50%" height="30" align="right">商户名：</td>
                <td width="50%" height="30" align="left"> <input  id="shopName" type="text" name="shopName" ></td>
            </tr>
            <tr>
                <td width="50%" height="30" align="right">Tel：</td>
                <td width="50%" height="30" align="left"> <input id="tel" type="text" name="tel" ></td>
            </tr>
            <tr>
                <td width="100%" height="40" align="center" colspan="2">
                    <input id="submitBtn" type="button" name="sub" value="商家登录" class="btn btn-primary radius" onclick="tijiao();">
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript">
        //判断表单数据是否正确
        var checkData = function(){
            var shopName = $("#shopName").val();
            if(shopName==""){
                alert("商户名不可为空");
            return false;
        }
        var tel = $("#tel").val();
            if(tel==""){
                alert("电话不可为空");
                return false;
            }
            return true;

        }
        //提交表单数据
        var tijiao = function(){//定义submit ,submit的功能如下

            if (checkData()){//判断数据
                var data={//定义一个名为data的变量
                    shopName:$("#shopName").val(),//获取username值
                    tel:$("#tel").val(),/* 获取password值 */
                }
                //$('#submitBtn').click(function() {/* 通过点击提交按钮，触发点击事件 */
                $('#shoplogin').submit();/* 提交表单数据 */
                //});
            }
        }

    </script>
</div>
</body>
</html>
