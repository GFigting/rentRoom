<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/COMMON/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>login</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="CSS/login.css" media="all">

<script>
	layui.use(['form', 'layer'], function(){
		var form = layui.form
		,layer = layui.layer;
		
		
// 		$("button").click(function(event) {
			
			
// 			var url = "login";
// 			var args = {"time":new Date()};
			
// 			$.ajax({
// 		        type : "post",
// 		        url : url,
// 		        data : args,
// 		        success : function(data) {
// 		        	console.log("data---" + data);
// 		        	if(data.code == 0){
// 						layer.msg(data.msg);
// 						event.preventDefault();
// 						//有待修改...
// 					}else{
// 						layer.msg(data.msg);
// 						event.preventDefault();
// 					}
// 		        },
// 		        error : function() {
		        	
// 		        }
// 		    });
			
// 		})

		$("#phone").change(function () {
			var phone = $("#phone").val();
			console.log("phone---"+phone)
			var url = "checkPhone";
			var args = {"phone":phone,"time":new Date()};
			$.post(url, args, function(data){
// 				alert(data)
				if(data == "existPhoneN"){
					layer.msg('请先注册')
					$('#phone').val("");
					//有待修改...
				}
			});	
		})
		
		$("button").click(function() {
			var phone = $("#phone").val();
			var password = $("#password").val();
			console.log(phone+'========='+password);
			if(phone != null && password != null){
				layer.load(1);
			}
		})
	});
</script>
</head>

<body>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				<a href="nav_me"><i class="layui-icon layui-icon-left" style="font-size: 20px; color: &#xe603;"></i> </a> 
			</div>
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
				<h3 style="text-align: center;">用户登录</h3>
			</div>
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				&nbsp;
			</div>
		</div>
		<hr class="layui-bg-gray" style="height: 2px">
		<form class="layui-form" action="login" lay-filter="example" method="post">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo">
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input type="tel" id="phone" name="phone" lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit="" lay-filter="demo1">登录</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
		<div class="layui-row">
			<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
				<div class="grid-demo" id="city">
					<div class="register">
						<a href="register.jsp">新用户注册</a>
					</div>
				</div>
			</div>
			<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
				<div class="grid-demo" id="city">
					<div class="findback">
						<a href="findback">忘记密码</a>
					</div>
				</div>
			</div>
		</div>
		
	</div>


</body>
</html>
