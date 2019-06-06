<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${user.userName}的主页</title>
   <link rel="stylesheet" href="../static/css/bootstrap.min.css">
   <link rel="stylesheet" href="../static/css/mainpage.css"> 
 <link rel="stylesheet" type="text/css" href="../static/css/mymusic.css">
 <style type="text/css">
 .tabContent{
  margin-top:57px;
  border: 0px solid #f60; 
 }
 .tabContent div{
  border: 1px solid #f60; 
  width:800px; 
  height: 250px; 
  padding: 15px;
  }
  .hide{ display: none;}
 </style>
</head>
<body>
<div class="headerbg">
    <div class="geRenZiLiao">
        <div class="touxiang">
            <img src="${pageContext.request.contextPath}/static/images/user_photo.png" class="img-circle txborder">
        </div>
        <ul class="gzfs">
            <li class="guanzhu">
                <strong class="gznumber"><a href="">${user.userName}</a></strong>
            </li>
        </ul>
        <div class="headernav">
        <!-- 标签标题 -->
        <ul class="gzfs">
            <li class="guanzhu"><a href="UserInfo?id=${user.id}" class="hnava" target="content">编辑资料</a></li>
            <li class="guanzhu"><a href="view/UpdatePwd.jsp" class="hnava" target="content">修改密码</a></li>
            <li class="guanzhu"><a href="view/CollectMusic.jsp" class="hnava" target="content">我的收藏</a></li>
            <li class="guanzhu"><a href="#" class="hnava" target="content">我的云盘</a></li>
         </ul>
        </div>
    </div>
</div>
<iframe name="content" noresize="noresize" scrolling="no" width=100% height="500px"></iframe>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript">

</script>
</html>