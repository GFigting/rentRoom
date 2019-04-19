layer.open({
  title: false
  
,icon: 1
,type:3

});
closeBtn: 2

var lis = [];
		        var count = 5;
		        var realCount = '${count}';
		        console.log(realCount);
		        if(realCount < count){
		        	count = realCount;
		        }
		        for(var i = 0; i < count; i++){
		          lis.push('<a href=""><li>' + 
							'<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">' + 
							'<div class="layui-card">' + 
								'<div class="layui-card-header">' + 
									'<div class="grid-demo">' + 
// 										'<s:property value="roomName"/>' + 
										'${item.roomName}' + 
									'</div>' + 								
								'</div>' + 
								'<div class="layui-card-body">' + 
									'<div class="layui-row">' + 
										'<div class="layui-col-xs8 layui-col-sm8 layui-col-md8">' + 
											'<div class="grid-demo">' + 
// 												'<s:property value="location"/><br>' +
												'${item.location}' + '<br>' +
// 												'<s:property value="roomType"/> | <s:property value="roomArea"/> | ' + 
// 												'<s:property value="towards"/>' + 
												'${item.roomType} | ${item.roomArea} | ${item.towards}' +
											'</div>' + 
										'</div>' + 
										'<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">' + 
// 											'<div class="grid-demo">' + '<s:property value="price"/>' + '</div>' + 
											'<div class="grid-demo"> ${item.price} </div>' + 
										'</div>' + 
									'</div>' + 
								'</div>' + 
							'</div>' + 
							'<hr style="height: 10px;color: #F2F2F2;">' + 
						'</div>' + 
					'</li></a>'
		        	)
		        }

// 		        next(lis.join(''), page < '<s:property value="#request.pages"/>'); //假设总页数为 10



// 		flow.load({
// 		    elem: '#resultSearch' //流加载容器
// 		    ,done: function(page, next){ //执行下一页的回调
		    	
// 		    	alert("***"+$("#autocomplete").val());
// 		    	var lis = [];
// 		    	var args = {"page":page,"search":$("#autocomplete").val()};
// 		    	var url = "resultSearch";
		    	
// 		    	$.ajax({
// 	 		        type : "get",
// 	 		        url : url,
// 	 		        data : args,
// 	 		        success : function(res) {
// 		 		   		console.log(res.roomDetails)
// 		 		   		console.log(res.pages)
// 						console.log(page)
// 					    //假设你的列表返回在data集合中
// 				        layui.each(res.roomDetails, function(index, item){
// 				          lis.push('<a href=""><li>' + 
// 								'<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">' + 
// 									'<div class="layui-card">' + 
// 										'<div class="layui-card-header">' + 
// 											'<div class="grid-demo">' + 
// 	// 										'<s:property value="roomName"/>' + 
// 											item.roomName + 
// 											'</div>' + 								
// 										'</div>' + 
// 										'<div class="layui-card-body">' + 
// 											'<div class="layui-row">' + 
// 												'<div class="layui-col-xs8 layui-col-sm8 layui-col-md8">' + 
// 													'<div class="grid-demo">' + 
// 	// 												'<s:property value="location"/><br>' +
// 													item.location + '<br>' +
// 	// 												'<s:property value="roomType"/> | <s:property value="roomArea"/> | ' + towards
// 													item.roomType +' | ' + item.roomArea + ' | ' + item.towards +
// 													'</div>' + 
// 												'</div>' + 
// 												'<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">' + 
// 	// 												'<div class="grid-demo">' + '<s:property value="price"/>' + '</div>' + 
// 													'<div class="grid-demo">' + item.price + '</div>' + 
// 												'</div>' + 
// 											'</div>' + 
// 										'</div>' + 
// 									'</div>' + 
// 									'<hr style="height: 10px;color: #F2F2F2;">' + 
// 								'</div>' + 
// 							'</li></a>');
// 				        }); 
				       
// 						next(lis.join(''), page < res.pages);
// 	 		        }
// 		    	});
		    	

// 		    }
// 		  });


