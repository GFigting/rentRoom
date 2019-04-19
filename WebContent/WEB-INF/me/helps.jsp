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
<title>MyHelp</title>
<style type="text/css">
.layui-input, .layui-textarea {
    width: 100%;
}
.layui-btn {
    width: 100%;
}
</style>
<script>
	layui.use(['form', 'layer'], function(){
		var form = layui.form
		,layer = layui.layer;
		
	});
</script>
</head>
<body>
	<div class="layui-container site-demo">
		<div class="layui-row">
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				<a href="nav_me"><i class="layui-icon layui-icon-left" style="font-size: 20px; color: &#xe603;"></i> </a> 
			</div>
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
				<h3 style="text-align: center;">反馈</h3>
			</div>
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				&nbsp;
			</div>
		</div>
		<hr class="layui-bg-gray" style="height: 2px">
		<form class="layui-form layui-form-pane" action="reflection">
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">宝贵意见</label>
				<div class="layui-input-block">
					<textarea lay-verify="required" placeholder="诚恳地欢迎您向我们提出宝贵意见" class="layui-textarea" name="content"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">您的E-mail</label>
				<div class="layui-input-block">
					<input type="text" name="email" lay-verify="" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<button class="layui-btn" lay-submit="" lay-filter="demo2">提交</button>
			</div>
		</form>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo">
					我们会尽快接到您的反馈并处理！
				</div>
			</div>
		</div>
	</div>
</body>
</html>