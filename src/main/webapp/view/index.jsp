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
</head>
<body>

<!-- 头部模板调用 开始 -->

<!--头部 开始-->
<div id="header">
    <!--顶部bar 开始-->
    <div class="nav_topbar">
        <div class="nav_topbar_cont">
            <!--用户登录-->
              <c:choose>
              <c:when test="${sessionScope.userName ==null}">
               <a class="user_login" href="javascript:;"><em></em>用户登录<i class="arrow"></i></a>
            <div style="display:none;" class="user_login_box"> 
                <p class="shadow_cover"></p>
                <div class="user_login_inner">
                    <form class="signin_form" method="post" action="login"> 
                        <input class="ipt" type="text" value="邮箱" name="log"> 
                        <input class="ipt" type="password" value="密码" name="pwd"> 
                        <input name="rememberme" id="rememberme" checked="checked" value="forever" type="checkbox">记住密码
                        <input class="login_btn" type="submit" name="submit" value="登录">
                    </form>
                    <p> 
                        <a href="${pageContext.request.contextPath}/view/register.jsp"><i class="sign"></i>注册</a> | 
                        <a href="${pageContext.request.contextPath}/view/findPwd.jsp"><i class="lock"></i>忘记密码？</a>
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
                	<a href="?cat=6"><span>曲风</span><span>曲风</span></a>
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
              <div class="user_photo"><a href="MyInfo"><img src="${pageContext.request.contextPath}/static/images/user_photo.png" /></a></div>
                <a class="nikeName" href="logout">${sessionScope.userName}</a>
            <!--     <a class="user_info_list" href=""><span>8</span><span>收藏</span></a>
                <a class="user_info_list" href=""><span>3</span><span>个人中心</span></a> -->
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
                        	<a href="?cat=6">流行</a><a href="?cat=6">摇滚</a>
                            <a href="?cat=6">安静</a><a href="?cat=6">民谣</a>
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

