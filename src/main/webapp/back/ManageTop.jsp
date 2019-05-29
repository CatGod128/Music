<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.bx {
	height: 60px;
	width: 100%;
	background: #177ec1;
}

.bx .container {
	margin: 0 60px;
	overflow: hidden;
}

.bx .container .left {
	width: 201px;
	height: 43px;
	padding-top: 19px;
	color: #FFFFFF;
	font-size: 24px;
	float: left;
}

.bx .container .right {
	overflow: hidden;
	width: 124px;
	padding-top: 19px;
	float: right;
}

.bx .container .right span {
	font-size: 16px;
	color: #fff;
}

.bx .container .right .l {
	float: left;
}

.bx .container .right .r {
	float: right;
}
</style>
</head>
<body>
	<div class="bx">
		<div class="container">
			<h2 class="left">Music管理后台</h2>
			<div class="right">
				<span class="1" id="text"></span> 
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
    setInterval(on,1000);  //这里是使时间动起来的地方
    function on() {
        var date1 =new Date;
        var  year=date1.getFullYear();
        var  month=date1.getMonth();
        var day=date1.getDate();
        var xinqi="日一二三四五".charAt(date1.getDay());
        var hh=date1.getHours();
        var mm=timeAdd0(date1.getMinutes().toString());
        var ss=timeAdd0(date1.getSeconds().toString());
        var time=year+"年"+(month+1)+"月"+day+"日   星期"+xinqi+"  "+hh+":"+mm+":"+ss;
        document.getElementById("text").innerHTML = time;
    }
    function timeAdd0(str){
    	if(str.length<=1){
    		str='0'+str;
    	}
         return str
    }
</script>
</html>