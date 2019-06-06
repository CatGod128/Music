<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
 input{
  text-align:center;
 }
 img{
   width:140px;
   height:140px;
 }
</style>
</head>
<body>
<form id="form1"  enctype="multipart/form-data">
   <table border="1"   cellpadding="2" align="center">
        <caption>歌曲信息</caption>
        <tr align="center"><td>歌曲名称</td> <td><input id="Mname" name="Mname" value="${music.MName}" readonly="readonly"/></td></tr>
        <tr align="center"><td>歌手名称</td> <td>${music.aname}</td></tr>
        <tr align="center"><td>歌曲图片</td> <td>
        <img id="img0"  name="123"alt="" src="${music.MIPath} ">
            <input type="file" name="MIFile" id="file0" style="opacity:0;width:50px;" /></td></tr>
        <tr align="center"> <td>歌词</td>    <td><c:choose>
              <c:when test="${music.LPath !=null}"><a onclick="show();">有歌词</a>   
               </c:when>
               <c:when test="${music.LPath ==null}">
                  <input type="file" name="LFile" id="file1"/>
               </c:when>
            </c:choose>	</td></tr>
        <tr align="center"><td>曲风</td> <td>
        <c:forEach  items="${stylelist}" var="stylename" varStatus="status">
        <p><input id="checkbox${status.index+1}" type="checkbox" name="style" value="${stylename}"><label>${stylename}</label>
        </c:forEach>
        <td></tr>
        <tr align="center"><td>发布时间</td> <td><input type="date" name="MTime" value="${music.mtime}"/></td></tr>
        <tr align="center"><td>下载量</td> <td><input  name="DCount" value="${music.DCount}" /></td></tr>
        <tr align="center"><td>收听量</td> <td><input  name="PCount" value="${music.PCount}" /></td></tr>
     
    </table>
        <input type="hidden" name="id" value="${music.id}"> 
</form>
<button onclick="update();">修改</button>
<ul id="lyric"></ul>
</body>
<script src="../static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" charset="utf-8" >
   function update(){
	 var Data = new FormData($("form")[0]); 
		    $.ajax({
		        type : 'Post',
		        data : Data,
		        url : 'updateMusic',
		        dataType : 'json',
		        contentType: false, //必须
		        processData: false, //必须
		        success : function(data) {
		           alert(data.msg);
		        }
		    });
   }
   $("#file0").change(function(){  
		 var objUrl = getObjectURL(this.files[0]) ;//获取文件信息  
		 console.log("objUrl = "+objUrl);  
		  if (objUrl) {  
		  $("#img0").attr("src", objUrl);  
		 }   
}) ;  
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
/**
 * 显示歌词文件
 */
function show(){
	 var lrc = "";
	    var ajax = new XMLHttpRequest();
	    ajax.open("GET", "${music.LPath}");
	    ajax.onreadystatechange = function () {
	        if (ajax.readyState == 4 && ajax.status == 200) {
	            lrc = ajax.responseText;
	            createLrcObj(lrc);
	            showLRC();
	        }
	    };
	    ajax.send(null);	   
	}
var oLRC = {
	    ti: "", //歌曲名
	    ar: "", //演唱者
	    al: "", //专辑名
	    by: "", //歌词制作人
	    offset: 0, //时间补偿值，单位毫秒，用于调整歌词整体位置
	    ms: [] //歌词数组{t:时间,c:歌词}
	};

	function createLrcObj(lrc) {
		if(lrc.length==0) return;
	    var lrcs = lrc.split('\n');//用回车拆分成数组
	    for(var i in lrcs) {//遍历歌词数组
	    	lrcs[i] = lrcs[i].replace(/(^\s*)|(\s*$)/g, ""); //去除前后空格
	        var t = lrcs[i].substring(lrcs[i].indexOf("[") + 1, lrcs[i].indexOf("]"));//取[]间的内容
	        var s = t.split(":");//分离:前后文字
	        if(isNaN(parseInt(s[0]))) { //不是数值
	            for (var i in oLRC) {
	                if (i != "ms" && i == s[0].toLowerCase()) {
	                    oLRC[i] = s[1];
	                }
	            }
	        }else { //是数值
	            var arr = lrcs[i].match(/\[(\d+:.+?)\]/g);//提取时间字段，可能有多个
	            var start = 0;
	            for(var k in arr){
	                start += arr[k].length; //计算歌词位置
	            }
	            var content = lrcs[i].substring(start);//获取歌词内容
	            for (var k in arr){
	                var t = arr[k].substring(1, arr[k].length-1);//取[]间的内容
	                var s = t.split(":");//分离:前后文字
	                oLRC.ms.push({//对象{t:时间,c:歌词}加入ms数组
	                    t: (parseFloat(s[0])*60+parseFloat(s[1])).toFixed(3),
	                    c: content
	                });
	            }
	        }
	    }
	    oLRC.ms.sort(function (a, b) {//按时间顺序排序
	        return a.t-b.t;
	    });
	     for(var i in oLRC){ //查看解析结果
	        console.log(i,":",oLRC[i]);
	    } 
	}
	function showLRC() {
	    var s="";
	    for(var i in oLRC.ms){//遍历ms数组，把歌词加入列表
	        s+='<li>'+oLRC.ms[i].c+'</li>';
	    }
	    document.getElementById("lyric").innerHTML = s;
	}
	//初始化复选框
	$(function(){
		var boxes = document.getElementsByName("style");
		   for(i=0;i<boxes.length;i++){
			   <c:forEach items="${music.style}" var="style">
			   if(boxes[i].value=="${style}"){
				   boxes[i].checked=true;
			   }
			   </c:forEach>
		   }
	})
</script>
</html>