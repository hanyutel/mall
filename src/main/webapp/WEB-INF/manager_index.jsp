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
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>韩宇的页面</title>
<script type="text/javascript">
	$(function b(){
		var url="${url}";
		var title="${title}";
		if(url!="" && title != ""){
			add_tab(url,title);
		}
	});
	
	function add_tab(url,title){
		var b=$('#tt').tabs('exists',title);
		if(!b){
			$('#tt').tabs('add',{    
			    title:title,
			    href:url,    
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			});  
		}else{
			$('#tt').tabs('select',title);
		}
		
	}
</script>
</head>
<body class="easyui-layout"> 
	
		<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>  
	 	<div data-options="region:'west',split:true,title:'West'" style="width:210px;padding:10px;">
	 		<div class="easyui-accordion" style="width: 180px;">
	 			<div title="商品发布" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
	 				<div title="TreeMenu" data-options="iconCls:'icon-search'" style="padding:10px;">
						<ul class="easyui-tree">
							<li>	
								<span>商品发布管理</span>
								<ul>
									<li><a href="javascript:add_tab('goto_spu.do','商品spu信息发布');">商品spu信息发布</a><br>
									</li>
									<li><a href="javascript:add_tab('goto_sku.do','商品sku信息发布');">商品sku信息发布</a><br>
									</li>
									<li><a href="javascript:add_tab('goto_attr.do','商品属性信息发布');">商品属性信息发布</a><br>
									</li>
								</ul>
							</li>
				 		</ul>	
				 	</div>	
				</div>
			</div>
		</div>
		<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
		<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
		<div data-options="region:'center',title:'Center'">
        	 <div id="tt" class="easyui-tabs"  style="height:500px;">   
			    	</div>  
		</div>
	
</body>
</html>