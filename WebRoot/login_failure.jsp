<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta http-equiv="refresh" content="3;URL=login.jsp">
<title>登陆失败</title>

</head>
<body>
	<!-- 	/*
	 * 0为发生错误
	 * 1为登陆成功
	 * 2为密码错误
	 * 3为用户名不存在
	 */ -->
	<h3>
		登陆失败，<%
		int loginstatus = (Integer) request.getAttribute("loginstatus");
		switch (loginstatus) {
		case 0:
			out.println("连接错误。");
			break;
		case 2:
			out.println("密码错误");
			break;
		case 3:
			out.println("用户名不存在");
			break;
		}
	%>
	</h3>
	<hr>
	<a href="login.jsp">3秒后将返回登录页</a>

</body>
</html>