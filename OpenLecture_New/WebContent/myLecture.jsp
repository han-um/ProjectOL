<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "lecture.Lecture" %>
<%@ page import = "lecture.Join" %>
<%@ page import = "lecture.Lecture" %>
<%@ page import = "lecture.LectureDAO" %>
<%@ page import = "search.SearchDAO" %>
<%@ page import = "java.util.ArrayList"%> 
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<!-- //////////// common.jsp //////////// -->
<%@include file="common.jsp"%>
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
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
        
          <div class="col-sm-6">
            <h1 class="m-0 text-white">내 강의</h1>
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
                            
            <div class="card">
              <!-- /.card-header -->
              <div class="card-header">
                <h3 class="card-title">내가 참여중인 강의</h3>
              </div>

              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
             
              <% 
              LectureDAO lectureDAO = new LectureDAO();
              ArrayList<Join> join = null;
              if(session.getAttribute("s_userid")!=null){
              join = lectureDAO.getJoin(Integer.parseInt((String)session.getAttribute("s_userid")),2); 
             	}
             if(join!=null){
              	for(int j=0; j<join.size(); j++){
              		int n = join.get(j).getLectureid();
              %>
                  <tr onclick="location.href='<%=request.getContextPath()%>/lectureInfo.jsp?id=<%=join.get(j).getLectureid()%>'">
                    <td><%out.println(lectureDAO.getData(String.valueOf(n)).getLectureName()); %></td>
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
          <div class="col-lg-6">
              <!-- 이곳에 두번째 줄의 컨텐츠가 들어감 -->
			<div class="card">
              <!-- /.card-header -->
              <div class="card-header">
                <h3 class="card-title">내가 만든 강의</h3>
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
				<%
				  if(session.getAttribute("s_userid")!=null){
				 SearchDAO searchDAO = new SearchDAO();
				 ArrayList<Lecture> lect_r = null;
				 lect_r = searchDAO.orderedLecture(1);
				 for(int k=0; k<lect_r.size()&&k<5; k++){
					 int temp1 = lect_r.get(k).getUserId();
					 int temp2 = Integer.parseInt((String)session.getAttribute("s_userid"));
					 if(temp1 == temp2){
				%>
                  <tr onclick="location.href='<%=request.getContextPath()%>/lectureInfo.jsp?id=<%=lect_r.get(k).getLectureId()%>'">
                    <td><%=lect_r.get(k).getLectureName()%></td>
                  </tr>
                 <%		}
					}
				}%>
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
