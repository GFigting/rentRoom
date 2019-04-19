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
<title>ChangeName</title>
<script>
	layui.use(['form', 'layer'], function(){
		var form = layui.form
		,layer = layui.layer;
		
		$("button").click(function() {
			layer.load(1);
		})
	});
</script>
</head>
<body>
	<form class="layui-form" action="changeName" lay-filter="example" method="post">
	<div class="layui-container site-demo">
		<h3 style="text-align: center;">修改昵称</h3>
		<hr class="layui-bg-gray" style="height: 2px">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="required" placeholder="请输入新的昵称" autocomplete="off" class="layui-input">
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