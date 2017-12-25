<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jsrender.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jsrender.js"></script>
<title>Message Board</title>
</head>

<script id="list" type="text/x-jsrender">
<div id="Message">
<span style="font-family: '微软雅黑';font-size: large;float: left;margin-left: 50px;" id="showMessage" >{{:messageDetails}}</span>
<br>
<span style="font-family: '微软雅黑';font-size: medium;float: right;margin-right: 50px;" id="showMessage" >{{:createPerson}}</span>
<br>
<hr>
<span style="font-family: '微软雅黑';font-size: small;float: right;margin-right: 50px;" id="showMessage" >{{:createTime}}</span>						
</div>
</script>

<script type="text/javascript">
$(function(){
	showAllMessage();
})

//注销
function logout(){
	history.go(0);
}

	function reFresh(){
		showAllMessage();
	}
	//发送回复
	function sendCommom(){
		if($("#commomDetails").val() == ""){
			alert("不能为空！！");
		}else{
			$.ajax({
				url:"rest/Message/sendCommon",
				type:"post",
				data:$("#addCommomDetails").serialize(),
				success:function(data){
					//alert(JSON.stringify(data));
					$("#showCommomDetails").empty();
					var html = $("#comonlist").render(data.message);
					$("#showCommomDetails").append(html);
				}
			});
		}
		
	}
	//发送留言
	function send(){
		if($("#messageArea").val() == ""){
			alert("不能为空！！");
		}else{
			$.ajax({
				url:"rest/Message/showMessage",
				type:"post",
				data:$("#MessageDetails").serialize(),
				success:function(data){
					//alert(JSON.stringify(data));
					$("#showList").empty();
					var html = $("#list").render(data.message);
					$("#showList").append(html);
				}
			});
		}
		
	}
	function showAllMessage(){
		$.ajax({
			url:"rest/Message/showPaMessage",
			type:"post",
			success:function(data){
				$("#showList").empty();
				var html = $("#list").render(data.message);
				$("#showList").append(html);
			}
		})
	}
	//登陆
	function login(){
		$.ajax({
			url:"rest/user/login",
			type:"post",
			data:$("#user").serialize(),
			success:function(data){
				//alert(JSON.stringify(data));
				var nickname = JSON.stringify(data.nickname).replace("\"","").replace("\"","");
				$("#userNickName").html(nickname);
				$('#sendMessageUserName').val(nickname);
				$('#sendCommonUserName').val(nickname);
				$("#userInfo").toggle();
				$("#LoginAndRegis").toggle()
			}
		});
	}
	//注册方法
	function regis(){
		if($("#password").val()==$("#rePassword").val()){
			$.ajax({
				url:"rest/user/regis",
				type:"post",
				data:$("#regisForm").serialize(),
				success:function(data){
					if(data.isRegis == 1){
						alert("你的账号已被注册！！");
					}else{
						alert("注册成功！！！你的账号为"+JSON.stringify(data.username));
					}
				}
			});
		}else{
			alert("两次密码输入不一致！！！");
		}
		
	}

</script>

<body style="background-color: #EEEEEE">
	<div class="navbar-header " style="background-color: #EEEEEE;">
		<!--
                        	作者：offline
                        	时间：2017-12-22
                        	描述：导航栏
                        -->
		<a class="navbar-brand" href="#">留言板</a>
	</div>
	<div>

		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header" style="margin-left: 200px;">
					<a class="navbar-brand" href="#" style="color: #122B40;">留言板</a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" style="color: #122B40;" onclick="javascript:reFresh();"><span
							class="	glyphicon glyphicon-refresh" data-toggle="modal"
							data-target="#reFleshMessage"></span> 刷新</a></li>
					<li><a href="#" style="color: #122B40;"><span
							class="glyphicon glyphicon-envelope" data-toggle="modal"
							data-target="#sendMessage"></span> 发留言</a></li>
					<li><a href="#" style="color: #122B40;margin-right: 200px"><span
							class="glyphicon glyphicon-log-in" onclick="javascript:logout();"></span> 注销</a></li>
				</ul>
			</div>
		</nav>
		<!--
	作者：offline
	时间：2017-12-22
	描述：导航栏结束-->
		<div class="jumbotron"
			style="background-color: #122B40; margin: 0 auto;height: 275px;">
			<div class="container">
				<h1 style="color: #ffffff">留&nbsp;&nbsp;&nbsp;言&nbsp;&nbsp;&nbsp;板</h1>
				<p style="color: #ffffff">随时随地分享你新编的故事</p>
				<div  id="userInfo" style="display:none;float: right;margin-right: 15px;">
				<span style="font-family: '微软雅黑';color: #FFFFFF;font-size: large;">Welcome!&nbsp;&nbsp;&nbsp;
				</span><span id="userNickName" style="font-family: '微软雅黑';color: #FFFFFF;font-size: large;">&nbsp;&nbsp;&nbsp;</span>
				</div>
				
				<div id="LoginAndRegis">
				<button class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#regis"
					style="float: right; margin: auto 15px; background-color: #FFFFFF; color: #122B40;">
					<span class="glyphicon glyphicon-book"></span> 注册
				</button>
				<button class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#login"
					style="float: right; margin: auto 15px; background-color: #FFFFFF; color: #122B40;">
					<span class="glyphicon glyphicon-user"></span> 登陆
				</button>
				</div>
				<!-- 注册模态框 -->
				<div class="modal fade" id="regis" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">注册</h4>
							</div>
							<form id="regisForm" class="form-horizontal" role="form" style="margin: 50px 50px 50px 50px;">
									<div class="form-group">
										<label class="col-sm-2 control-label" >昵称</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="nickname" id="firstname" placeholder="请输入用户名">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" >用户名</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="username" id="firstname" placeholder="请输入用户名">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" >密码</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="password" id="password" placeholder="请输入密码">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" >重复密码</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="rePassword" id="rePassword" placeholder="请再次输入密码">
										</div>
									</div>
									
								</form>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:regis();">注册</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!--
                	作者：offline
                	时间：2017-12-22s
                	描述：发送留言模态框
                -->
				<div class="modal fade" id="sendMessage" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">发留言</h4>
							</div>
							<form id="MessageDetails">
							<div class="modal-body" style="height: 500px;">
									<textarea name="message" style="width: 100%;height: 95%;" id="messageArea"></textarea>
									按下 ESC 按钮退出。
									<input type="hidden" id="sendMessageUserName" name="sendMessageUserName" ></input>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:send()">发送</button>
							</div>
							</form>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!-- 登陆模态框 -->
				<div class="modal fade" id="login" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">登陆</h4>
								</div>
								<form id="user" name="user">
								<div class="modal-body">
									<div class="input-group" style="margin: auto 30px">
										<span class="input-group-addon">用户名</span> <input type="text"
											class="form-control" placeholder="twitterhandle"
											name="username" >
									</div>
									<br>
									<div class="input-group" style="margin: auto 30px">
										<span class="input-group-addon">密 码</span> <input type="text"
											class="form-control" placeholder="twitterhandle"
											name="password" >
									</div>
									<br> 按下 ESC 按钮退出。
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary"  data-dismiss="modal" onclick="javascript:login()">登陆</button>
								</div>
								</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!-- 留言板主题 -->

	</div>

	</div>
	<div class="container" id="showList">
		
	</div>
		<!-- <div id="addCommom" class="collapse">
			
		</div>
		 -->
		
		</body>

</html>

