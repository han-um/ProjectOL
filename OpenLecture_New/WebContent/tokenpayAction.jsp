<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
	<%
			UserDAO userDAO = new UserDAO();
			int result = userDAO.addToken((String)session.getAttribute("s_username"),Integer.parseInt(request.getParameter("tokennum"))); // 로그인 시도.
			String result2[] = userDAO.getuserinfo((String)session.getAttribute("s_username"));
			out.print(result2[3]);
	%>