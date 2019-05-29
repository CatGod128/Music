<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>搜索页面</title>
<link rel="stylesheet" href="../static/css/style.css">
<link rel="stylesheet" href="../static/css/font-awesome.min.css">
<link rel="stylesheet" href="../static/css/bootstrap.min.css">

</head>
<style type="text/css">
#word {
	position: absolute;
	z-index: 99;
	width: 145px;
	height: auto;
	background-color: white;
	border: black solid 1px;
	display: none;
}

.click_work {
	padding-bottom: 8px;
	font-weight: lighter;
	font-size: 13px;
	cursor: pointer; /*鼠标放上变成小手*/
}

.click_work:hover {
	color: orange;
	background-color: gray;
}

.error {
	color: gray;
	cursor: pointer; /*鼠标放上变成小手*/
}
</style>
<body>
	<div>
		<table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>歌手名称</th>
					<th>歌手图片</th>
					<th>性别</th>
					<th>生日</th>
					<th>描述</th>
					<th>操作</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script src="../static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../static/js/JsonpAjax.js"></script>
<script type="text/javascript"src="../static/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"src="../static/js/dataTables.bootstrap.min.js"></script>
<script>
		$(document).ready(function() {
			$('#table').dataTable({
				'ajax' : {
					'url' : 'artistlist',
					'data' : {},
					'dataType' : 'json',
					'type' : 'POST'
				},
				language : { //将英文转换为中文
					"sProcessing" : "处理中...",
					"sLengthMenu" : "显示 _MENU_ 项结果",
					"sZeroRecords" : "没有匹配结果",
					"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
					"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
					"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
					"sInfoPostFix" : "",
					"sSearch" : "搜索:",
					"sUrl" : "",
					"sEmptyTable" : "表中数据为空",
					"sLoadingRecords" : "载入中...",
					"sInfoThousands" : ",",
					"oPaginate" : {
						"sFirst" : "首页",
						"sPrevious" : "上页",
						"sNext" : "下页",
						"sLast" : "末页"
					},
					"oAria" : {
						"sSortAscending" : ": 以升序排列此列",
						"sSortDescending" : ": 以降序排列此列"
					}
				},
				destroy:true,
				'aoColumns' : [ {'data' : 'aname'}, 
				                {
	                    "data" :'aipath',
	                	"render" : function(data) {
	                		var html = "<img src='"+data+"' height='50' width='50'/>"
	                		return html;
	                		}
	                		},
				                {'data' : 'sex',
	                			"render":function(data){
	                				if(data==1){
	                					return "男";
	                				}
	                				return "女";
	                			}
	                			}, 
				                {'data' : 'birthday'},
				                {'data' : 'summary'},
				                { 'target':3,
					                   "data" : null,
					                	"render" : function(data,type,row) {
					                		var id = row.id;
					                		var html = "<a href='getArtistInfo?id="+id+"'  class='delete btn btn-default btn-xs'  ><i class='fa fa-times'></i>编辑</a>"
					                		return html;
					                		}
					                		},
				              ],
			});
		});
</script>
</html>