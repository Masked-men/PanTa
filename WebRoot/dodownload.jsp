<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java"
	import="java.util.*,java.io.File,java.io.FileInputStream,java.net.URLDecoder"
	contentType="text/html; charset=utf-8"%>
<jsp:useBean id="thisUser" class="com.po.Users" scope="session"></jsp:useBean>
<%
	String fileName = URLDecoder.decode(request.getParameter("name"), "utf-8");
	response.setHeader("content-disposition",
			"attachment;fileName=" + new String(fileName.getBytes("utf-8"), "ISO8859-1"));
	String PATH = "BOX" + File.separator + thisUser.getUsername() + File.separator + fileName;

	out.clear();
	out = pageContext.pushBody();
	try (ServletOutputStream sos = response.getOutputStream()) {
		try (BufferedInputStream fis = new BufferedInputStream(new FileInputStream(PATH))) {
			byte[] buffer = new byte[1024];
			int m;
			while ((m = fis.read(buffer)) > 0) {
				sos.write(buffer, 0, m);
			}
		}
	}

	/*
	SmartUpload su = new SmartUpload();
	su.initialize(getServletConfig(), request, response);
	su.downloadFile(PATH);
	*/
%>