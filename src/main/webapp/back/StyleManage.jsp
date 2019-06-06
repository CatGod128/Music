<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分类管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
</head>
<body>
<div>
  <input type="text" name="name" id="in" />
<button onclick="saveStyle();">添加歌曲</button>
</div>
<hr>
<div id="style" role="navigation">
<ul id="ul" class="nav nav-pills">
	 <c:forEach items="${stylelist}" var="stylename">
    <li><a href="showstyle_music?sname=${stylename}">${stylename}</a></li>
   </c:forEach>
   </ul>
</div>
<hr>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
function saveStyle(){
	 var name=$('#in').val(); 
	$.ajax({
		  type : 'get',
	      url : "addStyle?name="+name+"",
	success:function(){	
		$("#ul").append(" <li><a href='showstyle_music?sname="+name+"'>"+name+"</a></li>"); 
	}});}
</script>
</html>