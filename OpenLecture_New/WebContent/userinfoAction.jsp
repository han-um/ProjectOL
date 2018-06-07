<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="UserInfo.UserInfoDAO"%>
<%@ page import="UserInfo.UserInfo" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	UserInfo userinfo = new UserInfo();
	userinfo.setPassword(request.getParameter("Password"));
	userinfo.setQuestion(request.getParameter("Question"));
	userinfo.setAnswer(request.getParameter("Answer"));
	
	String in_username = (String) session.getAttribute("s_username");
	
	UserInfoDAO userinfoDAO = new UserInfoDAO();
	int result=userinfoDAO.changeuserinfo(userinfo, in_username);
	if(result>0){
		response.sendRedirect("userinfo.jsp");
	}
	else{
		%>
		<script>
			history.go(-1);
		</script>
		<%
	}
%>


