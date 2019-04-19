<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/COMMON/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>register</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link rel="stylesheet" href="CSS/login.css" media="all">


<script>
	layui.use(['form', 'layer'], function(){
		var form = layui.form
		,layer = layui.layer
		
		
		var index = layer.open({
			type: 2
			,title : '用户协议'
			,closeBtn : false
			,content: 'protocol.html'
			,area: ['320px', '460px']
			,btn : ['同意并继续','取消']
			,btnAlign: 'c'
			//按钮
			,yes: function() {
				layer.msg("请注册",{
					offset:'400px'
				})
				layer.close(index); 
			}
			,btn2: function() {
				window.location.href = 'index.jsp';
			}
		});
		
		//自定义验证规则
		form.verify({
			repass: function(value){
			  var repassvalue = $('#password').val();
// 			  console.log(repassvalue)
// 			  console.log(value)
			  if(value != repassvalue){
			  	  return '密码不一致!';
			  }
		  }
		});
		
		$("#phone").change(function () {
			var phone = $("#phone").val();
			
			var url = "checkPhone";
			var args = {"phone":phone,"time":new Date()};
			$.post(url, args, function(data){
// 				alert(data)
				if(data == "existPhoneY"){
					layer.msg('用户已被注册')
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
		<h3 style="text-align: center;">用户注册</h3>
		<hr class="layui-bg-gray" style="height: 2px">
		<form class="layui-form" action="register" lay-filter="example" method="post">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo">
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input type="tel" name="phone" lay-verify="required|phone" id="phone"
								placeholder="请输入手机号" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input id="password" type="password" name="password" id="password"
								lay-verify="required" placeholder="请输入密码"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input type="password" name="password2" lay-verify="repass"
								id="password2" placeholder="请再次输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" lay-submit="" lay-filter="demo1">注册</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
</body>
</html>
	