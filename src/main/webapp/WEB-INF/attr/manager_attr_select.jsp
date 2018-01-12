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
		$("#attr_select_class_1").append("<option>-请选择-</option>");
		$.getJSON("js/json/class_1.js",function(data){
			$.each(data,function(i,n){
				$("#attr_select_class_1").append("<option value="+n.id+">"+n.flmch1+"</option>");
			});
		});
		
		$("#attr_select_class_1").change(function(){
			var id=$(this).attr("value");
			$.getJSON("js/json/class_2_"+id+".js",function(data){
				$("#attr_select_class_2").empty();
				$("#attr_select_class_2").append("<option>-请选择-</option>");
				$.each(data,function(i,n){
					$("#attr_select_class_2").append("<option value="+n.id+">"+n.flmch2+"</option>");
				});
			});
			
		});
	});
	
	function show_attr_list(class_2_id){
		$('#attr_list_div').datagrid({    
		    url:'select_attr_list_json.do',
		    queryParams: {
		    	class_2_id:class_2_id
			},
		    columns:[[    
		        {field:'id',title:'属性id',width:100},    
		        {field:'shxm_mch',title:'属性名称',width:100},   
		        {field:'flbh2',title:'属性名称',width:100,hidden:true},
		        {field:'chjshj',title:'创建时间',width:200,formatter: 
		        	function(value,row,index){
		        		var date = new Date(value);
		        		return date.toLocaleString();
			        }
		        },    
		        {field:'attr_value',title:'属性值列表',width:200,align:'left',
		        	formatter: function(value,row,index){
		        		var name="";
		        		$(value).each(function(i,n){
		        			name=name+" "+n.shxzh+n.shxzh_mch;
		        		});
		        		return name;
					}
				},
				{field:'opt',title:'操作',width:100,align:'center',
					formatter: function(value,row,index){
			              var e = '<button onclick="goto_attr_edit(\''+ row.id + '\')">修改</button> ';
			              var d = '<button onclick="attr_del(\''+ row.id +'\')">删除</button> ';
			              return e+"   "+d;
					}
				},     
		    ]],
		    toolbar:[{
	               text:'增加',iconCls:'icon-add',handler:function(){
	            	   goto_attr_add();
	               }
	             }
	             ],
		});  
	}
	function goto_attr_add(){
		var class_2_id=$("#attr_select_class_2").attr("value");
		var class_2_name=$("#attr_select_class_2 option:selected").text();
// 		window.location.href="goto_attr_add.do?class_2_id="+class_2_id+"&class_2_name="+class_2_name;
		add_tab("goto_attr_add.do?class_2_id="+class_2_id+"&class_2_name="+class_2_name,"添加分类属性");
		
	}
	function goto_attr_edit(id){
		
	}
	function attr_del(id){
		
	}
</script>
</head>
<body>

一级列表:<select id="attr_select_class_1" name="flbh1"></select>
二级列表:<select id="attr_select_class_2" name="flbh2" onchange="show_attr_list(this.value)"><option>-请选择-</option></select><br>
</body>
</html>