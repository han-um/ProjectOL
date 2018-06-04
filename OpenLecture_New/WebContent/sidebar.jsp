<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<%=request.getContextPath()%>/main.jsp" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Open Lecture</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <%
          if((String)session.getAttribute("s_username")==null){
          }else{
          out.println("<div class='image'> <img src='dist/img/user2-160x160.jpg' class='img-circle' alt='User Image'></div>");
          out.println("<a href='info.jsp' class='d-block'><div class='info'><h1 style='font-size:20px'>"+(String)session.getAttribute("s_username")+"</h1><br><i class='fa fa-get-pocket'></i>토큰 :");
          UserDAO userDAO = new UserDAO();
          String[] result = userDAO.getuserinfo((String)session.getAttribute("s_username"));
          out.println(result[3]+"</div></a>");
          }
          %>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
           <li class="nav-item">
           <%
           if((String)session.getAttribute("s_username")==null){
        	   out.println("<a href='sign/index.jsp' class='nav-link active'>");
               out.println("<i class='nav-icon fa fa-edit'></i>");
               out.println("<p> 로그인 </p></a>");        	   
           }else{
        	   out.println("<a href='logout.jsp' class='nav-link active'>");
               out.println("<i class='fa fa-sign-out nav-icon'></i>");
               out.println("<p> 로그아웃 </p></a>");
           }
           %>
          </li>    
        <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fa fa-dashboard"></i>
              <p>
                개인
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fa fa-info nav-icon"></i>
                  <p>프로필 / 강의 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fa fa-info-circle nav-icon"></i>
                  <p>개인정보 수정</p>
                </a>
              </li>
                <li class="nav-item">
                <a href="<%=request.getContextPath()%>/tokenpay.jsp" class="nav-link">
                  <i class="fa fa-get-pocket nav-icon"></i>
                  <p>TOKEN 충전</p>
                </a>
              </li>
            </ul>
          </li>
        <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fa fa-table"></i>
              <p>
                강의
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fa fa-plus nav-icon"></i>
                  <p>새 강의 만들기...</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/main.jsp" class="nav-link">
                  <i class="fa fa-play-circle nav-icon"></i>
                  <p>오늘의 강의</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fa fa-pie-chart nav-icon"></i>
                  <p>강의 차트</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fa fa-random nav-icon"></i>
                  <p>랜덤 강의 보기</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item ">
            <a href="#" class="nav-link active">
              <i class="nav-icon fa fa-th"></i>
              <p>
                어떻게 이용하나요?
              </p>
            </a>
          </li>
          <li class="nav-item ">
            <a href="#" class="nav-link active">
              <i class="nav-icon fa fa-user-plus"></i>
              <p>
                About Us
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>