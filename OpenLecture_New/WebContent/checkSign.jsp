<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if(session.getAttribute("s_username")==null){
	response.sendRedirect("sign/index.jsp");
}
%>