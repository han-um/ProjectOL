<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/dist/js/adminlte.js"></script>
<script>
$(function(){
  $(window).scroll(function() {
    var scroll = getCurrentScroll();
      if (  document.documentElement.scrollTop >= 100 ) {
           $('.main-header').addClass('shrink');
        }
        else {
            $('.main-header').removeClass('shrink');
        }
  });
function getCurrentScroll() {
    return window.pageYOffset || document.documentElement.scrollTop;
    }
});    
</script>