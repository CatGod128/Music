<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>风车乐栈</title>
<meta name="keywords" content="风车乐栈,播放器,播放器下载,音乐,音乐下载,音乐播放器,MV,MTV,高清MV,热门MV,MV下载,mv在线观看" />
<meta name="description" content="风车乐栈是风车乐栈公司推出的一款免费音乐服务，海量乐库在线试听、最流行新歌在线首发、高品质音乐试听、正版音乐下载、MV观看等，是互联网音乐播放和下载的首选" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/player.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/common.css">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/modernizr.js"></script>
<script>
if ((!to3d()) || document.documentMode == 10 || document.documentMode == 11){ 
	window.location="error/error.html";
}
</script>
<style type="text/css">
.result{
  width:640px;
  margin:0 auto;
  color:#fff;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.w1 {
    width: 308px;
}
.result a {
color: #FFF;
}

</style>
</head>
<body>

<!-- 头部模板调用 开始 -->

<!--头部 开始-->
<div id="header">
    <!--顶部bar 开始-->
    <div class="nav_topbar">
        <div class="nav_topbar_cont">
            <ul>
            	<li><a href="">我的主页</a></li><li><a href="">个人中心</a></li><li><a href="">帮助中心</a></li>
            </ul>
            <!--用户登录-->
              <c:choose>
              <c:when test="${sessionScope.userName ==null}">
               <a class="user_login" href="javascript:;"><em></em>用户登录<i class="arrow"></i></a>
            <div style="display:none;" class="user_login_box"> 
                <p class="shadow_cover"></p>
                <div class="user_login_inner">
                    <form class="signin_form" method="post" action="login"> 
                        <input class="ipt" type="text" value="用户名" name="log"> 
                        <input class="ipt" type="password" value="密码" name="pwd"> 
                        <input name="rememberme" id="rememberme" checked="checked" value="forever" type="checkbox">记住密码
                        <input class="login_btn" type="submit" name="submit" value="登录">
                    </form>
                    <p> 
                        <a href=""><i class="sign"></i>注册</a> | 
                        <a href=""><i class="lock"></i>忘记密码？</a>
                    </p>
                </div>
            </div>
              </c:when>
            </c:choose>
           
            <!--用户登录-->
        </div>
    </div>
    <!--顶部bar 结束-->
  	<!--头部导航 开始-->
    <div id="headCont">
        <div class="main_nav">
			<!--LOGO-->
            <div class="logo"><a href=""><img src="${pageContext.request.contextPath}/static/images/logo.png" width="60" height="60" alt="logo"></a></div>
            <div class="logoName">
            	<a href=""><img src="${pageContext.request.contextPath}/static/images/logoName.png" width="120" height="60" alt="logoName"></a>
            </div>
            <!--主导航-->
            <ul class="navigation" id="main_nav">
                <li> <!--class="on" -->
                	<a href=""><span>音乐馆</span><span>音乐馆</span></a>
                </li>
                <li>
                	<a href="?cat=6"><span>MV</span><span>MV</span></a>
                </li>
                <li>
                	<a href="?cat=7"><span>我的音乐</span><span>我的音乐</span></a>
                </li>
                <li>
                	<a href="?cat=8"><span>下载客户端</span><span>下载客户端</span></a>
                </li>
                <audio id="audioPlayer"></audio>
            </ul>
            <div class="user_info">
            <c:choose>
              <c:when test="${sessionScope.userName !=null}">
              <div class="user_photo"><a href=""><img src="${pageContext.request.contextPath}/static/images/user_photo.png" /></a></div>
                <a class="nikeName" href="">${sessionScope.userName}</a>
                <a class="user_info_list" href=""><span>8</span><span>歌单</span></a>
                <a class="user_info_list" href=""><span>3</span><span>收听</span></a>
                <a class="user_info_list" href=""><span>0</span><span>听众</span></a>
              </c:when>
            </c:choose>	
            </div>
        </div>
    	<!--二级导航-->
        <nav class="sub_nav">
            <div class="nav_list">
                <ul>
                    <li>
                    	<a href="" class="smallogo">
                        	<span class="mini_logo"></span>
                        </a>
                    </li>
                    <li><a href="" class="home">首页</a></li>
                    
                    <div class="sub_list" id="sub_list">
                        <p class="active">
                        	<a href="?cat=9">独家首发</a><a href="?cat=10">歌单广场</a>
							<a href="?cat=11">歌手</a>
                            <a href="?cat=12">专辑</a><a href="?cat=13">电台</a>
                        </p>
                        <p>
                        	<a href="?cat=6">MV推荐</a><a href="?cat=6">MV库</a>
                            <a href="?cat=6">MV专题</a><a href="?cat=6">音乐现场</a>
                        </p>
                        <p>
                        	<a href="?cat=7">主页</a><a href="?cat=7">歌单</a>
                            <a href="?cat=7">收听</a><a href="?cat=7">听众</a>
                            <a href="?cat=7">MV收藏</a>
                        </p>
                        <p>
                        	<a href="?cat=8">电脑版本</a><a href="?cat=8">pad版本</a>
                            <a href="?cat=8">手机版本</a>
                        </p>
                    </div>
                    
                    <!--搜索框 开始-->
                    <div class="search_box">
                        <form role="search" method="post" id="searchform" class="searchform" action="query">
							<input type="submit" value="" class="search_btn" id="searchsubmit" />
							<input type="text" class="search" value="搜索好音乐" name="query" id="s" />
						</form>
                        <!--搜索下拉菜单-->
                        <div class="hot_search" id="hot_search">
                            <div>
                                <span><a href="javascript:;">陈奕迅</a><font>171万</font></span>
                                <div>
                                    <span><a href="javascript:;">周杰伦</a><font>164万</font></span>
                                    <div>
                                        <span><a href="javascript:;">G.E.M. 邓紫棋</a><font>107万</font></span>
                                        <div>
                                            <span><a href="javascript:;">泡沫</a><font>90万</font></span>
                                            <div>
                                                <span><a href="javascript:;">林俊杰</a><font>62万</font></span>
                                                <div>
                                                    <span><a href="javascript:;">本兮</a><font>57万</font></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>             
                        </div>
                        <!--搜索下拉菜单-->        
                    </div>
                    <!--搜索框 结束-->
                </ul>
            </div>
        </nav>
    </div>
  	<!--头部导航  结束-->
