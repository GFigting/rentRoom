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
<title>FindBack</title>
<script>
	layui.use(['form', 'layer'], function(){
		var form = layui.form
		,layer = layui.layer;
		
	});
</script>
</head>
<body>
	<form class="layui-form" action="resetPasswd" lay-filter="example" method="post">
	<div class="layui-container site-demo">
		<h3 style="text-align: center;">忘记密码</h3>
		<hr class="layui-bg-gray" style="height: 2px">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-block">
						<input type="tel" name="phone" lay-verify="required|phone" placeholder="请输入您忘记密码的手机号" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">找回密码</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</body>
</html>