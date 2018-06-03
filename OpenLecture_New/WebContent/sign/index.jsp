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
                          password: $('#password').val()
        };
        $.ajax({
                  type: "POST",
                  url: action,
                  data: form_data,
                  success: function(response) {
                  	  if(response.trim() == 1){
                              //
                            swal({
                                type: 'success',
                                title: 'Success',
                                text: '로그인에 성공하였습니다!',
                                footer: '<a></a>',
                              }).then(function(result) {
                                if (result) {
                                    location.replace('../main.jsp');
                                }
                              }).done();
                              //
                  	  } else if(response.trim() == 0) { // 비밀번호가 틀려 실패
                		  swal({
                		    type: 'error',
                		    title: 'Oops...',
                		    text: '비밀번호가 틀렸습니다.',
                		    footer: '<a>비밀번호 찾기</a>',
                		  })
                	  }else if(response.trim() == -1){ // 아이디가 틀려 실패 
                		  swal({
                  		    type: 'error',
                  		    title: 'Oops...',
                  		    text: '존재하지 않는 계정입니다.',
                  		    footer: '<a href>아이디 찾기</a>',
                  		  })
                	  }else if(response.trim() == -2){ // 데이터베이스 오류.
                		  swal({
                  		    type: 'error',
                  		    title: 'Oops...',
                  		    text: '데이터베이스에 문제가 있습니다!',
                  		    footer: '<a href>Why do I have this issue?</a>',
                  		  })
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
                
                    <h2>Sign In</h2>
                
            <!--실제 로그인 입력 폼-->
				<form id="frmLogin" class="login100-form validate-form"  action="signinAction.jsp" method="post">
					<div class="wrap-input100 validate-input" data-validate="계정 이름을 입력하세요">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" id="username" placeholder="Username">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "비밀번호를 입력하세요">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" id="password" placeholder="*************">
						<span class="focus-input100"></span>
					</div>
                    <input type="button" id="btnLogin" class="btn btn-primary form-control" value="로그인">
				</form>
                <br>
                 <center><a calss="centered" href="signup.jsp"> Sign Up </a></center>
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