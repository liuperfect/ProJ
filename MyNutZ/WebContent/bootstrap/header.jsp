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
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="<%=basePath%>/bootstrap/css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="<%=basePath%>/bootstrap/css/bootstrap-theme.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="<%=basePath%>/rs/js/jquery-3.1.0.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
//获取所有 class为nav的li元素。并为点击的li增加class
$(function(){
	$('.nav li a').click(function(){
		$('.nav li').removeClass('active');
		$(this).parent().addClass('active');
	})
})
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="<%=basePath %>/user/index" role="button">首页</a>
					</div>
					<div class="navbar-collapse collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li ><a href="<%=basePath %>/user/accountlist"  target="mainframe">账户</a></li>
							<li><a href="<%=basePath %>/user/accountlist" target="mainframe">商品</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
									<li class="divider"></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li>
						</ul>
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input type="text" class="form-control" />
							</div>
							<button type="submit" class="btn btn-default">
								<span class="glyphicon glyphicon-search"></span> 搜  索
							</button>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#">欢迎您：liuperfect</a></li>
							<li>
								<a href="${base}/user/logout">
									<p>登出</p> 
								</a>
							</li>
							
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">我的商场<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="#">我的订单</a></li>
									<li><a href="#">个人信息维护</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>
