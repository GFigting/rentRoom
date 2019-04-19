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
<title>MySelf</title>
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
	.grid-demo{
		text-align: left;
		line-height: 20px;
		padding-left: 10px;
	}
	.layui-icon-right{
		padding-left: 30px;
	}
	.login {
	    height: 100px;
	    line-height: 100px;
	    font-size: 20;
	    font-weight: bolder;
	    margin-left: 20px;
	}
	.layui-nav-img {
	    width: 50px;
	    height: 50px;
	}
	.layui-btn {
	    width: 100%;
	}
</style>
<script type="text/javascript">
	layui.use(['layer'], function(){
		var layer = layui.layer
		
		var loginUser = '${sessionScope.userLogin}';
		console.log("userLogin---${userLogin.owner.name}");
		var headImg = 'images/login.jpg';
		if("${userLogin.userInfo.headImg}" != ''){
			headImg = '${userLogin.userInfo.headImg}';
		}
		var name = '豆芽';
		if("${userLogin.userInfo.name}" != ''){
			name = '${userLogin.userInfo.name}';
		}
		if(loginUser == ''){
			$('.login').html('<a href="login.jsp"><img src="'+ headImg +'" class="layui-nav-img">登录/注册</a>');
		}else {
			$('.login').html('<a href="my_info"><img src="' + headImg +'" class="layui-nav-img">'+ name +'&nbsp;>&nbsp;</a>');
		}
		
		$(".layui-btn").click(function() {
			layer.confirm('确定退出登录吗', {
			  	btn: ['确定','取消'] //按钮
			  	,title: false
			  	,offset: '300px'
			  	,btnAlign: 'c'
			  	,closeBtn: 0
			},function(){
		  		window.location.href = "logout";
		  	});
		})
		
	});
	
</script>
</head>
<body>

	<div class="layui-container  site-demo">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="login">
					
				</div>
			</div>
		</div>
		<hr class="layui-bg-gray">
		<fieldset class="layui-elem-field">
			<legend>我是房客</legend>
			<div class="layui-field-box">
				<a href="my_appointment">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							预约看房
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
				<a href="my_collections">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							我的收藏
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
				<a href="my_coupons">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							我的优惠券
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
				<a href="my_history">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							我的足迹
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
				<a href="my_contract">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							我的合同
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
			</div>
		</fieldset>
		
		<fieldset class="layui-elem-field">
			<legend>我是房主</legend>
			<div class="layui-field-box">
				<c:if test="${empty userLogin.owner}">
					<a href="my_identific">
					<div class="layui-row">
						<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
							<div class="grid-demo">
								房主认证
							</div>
						</div>
						<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
							<div class="grid-demo">
								<i class="layui-icon layui-icon-right"></i>
							</div>
						</div>
					</div>
					</a>
					<hr class="layui-bg-gray">
				</c:if>
				<a href="my_upload">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							发布房源
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
				<a href="my_room">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							我的房源
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
			</div>
		</fieldset>
		<fieldset class="layui-elem-field">
			<legend>我的服务</legend>
			<div class="layui-field-box">
				<a href="my_service">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							联系客服
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
				<a href="my_helps">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							意见反馈
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
				<a href="my_about">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							关于我们
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
				<a href="my_setting">
				<div class="layui-row">
					<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
						<div class="grid-demo">
							设置
						</div>
					</div>
					<div class="layui-col-xs2 layui-col-sm2 layui-col-md2">
						<div class="grid-demo">
							<i class="layui-icon layui-icon-right"></i>
						</div>
					</div>
				</div>
				</a>
				<hr class="layui-bg-gray">
			</div>
		</fieldset>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<c:if test="${not empty userLogin }">
				<button class="layui-btn">退出登录</button>
				</c:if>
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
					<li class="layui-nav-item" id="nav_message">
						<a href="nav_message"><i class="layui-icon layui-icon-dialogue" style="color: #1E9FFF;font-size: 25px;"></i><p>消息</p></a>
					</li>
					<li class="layui-nav-item" id="nav_moments">
						<a href="nav_moments"><i class="layui-icon layui-icon-user" style="color: #1E9FFF;font-size: 25px;"></i><p>动态</p></a>
					</li>
					<li class="layui-nav-item layui-this" id="nav_me">
						<a href="nav_me"><i class="layui-icon layui-icon-username" style="color: #1E9FFF;font-size: 25px;"></i><p>我</p></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>