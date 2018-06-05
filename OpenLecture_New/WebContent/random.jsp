<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Random" %>
<%@ page import = "java.util.ArrayList"%>    
<%@ page import = "lecture.Lecture" %>
<%@ page import = "lecture.Contents" %>
<%@ page import = "lecture.Comment" %>
<%@ page import = "lecture.LectureDAO" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "search.SearchDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>
	<%
		SearchDAO searchDAO = new SearchDAO(); 
	    UserDAO userDAO = new UserDAO(); 
	    ArrayList<Lecture> lect = searchDAO.orderedLecture(1); // lect 안에 정렬된 순서대로 강의가 들어가있다.
	    
	    // 인덱스번호 난수 생성
	    Random generator = new Random();        
	    int rand = generator.nextInt(lect.size());  
	    
	    response.sendRedirect("lectureInfo.jsp?id="+ String.valueOf(lect.get(rand).getLectureId()));
	%>