<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "lecture.Join" %>
<%@ page import = "lecture.Lecture" %>
<%@ page import = "lecture.LectureDAO" %>
<%@ page import = "search.SearchDAO" %>
<%@ page import = "java.util.ArrayList"%> 
<!-- Navbar -->
  <nav class="fixed-top main-header navbar navbar-expand bg-black navbar-dark">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      </li>
    </ul>
 <script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script>
$(document).ready(function() {
		$('#searchinput').click(function() {
			
		});
		<%
		if(session.getAttribute("s_userid")!=null){
		%>
		$("#searchinput").keypress(function(event) {
        var action = $('#frmSearch').attr("action");
            var form_data = {
               searchinput: $('#searchinput').val(),
            };
            $.ajax({
                      type: "POST",
                      url: action,
                      data: form_data,
                      success: function(response) {
                            $('#resultbox').html(response);
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
	<%}%>
});
</script>
    <!-- SEARCH FORM -->
       <form id="frmSearch" onsubmit="return false;" action="<%=request.getContextPath()%>/searchAction.jsp" method="post" class="d-inline form-inline ml-3 w-75">
      <div class="input-group input-group w-100">
        	<input  id="searchinput" v-on:click="show=!show"  class="form-control form-control-navbar" type="search" placeholder="어떤 것을 배우고 싶으신가요?" aria-label="Search" style="width:70%;float:left">
         	<input type="button" id="btnSearch" class="btn btn-navbar" value="Search" style="font-size:12px; color:white; float:right">
      </div>
    </form>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <% 
      if(session.getAttribute("s_userid")!=null){
    %>
      <li class="nav-item dropdown">
        <a id="btnList1" class="nav-link" data-toggle="dropdown" href="#">
          <i class="fa fa-shopping-cart"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <h1>참여중인 강의</h1>
          <a href="#" class="dropdown-item">
                    <div class="card">
              <!-- /.card-header -->

              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
             
              <% 
              LectureDAO lectureDAO = new LectureDAO();
              ArrayList<Join> join = null;
              if(session.getAttribute("s_userid")!=null){
              join = lectureDAO.getJoin(Integer.parseInt((String)session.getAttribute("s_userid")),2); 
             	}
             if(join!=null){
              	for(int j=0; j<join.size()&&j<5; j++){
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
          </a>
          <a href="<%=request.getContextPath()%>/myLecture.jsp" class="dropdown-item dropdown-footer">더 보기...</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="fa fa-pencil-square"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                      <h1>내가 만든 강의</h1>
          <a href="#" class="dropdown-item">
          <div class="card">
              <!-- /.card-header -->
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
          </a>
          <a href="<%=request.getContextPath()%>/myLecture.jsp" class="dropdown-item dropdown-footer">더 보기...</a>
        </div>
      </li>
      <li class="nav-item">
      </li>
    <% } %>
    </ul>
  </nav>
  <!-- /.navbar -->
  
    <transition name="fade">
            <div v-if="show" id="resultbox" class="card card-primary card-outline searchbox fixed-top float-right d-none d-sm-inline">
              <div class="card-header">
                <h5 class="m-0">Search Result</h5>
              </div>
            </div>
     </transition>       
    
