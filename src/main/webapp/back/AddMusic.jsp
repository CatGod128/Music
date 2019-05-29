<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>后台上传歌曲</title>
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/css/fileinput.min.css">
<script type="text/javascript" src="../static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../static/js/fileinput.min.js"></script>

</style>
</head>

<body>
	<form class="form-horizontal" enctype="multipart/form-data" method="Post">
		<div class="container">
			<!--下拉框-->
			<div class="row form-group ">
				<div class="input-group">
					<span class="input-group-addon">发布类型</span> 
					<select	class="form-control" name="Beard">
						<option>单曲</option>
						<option>专辑</option>
					</select>
				</div>
			</div>
			<div class="row form-group">
				<label class="control-label col-lg-1" >歌曲文件</label>
				<div class="col-lg-5 col-md-6">
                    <input id="Mlefile" type="file" style="display:none" name="Mfile" onchange="changestatus(Mlefile)">
					<input id="MFile" class="form-control"  type="text" />
					<input type="text" name="Size" id="size"value="文件大小"/>
				    <a class="btn" onclick="$('input[id=Mlefile]').click();">选择文件</a>
				</div>
			</div>
			
			<div class="row form-group">
				<label class="control-label col-lg-1">歌词文件</label>
				<div class="col-lg-5 col-md-6">
                    <input id="Llefile" type="file" style="display:none"name="Lfile">
					<input id="LFile" class="form-control"  type="text" />
				    <a class="btn" onclick="$('input[id=Llefile]').click();">选择文件</a>
				</div>
			</div>
			<div class="row form-group">
				<label class="control-label col-lg-1">歌曲图片</label>
				<div class="col-lg-5 col-md-6">
                   <input id="myFile" type="file" name="MIfiles" multiple class="file-loading">
				</div>
			</div>
			<div class="row form-group">
				<label class="control-label col-lg-1" for="name">歌曲名称</label>
				<div class="col-lg-5 col-md-6">
					<input class="form-control" name="Mname" id="name" type="text">
				</div>
			</div>
			<div class="row form-group">
				<label class="control-label col-lg-1">歌手名称</label>
				<div class="col-lg-5 col-md-6">
					<input class="form-control" name="Aname" id="name" type="text">
				</div>
			</div>
			<div class="row form-group ">
				<div class="input-group">
					<span class="input-group-addon">歌曲风格</span> 
					<select class="form-control" name="Style">
						<option>流行</option>
						<option>安静</option>
						<option>摇滚</option>
						<option>古典</option>
					</select>
				</div>
			</div>
			<button class="btn btn-info">提交</button>
	</form>
</body>
<script type="text/javascript">
	$(':button').click(
			function() {
				var formData = new FormData($('form')[0]);// 自动搜索表单信息(表单内没有name属性的input不会被搜索到)
				$.ajax({
					url : 'ajax/saveMusic',
					type : 'POST',
					xhr : function() {
						myXhr = $.ajaxSettings.xhr();
						if (myXhr.upload) {
							myXhr.upload.addEventListener('progress',
									progressHandlingFunction, false);
						}
						return myXhr;
					},
					//Ajax事件
					beforeSend : beforeSendHandler,
					success : completeHandler,
					error : errorHandler,
					// Form数据
					data : formData,
					cache : false,
					contentType : false,
					processData : false
				});
			});
	function progressHandlingFunction(e) {
		if (e.lengthComputable) {
			$('progress').attr({
				value : e.loaded,
				max : e.total
			});
		}
	}
	function beforeSendHandler() {
		alert("确认提交？");
	}
	function completeHandler() {
			alert("提交成功");
	}
	function errorHandler() {
		alert("请求错误");
	}
	$('input[id=Mlefile]').change(function(){
		$('#MFile').val($(this).val());
	})
	$('input[id=Llefile]').change(function(){
		$('#LFile').val($(this).val());
	})
	$('input[id=MIlefile]').change(function(){
		$('#MIFile').val($(this).val());
	})
	$('input[id=AIlefile]').change(function(){
		$('#AIFile').val($(this).val());
	})
	 function changestatus(fileid){
     var filesize = $("#Mlefile")[0].files[0].size;
	filesize = filesize / 1048576; //size in mb 
    document.getElementById("size").value=filesize.toFixed(2)+"MB";//js原始写法
    document.getElementById("size").setAttribute("readOnly",'true');
    }
	$(function () {
        //0.初始化fileinput
        var oFileInput = new FileInput();
        oFileInput.Init("myFile", "/afterSale/uplode/photo");
    });
    var FileInput = function () {
        var oFile = new Object();

        //初始化fileinput控件（第一次初始化）
        oFile.Init = function (ctrlName, uploadUrl) {
            var control = $('#' + ctrlName);

            //初始化上传控件的样式
            control.fileinput({
                language: 'zh', //设置语言
               // uploadAsync:false,//设置异步
                uploadUrl: uploadUrl, //上传的地址
                allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
                //showUploadedThumbs:false,
                // uploadClass: 'hidden',
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: "btn btn-info", //按钮样式
                dropZoneEnabled: false,//是否显示拖拽区域
                //minImageWidth: 150, //图片的最小宽度
                //minImageHeight: 150,//图片的最小高度
                //maxImageWidth: 150,//图片的最大宽度
                //maxImageHeight: 150,//图片的最大高度
                //maxFileSize:0,//单位为kb，如果为0表示不限制文件大小
                maxFileCount:1, //表示允许同时上传的最大文件个数
                minFileCount: 1,
                enctype: 'multipart/form-data',
                validateInitialCount: true,
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                previewSettings: {
                    image: {width: "150px", height: "150px"},
                },
                msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
                fileActionSettings : {
                    showUpload: false,
                    //showRemove: false
                   showZoom:false
                }
            });

            //导入文件上传完成之后的事件
            $("#Mfiles").on("fileuploaded", function (event, data, previewId, index) {
                alert(data.response.code);
                // $("#divControl").hide();
            });
        }
        return oFile;
    };
</script>
</html>