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
<title>MyContract</title>
<style type="text/css">
	.grid-demo{
		line-height: 25px;
	}
	.layui-form-item .layui-input-inline {
	    float: left;
	    width: 93px;
	    margin: 0;
	}
	.layui-form-item {
	    clear: both;
	    margin-left: 10;
	}
</style>
</head>
<body>
	<div class="layui-container site-demo">
		<div class="layui-row">
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				<a href="nav_me"><i class="layui-icon layui-icon-left" style="font-size: 20px; color: &#xe603;"></i> </a> 
			</div>
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
				<h3 style="text-align: center;">我的合同</h3>
			</div>
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				&nbsp;
			</div>
		</div>
		<hr class="layui-bg-gray" style="height: 2px">
		<c:if test="${ empty roomDetails }">
			<div class="layui-row">
				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
					<div class="grid-demo">
						您暂时还有租房合同哦，赶紧去看看吧
					</div>
				</div>
			</div>
		</c:if>
		<div class="layui-row">
			<c:forEach items="${roomDetails }" var="item">
				<a href="roomDetail?id=${item.id }">
					<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
						<div class="layui-card">
							<div class="layui-card-header">
								<div class="grid-demo" style="font-size: 15px;color: #000;font-weight: 550">${item.roomName}</div>
							</div>
							<div class="layui-card-body">
								<div class="layui-row">
									<div class="layui-col-xs8 layui-col-sm8 layui-col-md8">
										<div class="grid-demo">
											<i class="layui-icon layui-icon-location" style="color: #1E9FFF;"></i>
											${item.location}<br>${item.roomType} &nbsp;|&nbsp;
											${item.roomArea}平方 &nbsp;|&nbsp; ${item.towards}
										</div>
									</div>
									<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
										<div class="grid-demo" style="color: #f00;font-size: 15px">￥&nbsp;${item.price}</div>
									</div>
								</div>
							</div>
						</div>
						<hr style="height: 5px; color: #F2F2F2;">
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>