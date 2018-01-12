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

</head>
<body>
<script type="text/javascript">
	$(function b(){
		$("#sku_select_class_1").append("<option>-请选择-</option>");
		$.getJSON("js/json/class_1.js",function(data){
			$(data).each(function(i,n){
				$("#sku_select_class_1").append("<option value="+n.id+">"+n.flmch1+"</option>");
				
			});
		});
	});
	function class_1_change(id){
		$("#sku_select_class_2").empty();
		$("#sku_select_class_2").append("<option>-请选择-</option>");
		$.getJSON("js/json/class_2_"+id+".js",function(data){
			$(data).each(function(i,n){
				$("#sku_select_class_2").append("<option value="+n.id+">"+n.flmch2+"</option>");
			});
		});
		load_select_tm_class(id);
	}
	function load_select_tm_class(id){
		$("#sku_select_tm_class").empty();
		$("#sku_select_tm_class").append("<option>-请选择-</option>");
		$.getJSON("js/json/tm_class_1_"+id+".js",function(data){
			$(data).each(function(i,n){
				$("#sku_select_tm_class").append("<option value="+n.id+">"+n.ppmch+"</option>");
			});
		});
	}
	function class_2_change(class_2_id){
		$.post("get_attr_list_sku.do",{class_2_id:class_2_id},function(data){
			$("#sku_add_attr_div").html(data);
		});
	}
	function select_tm_class_change(value){
		$("#sku_select_spu").empty();
		$("#sku_select_spu").append("<option>-请选择-</option>");
		var class_2_id=$("#sku_select_class_2").attr("value");
		$.post("get_spu_list_sku.do",{pp_id:value,class_2_id:class_2_id},function(data){
			$(data).each(function(i,n){
				$("#sku_select_spu").append("<option value="+n.id+">"+n.shp_mch+"</option>");
			});
		});
	}
</script>

	一级列表：<select name="flmch1" id="sku_select_class_1" onchange="class_1_change(this.value)"></select>
	二级列表：<select name="flmch2" id="sku_select_class_2" onchange="class_2_change(this.value)"><option>-请选择-</option></select>
	品牌：<select name="pp_id" id="sku_select_tm_class" onchange="select_tm_class_change(this.value)"></select>
	spu：<select name="shp_id" id="sku_select_spu"></select>
</body>
</html>