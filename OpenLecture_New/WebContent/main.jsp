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
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5b16d7138859f57bdc7bdee0/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();

var Tawk_API=Tawk_API||{};
Tawk_API.visitor = {
name : '회원0',
email : 'visitor@email.com'
};

var Tawk_LoadStart=new Date();
<!-- rest of the tawk.to widget code -->
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
            <h1 class="m-0 text-white">TODAY</h1>
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
                            
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h5 class="m-0">Featured</h5>
              </div>
              <div class="card-body">
                <h6 class="card-title">토큰이 부족하신가요?</h6>

                <p class="card-text">아래 버튼을 눌러 토큰을 충전하세요!</p>
                <a href="<%=request.getContextPath()%>/tokenpay.jsp" class="btn btn-primary">토큰 충전하기</a>
              </div>
            </div>
            
                          
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h5 class="m-0">Featured</h5>
              </div>
              <div class="card-body">
                <h6 class="card-title">아무 강의나 찾아볼까요?</h6>

                <p class="card-text">버튼을 눌러주세요. 임의의 강의를 찾아드립니다.</p>
                <a href="<%=request.getContextPath()%>/random.jsp" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
            
              <!-- 이미지 슬라이드형 카드박스 -->     
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">강의 미리보기</h3>
              </div>
              <div class="card-body">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <img class="d-block w-100" src="<%=request.getContextPath()%>/upload/1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                      <img class="d-block w-100" src="<%=request.getContextPath()%>/upload/2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                      <img class="d-block w-100" src="<%=request.getContextPath()%>/upload/3.jpg" alt="Third slide">
                    </div>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
              </div>
            </div>
              
              <!-- 단순 정보형 카드박스 -->    


          </div>
          <!-- /.col-md-6 -->
          <div class="col-lg-6">
              <!-- 이곳에 두번째 줄의 컨텐츠가 들어감 -->
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
