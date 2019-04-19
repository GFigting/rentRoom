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
<title>message</title>
<style type="text/css">
	p{
		margin-top: -25px
	}
	.layui-nav .layui-nav-item {
    	line-height: 50px;
    }
    .layui-nav .layui-nav-item a {
	    padding: 0 30px;
	}
</style>
<script type="text/javascript">
	layui.use(['form', 'layer','element'], function(){
		var form = layui.form
		,layer = layui.layer
		,element = layui.element;
	});
</script>
</head>
<body>
	<div class="layui-container site-demo">
		<div class="layui-row">
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="grid-demo">
					暂无消息
				</div>
			</div>
		</div>
	</div>

	<div class="layui-container footer-demo">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<ul class="layui-nav" style="text-align: center;padding: 0">
					<li class="layui-nav-item" id="nav_main">
						<a href="nav_main"><i class="layui-icon layui-icon-home" style="color: #1E9FFF;font-size: 25px;"></i><p>首页</p></a>
					</li>
					<li class="layui-nav-item layui-this" id="nav_message">
						<a href="nav_message"><i class="layui-icon layui-icon-dialogue" style="color: #1E9FFF;font-size: 25px;"></i><p>消息</p></a>
					</li>
					<li class="layui-nav-item" id="nav_moments">
						<a href="nav_moments"><i class="layui-icon layui-icon-user" style="color: #1E9FFF;font-size: 25px;"></i><p>动态</p></a>
					</li>
					<li class="layui-nav-item" id="nav_me">
						<a href="nav_me"><i class="layui-icon layui-icon-username" style="color: #1E9FFF;font-size: 25px;"></i><p>我</p></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>