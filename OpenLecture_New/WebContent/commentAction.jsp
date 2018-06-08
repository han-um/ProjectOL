<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList"%>    
<%@ page import = "lecture.Lecture" %>
<%@ page import = "lecture.Contents" %>
<%@ page import = "lecture.Comment" %>
<%@ page import = "lecture.LectureDAO" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "search.SearchDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
	<%
	 		LectureDAO lectureDAO = new LectureDAO (); 
			// addComment(int lectureid, int userid, String title, String contents, int price)
			int a = Integer.parseInt((String)session.getAttribute("current_lectureid"));
			int b = Integer.parseInt((String)session.getAttribute("s_userid"));
			String c = request.getParameter("in_Title");
			String d = request.getParameter("in_Comment");
			int e = Integer.parseInt(request.getParameter("in_Price"));
			lectureDAO.addComment(a,b,c,d,e);
			
			Lecture lect = lectureDAO.getData((String)session.getAttribute("current_lectureid"));
			lectureDAO.setPrice(e, lect.getPrice(),lect.getCommentNum(), a);
			response.sendRedirect("lectureInfo.jsp?id="+session.getAttribute("current_lectureid"));
	%>