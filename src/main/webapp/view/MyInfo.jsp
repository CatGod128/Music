<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>编辑资料</title>
<style type="text/css">
form#payment {
	background: #9cbc2c;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	padding: 20px;
	width: 400px;
}

form#payment fieldset {
	border: none;
	margin-bottom: 10px;
}

form#payment fieldset:last-of-type {
	margin-bottom: 0;
}

form#payment ol li {
	background: #b9cf6a;
	background: rgba(255, 255, 255, 0.3);
	border: #e3ebc3;
	border-color: rgba(255, 255, 255, 0.6);
	border-style: solid;
	border-width: 2px;
	-webkit-border-radius: 5px;
	line-height: 30px;
	padding: 5px 10px;
	margin-bottom: 2px;
}

form#payment ol ol li {
	bakcground: none;
	border: none;
	float: left;
}

form#payment label {
	float: left;
	font-size: 13px;
	width: 110px;
}

form#payment fieldset fieldset label {
	background: none no-repeat left 50%;
	line-height: 20px;
	padding: 0 0 0 30px;
	width: auto;
}

.frame {
	width: 300px;
	height: 250px;
	float: left;
	display: inline;
	box-shadow: #666 0px 0px 10px;
	background: #EEFF99;
}

.frame div img {
	padding: 0px;
	padding-top: 0px;
	width: 150px;
	height: 150px;
}
.img_div {
    width: 200px;
    height:200px;
}
.mask {
    top: 0;
    left: 0;
    color: #ffffff;
    opacity: 0;
}
.mask{
    text-align: center;
}
.img_div:hover .mask {
    opacity: 1;           
}
</style>
</head>
<body>
    <div>
	<div class="frame">
			<div class="img_div">
				<c:choose>
					<c:when test="${userInfo.img==null}">
						<img id="img0"
							src="${pageContext.request.contextPath}/static/images/user_photo.png" />
					</c:when>
					<c:when test="${userInfo.img!=null}">
						<img  id="img0" name="touxiang" src="${userInfo.img}" />
					</c:when>
				</c:choose>		
		<form  enctype="multipart/form-data" id="upload"> 
        <a  class="mask" href="#">
              <input type="file" name="img" id="file0"/>
        </a></form>
			</div>
			<p>账号:${userInfo.email}</p>
		</div>
		<div class="frame">
			<form id=payment>
				<fieldset>
					<ol>
						<li><label for="name">用户名称：</label> <input type="text"
							id="name" name="name" value="${userInfo.userName}" required
							autofocus></li>
						<li><label for="email">邮件地址：</label> <input type="text"
							name="email" id="email" value="${userInfo.email}" required>
						</li>
						<li><label for="phone">联系电话：</label> <input type="tel"
							id="phone" name="phone" value="${userInfo.phone}"></li>
						<input type="submit" value="修改"/>
					</ol>
				</fieldset>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript">
$("#file0").change(function(){  
	 var objUrl = getObjectURL(this.files[0]) ;//获取文件信息   
	  if (objUrl) {  
	  $("#img0").attr("src", objUrl);  
	  UploadImg();
	 }   
}) ; 
function UploadImg(){
	 var Data = new FormData($("#upload")[0]); 
		    $.ajax({
		        type : 'Post',
		        data : Data,
		        url : 'uploadImg',
		        dataType : 'json',
		        contentType: false, //必须
		        processData: false, //必须
		        success : function(data) {
		        	alert(data.data);
		        }
		    });
  } 
function getObjectURL(file) {  
	 var url = null;   
	 if (window.createObjectURL!=undefined) {  
	  url = window.createObjectURL(file) ;  
	 } else if (window.URL!=undefined) { // mozilla(firefox)  
	  url = window.URL.createObjectURL(file) ;  
	 } else if (window.webkitURL!=undefined) { // webkit or chrome  
	  url = window.webkitURL.createObjectURL(file) ;  
	 }  
	 return url ;  
	}  
</script>
</html>