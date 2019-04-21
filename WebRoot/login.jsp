<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>PanTa-登录</title>
</head>
<body>
	<form action="dologin.jsp" method="post">
	<h3>盘他 PanTa - 登陆</h3>
		<table>
			<tr>
				<td>用户名：&nbsp;</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>密码:&nbsp;</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="登陆" style="pointer"></td>
			</tr>
		</table>
	</form>
	<a href="regist.jsp">注册</a>
</body>
</html>