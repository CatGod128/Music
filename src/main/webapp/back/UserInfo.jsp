<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
 input{
  text-align:center;
 }
</style>
</head>
<body>
<form id="form1"  enctype="multipart/form-data">
   <table border="1" width="60%" cellpadding="2">
        <caption>用户信息</caption>
        <tr align="center">
            <td>用户名称</td>
            <td>用户头像</td>
            <td>用户邮箱</td>
            <td>联系方式</td>
            <td>用户密码</td>
            <td>注册时间</td>
        </tr>
        <tr align="center">
            <td><input id="username" name="username" value="${user.userName}" readonly="readonly"/></td>
            <td> <img id="img0"  name="123"alt="" src="${user.img}"></td>
            <td><input type="text" name="email" value="${user.email}"/></td>
            <td><input type="text" name="phone" value="${user.phone}"/></td>
            <td><input type="text" name="password" value="${user.passWord}" readonly="readonly"/></td>
            <td><input type="text" name="registerDate" value="${user.registerdate}" readonly="readonly"/></td>
        </tr>
    </table>
</form> 
<button onclick="update(${user.id})">修改</button>
</body>
<script src="../static/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
   function update(id){
	 var Data = new FormData($("form")[0]); 
		    $.ajax({
		        type : 'Post',
		        data : Data,
		        url : 'update',
		        dataType : 'json',
		        contentType: false, //必须
		        processData: false, //必须
		        success : function(data) {
		           alert(data.msg);
		        }
		    });
   }  
   function  parserDate(date) {
	      var t = Date.parse(date);
	      if (!isNaN(t)) {
	        return new Date(Date.parse(date.replace(/-/g, '/')))
	      }
	    }
  
</script>
</html>