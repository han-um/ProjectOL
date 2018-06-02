<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
 <%@include file="../common.jsp"%>	
<body style="background-color: #999999;">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main1.css">
        <link rel="stylesheet" href="../dist/css/adminlte.css">
<!--===============================================================================================-->
  <script src="http://code.jquery.com/jquery-1.12.0.js"></script>
  <script>
    $(document).ready(function() {
      $('#btnLogin').click(function() {
        var action = $('#frmLogin').attr("action");
            var form_data = {
                              username: $('#username').val(),
                              question: $('#question').val(),
                              answer: $('#answer').val(),
                              password: $('#password').val(),
                              passwordconf: $('#passwordconf').val()
            };
            $.ajax({
                      type: "POST",
                      url: action,
                      data: form_data,
                      success: function(response) {
                          if(response==1){
                            swal({
                                type: 'error',
                                title: 'Oops...',
                                text: '정보를 빈칸없이 입력해주세요.',
                                footer: '<a></a>',
                		      })
                          }else if(response==2){                            
                              swal({
                                type: 'error',
                                title: 'Oops...',
                                text: '비밀번호와 비밀번호 확인의 값이 다릅니다!',
                                footer: '<a></a>',
                		      })
                          }else if(response==3){
                              swal({
                                type: 'error',
                                title: 'Oops...',
                                text: '계정 이름이 이미 존재합니다!',
                                footer: '<a></a>',
                		      })
                          }else if(response==4){
                              //
                            swal({
                                type: 'success',
                                title: 'Success',
                                text: '회원가입에 성공하였습니다!',
                                footer: '<a></a>',
                              }).then(function(result) {
                                if (result) {
                                    location.replace('index.jsp');
                                }
                              }).done();
                              //
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


	<div class="limiter">
		<div class="container-login100">
            
			<div class="login100-more" style="background-image: url('../dist/img/blurbackground.jpg');"></div>
            
            
			<div class="wrap-login100 p-l-90 p-r-90 p-t-100 p-b-50">
               <a href="index.jsp"> ← Login </a>
                    <h2>Sign Up</h2>
                
            <!--실제 로그인 입력 폼-->
				<form id="frmLogin" class="login100-form validate-form"  action="signupAction.jsp" method="post">
					<div class="wrap-input100 validate-input" data-validate="계정 이름을 입력하세요">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" id="username" placeholder="계정 이름">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="질문을 입력하세요">
						<span class="label-input100">Question</span>
						<input class="input100" type="text" id="question" placeholder="ex) 졸업한 초등학교의 이름은 무엇입니까?">
						<span class="focus-input100"></span>
					</div>
                    <div class="wrap-input100 validate-input" data-validate="답변을 입력하세요">
						<span class="label-input100">Answer</span>
						<input class="input100" type="text" id="answer" placeholder="질문의 답변">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "비밀번호를 입력하세요">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" id="password" placeholder="*************">
						<span class="focus-input100"></span>
					</div>
                    <div class="wrap-input100 validate-input" data-validate = "비밀번호 확인을 입력하세요">
						<span class="label-input100">Password Confirm</span>
						<input class="input100" type="password" id="passwordconf" placeholder="*************">
						<span class="focus-input100"></span>
					</div>
                    <input type="button" id="btnLogin" class="btn btn-primary form-control" value="회원 가입">
				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>