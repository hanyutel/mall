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


<c:forEach items="${attr_list }" var="attr" varStatus="index">
	${attr.shxm_mch}:<input type="checkbox" name="sku_value_list[${index.index }].shxm_id" value="${attr.id}" onchange="select_show_value_radio(this.value,this.checked)">
</c:forEach>
<br>
<c:forEach items="${attr_list }" var="attr" varStatus="index">
	<div id="show_attr_val_${attr.id }"  style="display:none;">
		<c:forEach items="${attr.attr_value}" var="val">
			<input class="${attr.id}" type="radio"  name="sku_value_list[${index.index }].shxzh_id" value="${val.id}" >${val.shxzh}${val.shxzh_mch} 
		</c:forEach>
	</div>
	<br>
</c:forEach>



<script type="text/javascript">
	function select_show_value_radio(value,checked){
		if(checked){
			$("#show_attr_val_"+value).show()
		}else{
			$("#show_attr_val_"+value).hide()
		}
	}
</script>
</body>
</html>