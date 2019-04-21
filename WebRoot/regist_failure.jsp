<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>注册失败，</title>
<meta http-equiv="refresh" content="3;URL=regist.jsp">
</head>

<body>
	<h3>
		<!-- 
	/*
	* 0为发生错误 1为用户名未被使用过 2为用户名已存在
	*/-->
		注册失败。
		<%
			int loginstatus = (Integer) request.getAttribute("registstatus");
			switch (loginstatus) {
			case 0:
				out.println("未知错误。");
				break;
			case 2:
				out.println("用户名已被使用");
				break;
			}
		%>
	</h3>
	<hr>
	<a href="regist.jsp">3秒后将返回注册页</a>
</body>
</html>