</div>
<!--头部 结束-->
<!-- 头部模板调用 结束 -->
   <HR align=center width=732 color=#987cb9 SIZE=1>
   <from method="post" action="Command">
     <textarea name="text" cols="100" rows="10" maxlength="30" class="text"></textarea><br>
     <input type="submit" value="评论">
   </from>
    <div lang="en-US" class="gitment-container gitment-comments-container">
        <ul class="gitment-comments-list">
         <c:forEach items="${commands}" var="command">
            <li class="gitment-comment">
                <a class="gitment-comment-avatar">
                    <img class="gitment-comment-avatar-img" src="${command.img}">
                </a>
                <div class="gitment-comment-main">
                    <div class="gitment-comment-header">
                        <a class="gitment-comment-name">
                            ${command.userName}
                        </a>
                        <span>${command.createTime}</span>

                        <div class="gitment-comment-like-btn">
                            <svg class="gitment-heart-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
                                <path d="M25 39.7l-.6-.5C11.5 28.7 8 25 8 19c0-5 4-9 9-9 4.1 0 6.4 2.3 8 4.1 1.6-1.8 3.9-4.1 8-4.1 5 0 9 4 9 9 0 6-3.5 9.7-16.4 20.2l-.6.5zM17 12c-3.9 0-7 3.1-7 7 0 5.1 3.2 8.5 15 18.1 11.8-9.6 15-13 15-18.1 0-3.9-3.1-7-7-7-3.5 0-5.4 2.1-6.9 3.8L25 17.1l-1.1-1.3C22.4 14.1 20.5 12 17 12z"></path>
                            </svg>
                            ${command.giveLike}
                        </div>
                    </div>
                    <div class="gitment-comment-body gitment-markdown"><p>${command.content}</p></div>
                </div>
                </li>
                </c:forEach>
        </ul>
    </div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
</html>