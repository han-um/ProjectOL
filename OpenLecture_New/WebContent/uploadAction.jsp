<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "lecture.Lecture" %>
<%@ page import = "lecture.Contents" %>
<%@ page import = "lecture.LectureDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<meta charset="utf-8" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>봉사활동 참가신청</title>
</head>
<body>
<%=request.getParameter("title") %><hr>
<%=request.getParameter("topic") %><hr>
<%=request.getParameter("intro") %><hr>
<%=request.getParameter("image") %><hr>
<%
String[] contents = request.getParameterValues("content");
String[] urls = request.getParameterValues("url");
/* for(String content:contents){
	out.println(content);
}
for(String url:urls){
	out.println(url);
} */
%>
<hr>
<%=contents.length %><hr>
<%
	//session.setAttribute("s_userid", 1); //테스트를 위해 임의로 userid 지정.
	int userid = Integer.parseInt((String)session.getAttribute("s_userid"));
	out.println(userid);
	String title = request.getParameter("title");
	LectureDAO lectureDAO = new LectureDAO();
	int resultLecture = lectureDAO.uploadLecture(title, userid, request.getParameter("topic"),
			request.getParameter("intro"), contents.length, request.getParameter("imageURL"));
	int resultContent;
	if (resultLecture == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('강의정보 등록에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		resultContent = lectureDAO.uploadContent(title, userid, urls, contents);

		if (resultContent == -4) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('강의id를 불러올 수 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if (resultContent == -3) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('강의목록 등록에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('강의가 등록되었습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	}
%>
</body>
</html>