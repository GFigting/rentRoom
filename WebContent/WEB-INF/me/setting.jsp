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
<title>Setting</title>
<style type="text/css">
.grid-demo{
	text-align: left;
	line-height: 20px;
	padding-left: 10px;
}
</style>
<script type="text/javascript">
	layui.use(['layer','upload'], function(){
		var layer = layui.layer
		
		$(".clearCookie").click(function() {
			layer.msg("清除成功");
		})
		$(".update").click(function() {
			layer.msg("已是最新版本v1.0");
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
				<h3 style="text-align: center;">设置</h3>
			</div>
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				&nbsp;
			</div>
		</div>
		<hr class="layui-bg-gray" style="height: 2px">
		<div class="layui-row">
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
				<div class="grid-demo clearCookie">
					清除缓存
				</div>
			</div>
			<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
				<div class="grid-demo">
					<i class="layui-icon layui-icon-right"></i>
				</div>
			</div>
		</div>
		<hr class="layui-bg-gray">
		<div class="layui-row">
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
				<div class="grid-demo update">
					检查更新
				</div>
			</div>
			<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
				<div class="grid-demo">
					<i class="layui-icon layui-icon-right"></i>
				</div>
			</div>
		</div>
		<hr class="layui-bg-gray">
	</div>
</body>
</html>