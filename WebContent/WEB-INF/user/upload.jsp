<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/COMMON/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no"">
<title>Upload</title>
<script type="text/javascript">
	layui.use(['form','upload'], function(){
		var form = layui.form
		,layer = layui.layer
		,upload = layui.upload
		
		
		//多图片上传
		var ListView = $('#list');
	    var url = 'upload';
	    console.log(url);
		var uploadListIns = upload.render({
		  elem: '#select'
		  ,url: url
		  ,multiple: true
		  ,accept: 'images'
		  ,auto: false //选择文件后不自动上传
		  ,bindAction: '#upload' //指向一个按钮触发上传
		  ,acceptMime: 'image/*'
		  ,choose: function(obj){
			  console.log("obj---"+obj);
			  var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
		      obj.preview(function(index, file, result){
		    	  console.log("index---"+index); //得到文件索引
		          console.log("file---"+file); //得到文件对象
		          console.log("result---"+result); //得到文件base64编码，比如图片
		    	  var span = $(['<span id="upload-'+ index +'">'
		    	  		,'<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">'
		    	  		,'<i class="layui-icon layui-icon-close" style="font-size: 30px; color: #560072;"></i>'
		    	  		,'</span>'].join(''));

		    	  var name = new Date().getTime();
		    	  obj.resetFile(index, file, name +'.jpg');
		    	  span.find(".layui-icon-close").click(function () {
		    		  delete files[index]; //删除对应的文件
		    		  span.remove();
		    		  uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
				  });
		    	  ListView.append(span);
		      });
		  }
		  ,done: function(res, index, upload){
			  console.log(res)
			  var item = this.item;
              console.log(item);
			  if(res.code == 0){ //上传成功
				  layer.msg(res.msg,{offset: 'auto'});
		          return delete this.files[index]; //删除文件队列已经上传成功的文件
		      }
		      this.error(index, upload);
			  layer.msg(res.msg);
		  }
		  ,error: function(index, upload){
			  $('#upload').addClass('layui-btn layui-btn-danger');
			  $('#upload').html('<i class="layui-icon">&#xe67c;</i>点击重传');
			  $('#upload').click(function () {
				  uploadListIns.upload();
			})
		  }
		});
		$("#launch").click(function() {
			var name = $("input[name='name']").val();
			console.log('name-----'+name);
			if(name != null){
				layer.load(1);
			}
		})
	});
</script>
<style type="text/css">
	.layui-form-pane .layui-form-label {
	    width: 90px;
	}
	.layui-form-pane .layui-input-block {
	    margin-left: 90px;
	}
	
	span{
		position: relative;
	}
	.layui-upload-img{
		width: 80px;
	    height: 80px;
	    margin: 0 10px 10px 0;
	}
	.layui-icon-close {
	    position: absolute;
	    top: -30px;
	    right: 10;
	    font-weight: bolder;
	}
	.layui-form-radio {
	    margin: 0;
	    padding-right: 0;
	}
</style>
</head>
<body>
	<form class="layui-form layui-form-pane" action="user_done" method="post">
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				<a href="nav_me"><i class="layui-icon layui-icon-left" style="font-size: 20px; color: &#xe603;"></i> </a> 
			</div>
			<div class="layui-col-xs10 layui-col-sm10 layui-col-md10">
				<h3 style="text-align: center;">房源发布</h3>
			</div>
			<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
				&nbsp;
			</div>
		</div>
		<hr class="layui-bg-gray" style="height: 2px">
		<p>房屋基本信息</p><br>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-upload">
					<button type="button" class="layui-btn" id="select">
						选择房屋图片
					</button>
					<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
						预览图：
						<div class="layui-upload-list" id="list" style="text-align: center;"></div>
					</blockquote>
					<button type="button" class="layui-btn" id="upload">
						<i class="layui-icon">&#xe67c;</i>点击上传
					</button>
				</div>
			</div>
		</div><br>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
					<label class="layui-form-label">房屋标题</label>
   					<div class="layui-input-block">
     					<input type="text" name="roomName" lay-verify="required" autocomplete="off" class="layui-input">
   					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
   					<label class="layui-form-label">小区</label>
   					<div class="layui-input-block">
     					<input type="text" name="location" lay-verify="required" autocomplete="off" class="layui-input">
   					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item" pane style="width: 288px;">
					<label class="layui-form-label">出租方式</label>
   					<div class="layui-input-block">
   						<input type="radio" name="rentWay" value="整租" title="整租">
						<input type="radio" name="rentWay" value="合租" title="合租" >
   					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
   					<label class="layui-form-label">楼层</label>
				  	<div class="layui-input-block">
				    	<input type="text" name="floor" lay-verify="required" autocomplete="off" class="layui-input">
				  	</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
   					<label class="layui-form-label">装修</label>
		  			<div class="layui-input-block">
		    			<input type="text" name="decoration" lay-verify="required" autocomplete="off" class="layui-input">
		  			</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
   					<label class="layui-form-label">面积</label>
   					<div class="layui-input-block">
     					<input type="text" name="roomArea" placeholder="  ㎡ " lay-verify="required|number" autocomplete="off" class="layui-input">
   					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
   					<label class="layui-form-label">户型</label>
   					<div class="layui-input-block">
     					<input type="text" name="roomType" lay-verify="required" autocomplete="off" class="layui-input">
   					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
					<label class="layui-form-label">朝向</label>
   					<div class="layui-input-block">
   						<input type="text" name="towards" lay-verify="required" autocomplete="off" class="layui-input">
   					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
					<label class="layui-form-label">租金</label>
   					<div class="layui-input-block">
   						<input type="text" name="price" placeholder="  元/月" lay-verify="required|number" autocomplete="off" class="layui-input">
   					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
					<label class="layui-form-label">配套设施</label>
   					<div class="layui-input-block">
     					<input type="text" name="facility" lay-verify="" autocomplete="off" class="layui-input">
   					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		<hr class="layui-bg-red">
		<p>联系人信息</p><br>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
					<label class="layui-form-label">姓名</label>
   					<div class="layui-input-block">
   						<input type="text" name="name" lay-verify="required" autocomplete="off" class="layui-input">
   					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item" pane style="width: 288px;">
   					<label class="layui-form-label">性别</label>
   					<div class="layui-input-block">
   						<input type="radio" name="sex" value="男" title="男">
						<input type="radio" name="sex" value="女" title="女">
   					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
					<label class="layui-form-label">联系电话</label>
   					<div class="layui-input-block">
   						<input type="text" name="phone" lay-verify="required|phone|number" autocomplete="off" lay-verType="tips" class="layui-input">
   					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" id="launch" lay-submit="" lay-filter="launch">发布</button>
					</div>
				</div>
			</div>
		</div>
		
		
		
	</div>
	</form>
</body>
</html>