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
    
    <!-- 搜索结果开始 -->
     <div class="songs_rcmd" id="songs_rcmd">
     <div class="result">
             <table>
             <tbody>
              <c:forEach items="${result}" var="music" varStatus="status">
                 <tr onclick="play(${music.id})">
                 <td style="width:50px">${status.index+1}</td> 
                 <td class="w1"><a href="getInfo?id=${music.id}">${music.MName}</a></td>
                 <td></td>  
                 <td>${music.AName}</td>
                 </tr>
                </c:forEach> 
             </tbody>
             </table>	  
     </div>
     </div>                  
    <!--推荐内容 结束-->
    
    
    
    <!-- 搜索结果结束-->
    
<!-- 底部模板调用 开始 -->
<!-- 左侧播放器 开始-->
<div id="jp_container_N" class="jp-video jp-video-270p" role="application" aria-label="media player">
	<div class="jp-type-playlist">
		<div id="jquery_jplayer_N"class="jp-jplayer"></div>
		<div class="jp-gui">
			<!--<div class="jp-video-play">
				<button class="jp-video-play-icon" role="button" tabindex="0">播放</button>
			</div>-->
			<div class="jp-interface">
				<div class="jp-progress">
					<div class="jp-seek-bar">
						<div class="jp-play-bar"></div>
					</div>
				</div>
				<div class="jp-current-time" role="timer" aria-label="time"></div>
				<div class="jp-duration" role="timer" aria-label="duration"></div>
				<div class="jp-controls-holder">
					<div class="jp-controls">
						<button class="jp-previous" role="button" tabindex="0">上一曲</button>
						<button class="jp-play" role="button" tabindex="0">播放</button>
						<button class="jp-next" role="button" tabindex="0">下一曲</button>
						<button class="jp-stop" role="button" tabindex="0">暂停</button>
					</div>
					<div class="jp-volume-controls">
						<button class="jp-mute" role="button" tabindex="0">静音</button>
						<button class="jp-volume-max" role="button" tabindex="0">最大音量</button>
						<div class="jp-volume-bar">
							<div class="jp-volume-bar-value"></div>
						</div>
					</div>
					<div class="jp-toggles">
						<button class="jp-repeat" role="button" tabindex="0">重复</button>
						<button class="jp-shuffle" role="button" tabindex="0">随机</button>
						<!-- <button class="jp-givelike" role="button" tabindex="0">收藏</button> -->
					</div>
				</div>
				<div class="jp-details">
					<div class="jp-title" aria-label="title"></div>
				</div>
			</div>
		</div>
		<div class="jp-playlist">
        	<div class="jp-playlist-box">
                <ul>
                    <!-- 该方法使用无序列表displayplaylist()播放列表 -->
                    <li></li>
                </ul>
            </div>
		</div>
		<div class="jp-no-solution">
			<span>升级需要</span>
			您浏览器赞不支持播放，请更新版本
            <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash插件</a>.
		</div>
	</div>
    <!--歌曲列表滚动条-->
    <div class="scrollBar">
    	<div class="bar"></div>
    </div>
    <!--播放器展开隐藏按钮-->
    <button type="button" class="folded_bt" title="点击收缩" id="btnfold">
    	<span></span>
   	</button>
    <div id="listRemove"></div><!--移除全部歌曲按钮--> 
    <div id="listClose"></div><!--歌曲列表展开收缩按钮-->
</div>
<!-- 左侧播放器 结束-->

<!--底部 开始 -->
<div class="footer" id="footer">
	<div class="footer_cont">
    	<div class="footer_cont_left">
        	<p>
            	<a href="">关于我们</a>|<a href="">版权声明</a>|<a href="">诚聘英才</a>|
                <a href="">联系我们</a>|<a href="">历史合作</a>|<a href="">唱片公司</a>|
                <a href="">广告服务</a>|<a href="">友情链接</a>|<a href="">帮助中心</a>
            </p>
            <p>
            	Copyright © 2 pic5-2 pic6 <a href="">www.xxffcc.com</a> All Rights Reserved
            </p>
        </div>
        <div class="footer_cont_right">
        	<span>关注我们</span>
        	<ul>
            	<li><a href=""><span></span></a></li><li><a href=""><span></span></a></li>
                <li>
					<a href="" class="twoCode">
						<span></span>
						<img class="tCode" src="${pageContext.request.contextPath}/static/images/twoCode.jpg" width="100" height="100" alt="二维码" />
					</a>
				</li>
                <li><a href=""><span></span></a></li><li><a href=""><span></span></a></li>
            </ul>
        </div>
        <div id="toTop"></div>
    </div>

</div>
<!--底部 结束 -->
 
 
  
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script> --%>
<!--播放器js-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/player.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/playlist.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/player_database.js"></script>	
<!--播放器js-->
<!-- 底部模板调用 结束 -->
<script type="text/javascript">
function play(id){
	$.ajax({
		   type: "POST",
		   url: "getMusicById?id="+id+"",
		   data: "json",
		   success: function(music){
		    console.log(music);
		    myPlaylist.add({ 
			title:music.mname, artist:music.aname,
			//free:true,
			mp3:music.mpath,
			//oga:"",
			poster:music.mipath
		});
		myPlaylist.play(-1);
		   }

		});
};
</script>
</body>

</html>