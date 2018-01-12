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

	<div class="easyui-layout" data-options="fit:true">  
  		<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>   
        <div data-options="region:'west'" style="width:180px">
            <a href="javascript:add_tab('goto_spu_list.do','商品信息查询')">商品信息查询</a><br>
			<a href="javascript:add_tab('goto_spu_add.do','商品信息添加')">商品信息添加</a><br>
    	</div>   
           <div data-options="region:'center'"></div>   
    </div>  

</body>
</html>