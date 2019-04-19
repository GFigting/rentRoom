<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/COMMON/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>ResetPasswd</title>
<script>
	layui.use(['form', 'layer'], function(){
		var form = layui.form
		,layer = layui.layer;
		
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
		
		var phone = '${requestScope.phone}';
		if(phone == ''){
			$("#phone").change(function () {
				var phone = $("#phone").val();
				
				var url = "checkPhone";
				var args = {"phone":phone,"time":new Date()};
				$.post(url, args, function(data){
	// 				alert(data)
					if(data == "existPhoneN"){
						layer.msg('用户未被注册,请先注册')
						$('#phone').val("");
						//有待修改...
					}
				});	
			})
		}else{
			var phone = $("#phone").val(phone);
// 			$("#phone").attr("disabled","disabled");
		}
	});
</script>
</head>
<body>
	<form class="layui-form" action="resetPasswd" lay-filter="example" method="post">
	<div class="layui-container site-demo">
		<h3 style="text-align: center;">重置密码</h3>
		<hr class="layui-bg-gray" style="height: 2px">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-block">
						<input type="tel" id="phone" name="phone" lay-verify="required|phone" placeholder="请输入您忘记密码的手机号" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">			
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-block">
						<input id="password" type="password" name="password" lay-verify="required|pass" placeholder="请重新设置密码" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-block">
						<input type="password" name="password2" lay-verify="repass" id="password2" placeholder="请再次输入密码" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">确定</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>
</html>