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
<title>MyIdentification</title>
</head>
<script type="text/javascript">
	
layui.use(['form','upload'], function(){
	var form = layui.form
	,layer = layui.layer
	,upload = layui.upload
	
	
    var url = 'my_owner';
    console.log(url);
    debugger;
	var upload_1 = upload.render({
	  elem: '#select-1'
	  ,url: url
	  ,accept: 'images'
	  ,acceptMime: 'image/*'
	  ,choose: function(obj){
// 		  console.log(obj);
		  var files = this.files = obj.pushFile();
	      obj.preview(function(index, file, result){
	    	  $('.up').empty().append('<div class="layui-upload-drag success" id="select-1"><img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">'
		    	  		+ '</div>');
	    	  //<i class="layui-icon layui-icon-close" style="font-size: 30px; color: #560072;"></i>---右上角x
	    	  console.log("index---"+index);
	    	  console.log("files---"+files);
// 	    	  $(".layui-icon-close").click(function () {
// 	    		  delete files[index]; //删除对应的文件
// 	    		  $('.up').empty().append('<div class="layui-upload-drag" id="select-1">' 
// 	    				  +'<i class="layui-icon layui-icon-upload-drag" style="font-size: 45px;"></i>'
// 	    				  +'<p>身份证正面</p>'
// 	    				  +'</div>');
// 	    	  });
	      });
	  }
	  ,done: function(res, index, upload){
		  $('#imgNames').val(res.filename);
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
	$(".layui-icon-close").click(function() {
		up.config.data = {
			msg:"hhh"
		}
		upload.render(upload_1);
	})
	console.log("upload_1---"+upload_1);
	var upload_2 = upload.render({
	  elem: '#select-2'
	  ,url: url
	  ,accept: 'images'
	  ,acceptMime: 'image/*'
	  ,choose: function(obj){
		  var files = this.files = obj.pushFile();
	      obj.preview(function(index, file, result){
	    	  $('.down').empty().append('<div class="layui-upload-drag success" id="select-2"><img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">'
		    	  		+ '<i class="layui-icon layui-icon-close" style="font-size: 30px; color: #560072;"></i></div>');
	    	  $(".layui-icon-close").click(function () {
	    		  delete files[index]; //删除对应的文件
	    		  $('.down').empty().append('<div class="layui-upload-drag" id="select-2">'
	    				  +'<i class="layui-icon layui-icon-upload-drag" style="font-size: 45px;"></i>'
	    				  +'<p>身份证反面</p>'
	    				  +'</div>');
			  });
	      });
	  }
	  ,done: function(res, index, upload){
		  $('#imgNames2').val(res.filename);
		  if(res.code == 0){ //上传成功
			  layer.msg(res.msg);
			  return delete this.files[index]; //删除文件队列已经上传成功的文件
	      }
		  layer.msg(res.msg);
	  }
	});
	
	$("#owner").click(function() {
		var name = $("input[name='name']").val();
		console.log('name-----'+name);
		if(name != null){
			layer.load(1);
		}
	})
// 	$('#imgNames').val()
});
</script>
<style type="text/css">
span{
	position: relative;
}
.layui-upload-img {
    width: 192px;
    height: 102px;
}
.layui-icon-close {
    position: absolute;
    top: -15px;
    right: -4px;
    font-weight: bolder;
}
.layui-upload-drag {
    padding: 20px 80px;
}
.success {
    padding: 20px;
}
</style>
<body>
	
	<form class="layui-form" action="owner_registe" lay-filter="example" method="post">
	<input type="hidden" name="imgNames" id="imgNames">
	<input type="hidden" name="imgNames2" id="imgNames2">
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				<a href="nav_me"><i class="layui-icon layui-icon-left" style="font-size: 20px; color: &#xe603;"></i> </a> 
			</div>
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
				<h3 style="text-align: center;">房主认证</h3>
			</div>
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				&nbsp;
			</div>
		</div>
		<hr class="layui-bg-gray" style="height: 2px">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
				  	<div class="layui-input-block">
				      <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="您的姓名" class="layui-input">
				    </div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
				  	<div class="layui-input-block">
				      <input type="radio" name="sex" value="男" title="男">
				      <input type="radio" name="sex" value="女" title="女">
				    </div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
				  	<div class="layui-input-block">
				    	<input type="text" name="identity" lay-verify="identity|required" placeholder="您的身份证号码" autocomplete="off" class="layui-input">
				  	</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-block">
						<input type="tel" name="phone" lay-verify="required|phone" placeholder="您的手机号" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
		</div>
		
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo up">
					<div class="layui-upload-drag" id="select-1">
					  	<i class="layui-icon layui-icon-upload-drag" style="font-size: 45px;"></i>
					  	<p>身份证正面</p>
					</div>
				</div>
			</div>
		</div><br>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo down">
					<div class="layui-upload-drag" id="select-2">
					  	<i class="layui-icon layui-icon-upload-drag" style="font-size: 45px;"></i>
					  	<p>身份证反面</p>
					</div>
				</div>
			</div>
		</div><br>
		
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="grid-demo layui-form-item">
				  	<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" id="owner">成为房主</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	</form>
</body>
</html>