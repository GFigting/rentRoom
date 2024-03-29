<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=dRbrKqkkvcAP9eX0VAbwmuPoeZ7Fq8ut"></script>
	<title>浏览器定位</title>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
// 	var point = new BMap.Point(116.331398,39.897445);
// 	map.centerAndZoom(point,12);

	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			//添加gps marker和label
			var ggPoint = new BMap.Point(r.point.lng,r.point.lat);
		    map.centerAndZoom(ggPoint,12);
		    var markergg = new BMap.Marker(ggPoint);
		    map.addOverlay(markergg); //添加GPS marker
		    var labelgg = new BMap.Label("未转换的GPS坐标（错误）",{offset:new BMap.Size(20,-10)});
		    markergg.setLabel(labelgg); //添加GPS label
		    
		  	//坐标转换完之后的回调函数
		    translateCallback = function (data){
		      if(data.status === 0) {
		        var marker = new BMap.Marker(data.points[0]);
		        map.addOverlay(marker);
		        var label = new BMap.Label("转换后的百度坐标（正确）",{offset:new BMap.Size(20,-10)});
		        marker.setLabel(label); //添加百度label
		        map.setCenter(data.points[0]);
		      }
		      console.log(data.status)
		      console.log("fail!")
		    }

		    setTimeout(function(){
		        var convertor = new BMap.Convertor();
		        var pointArr = [];
		        pointArr.push(ggPoint);
		        convertor.translate(pointArr, 1, 5, translateCallback)
		    }, 1000);
// 			alert('您的位置：'+r.point.lng+','+r.point.lat + "," + r.address.province);
			console.log(r.address);
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
	//关于状态码
	//BMAP_STATUS_SUCCESS	检索成功。对应数值“0”。
	//BMAP_STATUS_CITY_LIST	城市列表。对应数值“1”。
	//BMAP_STATUS_UNKNOWN_LOCATION	位置结果未知。对应数值“2”。
	//BMAP_STATUS_UNKNOWN_ROUTE	导航结果未知。对应数值“3”。
	//BMAP_STATUS_INVALID_KEY	非法密钥。对应数值“4”。
	//BMAP_STATUS_INVALID_REQUEST	非法请求。对应数值“5”。
	//BMAP_STATUS_PERMISSION_DENIED	没有权限。对应数值“6”。(自 1.1 新增)
	//BMAP_STATUS_SERVICE_UNAVAILABLE	服务不可用。对应数值“7”。(自 1.1 新增)
	//BMAP_STATUS_TIMEOUT	超时。对应数值“8”。(自 1.1 新增)
</script>
