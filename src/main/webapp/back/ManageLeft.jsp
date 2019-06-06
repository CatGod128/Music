<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Music</title>
		<link rel="stylesheet" href="../static/css/StudentLeft.css">
		<script src="../static/js/jquery-3.3.1.js"></script>
	</head>
	<body>
		<div class="nav">
			<div class="nav-list">
				<div class="nav-tit" id="personal">
					<a>
						<img src="../static/images/personal-msg.png" style="height: 30px" alt="">
						<span>歌曲管理</span>
					</a>
				</div>
				<div class="personal-list" id="personal-child">
					<ul>
						<li><a href="SearchMusic.jsp" target="main">歌曲搜索</a></li>
						<li><a href="AddMusic.jsp" target="main">歌曲添加</a></li>
					</ul>
				</div>
				<div class="nav-tit" id="artist">
				    <a>
						<img src="../static/images/archives-msg.png" alt="">
						<span><a href="listartist.jsp" target="main">歌手管理</span>
					</a>
				</div>
				<div class="nav-tit">
					<a href="listStyle" target="main">
						<img src="../static/images/job-msg.png" alt="">
						<span>曲风管理</span>
					</a>
				</div>
				<div class="nav-tit">
					<a href="ShowComand" target="main">
					<img src="../static/images/job-change.png" alt="">
					<span>评论管理</span>
					</a>
				</div>
				<div class="nav-tit">
					<a href="listUser.jsp" target="main">
						<img src="../static/images/PubMed-msg.png" alt="">
						<span>用户管理</span>
					</a>
				</div>
			</div>
		</div>

		<script>
			$(document).ready(function(){
				$('#personal').on('click',function(){
					$('#personal-child').fadeToggle(300);
				});
				let aLi = $('#personal-child li');
				aLi.on('click',function(){
					$(this).addClass('active').siblings('li').removeClass('active');
				})
			});
			$(document).ready(function(){
				$('#artist').on('click',function(){
					$('#artist-child').fadeToggle(300);
				});
				let aLi = $('#artist-child li');
				aLi.on('click',function(){
					$(this).addClass('active').siblings('li').removeClass('active');
				})
			});
		</script>
	</body>
</html>
