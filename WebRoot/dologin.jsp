<%@ page language="java" import="java.util.*,com.dao.DemoDao"
	contentType="text/html; charset=utf-8"%>
<%
	response.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="thisUser" class="com.po.Users" scope="session"></jsp:useBean>
<jsp:useBean id="Dao" class="com.dao.DemoDao" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="thisUser" />
<%
	/*
	 * 0为数据库连接失败
	 * 1为登陆成功
	 * 2为密码错误
	 * 3为用户名不存在
	 */
	int loginstatus = Dao.LoginStatus(thisUser);//Dao中 调用了thisUser.setId();
	switch (loginstatus) {
	case 0:
		request.setAttribute("loginstatus", 0);
		request.getRequestDispatcher("login_failure.jsp").forward(request, response);
	case 1:
		session.setAttribute("thisUser", thisUser);
		response.sendRedirect("home.jsp");
		break;
	case 2:
		request.setAttribute("loginstatus", 2);
		request.getRequestDispatcher("login_failure.jsp").forward(request, response);
		break;
	case 3:
		request.setAttribute("loginstatus", 3);
		request.getRequestDispatcher("login_failure.jsp").forward(request, response);
	}
%>
