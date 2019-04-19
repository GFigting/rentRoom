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
<title>Detail</title>
<script type="text/javascript">
	layui.use(['form', 'layer','element','carousel'], function(){
		var form = layui.form
		,layer = layui.layer
		,element = layui.element
		,carousel = layui.carousel
		
		
		carousel.render({
		  elem: '#image'
		  ,interval: 1800
		  ,anim: 'fade'
		  ,height: '180px'
		  ,width: '100%'
		  ,arrow: 'none'
		});
	});
</script>
<style type="text/css">
.grid-demo{
	text-align: left;
}
</style>
</head>
<body>
	<div class="layui-container">
		<div class="layui-row" style="margin-bottom: 10px">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo">
					<div class="layui-carousel" id="image" style="">
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