<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>  
<%
    // 1: 기존의 세션 데이터를 모두 삭제
    session.invalidate();
    // 2: 메인 페이지로 이동시킴.
    response.sendRedirect("main.jsp");
%>