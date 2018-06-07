<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="UserInfo.UserInfoDAO" %>
<%@ page import = "java.io.PrintWriter"%>    
<%@ page import = "java.util.ArrayList"%>    
<%@ page import = "lecture.Lecture" %>
<%@ page import = "lecture.Join" %>
<%@ page import = "lecture.Contents" %>
<%@ page import = "lecture.Comment" %>
<%@ page import = "lecture.LectureDAO" %>
<%@ page import = "java.sql.ResultSet" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<!-- //////////// common.jsp //////////// -->
<%@include file="common.jsp"%>
<!-- //////////// 로그인 검증 //////////// -->
<%@include file="checkSign.jsp"%>
<!-- //////////// //////////// //////////// -->
<body class="hold-transition sidebar-mini sidebar-collapse">
	<div class="wrapper" id="wrap">

		<!-- //////////// header.jsp //////////// -->
		<%@include file="header.jsp"%>
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// sidebar.jsp //////////// -->
		<%@include file="sidebar.jsp"%>
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// main.jsp //////////// -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- /.content-header -->
			<!-- Main content -->
			<br>
			<br>
			<div class="card w-100">
			<%
			String contentid = request.getParameter("conid");
			String lectureid = request.getParameter("lecid");
			LectureDAO lectureDAO = new LectureDAO();
			Lecture lect = lectureDAO.getData(lectureid);
			String result[] = lectureDAO.searchContent(Integer.parseInt(lectureid),Integer.parseInt(contentid));
			%>
				              <div class="card-header w-100">
				               <a href="lectureInfo.jsp?id=<%=lectureid%>"><h3 class="card-title w-100"><%=lect.getLectureName() %></h3></a>
				              </div>
				              <div id="selectpay" w-100 class="card-body">
				                <p><%=result[0] %></p>
				              </div>
				              <!-- /.card-body -->
				            </div>
				        <iframe width=100% height="815" src="<%=result[1] %>" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			<section class="content">
				<div class="row">
					<!-- end of col-12 -->
				</div>
				<!-- end of row -->
			</section>
			<!-- end of content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// sidebar-right.jsp //////////// -->
		<%@include file="sidebar-right.jsp"%>
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// footer.jsp //////////// -->
		<%@include file="footer.jsp"%>
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// common-js.jsp //////////// -->
		<%@include file="common-js.jsp"%>
		<!-- //////////// //////////// //////////// -->
</body>
</html>
