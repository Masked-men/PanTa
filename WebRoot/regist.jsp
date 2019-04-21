<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>注册页</title>
</head>

<body>
	<h3>盘他 PanTa-注册</h3>
	<form action="doregister.jsp" method="post">
		<table>
			<tr>
				<td>您的用户名：&nbsp;</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>您的密码:&nbsp;</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>请再次输入您的密码:&nbsp;</td>
				<td><input type="password" name="repassword"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="确定" style="pointer"></td>
			</tr>
		</table>
	</form>
	<a href="login.jsp">我已有账号，返回登陆</a>
</body>
</html>
