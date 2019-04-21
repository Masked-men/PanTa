<%@ page language="java"
	import="java.util.*,java.io.File,java.net.URLDecoder"
	contentType="text/html; charset=utf-8"%>
<jsp:useBean id="thisUser" class="com.po.Users" scope="session"></jsp:useBean>
<%
	String PATH = "BOX" + File.separator + thisUser.getUsername() + File.separator
			+ new String(URLDecoder.decode(request.getParameter("name"), "utf-8"));
	File file = new File(PATH);
	if (file.exists()) {
		file.delete();
	}
	response.sendRedirect("home.jsp");
%>