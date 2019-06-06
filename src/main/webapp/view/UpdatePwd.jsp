<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>.<link rel="stylesheet" href="../static/css/Register.css" />
</head>
<body>
<div class="register-container">
	<h1>大风车音乐网</h1>
	
	<div class="connect">
		<p>Link the world. Share to world.</p>
	</div>
	
	<form action="updatePwd" method="post" id="registerForm">
		<div>
			<input type="password" name="password" class="password" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="password" name="confirm_password" class="confirm_password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
	</form>
		<button  type="submit" onclick="update();">修改密码</button>
</div>
<script src="../static/js/jquery-3.3.1.js"></script>
<script src="../static/js/common.js"></script>
<!--背景图片自动更换-->
<!-- <script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script> -->
<!--表单验证-->
<script src="../static/js/jquery.validate.min.js?var1.14.0"></script>
<script type="text/javascript">
function update(){
	 var Data = new FormData($("form")[0]); 
		    $.ajax({
		        type : 'Post',
		        data : Data,
		        url : 'updatePwd',
		        dataType : 'json',
		        contentType: false, //必须
		        processData: false, //必须
		        success : function(data) {
		        	alert(data.data);
		        }
		    });
 }
</script>
</body>
</html>