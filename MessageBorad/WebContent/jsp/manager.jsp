<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jsrender.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jsrender.js"></script>
		<title>Message Manager</title>
	</head>
<script id="Alllist" type="text/x-jsrender">
<div class="panel-body">
<table class="table table-hover">
<tbody>
<tr>
	<td style="width:40%;">{{:messageDetails}}</td>
	<td style="width:30%;">{{:createPerson}}</td>
	<td><a href="#" style="color: #122B40;" onclick="javascript:deleteMessage({{:messageId}});"><span
							class="glyphicon glyphicon-trash" ></span> 删除</a></td>
</tr>
</tbody>
</div>
</script>	

<script id="AllNonlist" type="text/x-jsrender">
<div class="panel-body">
<table class="table table-hover">
<tbody>
<tr>
	<td style="width:40%;">{{:messageDetails}}</td>
	<td style="width:30%;">{{:createPerson}}</td>
	<td><a href="#" style="color: #122B40;" onclick="javascript:PassMessage({{:messageId}});"><span
							class="	glyphicon glyphicon-ok" ></span> 通过</a></td>
</tr>
</tbody>
</div>
</script>

<script id="AllPasslist" type="text/x-jsrender">
<div class="panel-body">
<table class="table table-hover">
<tbody>
<tr>
	<td style="width:40%;">{{:messageDetails}}</td>
	<td style="width:30%;">{{:createPerson}}</td>
	<td><a href="#" style="color: #122B40;" onclick="javascript:RemoveMessage({{:messageId}});"><span
							class="	glyphicon glyphicon-remove" ></span> 隐藏</a></td>
</tr>
</tbody>
</div>
</script>
	
<script type="text/javascript">

//删除留言
function deleteMessage(str){
	var jstr = eval('('+str+')');
	$.ajax({
		url:"../rest/Message/deleteMessage",
		type:"post",
		data:{a1:jstr},
		success:function(data){
			$("#collapseOne").empty();
			var html = $("#Alllist").render(data.message);
			$("#collapseOne").append(html);
		}
	})
	
}
//审核通过
function PassMessage(str){
	var jstr = eval('('+str+')');
	$.ajax({
		url:"../rest/Message/PassMessage",
		type:"post",
		data:{a1:jstr},
		success:function(data){
			$("#collapseTwo").empty();
			var html = $("#AllNonlist").render(data.message);
			$("#collapseTwo").append(html);
		}
	})
}
//取消审核通过
function RemoveMessage(str){
	var jstr = eval('('+str+')');
	$.ajax({
		url:"../rest/Message/RemoveMessage",
		type:"post",
		data:{a1:jstr},
		success:function(data){
			$("#collapseThree").empty();
			var html = $("#AllPasslist").render(data.message);
			$("#collapseThree").append(html);
		}
	})
}
function showAllMessage(){
	$.ajax({
		url:"../rest/Message/showAllMessage",
		type:"post",
		success:function(data){
			$("#collapseOne").empty();
			var html = $("#Alllist").render(data.message);
			$("#collapseOne").append(html);
		}
	})
}

function showNonMessage(){
	$.ajax({
		url:"../rest/Message/showNonMessage",
		type:"post",
		success:function(data){
			$("#collapseTwo").empty();
			var html = $("#AllNonlist").render(data.message);
			$("#collapseTwo").append(html);
		}
	})
}

function showPaMessage(){
	$.ajax({
		url:"../rest/Message/showPaMessage",
		type:"post",
		success:function(data){
			$("#collapseThree").empty();
			var html = $("#AllPasslist").render(data.message);
			$("#collapseThree").append(html);
		}
	})
}
</script>
	<body style="background-color: #EEEEEE">
		<div class="jumbotron" style="background-color: #122B40;margin: 0 auto;height: 275px;">

			<div class="container">

				<h1 style="color: #FFFFFF;">留&nbsp;&nbsp;&nbsp;言&nbsp;&nbsp;&nbsp;板</h1>
				<p style="color: #FFFFFF;">后台管理</p>
			</div>
		</div>
		<div class="container" style="margin-top: 30px;">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseOne" onclick="javascript:showAllMessage();">
					查看所有留言信息
				</a>
			</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse">
						
					</div>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">
						<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseTwo" onclick="javascript:showNonMessage();">
					查看未通过检测的留言
				</a>
			</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse">
						
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
						<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseThree" onclick="javascript:showPaMessage();">
					查看已通过检测的留言
				</a>
			</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse">
						
					</div>
				</div>
				
			</div>
		</div>
	</body>

</html>