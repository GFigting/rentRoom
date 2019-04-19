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
<title>Search</title>
<link rel="stylesheet" href="CSS/jquery-ui.css" media="all">
<script type="text/javascript" src="JS/jquery-ui.js"></script>
<script type="text/javascript" src="JS/search.js"></script>
<style type="text/css">
.grid-demo.search {
	line-height: 40px;
}
.layui-btn {
    border-radius: 20px;
    width: 80px;
}
.grid-demo{
	line-height: 25px;
}
.layui-form-item .layui-input-inline {
    float: left;
    margin: 0;
}
.layui-input, .layui-textarea {
    display: block;
    width: 100%;
    padding-left: 10px;
}
.layui-form-item {
    clear: both;
    margin-left: 5;
}
.layui-form-select .layui-input {
    padding-right: 0px;
}
</style>
<script type="text/javascript">
	layui.use(['form', 'layer','element','flow'], function(){
		var form = layui.form
		,layer = layui.layer
		,element = layui.element
		,flow = layui.flow

		flow.load({
		    elem: '#resultSearch' //流加载容器
		    ,scrollElem: '#resultSearch' //滚动条所在元素，一般不用填，此处只是演示需要。
		    ,done: function(page, next){ //执行下一页的回调
	    	    var lis = [];
	            next(lis.join(''), page < '${pages}');
		    }
		});
		
		var searchVal = '${search}';
		console.log(searchVal)
		$("#autocomplete").val(searchVal);
		
		
		//监听导航点击
		element.on('nav(demo)', function(elem){
		   console.log(elem)
		   layer.msg(elem.text());
		});
// 		var selectDatas = new Array()
		form.on('select', function(data0){
			
			$('#resultSearch').empty();
// 		    console.log(data.elem); //得到select原始DOM对象
// 		    console.log(data.othis); //得到美化后的DOM对象
		    console.log(data0.value); //得到被选中的值
			var args = {"data":data0.value};
		    var url = "select";
			$.getJSON(url, args, function(data){
				console.log("data---"+data); 
// 				var data = eval(data);
				console.log("eval(data)---"+data); 
				
				console.log('roomDetails----${requestScope.roomDetails }');
				console.log('roomDetails2----${roomDetails2 }'+data);
				console.log(data);
				console.log(data.msg);
				var aa = data.roomDetails2;
<%-- 				<%request.setAttribute("roomDetails", null);%> --%>
				if(data.code == 0){
					layer.msg(data.msg)
					$('#resultSearch').off('scroll');
					flow.load({
					    elem: '#resultSearch' //流加载容器
					    ,scrollElem: '#resultSearch' //滚动条所在元素，一般不用填，此处只是演示需要。
					    ,done: function(page, next){ //执行下一页的回调
				    	    var lis = [];
					    	if(data.roomDetails2 != null){
					    		
					    	    layui.each(data.roomDetails2, function(index, item){
					    	    	var html='';
					    	    	html += '<a href="roomDetail?id='+item.id+'">';
					    	    	html += '<li><div class="layui-col-xs12 layui-col-sm12 layui-col-md12">';
					    	    	html += '<div class="layui-card"><div class="layui-card-header">';
					    	    	html += '<div class="grid-demo" style="font-size: 15px;color: #000;font-weight: 550">'+item.roomName+'</div></div>';
					    	    	html += '<div class="layui-card-body"><div class="layui-row">';
					    	    	html += '<div class="layui-col-xs8 layui-col-sm8 layui-col-md8"><div class="grid-demo">';
					    	    	html += '<i class="layui-icon layui-icon-location" style="color: #1E9FFF;"></i>';
					    	    	html += item.location+'<br>'+item.roomType+ '&nbsp;|&nbsp;'+item.roomArea+'平方 &nbsp;|&nbsp; '+item.towards+'</div></div>';
					    	    	html += '<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">';
					    	    	html += '<div class="grid-demo" style="color: #f00;font-size: 15px">￥&nbsp;'+item.price+'</div></div></div></div></div>';
					    	    	html += '<hr style="height: 5px; color: #F2F2F2;"></div></li></a>';
					    	    	lis.push(html);
					    		}); 
					    	}
					    
					    
				            next(lis.join(''), page < data.pages);
					    }
					});
				}else{
					layer.msg(data.msg);
					flow.load({
					    elem: '#resultSearch' //流加载容器
					    ,scrollElem: '#resultSearch' //滚动条所在元素，一般不用填，此处只是演示需要。
					    ,done: function(page, next){ //执行下一页的回调
				    	    var lis = [];
				            next(lis.join(''), page < data.pages);
					    }
					});
				}
			});
		});
// 		var text = $("select[name='distance'] option:selected").text();
// 		console.log("text---"+text);
// 		$("select").change(function(){
// 		})
	});
</script>
</head>
<body>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
				<form class="layui-form" action="resultSearch">
					<div class="layui-col-xs1 layui-col-sm1 layui-col-md1">
						<div class="grid-demo search">
							<div class="layui-input-block">
								<a href="main_main"><i class="layui-icon layui-icon-left" style="font-size: 20px; color: &#xe603;"></i> </a> 
							</div>
						</div>
					</div>
					<div class="layui-col-xs8 layui-col-sm8 layui-col-md8">
						<div class="grid-demo">
							<input id="autocomplete" value="" name="search" autocomplete="off" placeholder="您想住哪儿" class="layui-input">
						</div>
					</div>
					<div class="layui-col-xs3 layui-col-sm3 layui-col-md3">
						<div class="grid-demo search">
							<button class="layui-btn" lay-submit="" lay-filter="demo1">搜索</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<hr class="layui-bg-cyan">

		<c:if test="${ empty roomDetails }">
			<div class="layui-row">
				<div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
					<div class="grid-demo">
						暂无相关内容
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${ not empty roomDetails }">
		<div class="layui-row layui-form">
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-inline">
					  <select name="area">
					    <option value="1_0">选择面积</option>
					    <option value="1_1">10m²</option>
					    <option value="1_2">30m²</option>
					    <option value="1_3">50m²</option>
					    <option value="1_4">70m²</option>
					    <option value="1_5">90m²</option>
					    <option value="1_6">其他</option>
					  </select>
					</div>
				</div>
			</div>
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-inline">
					  <select name="roomType">
					    <option value="2_0">选择户型</option>
					    <option value="2_1">一室一厅</option>
					    <option value="2_2">二室一厅</option>
					    <option value="2_3">三室一厅</option>
					    <option value="2_4">四室一厅</option>
					    <option value="2_5">四室二厅</option>
					    <option value="2_6">其他</option>
					  </select>
					</div>
				</div>
			</div>
			<div class="layui-col-xs4 layui-col-sm4 layui-col-md4">
				<div class="grid-demo layui-form-item">
					<div class="layui-input-inline">
					  <select name="rent">
					    <option value="3_0">选择价格</option>
					    <option value="3_1">500元内</option>
					    <option value="3_2">500-800元</option>
					    <option value="3_3">800-1100元</option>
					    <option value="3_4">1100-1400元</option>
					    <option value="3_5">1400-1700元</option>
					    <option value="3_6">其他</option>
					  </select>
					</div>
				</div>
			</div>
		</div>


		<div class="layui-row">
			<ul class="flow-default" id="resultSearch">
			<c:forEach items="${requestScope.roomDetails }" var="item">
					<a href="roomDetail?id=${item.id }">
						<li>
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
						</li>
					</a>
				</c:forEach>
			</ul>
		</div>
		</c:if>
	</div>
</body>
</html>