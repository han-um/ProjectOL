<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

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
    LectureDAO lectureDAO = new LectureDAO (); 
    String[] result = userDAO.getuserinfo((String)session.getAttribute("s_username"));
    int in_price =  Integer.parseInt(request.getParameter("price"));
    int my_token = Integer.parseInt(result[3]);
    

    int in_userid =  Integer.parseInt((String)session.getAttribute("s_userid"));
    String in_username = (String)session.getAttribute("s_username");
    int in_lectureid = Integer.parseInt(request.getParameter("lectureid"));
    String in_teachername = (String)request.getParameter("teachername");
    
    if(in_price <= my_token ){
    	userDAO.useToken(in_username, in_price);
    	lectureDAO.joinLecture(in_userid, in_lectureid);
    	userDAO.addToken(in_teachername, in_price);
    	//Join테이블에 추가
    	out.println(my_token-in_price);
    }else{
    	out.println(0);
    }



    
	%>