$('.layui-nav-tree li').on('click',function () {
	if($(this).hasClass("on")){
		console.log($(this).hasClass("on"));
		$(this).removeClass('layui-nav-itemed');
		$('.layui-nav-tree li').removeClass('on');
	}else{
		$('.layui-nav-tree li').removeClass('layui-nav-itemed');
		$('.layui-nav-tree li').removeClass('on');
		$(this).addClass('layui-nav-itemed');
		$(this).addClass('on');
	}
});
.layui-nav-tree {
    width: 94px;
}
.layui-nav-itemed>.layui-nav-child {
    width: 375px;
    background-color: rgb(0, 150, 136)!important
}
.layui-nav-tree .layui-nav-bar {
    background-color: #7ce845;
}
<div class="layui-row">
			<div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
				<div class="grid-demo">
					<ul class="layui-nav layui-nav-tree layui-bg-green layui-inline" lay-filter="demo">
						<li class="layui-nav-item">
							<a href="javascript:;">距离</a>
							<dl class="layui-nav-child">
								<dd>
									<a href="">不限</a>
								</dd>
								<dd>
									<a href="javascript:;">1000米内</a>
								</dd>
								<dd>
									<a href="javascript:;">2000米内</a>
								</dd>
								<dd>
									<a href="javascript:;">3000米内</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<div class="layui-col-xs3 layui-col-sm12 layui-col-md3">
				<div class="grid-demo">
					<ul class="layui-nav layui-nav-tree layui-bg-green layui-inline" lay-filter="demo">
						<li class="layui-nav-item">
							<a href="javascript:;">区域</a>
							<dl class="layui-nav-child" style="left: -281px">
								<dd>
									<a href="javascript:;">不限</a>
								</dd>
								<dd>
									<a href="javascript:;">裕华</a>
								</dd>
								<dd>
									<a href="javascript:;">长安</a>
								</dd>
								<dd>
									<a href="javascript:;">桥西</a>
								</dd>
								<dd>
									<a href="javascript:;">新华</a>
								</dd>
								<dd>
									<a href="javascript:;">井陉矿</a>
								</dd>
								<dd>
									<a href="javascript:;">藁城</a>
								</dd>
								<dd>
									<a href="javascript:;">鹿泉</a>
								</dd>
								<dd>
									<a href="javascript:;">栾城</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
				<div class="grid-demo">
					<ul class="layui-nav layui-nav-tree layui-bg-green layui-inline" lay-filter="demo">
						<li class="layui-nav-item">
							<a href="javascript:;">户型</a>
							<dl class="layui-nav-child" style="left: -93px">
								<dd>
									<a href="javascript:;">不限</a>
								</dd>
								<dd>
								<dd class="layui-form">
									<div class="layui-form-item">
    									<div class="layui-inline">
											<div class="layui-input-inline" style="width: 100px;">
											  	<input type="text" name="price_min" lay-verify="number" autocomplete="off" class="layui-input">
											</div>
											<div class="layui-form-mid">厅</div>
											<div class="layui-input-inline" style="width: 100px;">
											  	<input type="text" name="price_max" lay-verify="number" autocomplete="off" class="layui-input">
											</div>
											<div class="layui-form-mid">室</div>
										</div>
									</div>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<div class="layui-col-xs3 layui-col-sm12 layui-col-md3">
				<div class="grid-demo">
					<ul class="layui-nav layui-nav-tree layui-bg-green layui-inline" lay-filter="demo">
						<li class="layui-nav-item">
							<a href="javascript:;">价格</a>
							<dl class="layui-nav-child" style="left: -187px">
								<dd>
									<a href="javascript:;">选项一</a>
								</dd>
								<dd>
									<a href="javascript:;">选项二</a>
								</dd>
								<dd>
									<a href="javascript:;">选项三</a>
								</dd>
								<dd>
									<a href="">跳转项</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
		
		<div class="layui-input-inline">
					  <select name="quiz1">
					    <option value="">选择区域</option>
					    <option value="长安">裕华</option>
					    <option value="长安">长安</option>
					    <option value="桥西">桥西</option>
					    <option value="新华">新华</option>
					    <option value="井陉矿">井陉矿</option>
					    <option value="藁城">藁城</option>
					    <option value="新华">鹿泉</option>
					  </select>
					</div>
					
/     debugger;
    layui.each($('.myUpload'), function(index, elem){
    	console.log(index+"----"+elem);
    	var data = "upload_"+index;
		var upload_1 = upload.render({
// 		  elem: "select_"+index
		  elem: $(elem).children("#select_1")
		  ,url: url
		  ,accept: 'images'
		  ,choose: function(obj){
	// 		  console.log(obj);
			  var files = this.files = obj.pushFile();
		      obj.preview(function(index, file, result){
		    	  $('.myUpload').empty().append('<div class="layui-upload-drag success" id="select_1"><img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">'
			    	  		+ '<i class="layui-icon layui-icon-close" style="font-size: 30px; color: #560072;"></i></div>');
		    	  console.log("index---"+index);
		    	  console.log("files---"+files);
		    	  $(".layui-icon-close").click(function () {
		    		  delete files[index]; //删除对应的文件
		    		  $('.myUpload').empty().append('<div class="layui-upload-drag" id="select_1">' 
		    				  +'<i class="layui-icon layui-icon-upload-drag" style="font-size: 45px;"></i>'
		    				  +'<p>身份证正面</p>'
		    				  +'</div>');
				  });
		      });
		  }
		  ,done: function(res, index, upload){
			  $('#imgNames').val(res.filename);
			  console.log("res---"+res)
			  var item = this.item;
	          console.log(item);
			  if(res.code == 0){ //上传成功
				  layer.msg(res.msg);
		          delete this.files[index]; //删除文件队列已经上传成功的文件
		          return;
		      }
			  layer.msg(res.msg);
		  }
		});
    });
// 	$("#select-1").click(function() {
// 		upload.render(upload_1);
// 	})
// 	debugger;
// 	console.log("upload_1---"+upload_1);