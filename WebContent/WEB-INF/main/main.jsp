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
<title>Main</title>
<link rel="stylesheet" href="CSS/main.css" media="all">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=dRbrKqkkvcAP9eX0VAbwmuPoeZ7Fq8ut"></script>
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
	#img{
		width: 30px;
		height: 30px;
		margin-bottom: 5px;
	}
</style>
<script type="text/javascript">
	layui.use(['form', 'layer','element'], function(){
		var form = layui.form
		,layer = layui.layer
		,element = layui.element;
		
		
		
	});
	
	// 百度地图API功能
	var map = new BMap.Map("city");
// 	var point = new BMap.Point(116.331398,39.897445);

	function myFun(result){
		console.log(result);
		var cityName = result.name;
// 		$("#city").html('<i class="layui-icon layui-icon-location" style="color: #1E9FFF;"></i>&nbsp;&nbsp;'+ result.name);
		window.setTimeout(function(){
			$("#city").empty().html('<i class="layui-icon layui-icon-location" style="color: #1E9FFF;"></i>&nbsp;&nbsp;石家庄');
		},3000)
// 		map.setCenter(cityName);
		console.log("当前定位城市:"+cityName);
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
</script>
</head>
<body>
	<div class="layui-container site-demo">
		<div class="layui-row">
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="grid-demo" id="city">
					<i class="layui-icon layui-icon-location" style="color: #1E9FFF;"></i>&nbsp;&nbsp;定位中
				</div>  
			</div>
			<div class="layui-col-xs8 layui-col-sm8 layui-col-md8">
				<div class="grid-demo">
					<div class="layui-input-block">
						<a href="main_search"><input id="autocomplete" name="search" autocomplete="off" placeholder="您想住哪儿" class="layui-input"></a>
					</div>
				</div>
			</div>
		</div>
		<hr class="layui-bg-gray">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="layui-anim layui-anim-scaleSpring">
					<a href="main_list?sort=y">
						<img src="images/y.png" id="img"><br>
						月租
					</a>
				</div>
			</div>
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="layui-anim layui-anim-scaleSpring">
					<a href="main_list?sort=z">
						<img src="images/z.png" id="img"><br>
						整租
					</a>
				</div>
			</div>
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="layui-anim layui-anim-scaleSpring">
					<a href="main_list?sort=h">
						<img src="images/h.png" id="img"><br>
						合租
					</a>
				</div>
			</div>
		</div>
		<div class="layui-row layui-col-space10">
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="layui-anim layui-anim-scaleSpring">
					<a href="main_list?sort=g">
						<img src="images/g.png" id="img"><br>
						公寓
					</a>
				</div>
			</div>
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="layui-anim layui-anim-scaleSpring">
					<a href="main_list?sort=t">
						<img src="images/t.png" id="img"><br>
						通勤找房
					</a>
				</div>
			</div>
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="layui-anim layui-anim-scaleSpring">
					<a href="main_list?sort=f">
						<img src="images/f.png" id="img"><br>
						全部房源
					</a>
				</div>
			</div>
		</div>
		<hr class="layui-bg-gray">
	</div>
	<div class="layui-container footer-demo">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<ul class="layui-nav" style="text-align: center;padding: 0">
					<li class="layui-nav-item layui-this" id="nav_main">
						<a href="nav_main"><i class="layui-icon layui-icon-home" style="color: #1E9FFF;font-size: 25px;"></i><p>首页</p></a>
					</li>
					<li class="layui-nav-item" id="nav_message">
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