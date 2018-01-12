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

</head>
<body>
	<jsp:include page="manager_spu_select.jsp"></jsp:include>
	<div id="spu_list_div">
	
	</div>

<script type="text/javascript">
	$(function b(){
		$("#spu_select_class_1").change(function(){
			$.post("get_spu_list.do",{flbh1:this.value},success);
		});
		$("#spu_select_class_2").change(function(){
			var flbh1=$("#spu_select_class_1").attr("value");
			var flbh2=this.value;
			$.post("get_spu_list.do",{flbh1:flbh1,flbh2:flbh2},success);
		});
		function success(data){
			$("#spu_list_div").html(data);
		}
	});
	
</script>
</body>
</html>