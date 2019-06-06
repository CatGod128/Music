<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>找回密码</title>
<link rel="stylesheet" href="../static/css/Register.css" />
<style>
body{
  background:url("../static/img/2.jpg") no-repeat;
  background-size: 100%;
}
</style>
</head>
<body>

<div class="login-container">
	<h1>找回密码</h1>
	
	<form action="forgetPwd" method="post" id="forgetForm">
		<div>
			<input type="email" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false" onpaste="return false" />
		</div>
		<button id="submit" type="submit">发送邮箱</button>
	</form>

	<a href="register.jsp">
		<button type="button" class="register-tis">还有没有账号？</button>
	</a>

</div>


<script src="../static/js/jquery-3.3.1.js"></script>
<script src="../static/js/common.js"></script>
<!--背景图片自动更换-->
<!-- <script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script> -->
<!--表单验证-->
<script src="../static/js/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>