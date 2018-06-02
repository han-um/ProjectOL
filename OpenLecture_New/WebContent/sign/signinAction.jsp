<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="username" />  
<jsp:setProperty name="user" property="password" />    
	<%
		String in_username= null;
	in_username = request.getParameter("username");
			UserDAO userDAO = new UserDAO();
			int result = userDAO.signin(request.getParameter("username"), request.getParameter("password")); // 로그인 시도.
                if(result==1){
                    session.setAttribute("s_username",user.getUsername());
                }
				out.print(result);
	%>