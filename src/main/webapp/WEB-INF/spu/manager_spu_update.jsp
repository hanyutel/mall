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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>韩宇的页面</title>
<script type="text/javascript">
function click_image(value){
	$("#spu_file_"+value).click();
}
function show_image(value){
	//获取缓存数据
	var file=$("#spu_file_"+value)[0].files[0];
	var URL = window.URL || window.webkitURL;
    var imgURL = URL.createObjectURL(file);
    $("#spu_img_"+value).attr("src",imgURL);
    var length=$(":file").length;
	if((value+1)==length){
		add_image(value)
	}
}

function add_image(value){
	var add_img='<img id="spu_img_'+(value+1)+'" width="100px" height="100px" style="cursor:pointer" src="image/upload_hover.png" onclick="click_image('+(value+1)+')">';
	var add_file='<input id="spu_file_'+(value+1)+'" type="file" name="files" style="display:none" onchange="show_image('+(value+1)+')">';
	$("#image_add_div").append(add_img+add_file);
}
</script>
</head>
<body>	
	<form action="do_spu_update.do" method="post" enctype="multipart/form-data">
		<table border="1" align="center">
			
			<tr>
				<th>商品名</th>
				<th>
					<input type="hidden" name="id" value="${product.id }">
					<input type="text" value="${product.shp_mch }" name="shp_mch">
				</th>
			</tr>
			<tr>
				<th>商品描述</th>
				<th>
					<textarea rows="5" cols="10" name="shp_msh">${product.shp_msh}</textarea>
				</th>
			</tr>
			<tr>
				<th>创建时间</th>
				<th>
				<fmt:formatDate value="${product.chjshj}" type="both"/>
				</th>
			</tr>
			<tr>
				<th>商品图片</th>
				<th>
					<div id="image_add_div">
						<c:forEach items="${product_images }" var="pImage" varStatus="index">
							<img id="spu_img_${index.index }" width="100px" height="100px" style="cursor:pointer" src="upload/image/${pImage.url}" onclick="click_image(${index.index })">
							<input id="spu_file_${index.index }" type="file" name="files" style="display:none" onchange="show_image(${index.index })">
						</c:forEach>
						
<!-- 						<img id="spu_img_1" width="100px" height="100px" style="cursor:pointer" src="image/upload_hover.png" onclick="click_image(1)"> -->
<!-- 						<input id="spu_file_1" type="file" name="files" style="display:none" onchange="show_image(1)"> -->
					</div>
				</th>
			</tr>
			<tr>
				<th>提交修改</th>
				<th>
					<input type="submit">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>