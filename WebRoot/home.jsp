<%@ page language="java"
	import="java.util.*,com.po.Users,com.dao.FileManageTool,java.text.SimpleDateFormat"
	contentType=" text/html; charset=utf-8"%>
<jsp:useBean id="Dao" class="com.dao.DemoDao" scope="session"></jsp:useBean>
<jsp:useBean id="thisUser" class="com.po.Users" scope="session"></jsp:useBean>
<html>
<head>
<title>欢迎</title>
</head>
<body>
	<%
		if (thisUser.getUsername() == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<%
		String loginUser = "";
		if (session.getAttribute("thisUser") != null) {
			loginUser = ((Users) session.getAttribute("thisUser")).getUsername();
		}
	%>
	<h3>Welcome!盘他 PanTa</h3>
	<hr>
	现在是:<%=new SimpleDateFormat("YYYY年MM月dd日 HH点mm分").format(new Date(System.currentTimeMillis()))%>
	&ensp; 欢迎!
	<strong><%=loginUser%></strong>&ensp;
	<a href="dologout.jsp">注销 </a>
	<hr>
	<h4>文件列表</h4>
	<%!FileManageTool Tool = new FileManageTool();%>
	<div><%=Tool.listShow(thisUser)%></div>
	<br>
	<br>
	<hr>
	<form method="post" action="doupload.jsp" enctype="multipart/form-data">
		选择一个文件: <input type="file" name="uploadFile"> <br> <br>
		<input type="submit" value="上传">
	</form>
	<hr>
</body>
</html>