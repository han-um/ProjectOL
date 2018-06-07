<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="UserInfo.UserInfoDAO" %>
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
<script>
	
	function checkInput() {
		var pw = document.getElementById("Password").value;
		var pwc = document.getElementById("pwc").value;
		var question = document.getElementById("Question").value;
		var answer = document.getElementById("Answer").value;

		if (pw == "" || pwc=="" || question=="" || answer=="") {
			swal({
				type : 'error',
				title : 'Oops...',
				text : '빈 칸을 채워주세요.',
				footer : ''
			})
			return false;
		}
		else if (pw != pwc){
			swal({
				type : 'error',
				title : 'Oops...',
				text : '비밀번호를 확인해주세요.',
				footer : ''
			})
			return false;
		}
		else{
			swal({
				type : 'success',
				title : 'Oops...',
				text : '정보를 변경하였습니다.',
				footer : ''
			})
		}
	}
</script>

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
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">

						<div class="col-sm-6">
							<h1 class="m-0 text-white">개인 정보 수정</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="text-white">_</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->
			<%
				UserInfoDAO userinfoDAO = new UserInfoDAO();
				String[] result = userinfoDAO.getuserinfo((String) session.getAttribute("s_username"));
			%>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<ul class="nav nav-pills red">
									<li class="nav-item"><a class="nav-link active"
										href="#viewProfile" data-toggle="tab">프로필 보기</a></li>
									<li class="nav-item"><a class="nav-link"
										href="#changeProfile" data-toggle="tab">프로필 변경</a></li>
								</ul>
							</div>
							<!-- end of card-header -->
							<div class="card-body">
								<div class="tab-content">
									<!-- viewProfile -->
									<div class="active tab-pane" id="viewProfile">
										<table class="table table-condensed">
											<tr>
												<th style="width: 30%">질문</th>
												<td><%=result[0] %></td>
											</tr>
											<tr>
												<th>답변</th>
												<td><%=result[1] %></td>
											</tr>
											<tr>
												<th>가입 날짜</th>
												<td><%=result[2] %></td>
											</tr>
											<tr>
												<th>Token</th>
												<td><%=result[3] %></td>
											</tr>
										</table>
									</div>
									<!-- end of viewProfile -->

									<!-- changeProfile -->
									<div class="tab-pane" id="changeProfile">
										<form class="form-horizontal" action="userinfoAction.jsp"
											method="POST" onsubmit="return checkInput()">
											<div class="form-group">
												<label for="pw" class="col-sm-2 control-label">Password</label>
												<div class="col-sm-10">
													<input type="password" class="form-control" id="Password"
														name="Password">
												</div>
											</div>
											<div class="form-group">
												<label for="PasswordConfirm" class="col-sm-2 control-label">Password
													Confirm</label>
												<div class="col-sm-10">
													<input type="password" class="form-control" id="pwc">
												</div>
											</div>
											<div class="form-group">
												<label for="Question" class="col-sm-2 control-label">Question</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="Question"
														name="Question">
												</div>
											</div>
											<div class="form-group">
												<label for="Answer" class="col-sm-2 control-label">Answer</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="Answer"
														name="Answer">
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10">
													<input type="submit" class="form-control" value="modify"
														style="background-color: rgb(0, 123, 255)"></input>
												</div>
											</div>
										</form>
									</div>
									<!-- end of changeProfile -->
									
								</div>
								<!-- end of tab-content -->
							</div>
							<!-- /.card-body -->
						</div>
						<!-- end of card -->
					</div>
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
