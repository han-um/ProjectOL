<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      $('#btnSearch').click(function() {
        var action = $('#frmSearch').attr("action");
            var form_data = {
               searchinput: $('#searchinput').val(),
            };
            $.ajax({
                      type: "POST",
                      url: action,
                      data: form_data,
                      success: function(response) {
                          swal({
                              type: 'error',
                              title: 'Oops...',
                              text: response.trim(),
                              footer: '<a href>Why do I have this issue?</a>',
                            })
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
    <!-- SEARCH FORM -->
       <form id="frmSearch" action="<%=request.getContextPath()%>/searchAction.jsp" method="post" class="d-inline form-inline ml-3 w-75">
      <div class="input-group input-group w-100">
        	<input  id="searchinput" v-on:click="show=!show"  class="form-control form-control-navbar" type="search" placeholder="어떤 것을 배우고 싶으신가요?" aria-label="Search" style="width:70%;float:left">
         	<input type="button" id="btnSearch" class="btn btn-navbar" value="Search" style="font-size:12px; color:white; float:right">
      </div>
    </form>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="fa fa-comments-o"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <h1>Groups</h1>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fa fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="fa fa-clock-o mr-1"></i> 14 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>

          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fa fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="fa fa-clock-o mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>

          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fa fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="fa fa-clock-o mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>

          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="fa fa-bell-o"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <h1>Notifications</h1>
          <span class="dropdown-header">15 New Notifications</span>
          <a href="#" class="dropdown-item">
            <i class="fa fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <a href="#" class="dropdown-item">
            <i class="fa fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <a href="#" class="dropdown-item">
            <i class="fa fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"><i
            class="fa fa-th-large"></i></a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->
  
    <transition name="fade">
            <div v-if="show" class="card card-primary card-outline searchbox fixed-top">
              <div class="card-header">
                <h5 class="m-0">Search Result</h5>
              </div>
              <div class="card-body">
                <h6 class="card-title">Special title treatment</h6>

                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                <a href="tokenpay.jsp" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
     </transition>       
    
