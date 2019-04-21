<%@ page language="java" import="java.util.*,com.dao.DemoDao"
	contentType="text/html; charset=utf-8"%>

<jsp:useBean id="thisUser" class="com.po.Users" scope="page"></jsp:useBean>
<jsp:useBean id="Dao" class="com.dao.DemoDao" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="thisUser" />
<%
	if (request.getParameter("password").equals(request.getParameter("repassword"))) {
		/*
		* 0为发生错误 1为用户名未被使用过 2为用户名已存在
		*/
		int loginstatus = Dao.RegistStatus(thisUser);
		switch (loginstatus) {
		case 0:
			request.setAttribute("registstatus", 0);
			request.getRequestDispatcher("regist_failure.jsp").forward(request, response);
			break;
		case 1:
			if (Dao.doRegist(thisUser)) {
				request.getRequestDispatcher("regist_success.jsp").forward(request, response);
			} else {
				request.setAttribute("registstatus", 0);
				request.getRequestDispatcher("regist_failure.jsp").forward(request, response);
			}
			break;
		case 2:
			request.setAttribute("registstatus", 2);
			request.getRequestDispatcher("regist_failure.jsp").forward(request, response);
			break;
		}
	} else {
		out.print("<h3>您输出的两次密码不匹配，请重新输入.</h3><br>");
		out.print("<h4><a href=\"regist.jsp\">返回注册页</a></h4>");
	}
%>