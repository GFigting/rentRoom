$(function() {
	
	$('a').click(function() {
		var href = $('.layui-this').attr("id");
		var ahref = $(this).attr("href");
		if(href == ahref){
			return false;
		}else {
			window.location.href = ahref;
		}
//		alert("href---"+href + "ahref---"+ahref);
	})
	
})