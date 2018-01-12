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
	$(function b(){
		$("#spu_add_select_class_1").append("<option>-请选择-</option>");
		$.getJSON("js/json/class_1.js",function(data){
			$.each(data,function(i,n){
				$("#spu_add_select_class_1").append("<option value="+n.id+">"+n.flmch1+"</option>");
			});
		});
		
		$("#spu_add_select_class_1").change(function(){
			var id=$(this).attr("value");
			$.getJSON("js/json/class_2_"+id+".js",function(data){
				$("#spu_add_select_class_2").empty();
				$.each(data,function(i,n){
					$("#spu_add_select_class_2").append("<option value="+n.id+">"+n.flmch2+"</option>");
				});
			});
			$.getJSON("js/json/tm_class_1_"+id+".js",function(data){
				$("#spu_add_select_tm_class").empty();
				$.each(data,function(i,n){
					$("#spu_add_select_tm_class").append("<option value="+n.id+">"+n.ppmch+"</option>");
				});
			});
		});
	});

</script>
</head>
<body>
一级列表:<select id="spu_add_select_class_1" name="flbh1"></select>
二级列表:<select id="spu_add_select_class_2" name="flbh2"></select>
商标:<select id="spu_add_select_tm_class" name="pp_id"></select>
</body>
</html>