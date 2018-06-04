<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"%>    
<%@ page import = "java.util.ArrayList"%>    
<%@ page import = "lecture.Lecture" %>
<%@ page import = "lecture.Contents" %>
<%@ page import = "lecture.Comment" %>
<%@ page import = "lecture.LectureDAO" %>
<%@ page import = "java.sql.ResultSet" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<!-- //////////// common.jsp //////////// -->
<%@include file="common.jsp"%>
<!-- //////////// //////////// //////////// -->
<style>
.lecture-price {
	color:#ffff00;
}
.expected-price {
	padding-left:10px;
	color:#ffff00;
}
</style>


<body class="hold-transition sidebar-mini sidebar-collapse">
	<div class="wrapper"  id="wrap">
		<!-- //////////// header.jsp //////////// -->
		<%@include file="header.jsp"%>
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// sidebar.jsp //////////// -->
		<%@include file="sidebar.jsp"%>
		<!-- //////////// //////////// //////////// -->
		<!-- //////////// main.jsp //////////// -->
		<%
			String lectureid = request.getParameter("id");
			LectureDAO lectureDAO = new LectureDAO();
			Lecture lect = lectureDAO.getData(lectureid);
			int contentNum = lect.getContentNum();
			int commentNum = lect.getCommentNum();
		%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">

						<div class="col-sm-6">
							<h1 class="m-0 text-white"><%=lect.getUserName()%>'s</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->
			<!-- Main content -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class=class="col-12">
							<!-- 이곳에 첫번째 줄의 컨텐츠가 들어감 -->
							<h1 class="m-0 text-white" id="lecture_name">
								<%=lect.getLectureName()%>
								<span id="lecture_view"
									style="margin-left: 5%; font-size: 15px;"><%=lect.getView() %>
									view</span>
							</h1>
							<br>
							<div class="callout callout-info">
					              이 강의의 현재 가격 (토큰) : <i class='fa fa-get-pocket'></i>
								<span class="lecture-price"><%=lect.getPrice()%></span>
					            </div>
					        <div class="callout callout-warning">
					              이 강의는 테스트를 위해 임의로 만들어졌습니다.
					            </div>
							<div id="price_view_wrapper">
								<p>
									<a href="#" class="btn btn-warning" role="button"
										style="color: #ffffff">강의 구매 </a> <a href="#"
										class="btn btn-success" role="button">미리보기</a>
								</p>
							</div>
							<div id="lecture_topic_wrapper">
								<br>
								<h1 class="m-0 text-white">주제</h1>
								<p style="color: #ffffff"><%=lect.getTopic() %></p>
								<br>
							</div>
							<div id="lecture_intro_wrapper">
								<br>
								<h1 class="m-0 text-white">인트로</h1>
								<p style="color: #ffffff"><%=lect.getIntro() %></p>
								<br>
								<br>
							</div>
							<div class="card" id="lecture_list_wrapper">
								<div class="card-header">
									<h3 class="card-title">강의 목차</h3>

									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 150px;"></div>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover">

									<%
										ArrayList<Contents> contentList = lectureDAO.getContentList(lectureid);
										for(Contents c : contentList) {
											String length = (c.getLength() / 60) + " : " + (c.getLength() % 60);
									%>
										<tr>
											<td id="lecture_num"><%=c.getContentnum() %>주차</td>
											<td id="lecture_name"><%=c.getContentname() %></td>
											<td id="viedo_time"></td>
											<td
												style="width: 15%; padding-top: 6px; padding-bottom: 6px;">
												<a href="#" class="btn btn-primary"
												style="padding-top: 6px; padding-bottom: 6px;"><span
													style="font-size: 10px">수강하기</span></a>
											</td>
										</tr>
									<%	
										}
									%>
									</table>
								</div>
								<!-- /.card-body -->
							</div>
							<div id="comment_list_wrapper"></div>
							
							<div class="card">
								<div class="card-header p-2">
									<h3 class="card-title">강의 평가</h3>
								</div>
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane active show" id="comments">
											<!-- Post -->
										<%
											ArrayList<Comment> commentList = lectureDAO.getCommentList(lectureid);
											for (Comment c : commentList) {
										%>
											<div class="post">
												<div class="user-block">
													<div>
														<h3 style="display: inline-block"><%=c.getTitle() %></h3>
														<div style="display: inline-block">
															<i class='fa fa-get-pocket'></i>
															<span class="expected-price"><%=c.getPrice() %></span>
														</div>
													</div>
													<span style="color:#6CA0DC; font-weight: bold;"><%=c.getUsername() %></span>
													<span class="float-right description"><%=c.getDatetime() %></span>
												</div>
												<!-- /.user-block -->
												<p style="color:#ffffff"><%=c.getContents() %></p>
											</div>
										<%
											}
										%>
											<!-- /.post -->

										</div>
									</div>
									<!-- /.tab-content -->
								</div>
								<!-- /.card-body -->
							</div>

							<!-- 이곳에 두번째 줄의 컨텐츠가 들어감 -->

						</div>
						<!-- /.col-md-6 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content -->
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
