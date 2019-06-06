<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${music.MName} - ${music.aname}</title>
   <link rel="stylesheet" type="text/css" href="../static/css/audio.css">
   <style type="text/css">
#content{
   width:100%;
   height:591px;
   position:relative;
   background-color: rgba(0,0,0,.35);
}
#nav{
   width:70%;
   height:10%;
   position:absolute;
   margin-top:50px;
   margin-left:50px;
   border:1px solid #000;
} 
#info{
 width:100%;
 height:80%;
 position:absolute;
 margin-top:110px;
}
#info-left{
width:50%;
height:30px;
float:left;
margin-left:50px;
}
#lrc{
 width:50%;
 height:400px;
 float:left;
 margin-left:60px;
 position: relative;
 overflow: scroll;
} 
#lrctext{
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
  width:4px;
  height:4px;
}
#lrc::-webkit-scrollbar-thumb {
  background-color:#d9d9d9;
}
#img{
 width:40%;
 height:400px;
 float:left;
 margin-left:50px;
}
#img img{
   background:#000;
   border:1px solid #fff;
   border-width:5px 5px 5px 5px;
   box-shadow:1px 1px 5px #333;
   width:200px;
   height:200px;
   margin-top:50px;
   margin-left:150px;
}
.downloadbtn{
    display: block;
    width: 230px;
    height: 50px;
    background: url(../static/img/downlaod_bg.png) no-repeat;
    cursor: pointer;
     margin-top:20px;
    margin-left:146px;
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
.singerN{
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
ul li{
width: 300px;
height: 60px;
text-align: center;
}
   </style>
</head>
<body style="height: 588px;">
<div id="content">
  <div id="info">
  <div id="info-left">
  <span class="audioName">${music.MName}</span>
 </div> 
 <div class="singerN">
  <span>歌手：</span><a href="" target="blank">${music.aname}</a>
  </div>
     <div id="lrc">
   <ul id="text" style="transform: translateY(0px);"></ul>
     </div>
     <div id="img">
      <img src="${music.MIPath}">
      <a class="downloadbtn" href="*/download?id=${music.id}"></a>
     </div>
  </div>
</div>
	<div class="audio-box">
		<div class="audio-container">
			<div class="audio-cover" style="background-image: url(&quot;images/cover.jpg&quot;);"></div>
			<div class="audio-view">
				<h3 class="audio-title">the xx</h3>
				<div class="audio-body">
					<div class="audio-backs">
						<div class="audio-this-time">00:00</div>
						<div class="audio-count-time">00:00</div>
						<div class="audio-setbacks">
							<i class="audio-this-setbacks">
								<span class="audio-backs-btn"></span>
							</i>
							<span class="audio-cache-setbacks">
							</span>
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
						<ul class="audio-inline"><li><a href="javascript:;">the xx</a></li><li><a href="javascript:;">不该 - 周杰伦、张惠妹</a></li><li><a href="javascript:;">再见 - 邓紫棋</a></li><li><a href="javascript:;">最后一次 - 庄心妍</a></li><li><a href="javascript:;">远走高飞 - 金志文、徐佳莹</a></li><li><a href="javascript:;">极乐净土 - GARNiDELiA</a></li></ul>
					</div>
				</div>
			</div>
		</div>
	</div>


<script type="text/javascript" src="../static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../static/js/audio.js"></script>
<script type="text/javascript">
$(function(){
	var song = [
		{
			'cover' : '${music.MIPath}',
			'src' : '${music.MPath}',
			'title' : '${music.aname} - ${music.MName}'
		},
		{
			'cover' : 'images/cover2.jpg',
			'src' : 'http://so1.111ttt.com:8282/2016/1/06m/24/199240145502.m4a?tflag=1494769732&pin=84bac9745fcebbd3ed5c598b97e15c39&ip=114.233.172.33#.mp3',
			'title' : '不该 - 周杰伦、张惠妹'
		},
		{
			'cover' : 'images/cover5.jpg',
			'src' : 'http://so1.111ttt.com:8282/2015/1/10m/31/103311642007.m4a?tflag=1494769515&pin=26fa27d88422f6adb1fbca3f0f17333e&ip=114.233.172.33#.mp3',
			'title' : '再见 - 邓紫棋'
		},
		{
			'cover' : 'images/cover1.jpg',
			'src' : 'http://so1.111ttt.com:8282/2017/1/05m/09/298092036393.m4a?tflag=1494768868&pin=9a24cbf7571cb3524af1d6c883916169&ip=114.233.172.33#.mp3',
			'title' : '远走高飞 - 金志文、徐佳莹'
		}
	];

	var audioFn = audioPlay({
		song : song,
		autoPlay : true  //是否立即播放第一首，autoPlay为true且song为空，会alert文本提示并退出
	});

	/* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 */
	audioFn.newSong({
		'cover' : 'images/cover4.jpg',
		'src' : 'http://so1.111ttt.com:8282/2016/5/06m/06/199061931237.m4a?tflag=1494769315&pin=a0b26b2dddd976d74724841f6d2641d6&ip=114.233.172.33#.mp3',
		'title' : '极乐净土 - GARNiDELiA'
	},false);

	/* 暂停播放 */
	audioFn.stopAudio();

	/* 开启播放 */
	audioFn.playAudio();

	/* 选择歌单中索引为3的曲目(索引是从0开始的)，第二个参数true立即播放该曲目，false则不播放 */
	audioFn.selectMenu(0,true);

	/* 当前播放曲目的对象 */
	console.log(audioFn.audio);
	/**
	 * 显示歌词文件
	 */
	  var audio = audioFn.audio;
		var url = "${music.LPath}";
		var geci = $.ajax({url:url,async:false}).responseText;
		var geci1 = geci.split("\n");
		var geci2=[];
		for (var i = 0; i < geci1.length; i++) {
			var arr = geci1[i].split("]");
			geci2.push(arr[arr.length-1]);
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
			var fen = String(musictime1[i]).substr(1,2);
			var miao = String(musictime1[i]).substr(4,2);
			time.push(fen*1*60+miao*1);
		}
		console.log(time);
		setInterval(function(){
			for (var i = 0; i < time.length; i++) {
				if(parseInt(audio.currentTime)!=0){
					if(parseInt(audio.currentTime)==time[i]){
						$("#text").css({"transition":"all 0.5s linear"});
						$('#text').css("transform","translateY("+(i-2)*(-60)+"px)");
						$("#text li").css({"color":"black"}).eq(i).css({"color":"green"});
					}
				}
			}
		},1000)
});

</script>
</body>
</html>