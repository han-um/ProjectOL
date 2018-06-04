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
		String CompleteCode ="<h2>Search Result</h2><br>";
		String SubCode = "";
		SearchDAO searchDAO = new SearchDAO();
		ArrayList<Lecture> lect = searchDAO.searchLecture(request.getParameter("searchinput").trim());
		if(lect.size()==0){ // 배열의 길이가 0일때 = 결과값이 하나도 없을 때
				CompleteCode = CompleteCode + "<div class='callout callout-warning text-white'><b>검색 결과가 없습니다. 다음을 검증해보세요.</b></div><div class='callout callout-warning'>- 단어의 철자가 정확한지 확인해 보세요.<br>- 한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>- 검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>- 두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</div>";
		}else{
			for(int i=0; i<lect.size(); i++){
				SubCode = "<div class='card float-left d-none d-sm-inline' style='width: 18rem;''><div class='callout callout-info'><div class='card-body'><h5 class='card-title'>";
				SubCode = SubCode + lect.get(i).getLectureName() + "</h5><p class='card-text'><span style='color:yellow'> 이 강의의 현재 가격 (토큰) : <i class='fa fa-get-pocket'></i>";
				SubCode = SubCode + lect.get(i).getPrice() + "</span><br>";
				SubCode = SubCode + lect.get(i).getIntro() + "</p><a href='";
				SubCode = SubCode + request.getContextPath() + "/lectureInfo.jsp?id=" +lect.get(i).getLectureId()+ "' class='btn btn-primary'>강의 보러가기</a></div></div></div>";
				CompleteCode = CompleteCode + SubCode;
			}
		}
				out.print(CompleteCode);
	%>