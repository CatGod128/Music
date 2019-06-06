<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/style.css">
<link rel="stylesheet" href="../static/css/font-awesome.min.css">
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
</head>
<body>
	<div>
	  <a href="playAllConllect" target="blank">播放全部</a>
		<table id="table" class="table table-striped table-bordered"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>歌曲名称</th>
					<th>歌手名称</th>
					<th>播放量</th>
					<th>下载量</th>
					<th>操作</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
<script src="../static/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="../static/js/JsonpAjax.js"></script>
<script type="text/javascript" src="../static/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../static/js/dataTables.bootstrap.min.js"></script>
<script>
$(function(){
	query();
})
function query() {
		$(document).ready(function() {
			$('#table').dataTable({
				'ajax' : {
					'url' : 'CollectMusic',
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
				'aoColumns' : [ {'data' : 'mname'}, 
				                {'data' : 'aname'},
				                {'data' : 'pcount'}, 
				                {'data' : 'dcount'},
				                { 'target':3,
				                   "data" : null,
				                	"render" : function(data,type,row) {
				                		var id = row.id;
				                		var html = "<a href='getInfo?id="+id+"'  class='delete btn btn-default btn-xs'  target='blank'><i class='fa fa-times'></i>播放</a>"
				                		html += "<a href='javascript:void(0);' onclick='deleteThisRowPapser("+ id + ")'  class='down btn btn-default btn-xs'><i class='fa fa-arrow-down'></i> 删除</a>"
				                		return html;
				                		}
				                		},
				              ],
			});
		});}
function deleteThisRowPapser(id){		
			  if(confirm("确定要取消收藏吗?")){
					$.ajax({
						   type: "POST",
						   url: "deleteConllect?id="+id+"",
						   data: "json",
						   success: function(Msg){
						     alert( "取消: " + Msg );
						     query();
						   }
						});
		        }
		}
</script>
</html>