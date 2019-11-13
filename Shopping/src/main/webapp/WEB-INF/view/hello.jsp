<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello world</title>
</head>
<body>
	Hello world!!!
	<br>
	========
	message:${message}

	<br/>
	<br/>
	<form method="POST" action="/WebProject/annotation/sendParams">
		用户名：<input name="username">


		<br>
		<input type="submit">
		<br>
		<input type="button" id="subBtn" value="btn提交">
		<br>
		<input type="button" id="subBtn2" value="btn提交2">
	</form>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#subBtn").bind('click',function(e){
				e.preventDefault();
		        var obj = $(this);
		        var name = $("input[name='username']").val();
		        //var phone = $("input[name='phone']").val();
		        $.ajax({
		          url : "/WebProject/annotation/ajaxPost",
		          type : "POST",
		          contentType : "application/json",
		          //contentType : "application/x-www-form-urlencoded",
		          dateType:"json",
		          data : JSON.stringify({username:name,password:"psd"}),
		          //dataType : "text",
		          success : function(result, status, req) {
			          	alert('success:');
		              //$(".noticeInfo").css("display", "block");
		          },
		          error : function(req, status, reason) {
		          	alert('Error:' + reason);
		        	  //$(".noticeInfo").css("display", "block").text('Error:' + reason);
		          }
		        })
		        return false;
			});

			$("#subBtn2").bind('click',function(e){
				e.preventDefault();
		        var obj = $(this);
		        var name = $("input[name='username']").val();
		        $.ajax({
		          url : "/WebProject/annotation/sendParams",
		          type : "POST",
		          //contentType : "application/json",
		          contentType : "application/x-www-form-urlencoded",
		          dateType:"json",
		          data : JSON.stringify({username:name,password:"psd"}),
		          //dataType : "text",
		          success : function(result, status, req) {
			          	alert('success:');
		              //$(".noticeInfo").css("display", "block");
		          },
		          error : function(req, status, reason) {
		          	alert('Error:' + reason);
		        	  //$(".noticeInfo").css("display", "block").text('Error:' + reason);
		          }
		        })
		        return false;
			});
		});

	</script>

</body>
</html>
