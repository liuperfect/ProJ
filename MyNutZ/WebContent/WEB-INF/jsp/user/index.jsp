<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<header>
  		<jsp:include page="/bootstrap/header.jsp"></jsp:include>
  	</header>
  	<div class="container-fluid">
  		<iframe class="embed-responsive-item" src="<%=basePath %>/user/accountlist" width="100%" height="100%" frameborder="0" name="mainframe"></iframe>	
  	</div>
    <footer>
    	<jsp:include page="/bootstrap/footer.jsp"></jsp:include>
    </footer>
    
  </body>
</html>
