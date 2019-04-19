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
<title>RoomShow</title>
</head>
<body>
	<div class="layui-container">
		<div class="layui-row" style="margin-top: 200px">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo">
					发布成功，请耐心等待工作人员的审核！<br>(本次测试跳过审核)
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo">
					<a href="user_backmain"><button class="layui-btn layui-btn-normal">回到首页</button></a>
				</div>
			</div>
		</div>
		<br>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo">
					<a href="user_display?roomId=${roomId }"><button class="layui-btn layui-btn-normal">预览发布</button></a>
				</div>
			</div>
		</div>
		
    </div>
</body>
</html>