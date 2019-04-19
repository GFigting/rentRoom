<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/COMMON/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<title>浏览器定位</title>
</head>
<body>
<button class="layui-btn" onclick="upfile('uploadTest')">动态绑定上传控件</button>
<button class="layui-btn" id="uploadTest" lay-data="{url: '/a/'}">上传图片</button>


<script>
    function upfile(fid) {
    	layui.use(['form','upload'], function(){
    		var form = layui.form
    		,layer = layui.layer
    		,upload = layui.upload
    		
    		
            upload.render({
                elem: "#" + fid
                , before: function (obj) { obj.preview(function (index, file) { $("#pf_" + fid).html(file.name); }); }
                , done: function (res) { if (res.code) { layer.tips("点击保存数据不会消失哟", "#SaveData", { tips: 1 }); } else { $("#pf_" + fid).html("上传文件"); layer.msg(res.msg); } }
            });
        });
    }
</script>
</body>
</html>
