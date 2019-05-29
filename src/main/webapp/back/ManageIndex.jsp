<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Music管理后台</title>
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
			frame{
				height: 2000px;
			}
		</style>
	</head>
	<frameset frameborder="0" rows="60,*">
		<frame src="ManageTop.jsp" noresize="noresize" scrolling="no" />
		<frameset frameborder="0" cols="210,*">
			<frame src="ManageLeft.jsp" noresize="noresize" scrolling="no" />
			<frame noresize="noresize" scrolling="yes" name="main" />
			<!-- <frame noresize="noresize" scrolling="no" name="main"  src="首页.html"/> -->
		</frameset>
	</frameset>
</html>
