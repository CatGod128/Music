<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${music.MName}-${music.aname}</title>
<link rel="stylesheet" type="text/css" href="../static/css/audio.css">
<style type="text/css">
#content {
	width: 100%;
	height: 591px;
	position: relative;
	background-color: rgba(0, 0, 0, .35);
}

#nav {
	width: 70%;
	height: 10%;
	position: absolute;
	margin-top: 50px;
	margin-left: 50px;
	border: 1px solid #000;
}

#info {
	width: 100%;
	height: 80%;
	position: absolute;
	margin-top: 110px;
}

#info-left {
	width: 50%;
	height: 30px;
	float: left;
	margin-left: 50px;
	display:block;
}

#lrc {
	width: 50%;
	height: 400px;
	float: left;
	margin-left: 60px;
	position: relative;
	overflow: scroll;
}

#lrctext {
	width: 50%;
	min-height: 50%;
	position: absolute;
	left: 0;
	top: 0;
}

#lrctext p {
	width: 50%;
	height: 60px;
	text-align: center;
	line-height: 60px;
	margin: 0;
	padding: 0;
}

#lrc::-webkit-scrollbar {
	width: 4px;
	height: 4px;
}

#lrc::-webkit-scrollbar-thumb {
	background-color: #d9d9d9;
}

#img {
	width: 40%;
	height: 400px;
	float: left;
	margin-left: 50px;
}

#img img {
	background: #000;
	border: 1px solid #fff;
	border-width: 5px 5px 5px 5px;
	box-shadow: 1px 1px 5px #333;
	width: 200px;
	height: 200px;
	margin-top: 50px;
	margin-left: 150px;
}

.downloadbtn {
	display: block;
	width: 230px;
	height: 50px;
	background: url(../static/img/downlaod_bg.png) no-repeat;
	cursor: pointer;
	margin-top: 20px;
	margin-left: 146px;
}

.audioName {
	float: left;
	white-space: nowrap;
	overflow: hidden;
	font-size: 24px;
	font-style: normal;
	color: #fff;
	text-overflow: ellipsis;
	max-width: 420px;
}

.singerN {
	white-space: nowrap;
	overflow: hidden;
	font-style: normal;
	color: #fff;
	text-overflow: ellipsis;
	max-width: 420px;
}

.singerName {
	display: block;
	width: 225px;
	height: 24px;
	line-height: 24px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 15px;
	color: #fff;
}

#text li {
	width: 300px;
	height: 60px;
	text-align: center;
}

.CommandTop {
	height: 35px;
	border-bottom: 2px solid rgba(0, 0, 0, .35);
}

.Command h3 {
	font-size: 20px;
	line-height: 28px;
}

.f-ff2 {
	font-family: "Microsoft Yahei", Arial, Helvetica, sans-serif;
	float: left;
}

#scf-3 {
	float: left;
	margin: 2px 13px 0 10px;
}

#Command {
	width: 60%;
	height: 500px;
	display: block;
	margin: 0 auto;
}

#Comment {
	display: block;
	height: 98px;
}

#Comment-left {
	float: left;
	width: 70px;
	height: 70px;
}

#Comment-left img {
	width: 55px;
	height: 55px;
	margin: 10px 0 0 10px;
}

#Comment-right {
	float: left;
	width: 728px;
	height: 77px;
	margin-left: 10px;
	zoom: 1
}

#Comment .u-txt {
	width: 700px;
	height: 50px;
	margin: 10px 5px 5px 10px;
	padding: 5px 6px 6px;
	border-line: 1px solid #cdcdcd;
	border-radius: 2px;
	line-height: 19px;
}

textarea {
	resize: none;
	overflow: auto;
}

.u-btn {
	float: right;
	width: 46px;
	height: 25px;
	background-position: -84px -64px;
	color: #fff;
	text-align: center;
	line-height: 25px;
	text-decoration: none;
	background:
		url("${pageContext.request.contextPath}/static/img/Comment.jpg");
}

#OtherCommands {
	display: block;
}

.u-hd4 {
	position: relative;
	font-size: 15px;
	top: 45px;
	height: 20px;
}

.OtherCommand {
	padding: 15px 0;
	border-bottom: 1px dotted #ccc;
	display: block;
}

.OtherCommand .head {
	float: left;
	width: 50px;
	height: 50px;
	margin-right: -100px;
}

