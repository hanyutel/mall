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
	function b(){}
</script>
</head>
<body>
${class_2_name}属性添加页<br>
<form action="do_attr_add.do" method="post">
	<input type="hidden" name="class_2_name" value="${class_2_name}">
	<input type="hidden" name="class_2_id" value="${class_2_id}">
	<table border="1">
		<tr><td>属性名:<input type="text" name="attr_list[0].shxm_mch"></td><td></td><td>添加值</td></tr>
		<tr><td>属性值:<input type="text" name="attr_list[0].attr_value[0].shxzh"></td><td>单位:<input type="text" name="attr_list[0].attr_value[0].shxzh_mch"></td><td>删除</td></tr>
		<tr><td>属性值:<input type="text" name="attr_list[0].attr_value[1].shxzh"></td><td>单位:<input type="text" name="attr_list[0].attr_value[1].shxzh_mch"></td><td>删除</td></tr>
	</table>
	<br>
		<table border="1">
		<tr><td>属性名:<input type="text" name="attr_list[1].shxm_mch"></td><td></td><td>添加值</td></tr>
		<tr><td>属性值:<input type="text" name="attr_list[1].attr_value[0].shxzh"></td><td>单位:<input type="text" name="attr_list[1].attr_value[0].shxzh_mch"></td><td>删除</td></tr>
		<tr><td>属性值:<input type="text" name="attr_list[1].attr_value[1].shxzh"></td><td>单位:<input type="text" name="attr_list[1].attr_value[1].shxzh_mch"></td><td>删除</td></tr>
	</table>
	<input type="submit" value="添加">
</form>
</body>
</html>