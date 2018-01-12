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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>韩宇的页面</title>
<script type="text/javascript">
	function del_spu(id,flbh1,flbh2){
		window.location.href="do_spu_del.do?shp_id="+id+"&flbh1="+flbh1+"&flbh2="+flbh2;
		
	}
</script>
</head>
<body>
<c:if test="${not empty productList}">
	<table border="1" align="center">
			<tr align="center" >
				<th>商品图片</th>
				<th>商品名称</th>
				<th>商品描述</th>
				<th colspan="2" >操作</th>
			</tr>
			<c:forEach items="${productList}" var="product" >
				<tr align="center" >
					<td><img src="upload/image/${product.shp_tp}" height="100px" width="100px"></td>
					<td>${product.shp_mch}</td>
					<td>${product.shp_msh}</td>
					<td><button class="" onclick="javascript:add_tab('goto_spu_update/${product.id}.do','修改商品信息')">修改</button></td>
					<td><button onclick="javascript:del_spu(${product.id},${product.flbh1},${product.flbh2})">删除</button></td>
				</tr>
			</c:forEach>
			
		</table>
		</c:if>
</body>
</html>