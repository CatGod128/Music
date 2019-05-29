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
        <caption>歌手信息</caption>
        <tr align="center">
            <td>歌手名称</td>
            <td>歌手图片</td>
            <td>歌手性别</td>
            <td>歌手生日</td>
            <td>歌手描述</td>
        </tr>
        <tr align="center">
            <td><input id="Aname" name="Aname" value="${artist.AName}" readonly="readonly"/></td>
            <td> <img id="img0"  name="123"alt="" src="${artist.AIPath}">
            <input type="file" name="AIFile" id="file0" style="opacity:0;width:50px;" /></td>
            <td><c:choose>
                 <c:when test="${artist.sex==0}"> 
                 <input name="Sex" value="女" readonly="readonly"/>
                 </c:when> 
                  <c:when test="${artist.sex==1}"> 
                 <input name="Sex" value="男" readonly="readonly"/>
                 </c:when>          
              </c:choose>
            <td><input type="date" name="birthday" value="${artist.birthday}"/></td>
            <td><textarea name="summary" cols="50" rows="10">${artist.summary}</textarea></td>
        </tr>
    </table>
</form> 
<button onclick="update(${artist.id})">修改</button>
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
   $("#file0").change(function(){  
		 var objUrl = getObjectURL(this.files[0]) ;//获取文件信息  
		 console.log("objUrl = "+objUrl);  
		  if (objUrl) {  
		  $("#img0").attr("src", objUrl);  
		 }   
}) ;  
function getObjectURL(file) {  
		 var url = null;   
		 if (window.createObjectURL!=undefined) {  
		  url = window.createObjectURL(file) ;  
		 } else if (window.URL!=undefined) { // mozilla(firefox)  
		  url = window.URL.createObjectURL(file) ;  
		 } else if (window.webkitURL!=undefined) { // webkit or chrome  
		  url = window.webkitURL.createObjectURL(file) ;  
		 }  
		 return url ;  
		}  
</script>
</html>