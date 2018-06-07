<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"%>    
<%@ page import = "java.util.ArrayList"%>    
<%@ page import = "lecture.Lecture" %>
<%@ page import = "lecture.Join" %>
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
<!-- //////////// 로그인 검증 //////////// -->
<%@include file="checkSign.jsp"%>
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
			session.setAttribute("current_lectureid", request.getParameter("id"));
			String lectureid = request.getParameter("id");
			LectureDAO lectureDAO = new LectureDAO();
			Lecture lect = lectureDAO.getData(lectureid);
			lectureDAO.addView( Integer.parseInt(lectureid));
			int contentNum = lect.getContentNum();
			int commentNum = lect.getCommentNum();
		%>
		
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
  <script>
    $(document).ready(function() {
      $('#btnBuy').click(function() {
        var action = $('#frmBuy').attr("action");
            var form_data = {
                              price: <%=lect.getPrice()%>,
                              lectureid: <%=lect.getLectureId()%>
            };
            $.ajax({
                      type: "POST",
                      url: action,
                      data: form_data,
                      success: function(response) {
                    	  if(response==0){
                    	  swal({
                              type: 'error',
                              title: 'Oops...',
                              text: '토큰이 부족합니다!',
                              footer: '<a href></a>',
                            })
                    	  }else{
                    		  location.href="lectureInfo.jsp?id="+<%=request.getParameter("id")%>;
                    	  }
                      },
                      error: function() {
                          swal({
                                type: 'error',
                                title: 'Oops...',
                                text: 'AJAX Issue!',
                                footer: '<a href>Why do I have this issue?</a>',
                              })
                      }
            });
      });
    });
</script>
		
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
			<%
			// 사용자가 이 강의를 가지고있는지 판별
			ArrayList<Join> join = lectureDAO.getJoin(Integer.parseInt(request.getParameter("id")),1);
			int result=0;
				for(int i=0; i<join.size(); i++){
					if(join.get(i).getUserid()== Integer.parseInt((String)session.getAttribute("s_userid"))){
						result=1;
					}
				}
			%>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class=class="col-12">
							<!-- 이곳에 첫번째 줄의 컨텐츠가 들어감 -->
							<h1 class="m-0 text-white" id="lecture_name">
								<%=lect.getLectureName()%>
								<span id="lecture_view"
									style="margin-left: 5%; font-size: 15px;"><%=lect.getView() %>
									view, &nbsp;&nbsp;&nbsp; 
									
									<i class='fa fa-user-plus'></i>
									<% 
									session.setAttribute("buy_num",join.size());
									if(join.size()!=0){ %>
									<%=join.size() %>명의 구매자</span>
									<% }else{
										%> 구매자가 아직 없습니다! </span>
									<%}%>
							</h1>
							<br>
							<div class="callout callout-info">
					              이 강의의 현재 가격 (토큰) : <i class='fa fa-get-pocket'></i>
								<span class="lecture-price"><%=lect.getPrice()%></span>
					            </div>
					        <div class="callout callout-warning">
					              이 강의는 테스트를 위해 임의로 만들어졌습니다.
					            </div>
					        <%
							if(result==1){ // 강의를 가지고있지 않다면, 수강하기 버튼을 띄우지 않는다.
							%>
							<div class="callout callout-warning">
					              현재 이 강의를 보유중입니다!
					        </div>
							<%}%>
											
							<div id="price_view_wrapper">
							<%
							if(result!=1){ // 강의를 가지고있다면, 구매와 미리보기 버튼을 띄우지 않는다.
							%>
								<p>
								<form id="frmBuy" class="login100-form validate-form"  action="buyAction.jsp" method="post">
									<a href="#" id="btnBuy" class="btn btn-warning" role="button"style="color: #ffffff">강의 구매 </a> 
										<a href="#"class="btn btn-success" role="button">미리보기</a>
								</form>
								</p>
							<%
							}
							%>
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
											String length;
											if(c.getLength() == 0)
												length = "00:00";
											else
												length = (c.getLength() / 60) + " : " + (c.getLength() % 60);
									%>
										<tr>
											<td id="lecture_num"><%=c.getContentnum() %>주차</td>
											<td id="lecture_name"><%=c.getContentname() %></td>
											<td id="viedo_time"><%=length %></td>
											<td
												style="width: 15%; padding-top: 6px; padding-bottom: 6px;">
											<%
											if(result==1){ // 강의를 가지고있지 않다면, 수강하기 버튼을 띄우지 않는다.
											%>
													<a href="viewVideo.jsp?lecid=<%=lect.getLectureId() %>&conid=<%=c.getContentnum() %>" class="btn btn-primary"
												style="padding-top: 6px; padding-bottom: 6px;"><span
													style="font-size: 10px">
													수강하기</span></a>
											<%} %>
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
								<%
													if(result==1){ // 강의를 가지고있지 않다면, 수강하기 버튼을 띄우지 않는다.
								%>
									<form class="form-horizontal" action="commentAction.jsp" method="POST">
											<div class="form-group w-100">
													<br>제목
													<input type="text" class="form-control" id="in_Title" name="in_Title">
													<br>가격
													<input type="text" class="form-control w-25" id="in_Price" name="in_Price">
													내용
													<input type="text" class="form-control" id="in_Comment" name="in_Comment">
											</div>
											<div class="form-group w-100">
												<div class="col-sm-offset-2 w-100">
												<input type="submit" class="btn btn-success w-100" id="btnPay" value="평가하기" >
												</div>
											</div>
										</form>
								<%} %>
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
