<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-form.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>韩宇的页面</title>

</head>
<body>
<script type="text/javascript">
	$(function b(){
	
	});
	function click_image(value){
		$("#spu_file_"+value).click();
	}
	function show_image(value){
		// 获取缓存 
		var tmpfile= $("#spu_file_"+value)[0].files[0];
		var url=window.URL.createObjectURL(tmpfile);
		$("#spu_img_"+value).attr("src",url);
		var length=$(":file").length;
		if((value+1)==length){
			add_image(value);
		}
	}
	function add_image(value){
		var add_img='<img id="spu_img_'+(value+1)+'" width="100px" height="100px" style="cursor:pointer" src="image/upload_hover.png" onclick="click_image('+(value+1)+')">';
		var add_file='<input id="spu_file_'+(value+1)+'" type="file" name="files" style="display:none" onchange="show_image('+(value+1)+')">';
		$("#image_div").append(add_img+add_file);
	}
</script>
	添加商品信息<br>
	商品分类列表<br>
	<div>
		<form id="add_spu_form" action="save_spu.do" method="post" enctype="multipart/form-data">
			<jsp:include page="manager_spu_add_select.jsp"></jsp:include>
			<hr>	
			商品名称:<input type="text" name="shp_mch"><br>
			<hr>
			<!-- rows 行数    clos：列数（宽度） -->
			产品描述:<textarea rows="5" cols="10" name="shp_msh"></textarea><br>
			商品图片:<br>
			<div id="image_div">
			<img id="spu_img_0" width="100px" height="100px" style="cursor:pointer" src="image/upload_hover.png" onclick="click_image(0)">
			<input id="spu_file_0" type="file" name="files" style="display:none" onchange="show_image(0)">
			</div>
			<input type="submit" value="提交"> 
		</form>
	</div>
</body>
</html>