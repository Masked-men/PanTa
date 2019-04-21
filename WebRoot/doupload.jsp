<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" import="java.util.*,java.io.File"
	contentType="text/html; charset=utf-8"%>
<jsp:useBean id="thisUser" class="com.po.Users" scope="session"></jsp:useBean>
<%
	String PATH = "BOX" + File.separator + thisUser.getUsername();
	File dir = new File(PATH);
	if (!dir.exists()) {
		dir.mkdirs();
	}
	DiskFileItemFactory df = new DiskFileItemFactory();
	df.setSizeThreshold(40 * 1024 * 1024);
	File temp = new File("BOXtemp");
	if (!temp.exists()) {
		temp.mkdirs();
	}
	df.setRepository(temp);
	ServletFileUpload upload = new ServletFileUpload(df);
	upload.setHeaderEncoding("utf-8");
	upload.setFileSizeMax(40 * 1024 * 1024);
	List<FileItem> items = upload.parseRequest(request);
	if (items != null && items.size() > 0) {
		// 迭代表单数据
		for (FileItem item : items) {
			if (!item.isFormField()) {
				// 保存文件到硬盘
				item.write(new File(PATH + File.separator + item.getName()));
			}
		}
	}
	response.sendRedirect("home.jsp");
%>
