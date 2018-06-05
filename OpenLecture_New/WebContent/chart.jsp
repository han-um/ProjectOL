<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "lecture.Lecture" %>
<%@ page import = "java.util.ArrayList"%> 
<%@ page import = "lecture.Contents" %>
<%@ page import = "lecture.Comment" %>
<%@ page import = "lecture.LectureDAO" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "search.SearchDAO" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<!-- //////////// common.jsp //////////// -->
<%@include file="common.jsp"%>
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
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
        
          <div class="col-sm-6">
            <h1 class="m-0 text-white">강의 차트</h1>
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

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6">
              <!-- 이곳에 첫번째 줄의 컨텐츠가 들어감 -->
              
              <!-- 인기 차트 -->     
             <div class="card">
              <div class="card-header">
                <h3 class="card-title">인기 순위</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover ">
                  <tr>
                    <th class="w-50">강의명</th>
                    <th>강사</th>
                    <th>가격(토큰)</th>
                    <th>인기도</th>
                  </tr>
                    <% 
                    SearchDAO searchDAO = new SearchDAO(); 
                    UserDAO userDAO = new UserDAO(); 
                    ArrayList<Lecture> lect = searchDAO.orderedLecture(1); // lect 안에 정렬된 순서대로 강의가 들어가있다.
                    for(int i=0; i<lect.size(); i++){
                    	String[] result = userDAO.getUserinfoById(lect.get(i).getUserId());
                    	String Percent = lect.get(i).getView() + "%";
                    %>
                  <tr onclick="location.href='<%=request.getContextPath()%>/lectureInfo.jsp?id=<%=lect.get(i).getLectureId()%>'">
                    <td><B class="text-white"><% out.println(lect.get(i).getLectureName()); %></B><br><span style="font-size:12px"><% out.println(lect.get(i).getTopic()); %></span></td>
                    <td class="align-middle"><% out.println(result[0]);%></td>
                    <td class="align-middle"><span class="tag tag-success"><i class="fa fa-get-pocket nav-icon "></i> <%out.println(lect.get(i).getPrice()); %></span></td>
                    <td class="align-middle"> 
                        <div class="progress progress-xs progress-striped active">
                            <div class="progress-bar bg-primary" style="width:<%out.println(Percent);%>"></div>
                        </div>
                    </td>
                  </tr>
                   <%
                    }
                   %>
                </table>
              </div>
              <!-- /.card-body -->
            </div>  
            
          </div>
          <!-- /.col-md-6 -->
          <div class="col-lg-6">
              <!-- 이곳에 두번째 줄의 컨텐츠가 들어감 -->
               <!-- 고평가된 (가격순 정렬 후 인기순 정렬) 차트 -->     
             <div class="card">
              <div class="card-header">
                <h3 class="card-title">고평가된 강의</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover ">
                  <tr>
                    <th class="w-50">강의명</th>
                    <th>강사</th>
                    <th>가격(토큰)</th>
                    <th>인기도</th>
                  </tr>
                    <%  
                    lect = searchDAO.orderedLecture(2); // lect 안에 정렬된 순서대로 강의가 들어가있다.
                    for(int i=0; i<lect.size()&&i<5; i++){
                    	String[] result = userDAO.getUserinfoById(lect.get(i).getUserId());
                    	String Percent = lect.get(i).getView() + "%";
                    %>
                  <tr onclick="location.href='<%=request.getContextPath()%>/lectureInfo.jsp?id=<%=lect.get(i).getLectureId()%>'">
                    <td><B class="text-white"><% out.println(lect.get(i).getLectureName()); %></B><br><span style="font-size:12px"><% out.println(lect.get(i).getTopic()); %></span></td>
                    <td class="align-middle"><% out.println(result[0]);%></td>
                    <td class="align-middle"><span class="tag tag-success"><i class="fa fa-get-pocket nav-icon "></i> <%out.println(lect.get(i).getPrice()); %></span></td>
                    <td class="align-middle"> 
                        <div class="progress progress-xs progress-striped active">
                            <div class="progress-bar bg-primary" style="width:<%out.println(Percent);%>"></div>
                        </div>
                    </td>
                  </tr>
                   <%
                    }
                   %>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            
             <!-- 무료 차트 -->     
             <div class="card">
              <div class="card-header">
                <h3 class="card-title">지금 무료</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover ">
                  <tr>
                    <th class="w-50">강의명</th>
                    <th>강사</th>
                    <th>가격(토큰)</th>
                    <th>인기도</th>
                  </tr>
                    <%  
                    lect = searchDAO.orderedLecture(3); // lect 안에 정렬된 순서대로 강의가 들어가있다.
                    for(int i=0; i<lect.size(); i++){
                    	String[] result = userDAO.getUserinfoById(lect.get(i).getUserId());
                    	String Percent = lect.get(i).getView() + "%";
                    	if(lect.get(i).getPrice()==0){
                    %>
                  <tr onclick="location.href='<%=request.getContextPath()%>/lectureInfo.jsp?id=<%=lect.get(i).getLectureId()%>'">
                    <td><B class="text-white"><% out.println(lect.get(i).getLectureName()); %></B><br><span style="font-size:12px"><% out.println(lect.get(i).getTopic()); %></span></td>
                    <td class="align-middle"><% out.println(result[0]);%></td>
                    <td class="align-middle"><span class="tag tag-success"><i class="fa fa-get-pocket nav-icon "></i> <%out.println(lect.get(i).getPrice()); %></span></td>
                    <td class="align-middle"> 
                        <div class="progress progress-xs progress-striped active">
                            <div class="progress-bar bg-primary" style="width:<%out.println(Percent);%>"></div>
                        </div>
                    </td>
                  </tr>
                   <%
                    	}
                    }
                   %>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            
          </div>
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
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