<!-- 音乐馆 模块 开始  default-->
<section class="section_cont">
    <!--轮播图 开始 -->
    <div class="main_banner">
        <div class="main_banner_bg"></div>
        <div class="main_banner_wrap">
			<canvas id="myCanvas" width="150" height="150"></canvas>
            <div class="main_banner_box" id="m_box">
                <a href="javascript:void(0)" class="banner_btn js_pre">
                    <span class="banner_btn_arrow"><i></i></span>
                </a>
                <a href="javascript:void(0)" class="banner_btn btn_next js_next">
                    <span class="banner_btn_arrow"><i></i></span>
                </a>
                <ul>
                    <li id="imgCard0">
                        <a href=""><span style="opacity:0;"></span></a>      
                        <img src="${pageContext.request.contextPath}/static/main_banner/big0020150102211033.jpg" alt="">
                        <p style="bottom:0">周杰伦粉丝版MV</p>
                    </li> 
                    <li id="imgCard1">
                        <a href=""><span style="opacity:0.4;"></span></a>      
                        <img src="${pageContext.request.contextPath}/static/main_banner/big0120150101183428.jpg" alt="">
                        <p>乐侃有声节目第二期</p>
                    </li> 
                    <li id="imgCard2">
                        <a href=""><span style="opacity:0.4;" ></span></a>        
                        <img src="${pageContext.request.contextPath}/static/main_banner/big0320150101183351.jpg" alt="">
                        <p>乐见大牌：”荣“耀之声，”维“我独尊</p>
                    </li> 
                    <li id="imgCard3">
                        <a href=""><span style="opacity:0.4;"></span></a>      
                        <img src="${pageContext.request.contextPath}/static/main_banner/big0420150101224343.jpg" alt="">
                        <p>王力宏四年心血结晶</p>
                    </li> 
                    <li id="imgCard4">
                        <a href=""><span style="opacity:0.4;"></span></a>      
                        <img src="${pageContext.request.contextPath}/static/main_banner/big0720150102210934.jpg" alt="">
                        <p>MV精选：《武媚》女神团美艳大比拼</p>
                    </li> 
                </ul>
                <!--火狐倒影图层-->
                <p id="rflt"></p>
                <!--火狐倒影图层-->
            </div>
            <!--序列号按钮-->
            <div class="btn_list">
                <span class="curr"></span><span></span><span></span><span></span><span></span>        
            </div>
        </div>
    </div>
    <!--轮播图 结束 -->
    
    <!--在线首发 开始-->
    <div class="new_songs new_common">
        <!--标题 开始-->
        <div class="new_songs_title new_common_title">
            <span></span>
            <a href="?cat=12" class="more"></a>
            <a id="albumNext" href="javascript:;"></a>
            <a id="albumPrev" href="javascript:;"></a>
            <em>/ 2</em><em class="pageNum">1</em>
        </div>
        <!--标题 结束-->
        <!--第1页-->
        <ul class="show">
						            <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=19"><img width="220" height="220" src="${pageContext.request.contextPath}/static/pic/album1-220x220.jpg" class="attachment-220x220 wp-post-image" alt="你好，再见 - 戚薇" />                        <span><em>你好，再见</em><em>戚薇</em><i></i></span></a>	
                    </p>
                    <a href="?p=19"><span>歌曲</span><strong>4</strong></a>
                    <a href="?p=19"><span>试听</span><strong>1950<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=16"><img width="220" height="220" src="${pageContext.request.contextPath}/static/pic/album2-220x220.jpg" class="attachment-220x220 wp-post-image" alt="帽子戏法 - 魏晨" />                        <span><em>帽子戏法</em><em>魏晨</em><i></i></span></a>	
                    </p>
                    <a href="?p=16"><span>歌曲</span><strong>5</strong></a>
                    <a href="?p=16"><span>试听</span><strong>1860<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=13"><img width="220" height="220" src=" ${pageContext.request.contextPath}/static/pic/album3-220x220.jpg" class="attachment-220x220 wp-post-image" alt="哎呦，不错哦 - 周杰伦" />                        <span><em>哎呦，不错哦</em><em>周杰伦</em><i></i></span></a>	
                    </p>
                    <a href="?p=13"><span>歌曲</span><strong>12</strong></a>
                    <a href="?p=13"><span>试听</span><strong>3750<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="get?p=10"><img width="220" height="220" src="${pageContext.request.contextPath}/static/pic/album4-220x220.jpg" class="attachment-220x220 wp-post-image" alt="修炼爱情 - 林俊杰" />                        <span><em>修炼爱情</em><em>林俊杰</em><i></i></span></a>	
                    </p>
                    <a href="get?p=10"><span>歌曲</span><strong>12</strong></a>
                    <a href="get?p=10"><span>试听</span><strong>4020<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=7" onlick="javasrcipt;"><img width="220" height="220" src=" ${pageContext.request.contextPath}/static/pic/album5-220x220.jpg" class="attachment-220x220 wp-post-image" alt="album5" />                        <span><em>三十未满</em><em>苏醒</em><i></i></span></a>	
                    </p>
                    <a href="?p=7"><span>歌曲</span><strong>12</strong></a>
                    <a href="?p=7"><span>试听</span><strong>2060<em>万</em></strong></a>
                </div>
            </li>
                    </ul>
        <!--第2页-->
        <ul class="albumList">
            			            <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=34"><img width="220" height="220" src="${pageContext.request.contextPath}/static/pic/album6-220x220.jpg" class="attachment-220x220 wp-post-image" alt="敬女人" />                        <span><em>敬女人</em><em>徐若瑄</em><i></i></span></a>	
                    </p>
                    <a href="?p=34"><span>歌曲</span><strong>4</strong></a>
                    <a href="?p=34"><span>试听</span><strong>3180<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=31"><img width="220" height="220" src="${pageContext.request.contextPath}/static/pic/album7-220x220.jpg" class="attachment-220x220 wp-post-image" alt="罪恶感" />                        <span><em>罪恶感</em><em>A-Lin</em><i></i></span></a>	
                    </p>
                    <a href="?p=31"><span>歌曲</span><strong>6</strong></a>
                    <a href="?p=31"><span>试听</span><strong>3952<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=28"><img width="220" height="220" src=" ${pageContext.request.contextPath}/static/pic/album8-220x220.jpg" class="attachment-220x220 wp-post-image" alt="太歌 冬" />                        <span><em>太歌 冬</em><em>胡彦斌</em><i></i></span></a>	
                    </p>
                    <a href="?p=28"><span>歌曲</span><strong>12</strong></a>
                    <a href="?p=28"><span>试听</span><strong>2125<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=25"><img width="220" height="220" src="${pageContext.request.contextPath}/static/pic/album9-220x220.jpg" class="attachment-220x220 wp-post-image" alt="学着爱" />                        <span><em>学着爱</em><em>周兴哲</em><i></i></span></a>	
                    </p>
                    <a href="?p=25"><span>歌曲</span><strong>12</strong></a>
                    <a href="?p=25"><span>试听</span><strong>2464<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=22"><img width="220" height="220" src="${pageContext.request.contextPath}/static/pic/album10-220x220.jpg" class="attachment-220x220 wp-post-image" alt="黑暗中的微笑" />                        <span><em>敢爱敢当</em><em>丁当</em><i></i></span></a>	
                    </p>
                    <a href="?p=22"><span>歌曲</span><strong>20</strong></a>
                    <a href="?p=22"><span>试听</span><strong>3412060<em>万</em></strong></a>
                </div>
            </li>
                    </ul>
    </div>
    <!--在线首发 结束-->
    
    <!--MV首播 开始-->
    <div class="new_mv new_common">
        <!--标题 开始-->
        <div class="new_mv_title new_common_title index_mv_title">
            <span></span>
            <a href="?cat=6" class="more"></a>
            <ul>
                <li><a class="cur" href="javascript:;">首播</a></li>
                <li><a href="javascript:;">内地</a></li>
                <li><a href="javascript:;">港台</a></li>
            </ul>
        </div>
        <!--标题 结束-->
        <div class="new_mv_body index_mv_body">
            <!--1首播-->
            <div class="mvList" style="display:block;">
                <ul class="sb">
										                    <li>
                        <a href="?p=106">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_10.jpg" class="attachment-220x125 wp-post-image" alt="mv_1x2_10" />                            <strong>在你耳边说</strong>
                            <strong>周兴哲</strong>
                            <span>
                                <font>在你耳边说 &#8211; 周兴哲</font>
                                <font><i></i></font>
                                <font><i></i>1042425<em>2 pic4-12-31</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=104">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_9.jpg" class="attachment-220x125 wp-post-image" alt="蓝色圣诞节 - 徐若瑄" />                            <strong>蓝色圣诞节</strong>
                            <strong>徐若瑄</strong>
                            <span>
                                <font>蓝色圣诞节 &#8211; 徐若瑄</font>
                                <font><i></i></font>
                                <font><i></i>6392509<em>2 pic4-12-23</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=102">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_8.jpg" class="attachment-220x125 wp-post-image" alt="不改再是旧的 - 孙子涵" />                            <strong>不该再是旧的</strong>
                            <strong>孙子涵</strong>
                            <span>
                                <font>不该再是旧的 &#8211; 孙子涵</font>
                                <font><i></i></font>
                                <font><i></i>1237569<em>2 pic4-12-31</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=100">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_18.jpg" class="attachment-220x125 wp-post-image" alt="花开那年 - 魏晨" />                            <strong>花开那年</strong>
                            <strong>魏晨</strong>
                            <span>
                                <font>花开那年 -魏晨</font>
                                <font><i></i></font>
                                <font><i></i>1377190<em>2 pic4-10-03</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=98">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_6.jpg" class="attachment-220x125 wp-post-image" alt="Play 我呸 - 蔡依林" />                            <strong>Play 我呸</strong>
                            <strong>蔡依林</strong>
                            <span>
                                <font>Play 我呸 &#8211; 蔡依林</font>
                                <font><i></i></font>
                                <font><i></i>8377190<em>2 pic4-11-02</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=56">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_1.jpg" class="attachment-220x125 wp-post-image" alt="可惜没如果 - 林俊杰" />                            <strong>可惜没如果</strong>
                            <strong>林俊杰</strong>
                            <span>
                                <font>可惜没如果 &#8211; 林俊杰</font>
                                <font><i></i></font>
                                <font><i></i>8457190<em>2 pic4-12-19</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=52">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_2.jpg" class="attachment-220x125 wp-post-image" alt="裂心 - 王力宏" />                            <strong>裂心</strong>
                            <strong>王力宏</strong>
                            <span>
                                <font>裂心 &#8211; 王力宏</font>
                                <font><i></i></font>
                                <font><i></i>10577190<em>2 pic5- pic- pic</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=48">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_3.jpg" class="attachment-220x125 wp-post-image" alt="算什么男人 - 周杰伦" />                            <strong>算什么男人</strong>
                            <strong>周杰伦</strong>
                            <span>
                                <font>算什么男人 &#8211; 周杰伦</font>
                                <font><i></i></font>
                                <font><i></i>15377190<em>2 pic4-12-26</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=44">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_4.jpg" class="attachment-220x125 wp-post-image" alt="你身边的 - 魏晨" />                            <strong>你身边的</strong>
                            <strong>魏晨</strong>
                            <span>
                                <font>你身边的 &#8211; 魏晨</font>
                                <font><i></i></font>
                                <font><i></i>7377190<em>2 pic4-12-23</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=38">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/congcongnanian.jpg" class="attachment-220x125 wp-post-image" alt="匆匆那年 - 王菲" />                            <strong>匆匆那年</strong>
                            <strong>王菲</strong>
                            <span>
                                <font>匆匆那年 &#8211; 王菲</font>
                                <font><i></i></font>
                                <font><i></i>12377190<em>2 pic4-11-03</em></font>
                            </span>
                        </a>
                    </li>
					                </ul>
				
            </div>
            <!--2内地-->
            <div class="mvList">
                <ul>
										                    <li>
                        <a href="?p=121">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_17.jpg" class="attachment-220x125 wp-post-image" alt="绝口不提-柳岩" />                            <strong>绝口不提</strong>
                            <strong>柳岩</strong>
                            <span>
                                <font>绝口不提 &#8211; 柳岩</font>
                                <font><i></i></font>
                                <font><i></i>1449662<em>2 pic4-10-14</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=116">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_141.jpg" class="attachment-220x125 wp-post-image" alt="Lucky Lucky-戚薇" />                            <strong>Lucky Lucky</strong>
                            <strong>戚薇</strong>
                            <span>
                                <font>Lucky Lucky &#8211; 戚薇</font>
                                <font><i></i></font>
                                <font><i></i>2251664<em>2 pic4-10-27</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=113">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_16.jpg" class="attachment-220x125 wp-post-image" alt="永远 (舞蹈版)-张靓颖" />                            <strong>永远 (舞蹈版)</strong>
                            <strong>张靓颖</strong>
                            <span>
                                <font>永远 (舞蹈版) &#8211; 张靓颖</font>
                                <font><i></i></font>
                                <font><i></i>719622<em>2 pic4-10-22</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=110">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_15.jpg" class="attachment-220x125 wp-post-image" alt="小鸡小鸡 - 王蓉" />                            <strong>小鸡小鸡</strong>
                            <strong>王蓉</strong>
                            <span>
                                <font>小鸡小鸡 &#8211; 王蓉</font>
                                <font><i></i></font>
                                <font><i></i>4578418<em>2 pic4-10-29</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=102">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_8.jpg" class="attachment-220x125 wp-post-image" alt="不改再是旧的 - 孙子涵" />                            <strong>不该再是旧的</strong>
                            <strong>孙子涵</strong>
                            <span>
                                <font>不该再是旧的 &#8211; 孙子涵</font>
                                <font><i></i></font>
                                <font><i></i>1237569<em>2 pic4-12-31</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=100">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_18.jpg" class="attachment-220x125 wp-post-image" alt="花开那年 - 魏晨" />                            <strong>花开那年</strong>
                            <strong>魏晨</strong>
                            <span>
                                <font>花开那年 -魏晨</font>
                                <font><i></i></font>
                                <font><i></i>1377190<em>2 pic4-10-03</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=64">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_13.jpg" class="attachment-220x125 wp-post-image" alt="傻样 - 赵奕欢" />                            <strong>傻样</strong>
                            <strong>赵奕欢</strong>
                            <span>
                                <font>傻样 &#8211; 赵奕欢</font>
                                <font><i></i></font>
                                <font><i></i>1243769<em>2 pic4-10-29</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=60">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_11.jpg" class="attachment-220x125 wp-post-image" alt="有一种勇气叫放弃 - 丁当" />                            <strong>有一种勇气叫放弃</strong>
                            <strong>丁当</strong>
                            <span>
                                <font>有一种勇气叫放弃 &#8211; 丁当</font>
                                <font><i></i></font>
                                <font><i></i>1358666<em>2 pic4-10-29</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=44">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_4.jpg" class="attachment-220x125 wp-post-image" alt="你身边的 - 魏晨" />                            <strong>你身边的</strong>
                            <strong>魏晨</strong>
                            <span>
                                <font>你身边的 &#8211; 魏晨</font>
                                <font><i></i></font>
                                <font><i></i>7377190<em>2 pic4-12-23</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=38">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/congcongnanian.jpg" class="attachment-220x125 wp-post-image" alt="匆匆那年 - 王菲" />                            <strong>匆匆那年</strong>
                            <strong>王菲</strong>
                            <span>
                                <font>匆匆那年 &#8211; 王菲</font>
                                <font><i></i></font>
                                <font><i></i>12377190<em>2 pic4-11-03</em></font>
                            </span>
                        </a>
                    </li>
					                </ul>
				
            </div>
            <!--3港台-->
            <div class="mvList">
                <ul>
										                    <li>
                        <a href="?p=143">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_30.jpg" class="attachment-220x125 wp-post-image" alt="光辉岁月(feat. 张心杰)" />                            <strong>光辉岁月</strong>
                            <strong>(feat. 张心杰)</strong>
                            <span>
                                <font>光辉岁月 &#8211; (feat. 张心杰)</font>
                                <font><i></i></font>
                                <font><i></i>6494100<em>2 pic4-09-05</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=140">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_28-220x125.jpg" class="attachment-220x125 wp-post-image" alt="找自己-中国好声音第三季" />                            <strong>找自己</strong>
                            <strong>中国好声音第三季</strong>
                            <span>
                                <font>找自己 &#8211; 中国好声音第三季</font>
                                <font><i></i></font>
                                <font><i></i>584354<em>2 pic4-09-12</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=137">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_25.jpg" class="attachment-220x125 wp-post-image" alt="龙卷风-G.E.M. 邓紫棋" />                            <strong>龙卷风</strong>
                            <strong>G.E.M. 邓紫棋</strong>
                            <span>
                                <font>龙卷风 &#8211; G.E.M. 邓紫棋</font>
                                <font><i></i></font>
                                <font><i></i>3204658<em>2 pic4-09-26</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=106">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_10.jpg" class="attachment-220x125 wp-post-image" alt="mv_1x2_10" />                            <strong>在你耳边说</strong>
                            <strong>周兴哲</strong>
                            <span>
                                <font>在你耳边说 &#8211; 周兴哲</font>
                                <font><i></i></font>
                                <font><i></i>1042425<em>2 pic4-12-31</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=104">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_9.jpg" class="attachment-220x125 wp-post-image" alt="蓝色圣诞节 - 徐若瑄" />                            <strong>蓝色圣诞节</strong>
                            <strong>徐若瑄</strong>
                            <span>
                                <font>蓝色圣诞节 &#8211; 徐若瑄</font>
                                <font><i></i></font>
                                <font><i></i>6392509<em>2 pic4-12-23</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=98">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_6.jpg" class="attachment-220x125 wp-post-image" alt="Play 我呸 - 蔡依林" />                            <strong>Play 我呸</strong>
                            <strong>蔡依林</strong>
                            <span>
                                <font>Play 我呸 &#8211; 蔡依林</font>
                                <font><i></i></font>
                                <font><i></i>8377190<em>2 pic4-11-02</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=69">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_21.jpg" class="attachment-220x125 wp-post-image" alt="我存在 - 谢霆锋" />                            <strong>我存在</strong>
                            <strong>谢霆锋</strong>
                            <span>
                                <font>我存在 &#8211; 谢霆锋</font>
                                <font><i></i></font>
                                <font><i></i>592295<em>2 pic4-10-14</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=56">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_1.jpg" class="attachment-220x125 wp-post-image" alt="可惜没如果 - 林俊杰" />                            <strong>可惜没如果</strong>
                            <strong>林俊杰</strong>
                            <span>
                                <font>可惜没如果 &#8211; 林俊杰</font>
                                <font><i></i></font>
                                <font><i></i>8457190<em>2 pic4-12-19</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=52">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_2.jpg" class="attachment-220x125 wp-post-image" alt="裂心 - 王力宏" />                            <strong>裂心</strong>
                            <strong>王力宏</strong>
                            <span>
                                <font>裂心 &#8211; 王力宏</font>
                                <font><i></i></font>
                                <font><i></i>10577190<em>2 pic5- pic- pic</em></font>
                            </span>
                        </a>
                    </li>
					                    <li>
                        <a href="?p=48">
                            <img width="220" height="125" src="${pageContext.request.contextPath}/static/pic/mv_1x2_3.jpg" class="attachment-220x125 wp-post-image" alt="算什么男人 - 周杰伦" />                            <strong>算什么男人</strong>
                            <strong>周杰伦</strong>
                            <span>
                                <font>算什么男人 &#8211; 周杰伦</font>
                                <font><i></i></font>
                                <font><i></i>15377190<em>2 pic4-12-26</em></font>
                            </span>
                        </a>
                    </li>
					                    
                </ul>
            </div>
        </div>
    </div>
    <!--MV首播 结束-->
    
    <!--新歌推荐 开始-->
    <!--标题 开始-->
    <div class="songs_rcmd_title">
        <div class="rcmd_left_title rcmd_title">
            <span></span>
            <a href="" class="play_btn"></a>
            <a href="" class="add_btn"></a>
            <a href="" class="more"></a>
        </div>
        <div class="rcmd_center_title rcmd_title">
            <span></span>
            <a href="" class="play_btn"></a>
            <a href="" class="add_btn"></a>
            <a href="" class="more"></a>
        </div>
        <div class="rcmd_right_title rcmd_title">
            <span></span>
            <a href="" class="play_btn"></a>
            <a href="" class="add_btn"></a>
            <a href="" class="more"></a>
        </div>
    </div>
    <!--标题 结束-->
    <!--推荐内容 开始-->
    <div class="songs_rcmd" id="songs_rcmd">
        <div class="songs_rcmd_cont">
            <ul class="rcmd_left rcmd_cont" id="latest">
				<c:forEach items="${New}" var="music">				                <li>
                    <a href="?p=10" class="musicName">${music.MName} &#8211; ${music.AName}</a>
                    <a class="shareIcon" href="javascript:;"></a>
                    <a class="playIcon" href="javascript:;"></a>
                </li></c:forEach>
                            </ul>
            <ul class="rcmd_center rcmd_cont" id="popular">
								             <c:forEach items="${Hot}" var="music">			                <li>
                    <a href="?p=10" class="musicName">${music.MName} &#8211; ${music.AName}</a>
                    <a class="shareIcon" href="javascript:;"></a>
                    <a class="playIcon" href="javascript:;"></a>
                </li></c:forEach> </ul>
            <ul class="rcmd_right rcmd_cont" id="rank">
								               <c:forEach items="${Top}" var="music">				                <li>
                    <a href="?p=10" class="musicName">${music.MName} &#8211; ${music.AName}</a>
                    <a class="shareIcon" href="javascript:;"></a>
                    <a class="playIcon" href="javascript:;"></a>
                </li></c:forEach> </ul>
        </div>
    </div>
    <!--推荐内容 结束-->
    
    <!--精选集 开始-->
    <div class="omnibus hot_singer">
        <div class="omnibus_cont new_common">
            <div class="omnibus_title new_common_title">
                <span></span>
                <a href="" class="more"></a>
            </div>
            <ul id="omnibus_list">
                <li class="post_big">
                    <a href="">
                        <img src="${pageContext.request.contextPath}/static/images/20141010110027.jpg.jpg" alt="" width="305" height="290">
                        <i></i>
                    </a>
                    <a href="">神曲虐我千百遍，我待神曲如初恋</a>
                </li>
                <li class="post_small">
                    <a href="">
                        <img src="${pageContext.request.contextPath}/static/images/20141010110103.jpg" alt="" width="130" height="130">
                        <span></span>
                    </a>
                    <a href="">孤单的时候有二次元</a>
                </li>
                <li class="post_small">
                    <a href="">
                        <img src='${pageContext.request.contextPath}/static/images/20141010110157.jpg' alt="" width="130" height="130">
                        <span></span>
                    </a>
                    <a href="">萌娃爱唱歌</a>
                </li>
                <li class="post_small">
                    <a href="">
                        <img src="${pageContext.request.contextPath}/static/images/20141010110216.jpg" alt="" width="130" height="130">
                        <span></span>
                    </a>
                    <a href="">不疯狂,不青春</a>
                </li>
                <li class="post_small">
                    <a href="">
                        <img src='${pageContext.request.contextPath}/static/images/20141010110239.jpg' alt="" width="130" height="130">
                        <span></span>
                    </a>
                    <a href="">00后出没，请注意！</a>
                </li>
                <li class="post_small">
                    <a href="">
                        <img src='${pageContext.request.contextPath}/static/images/20141013142335.jpg' alt="" width="130" height="130">
                        <span></span>
                    </a>
                    <a href="">让节操碎一会儿</a>
                </li>
                <li class="post_small">
                    <a href="">
                        <img src="${pageContext.request.contextPath}/static/images/20141013142414.jpg" alt="" width="130" height="130">
                        <span></span>
                    </a>
                    <a href="">笑多了会怀孕哦</a>
                </li>
            </ul>
        </div>
        <div class="hot_singer_cont new_common">
            <div class="hot_singer_title new_common_title">
                <span></span>
                <a href="" class="more"></a>
            </div>
            <ul class="singer_list">
                <li>
                    <a href="?p=369" class="singerPhoto">
                        <img src=" ${pageContext.request.contextPath}/static/images/0025NhlN2yWrP4.jpg" alt="" width="70" height="70"></a>
                    <a href="?p=369" class="singer">周杰伦</a>
                </li>
                <li>
                    <a href="?p=357" class="singerPhoto">
                        <img src="${pageContext.request.contextPath}/static/images/001BLpXF2DyJe2.jpg" alt="" width="70" height="70"></a>
                    <a href="?p=357" class="singer">林俊杰</a>
                </li>
                <li>
                    <a href="?p=363" class="singerPhoto">
                        <img src=" ${pageContext.request.contextPath}/static/images/003Nz2So3XXYek.jpg" alt="" width="70" height="70"></a>
                    <a href="?p=363" class="singer">陈奕迅</a>
                </li>
                <li>
                    <a href="?p=367" class="singerPhoto">
                        <img src=" ${pageContext.request.contextPath}/static/images/002azErJ0UcDN6.jpg" alt="" width="70" height="70"></a>
                    <a href="?p=367" class="singer">张杰</a>
                </li>
                <li>
                    <a href="?p=360" class="singerPhoto">
                        <img src='${pageContext.request.contextPath}/static/images/001fNHEf1SFEFN.jpg' alt="" width="70" height="70"></a>
                    <a href="?p=360" class="singer">邓紫棋</a>
                </li>
                <li>
                    <a href="?p=345" class="singerPhoto">
                        <img src="${pageContext.request.contextPath}/static/images/000CK5xN3yZDJt.jpg" alt="" width="70" height="70"></a>
                    <a href="?p=345" class="singer">许嵩</a>
                </li>
                <div style="clear:both;"></div>
            </ul>
            <ul class="singer_classify">
                <li><a href="" class="singer">华语男歌手</a></li>
                <li><a href="" class="singer">华语女歌手</a></li>
                <li><a href="" class="singer">华语女组合</a></li>
                <li><a href="" class="singer">日韩男歌手</a></li>
                <li><a href="" class="singer">日韩女歌手</a></li>
                <li><a href="" class="singer">日韩组合</a></li>
                <li><a href="" class="singer">欧美男歌手</a></li>
                <li><a href="" class="singer">欧美女歌手</a></li>
                <li><a href="" class="singer">欧美组合</a></li>
            </ul>
        </div>
    <div style="clear:both"></div></div>
    <!--精选集 结束-->
</section>
<!-- 音乐馆 模块 结束 -->


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
						<!--<button class="jp-full-screen" role="button" tabindex="0">全屏</button>-->
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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
<!--播放器js-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/player.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/playlist.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/player_database.js"></script>	
<!--播放器js-->
<!-- 底部模板调用 结束 -->


</body>
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
   var latest=[];
   <c:forEach items="${New}" var="music">
   var M=new Object();
   M.id="${music.id}";
   M.title="${music.MName}";
   M.artist="${music.AName}";
   M.mp3="${music.MPath}";
   M.poster="${music.MIPath}";
   latest.push(M);
   </c:forEach>
   var popular=[];
   <c:forEach items="${Hot}" var="music">
   var M=new Object();
   M.id="${music.id}";
   M.title="${music.MName}";
   M.artist="${music.AName}";
   M.mp3="${music.MPath}";
   popular.push(M);
   </c:forEach> 
   var rank=[];
   <c:forEach items="${Top}" var="music">
   var M=new Object();
   M.id="${music.id}";
   M.title="${music.MName}";
   M.artist="${music.AName}";
   M.mp3="${music.MPath}";
   rank.push(M);
   </c:forEach>
</script>
</html>


