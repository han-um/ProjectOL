<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
	<%
		String in_username= null;
			UserDAO userDAO = new UserDAO();
			int result = 2; // 로그인 시도.
                if(result==1){
                    //session.setAttribute("s_username",user.getUsername());
                }
				out.print(result);
	%>