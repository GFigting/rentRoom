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
<title>Appointment</title>
<script type="text/javascript">
	
	layui.use(['form', 'layer'], function(){
		var form = layui.form
		,layer = layui.layer
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
				<h3 style="text-align: center;">预约看房</h3>
			</div>
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				&nbsp;
			</div>
		</div>
		<hr class="layui-bg-gray" style="height: 2px">
		<div class="layui-row">
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
				<div class="grid-demo">您暂时还没有预约哦</div>
			</div>
		</div>
	</div>


</body>
</html>