<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	session.setMaxInactiveInterval(1);
	response.sendRedirect("login.jsp");
%>