.cntwrap {
	margin-left: 60px;
	display: block;
}

.cnt {
	width: 100%;
	overflow: hidden;
	line-height: 20px;
	word-break: break-word;
	font-size: 12px; display : block;
	white-space: normal;
	display: block;
}

.s-fc7 {
	margin-right: 5px;
	color: #0c73c2;
	text-decoration: none;
	font-size: 15px;
	cursor: pointer;
}

.rp {
	margin-top: 15px;
	text-align: right;
	display: block;
}

.timescf-4 {
	float: left;
	margin: 0 !important;
	color: #999;
	font-size: 10px;
}

.like {
	float: right;
	color: #999;
	font-size: 10px;
	cursor: pointer;
}
.delete {
    float: right;
	color: #999;
	font-size: 10px;
	cursor: pointer;
}
.sep{
    font-size:3px;
    float: right;
    color: #ccc;
    margin:0 4px 0 4px;
}

.zan {
	display: inline-block;
	width: 15px; height : 15px;
	background-position: -150px 0;
}
.collectimg{
   width:15px;
   height:15px;
   margin: 8px 0 0 10px;
}
</style>
</head>
<body style="height: 588px;">
	<div id="content">
		<div id="info">
			<div id="info-left">
				<span class="audioName">${music.MName}</span>
				<img class="collectimg" id="${music.id}"src="${pageContext.request.contextPath}/static/img/collect.png">
			</div>
			<div class="singerN">
				<span>歌手：</span><a href="query?query=${music.aname}" target="blank">${music.aname}</a>
			</div>
			<div id="lrc">
				<ul id="text" style="transform: translateY(0px);"></ul>
			</div>
			<div id="img">
				<img src="${music.MIPath}"> <a class="downloadbtn"
					href="*/download?id=${music.id}"></a>
			</div>
		</div>
	</div>
	<div id="Command">
		<div class="CommandTop">
			<h3>
				<span class="f-ff2">评论</span>
			</h3>
			<span id="scf-3">11</span>
		</div>
		<div id="Comment">
			<div id="Comment-left">
				<img
					src="${pageContext.request.contextPath}/static/images/user_photo.png">
			</div>
			<div id="Comment-right">
				<textarea class="u-txt" placeholder="评论" id="Commandcontent"></textarea>
				<a href="javascript:Comment();" class="u-btn">评论</a>
			</div>
			<div id="OtherCommands">
				<h3 class="u-hd4">精彩评论</h3>
				<hr style="margin-top: 124px;">
			</div>
			<div class="OtherCommand">
				<div class="head">
					<img alt=""
						src="${pageContext.request.contextPath}/static/images/user_photo.png">
				</div>
				<div class="cntwrap">
					<div class="cnt">
						<a class="s-fc7">什么鬼 </a>：不知道为什么这些评论这么难写
					</div>
					<div class="rp">
						<div class="timescf-4">2019年6月21号</div>
					</div>
					<img class="zan" src="../static/img/like.png"><a class="like">(236316)</a>
				</div>
			</div>
		</div>

	</div>
	<div class="audio-box">
		<div class="audio-container">
			<div class="audio-cover"
				style="background-image: url(&quot;images/cover.jpg&quot;);"></div>
			<div class="audio-view">
				<h3 class="audio-title">the xx</h3>
				<div class="audio-body">
					<div class="audio-backs">
						<div class="audio-this-time">00:00</div>
						<div class="audio-count-time">00:00</div>
						<div class="audio-setbacks">
							<i class="audio-this-setbacks"> <span class="audio-backs-btn"></span>
							</i> <span class="audio-cache-setbacks"> </span>
						</div>
					</div>
				</div>
				<div class="audio-btn">
					<div class="audio-select">
						<div class="audio-prev"></div>
						<div class="audio-play audio-stop"></div>
						<div class="audio-next"></div>
						<div class="audio-menu"></div>
						<div class="audio-volume"></div>
					</div>
					<div class="audio-set-volume">
						<div class="volume-box">
							<i style="height: 80%;"><span></span></i>
						</div>
					</div>
					<div class="audio-list">
						<div class="audio-list-head">
							<p>☺随心听</p>
							<span class="menu-close">关闭</span>
						</div>
						<ul class="audio-inline">
							<li><a href="javascript:;">the xx</a></li>
							<li><a href="javascript:;">不该 - 周杰伦、张惠妹</a></li>
							<li><a href="javascript:;">再见 - 邓紫棋</a></li>
							<li><a href="javascript:;">最后一次 - 庄心妍</a></li>
							<li><a href="javascript:;">远走高飞 - 金志文、徐佳莹</a></li>
							<li><a href="javascript:;">极乐净土 - GARNiDELiA</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="../static/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../static/js/audio.js"></script>
	<script type="text/javascript">
		$(function() {
			
			var song = [
						{
							'cover' : '${music.MIPath}',
							'src' : '${music.MPath}',
							'title' : '${music.aname} - ${music.MName}',
							'lrc': '${music.LPath}'
						},
			            <c:forEach items="${Songs}" var="song">
			            {
							'cover' : '${song.MIPath}',
							'src' : '${song.MPath}',
							'title' : '${song.aname} - ${song.MName}',
							'lrc': '${music.LPath}'
						},
						   </c:forEach> ];

			var audioFn = audioPlay({
				song : song,
				autoPlay : true
			//是否立即播放第一首，autoPlay为true且song为空，会alert文本提示并退出
			});

			/* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 */
			audioFn
					.newSong(
							{
								'cover' : 'images/cover4.jpg',
								'src' : 'http://so1.111ttt.com:8282/2016/5/06m/06/199061931237.m4a?tflag=1494769315&pin=a0b26b2dddd976d74724841f6d2641d6&ip=114.233.172.33#.mp3',
								'title' : '极乐净土 - GARNiDELiA'
							}, false);

			/* 暂停播放 */
			audioFn.stopAudio();

			/* 开启播放 */
			audioFn.playAudio();

			/* 选择歌单中索引为3的曲目(索引是从0开始的)，第二个参数true立即播放该曲目，false则不播放 */
			audioFn.selectMenu(0, true);

			/* 当前播放曲目的对象 */
			console.log(audioFn.audio);
			/**
			 * 显示歌词文件
			 */
			var audio = audioFn.audio;
			var url = audioFn.song[0].lrc;
			var geci = $.ajax({
				url : url,
				async : false
			}).responseText;
			var geci1 = geci.split("\n");
			var geci2 = [];
			for (var i = 0; i < geci1.length; i++) {
				var arr = geci1[i].split("]");
				geci2.push(arr[arr.length - 1]);
			}
			for (var i = 0; i < geci2.length; i++) {
				var p = document.createElement("li");
				p.innerHTML = geci2[i];
				$("#text")[0].appendChild(p);
			}

			var reg = /\[\d*:\d*((\.|\:)\d*)*\]/g;
			var musictime1 = [];
			for (var i = 0; i < geci1.length; i++) {
				var musictime = geci1[i].match(reg);
				musictime1.push(musictime);
			}
			var time = [];
			for (var i = 0; i < musictime1.length; i++) {
				var fen = String(musictime1[i]).substr(1, 2);
				var miao = String(musictime1[i]).substr(4, 2);
				time.push(fen * 1 * 60 + miao * 1);
			}
			setInterval(function() {
				for (var i = 0; i < time.length; i++) {
					if (parseInt(audio.currentTime) != 0) {
						if (parseInt(audio.currentTime) == time[i]) {
							$("#text").css({"transition" : "all 0.5s linear"});
							$('#text').css("transform","translateY(" + (i - 2) * (-60) + "px)");
							$("#text li").css({"color" : "black"}).eq(i).css({"color" : "green"});
						}
					}
				}
			}, 1000)
		});
	</script>
	<script type="text/javascript">
	var userName="<%=session.getAttribute("userName")%>";
	$(function() {
		var status = true;
		$(".collectimg").click(function() {
			if(userName==null){
				alert("未登录，请先登录");
			}else{
			var id=this.id;	
			if(status) {
				$(this).attr('src',"${pageContext.request.contextPath}/static/img/collected.png");
				var url="Collect";
				collected(id,url);
				status = false;
			}else{
				$(this).attr('src',"${pageContext.request.contextPath}/static/img/collect.png");
				var url="CancelCollect";
				collected(id,url);
				status = true;
			}
			}
		});
	})
	function collected(id,url){
		$.ajax({
			type:'post',
			astnc:true,
			data:{
				m_id:id
			},
			url:url,
			dataType:"json",
			success:function(data){
				if(data>0){
					alert("收藏成功");
				}else{
					alert("取消收藏");
				}
			},
		error : function() {
				console.log('操作失败');
			}
		})
	}
	
		$(function(){	
				queryComment();
		});
		function Comment(){
			if(userName==null){
				alert("未登录，请先登录");
			}else{
			var id = ${music.id};
			var content = $("#Commandcontent").val();
			$.ajax({
				type:'post',
				astnc:true,
				data:{
					m_id:id,
					content:content
				},
				url:'Comment',
				dataType:"json",
				success:function(data){
					if(data==1){
						alert("评论成功");
					 $(".OtherCommand").remove();
						queryComment();
					}
				},
			error : function() {
					console.log('评论失败');
				}
			})}
		}
		$(function(){  
		    $('body').on('click','.like',function(){
		     var str =this.innerText;
		      var num= parseInt(str.substring(1,str.length-1))+1;
		      this.innerText="("+num+")";
		     addlike(num,this.id);
		    })
		  })
		  $(function(){  
		    $('body').on('click','.delete',function(){
		    	var id = this.id;
				$.ajax({
					type:'post',
					astnc:true,
					data:{
						id:id
					},
					url:'deleteCommand',
					dataType:"json",
					success:function(data){
						if(data==1){
							alert("删除成功");
						 $(".OtherCommand").remove();
							queryComment();
						}
					},
				error : function() {
						console.log('删除失败');
					}
				})
		    })
		  })
		  function addlike(num,id){
			$.ajax({
				type:'post',
				astnc:true,
				data:{
					num:num,
					id:id,
				},
				url:'addlike',
				dataType:"json",
				success:function(data){
					
				},
			error : function() {
					console.log('评论失败');
				}
			})
		}
		function queryComment() {
			var id = ${music.id};
			var url = "show?id="+id;
			$.ajax({
						type : "post",
						async : true,
						url : url,
						dataType : "json",
						success : function(data) {
							console.log($("#scf-3").text());
					        $("#scf-3").innerHTML="多少人";
							$.each(data,function(i, element) {
								var id=element.id;
								var state=element.state;
								var u_id=element.userId;
								var nickname = element.userName;
								var content = element.content;
								var imgpath = element.img;
								var time=formatyn(element.createTime);
						    	var like=element.giveLike;
						    	var userID=<%=session.getAttribute("userId")%>;
						    	if(u_id==userID){
						    		if(state==1){
						    			var info = $('<div class="OtherCommand"><div class="head"><img src="'+imgpath+'"></div><div class="cntwrap">'
												+'<div class="cnt"><a class="s-fc7">'
												+ nickname+'</a>:'
												+ content
												+ '</div><div class="rp"><div class="timescf-4">'
												+time+'</div></div><a class="like" id="'+id+'"><img class="zan" src="../static/img/like.png">('
												+like+')</a><span class="sep">|</span><a class="delete" id="'+id+'">删除</a></div></div>');
						    		}else{
						    			var info = $('<div class="OtherCommand"><div class="head"><img src="'+imgpath+'"></div><div class="cntwrap">'
												+'<div class="cnt"><a class="s-fc7">'
												+ nickname+'</a>:'
												+ "<center>该评论已被管理员删除</center>"
												+ '</div><div class="rp"><div class="timescf-4">'
												+time+'</div></div><a class="like" id="'+id+'"><img class="zan" src="../static/img/like.png">('
												+like+')</a></div></div>');	
						    		}
						    		
						    	}else{
								var info = $('<div class="OtherCommand"><div class="head"><img src="'+imgpath+'"></div><div class="cntwrap">'
								+'<div class="cnt"><a class="s-fc7">'
								+ nickname+'</a>:'
								+ content
								+ '</div><div class="rp"><div class="timescf-4">'
								+time+'</div></div><a class="like" id="'+id+'"><img class="zan" src="../static/img/like.png">('
								+like+')</a></div></div>');}
								$('#OtherCommands').append(info);
								});
						},
						error : function() {
							console.log('fail');
						}
					});
		}
		 function formatyn(nS) {
                        var s=nS.toString();
			            var a = parseInt(s.replace(/\D/igm, ""));
			            var datetime = new Date(a);
			            var year = datetime.getFullYear();
			            var month = datetime.getMonth() + 1;
			            var date = datetime.getDate();
			            return year + "年" + month + "月" + date+"日";
			}
	</script>
</body>
</html>