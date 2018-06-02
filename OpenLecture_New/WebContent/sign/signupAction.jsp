<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="username" />  
<jsp:setProperty name="user" property="question" /> 
<jsp:setProperty name="user" property="answer" />
<jsp:setProperty name="user" property="password" /> 
    
	<%
			UserDAO userDAO = new UserDAO();
			if(user.getUsername()==null||user.getPassword()==null||user.getQuestion()==null||user.getAnswer()==null||request.getParameter("passwordconf")==null||request.getParameter("passwordconf")==""){
				// 빈 칸 오류
				out.println(1);
			}else{
				if(!request.getParameter("password").equals(request.getParameter("passwordconf"))){ // 비밀번호 확인 오류
					out.println(2);
				}else{
					int check = userDAO.signin(user.getUsername(), "-"); 
					if(check==0){ // 아이디 중복 오류 
						out.println(3);
					}else{ // 최종 가입처리
						userDAO.signup(user);
						out.println(4);
					}
				}
			}
			
	%>