<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<title>login</title>
	</head>

<script type="text/javascript">
function adminLogin(){
	$.ajax({
		url:"./rest/user/adminLogin",
		type:"post",
		data:$("#adminUser").serialize(),
		success:function(data){
			if(data.nickname == null){
				alert("账号或密码错误");
			}else{
				if(data.roll == 0){
					alert("你不是管理员！！");
				}else{
					window.location.href="jsp/manager.jsp";
				}
			}
		}
		
	})
}

</script>
	<body style="background-color: #EEEEEE">
		<div class="container" style="width: 700px;height: 400px;margin-top: 200px;">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">管理员登陆</h4>
			</div>
			<form id="adminUser" name="user" action="./rest/user/adminLogin" method="post">
				<div class="modal-body">
					<div class="input-group" style="margin: auto 30px">
						<span class="input-group-addon">用户名</span> 
						<input type="text" class="form-control" placeholder="twitterhandle" name="username" >
					</div>
					<br>
					<div class="input-group" style="margin: auto 30px">
						<span class="input-group-addon">密 码</span> 
						<input type="text" class="form-control" placeholder="twitterhandle" name="password" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" >关闭</button>
					<button type="button" class="btn btn-primary" onclick="javascript:adminLogin();" >登陆</button>
				</div>
			</form>
		</div>
	</body>
</html>