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
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=dRbrKqkkvcAP9eX0VAbwmuPoeZ7Fq8ut"></script>
<title>LaunchDetail</title>
<script type="text/javascript">
	layui.use(['form', 'layer','element','carousel'], function(){
		var form = layui.form
		,layer = layui.layer
		,element = layui.element
		,carousel = layui.carousel
		
		
		carousel.render({
		  elem: '#image'
		  ,interval: 3000
		  ,anim: 'fade'
		  ,height: '180px'
		  ,width: '100%'
		  ,arrow: 'none'
		});
		
		//详细位置
		var sContent ='${roomDetail.location }^^^';
		console.log(sContent);
		var map = new BMap.Map("dtlLocation");
		map.addControl(new BMap.NavigationControl()); //添加默认缩放平移控件
		var point = new BMap.Point(113.39481756,23.40800373);
	 	map.centerAndZoom(point, 15);
		var marker = new BMap.Marker(point);  // 创建标注
		map.addOverlay(marker);              // 将标注添加到地图中
	 	
		function myFun(result){
			var cityName = result.name;
			map.setCenter(cityName);
			console.log("当前定位城市:"+cityName);
			
			var local = new BMap.LocalSearch(map, {
				renderOptions:{map: map}
			});
			local.search(sContent);
			var opts = {
				width : 50, // 信息窗口宽度
				height : 15, // 信息窗口高度
			}
//	 	 	var infoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opts);  // 创建信息窗口对象 
			var infoWindow = new BMap.InfoWindow(sContent,opts); // 创建信息窗口对象
			marker.addEventListener("click", function(){
				console.log(infoWindow)
				map.openInfoWindow(infoWindow,point); //开启信息窗口
			});
//		 	map.openInfoWindow(infoWindow, point); //开启信息窗口
		}
		var myCity = new BMap.LocalCity();
		myCity.get(myFun);
		
	});
	
	
</script>
<style type="text/css">
.grid-demo{
	text-align: left;
}
#dtlLocation{
	width: 100%;
	height: 200px;
	margin:0;
	font-family:"微软雅黑";
	font-size:14px;
}
</style>
</head>
<body>
	<div class="layui-container">
		<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
			<a href="nav_me"><i class="layui-icon layui-icon-left" style="font-size: 20px; color: &#xe603;"></i> </a> 
		</div>
		<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
			<h3 style="text-align: center;">房屋详情</h3>
		</div>
		<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
			&nbsp;
		</div>
		<hr class="layui-bg-gray" style="height: 2px">
		<div class="layui-row" style="margin-bottom: 20px">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo">
					<div class="layui-carousel" id="image">
						<div carousel-item="">
							<s:iterator value="#request.images">
								<div><a href="${imgUrl }"><img src="${imgUrl }" style="width: 450px;height: 180px"></a></div>
							</s:iterator>
						</div>
					</div>
				</div>
			</div>
		</div>
		<fieldset class="layui-elem-field"> 
			
<!-- 		    <legend>基本信息</legend> -->
		  	<div class="layui-field-box">
				<div class="layui-row">
					<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
						<div class="grid-demo" style="font-size: 15px;color: #000;font-weight: 550">
							${roomDetail.roomName }
						</div>	
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
						<div class="grid-demo" style="text-align: center;font-size: 15px;color: #ff0000;font-weight: 550">
							￥${roomDetail.price } /月
						</div>	
					</div>
					<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
						<div class="grid-demo" style="text-align: center;font-size: 15px;color: #ff0000;font-weight: 550">
							${roomDetail.roomType } 
						</div>	
					</div>
					<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
						<div class="grid-demo" style="text-align: center;font-size: 15px;color: #ff0000;font-weight: 550">
							${roomDetail.roomArea } 平方
						</div>	
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
						<div class="grid-demo">
							付款方式:&nbsp;&nbsp;付X押X
						</div>	
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
						<div class="grid-demo">
							发布时间:&nbsp;&nbsp;${roomDetail.pubDate }
						</div>	
					</div>
				</div>
 			</div>
		</fieldset>
		<fieldset class="layui-elem-field">
			
		    <legend>基本信息</legend>
		  	<div class="layui-field-box">
		
				<div class="layui-row">
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<div class="grid-demo">
							租房方式:&nbsp;&nbsp;${roomDetail.rentWay }
						</div>	
					</div>
					<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
						<div class="grid-demo">&nbsp;</div>	
					</div>
					<div class="layui-col-xs5 layui-col-sm5 layui-col-md5">
						<div class="grid-demo">
							楼层:&nbsp;&nbsp;${roomDetail.floor }
						</div>	
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
						<div class="grid-demo">
							住宅类型:&nbsp;&nbsp;普通住房
						</div>	
					</div>
					<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
						<div class="grid-demo">&nbsp;</div>	
					</div>
					<div class="layui-col-xs5 layui-col-sm5 layui-col-md5">
						<div class="grid-demo">
							朝向:&nbsp;&nbsp;${roomDetail.towards }
						</div>	
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
						<div class="grid-demo">
							配套设施:&nbsp;&nbsp;${roomDetail.facility }
						</div>
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-location" style="color: #1E9FFF;"></i>
							&nbsp;&nbsp;${roomDetail.location }
						</div>
					</div>
				</div>
		  	</div>
		</fieldset>
		
		<fieldset class="layui-elem-field">
			
		    <legend>详细位置</legend>
		  	<div class="layui-field-box">
				<div class="layui-row">
					<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
						<div class="grid-demo" id="dtlLocation">
							
						</div>
					</div>
				</div>
		  	</div>
		</fieldset><br>
		
		<div class="layui-row" style="margin-bottom: 30px;">
			<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
				<div class="grid-demo" style="text-align: center;">
					<button class="layui-btn layui-btn-primary">经纪人:&nbsp;&nbsp;${roomDetail.agents.name }</button>
				</div>	
			</div>
			<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
				<div class="grid-demo" style="text-align: center;">
					<a href="tel:${roomDetail.agents.phone }"><button class="layui-btn">电话联系</button></a>
				</div>	
			</div>
		</div>
	</div>

</body>
</html>