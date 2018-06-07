<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<!-- //////////// common.jsp //////////// -->
<%@include file="common.jsp"%>
<!-- //////////// //////////// //////////// -->
<!-- //////////// 로그인 검증 //////////// -->
<body class="hold-transition sidebar-mini sidebar-collapse">
<div class="wrapper" id="wrap">  

<!-- //////////// header.jsp //////////// -->
 <%@include file="header.jsp"%>
<!-- //////////// //////////// //////////// -->    
<!-- //////////// sidebar.jsp //////////// -->        
<%@include file="sidebar.jsp"%>
<!-- //////////// //////////// //////////// -->   
<!-- //////////// main.jsp //////////// -->   
 
 <script src="http://code.jquery.com/jquery-1.12.0.js"></script>
  
  <!-- Content Wrapper. Contains page content -->
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
        
          <div class="col-sm-6">
            <h1 class="m-0 text-white">About Us</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="text-white">_</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div id="app-5" class="col-12">
             <img src="dist/img/logo.png" width=20% class="rounded mx-auto d-block">
              <br>
              <br>
               <div class="card">
              <div class="card-header">
                <h3 class="card-title">Team OL</h3>
              </div>
                   <div id="selectpay" class="card-body">
                      
                  충북대학교 2018 오픈소스전문프로젝트 개발팀.<br><br>
                       
             
            <!-- /.card -->
           <div class="row">
          <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box" style="background-color:black">
              <div class="info-box-content" style="background-color:black">
                <span class="info-box-number">구본철</span>
                <span class="info-box-text">소프트웨어학과 2013041035</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box" style="background-color:black">
              <div class="info-box-content" style="background-color:black">
                  <span class="info-box-number">신종훈</span>
                <span class="info-box-text">정보통신공학부 2013039101</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box" style="background-color:black">
              <div class="info-box-content" style="background-color:black">
                  <span class="info-box-number">김기훈</span>
                <span class="info-box-text">소프트웨어학과 2013041010</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <!-- /.col -->
        </div>
        <div class="card w-100">
              <div class="card-header">
                <h3 class="card-title">OSS Notice</h3>
              </div>
                   <div id="selectpay" class="card-body" >
                <span class="info-box-number">Bootstrap 4.1</span>
                <span class="info-box-text">https://getbootstrap.com/</span>
                <span class="info-box-text">The MIT License (MIT)</span>
                       <hr>
                <span class="info-box-number">AdminLTE3</span>
                <span class="info-box-text">https://adminlte.io</span>
                <span class="info-box-text">The MIT License (MIT)</span>
                       <hr>
                  <span class="info-box-number">Vue.js</span>
                <span class="info-box-text">https://kr.vuejs.org</span>
                <span class="info-box-text">The MIT License (MIT)</span>
                       <hr>
                  <span class="info-box-number">SweetAlert2</span>
                <span class="info-box-text">https://sweetalert2.github.io/</span>
                        <span class="info-box-text">The MIT License (MIT)</span>
                       <hr>
                    <span class="info-box-number">Login Form v3 by Colorlib</span>
                <span class="info-box-text">https://colorlib.com/wp/template/login-form-v3/</span>
                <span class="info-box-text">CC BY 3.0</span>
                       <hr>

              <!-- /.card-body -->
                   </div>
            </div>
        
			</div>
              
            <!-- /.invoice -->
              
            <!-- /.card -->
            <!-- /.invoice -->
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
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
