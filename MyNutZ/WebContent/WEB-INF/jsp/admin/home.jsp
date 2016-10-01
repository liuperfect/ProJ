<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'home.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>rs/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>rs/js/jquery-easyui-1.5/themes/icon.css">
	
<script type="text/javascript"
	src="<%=basePath%>rs/js/jquery-easyui-1.5/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>rs/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
</head>
<script type="text/javascript">
$(function({
	$.ajax({
		url : base + "/user/add",
		data : $("#user_add_form").serialize(),
		dataType : "json",
		success : function(data) {
			if (data.ok) {
				user_reload();
				alert("添加成功");
			} else {
				alert(data.msg);
			}
		}
	});
})) 

</script>


<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height:60px;background:#B3DFDA;padding:10px">
			欢迎你：<input value="<%=session.getAttribute("me").getClass()%>"> 
	</div>
	<div data-options="region:'west',split:true,title:'首页'"
		style="width:150px;padding:10px;">
		<shiro:hasPermission name="menu:list">
			<
		</shiro:hasPermission>
		
		<div
			data-options="region:'east',split:true,collapsed:true,title:'East'"
			style="width:100px;padding:10px;">east region</div>
		<div data-options="region:'south',border:false"
			style="height:50px;background:#A9FACD;padding:10px;">south
			region</div>
		<div data-options="region:'center',title:'Center'"></div>
</body>
</html>
