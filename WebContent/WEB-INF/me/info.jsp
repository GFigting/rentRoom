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
<title>Info</title>
<style type="text/css">
	.layui-nav-img {
	    width: 50px;
	    height: 50px;
	}
	.grid-demo {
	    line-height: 30px;
	    font-size: 16px;
	}
</style>
<script type="text/javascript">
	layui.use(['layer','upload'], function(){
		var layer = layui.layer
		,upload = layui.upload
		
		var loginUser = '${sessionScope.userLogin}';
		console.log("loginUser---" + loginUser);
		var headImg = 'images/login.jpg';
		if("${userLogin.userInfo.headImg}" != ''){
			headImg = '${userLogin.userInfo.headImg}';
		}
		console.log("headImg---"+headImg);
		$('.headImg').html('<img src="' + headImg +'" class="layui-nav-img" id="demo1">');
		var name = '豆芽';
		if("${userLogin.userInfo.name}" != ''){
			name = '${userLogin.userInfo.name}';
		}
		console.log("name---"+name);
		$('.name').text(name);
		var phone = '${userLogin.phone}';
		console.log("phone---"+phone);
		$('.phone').text(phone);
		
		var url = 'changeHeadImg';
		var upload_1 = upload.render({
		  elem: '#head-img'
		  ,url: url
		  ,accept: 'images'
		  ,choose: function(obj){
			  var files = this.files = obj.pushFile();
		      obj.preview(function(index, file, result){
		    	  $('#demo1').attr('src', result); //图片链接（base64）
		      });
		  }
		  ,done: function(res, index, upload){
			  console.log("res---"+res)
			  var item = this.item;
	          console.log(item);
			  if(res.code == 0){ //上传成功
				  layer.msg(res.msg);
		          return delete this.files[index]; //删除文件队列已经上传成功的文件
		      }
			  layer.msg(res.msg);
		  }
		});
		
	});
	
</script>
</head>
<body>
	<div class="layui-container site-demo">
		<div class="layui-row">
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				<a href="nav_me"><i class="layui-icon layui-icon-left" style="font-size: 20px; color: &#xe603;"></i> </a> 
			</div>
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
				<h3 style="text-align: center;">个人信息</h3>
			</div>
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				&nbsp;
			</div>
		</div>
		
		<hr class="layui-bg-gray" style="height: 2px;margin-bottom: 40px">
		<div class="layui-row" id="head-img">
			<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
				<div class="grid-demo" style="text-align: left;line-height: 50px;">
					头像
				</div>
			</div>
			<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
				<div class="grid-demo headImg" style="text-align: right;">
					
				</div>
			</div>
		</div>
		<hr>
		<a href="my_changeName">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<div class="grid-demo" style="text-align: left;">
						昵称
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<div class="grid-demo name" style="text-align: right;">
						
					</div>
				</div>
			</div>
		</a>
		<hr>
		<div class="layui-row">
			<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
				<div class="grid-demo" style="text-align: left;">
					手机号
				</div>
			</div>
			<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
				<div class="grid-demo phone" style="text-align: right;">
					
				</div>
			</div>
		</div>
		<hr>
		<a href="findback?phone=${userLogin.phone}">
			<div class="layui-row">
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<div class="grid-demo" style="text-align: left;">
						重置密码
					</div>
				</div>
				<div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
					<div class="grid-demo" style="text-align: right;">
						*****
					</div>
				</div>
			</div>
		</a>
		<hr>
	</div>
</body>
</html>