<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NutzBook demo</title>
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
<!-- 把user id复制到一个js变量 -->
<script type="text/javascript">
    var me = '<%=session.getAttribute("me")%>';
	var base = '${base}';
	$(function() {
		$("#login_button").click(function() {
			$.ajax({
				url : base + "/user/login",
				type : "POST",
				data : $('#loginForm').serialize(),
				error : function(request) {
					alert("Connection error");
				},
				dataType : "json",
				success : function(data) {
					if (data && data.ok) {
						alert("登陆成功");
					
						location.reload();
					} else {
						alert(data.msg)
					}
				}
			});
			return false;
		});
		if (me != "null") {
			$("#login_div").hide();
			$("#userInfo").html("您的Id是" + me);
			window.location.href=base+"/user/index";
			$("#user_info_div").show();
		} else {
			$("#login_div").show();
			$("#user_info_div").hide();
		}
	});
	/**
	 *验证码刷新程序
	 */
	function next_captcha() {
		$("#captcha_img").attr("src",
				"${base}/captcha/next?_=" + new Date().getTime());
	}
</script>
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #eee;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row" id="login_div">
			<div class="col-md-5"></div>
			<div class="col-md-2">
				<form class="form-signin" action="#" id="loginForm" method="post">
					<h2 class="form-signin-heading">请登录</h2>
					<div class="form-group">
						<label for="inputEmail" class="sr-only">请输入邮件地址</label> 
						<input
							type="text" id="inputEmail" class="form-control"
							placeholder="请输入账号" name="username" required autofocus>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="sr-only">请输入密码</label> 
						<input
							type="password" id="inputPassword" class="form-control"
							placeholder="请输入密码" name="password" required>
					</div>
					<div class="form-group">
						<div class="input-group">
							<label for="inputCaptcha" class="sr-only">请输入右侧验证码</label> 
							<input type="text" class="" placeholder="请输入右侧验证码" name="captcha" id="inputCaptcha"  value="">

							<span class="input-group-btn">
								<img id="captcha_img" height="30" onclick="next_captcha();return false;"
									src="${base}/captcha/next" title="点击刷新验证码"></img>
							</span>
						</div>
					</div>
					<div class="checkbox">
						<label> <input type="checkbox" value="remember-me">
							记住我
						</label>
					</div>
						
					<button class="btn btn-lg btn-primary btn-block" 
						id="login_button">登 录</button>
				</form>
			</div>
			<div class="col-md-5"></div>
		</div>
	</div>
</body>
</html>