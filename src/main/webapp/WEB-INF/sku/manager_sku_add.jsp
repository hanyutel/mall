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
	function b(){}
</script>
</head>
<body>
<form action="do_sku_save.do" method="post">
<jsp:include page="manager_sku_select.jsp"></jsp:include>
<div id="sku_add_attr_div">
</div>
商品sku名称：<input type="text" name="sku_mch"><br>
商品库存价格：<input type="text" name="jg"><br>
商品库存地址：<input type="text" name="kcdz"><br>
商品库存数量：<input type="text" name="kc"><br>
<input type="submit">
</form>
</body>
</html>