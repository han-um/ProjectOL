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
  <script>
    $(document).ready(function() {
      $('#btnPay').click(function() {
        var action = $('#frmtoken').attr("action");
            var form_data = {
            			tokennum: $('#tokennum').val(),
            };
            $.ajax({
                      type: "POST",
                      url: action,
                      data: form_data,
                      success: function(response) {
                          if(response==1){
                            swal({
                                type: 'success',
                                title: '결제완료',
                                text: '성공적으로 결제가 완료되었습니다.',
                                footer: '<a></a>',
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

  <!-- Content Wrapper. Contains page content -->
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
        
          <div class="col-sm-6">
            <h1 class="m-0 text-white">TOKEN 결제</h1>
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
            <div class="callout callout-info">
              <h5><i class="fa fa-info"></i> 알림! </h5>
              현재 결제를 통한 토큰 충전은 제한되어있습니다. 이 페이지에서는 테스트를 위해 임의의 값으로 토큰을 충전할 수 있습니다.
            </div>
              <div class="card">
              <div class="card-header">
                <h3 class="card-title">결제 방법 선택</h3>
              </div>
              <div id="selectpay" class="card-body">
                <p>결제를 진행할 방법을 선택해주세요.</p>
                <a v-on:click="CreditCard" class="btn btn-app">
                  <i class="fa fa-credit-card"></i> 신용카드
                </a>
                <a  v-on:click="BitCoin" class="btn btn-app">
                  <i class="fa fa-bitcoin"></i> BitCoin
                </a>
                <a  v-on:click="Cash" class="btn btn-app">
                  <i class="fa fa-money"></i> 무통장입금
                </a>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
              <template v-if="PayType === 'CreditCard'">
                  <div class="card">
                  <div class="card-header">
                    <h3 class="card-title">신용카드</h3>
                  </div>
                  <div class="card-body">
                    <p>결제에 사용할 카드사를 선택해 주세요.</p>
                    <a class="btn btn-app">
                      신한카드
                    </a>
                    <a class="btn btn-app">
                      하나카드
                    </a>
                    <a class="btn btn-app">
                      삼성카드
                    </a>
                    <a class="btn btn-app">
                      현대카드
                    </a>
                    <a class="btn btn-app">
                      비씨카드
                    </a>
                    <a class="btn btn-app">
                      국민카드
                    </a>
                    <a class="btn btn-app">
                      롯데카드
                    </a>
                    <a class="btn btn-app">
                      NH카드
                    </a>
                    <a class="btn btn-app">
                      씨티카드
                    </a>
                  </div>
                  <!-- /.card-body -->
                </div>
              </template>
              <template v-if="PayType === 'BitCoin'">
                  <div class="card">
                  <div class="card-header">
                    <h3 class="card-title">BitCoin</h3>
                  </div>
                  <div class="card-body">
                    <p>아래에 안내되는 비트코인 주소로 충전을 원하는 금액을 입금하여 주십시오.</p>
                      <b>b362d97de852b362d97de852b362d97de852b362d97de852b362d97de852</b>
                  </div>
                  <!-- /.card-body -->
                </div>
              </template>
              <template v-if="PayType === 'Cash'">
                  <div class="card">
                  <div class="card-header">
                    <h3 class="card-title">무통장입금</h3>
                  </div>
                  <div class="card-body">
                    <p>결제에 사용할 은행을 선택해 주세요.</p>
                    <a class="btn btn-app">
                      신한은행
                    </a>
                    <a class="btn btn-app">
                      하나은행
                    </a>
                    <a class="btn btn-app">
                      NH농협
                    </a>
                    <a class="btn btn-app">
                      국민은행
                    </a>
                    <a class="btn btn-app">
                      SC은행
                    </a>
                    <a class="btn btn-app">
                      우리은행
                    </a>
                    <a class="btn btn-app">
                      기업은행
                    </a>
                  </div>
                  <!-- /.card-body -->
                </div>
              </template>
              <template v-else>
                </template> 
                  <div class="card">
                  <div class="card-header">
                    <h3 class="card-title">구매수량</h3>
                  </div>
                  <div class="card-body">
                       <p><i class="fa fa-get-pocket"></i>&nbsp;&nbsp;1토큰 당 10원의 요금이 부과됩니다.</p>
                    <input v-model="inpdata" id="tokennum" class="form-control form-control-lg" type="text" placeholder="구매할 개수">
                  </div>
                  <!-- /.card-body -->
                </div>
              <div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
                    <i class="fa fa-globe"></i> 영수증 : OpenLecture, Inc.
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                  From
                  <address>
                    <strong>OpenLecture, Inc.</strong><br>
                    795 Folsom Ave, Suite 600<br>
                    San Francisco, CA 94107<br>
                    Phone: (804) 123-5432<br>
                    Email: info@almasaeedstudio.com
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  To
                  <address>
                    <strong>John Doe</strong><br>
                    795 Folsom Ave, Suite 600<br>
                    San Francisco, CA 94107<br>
                    Phone: (555) 539-1037<br>
                    Email: john.doe@example.com
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  <b>Invoice #007612</b><br>
                  <br>
                  <b>Order ID:</b> 4F3S8J<br>
                  <b>Payment Due:</b> 2/22/2014<br>
                  <b>Account:</b> 968-34567
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
                <div class="col-12 table-responsive">
                  <table class="table table-striped">
                    <thead>
                    <tr>
                      <th>개수</th>
                      <th>제품</th>
                      <th>시리얼 넘버</th>
                      <th>내용</th>
                      <th>가격</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td>{{inpdata}}</td>
                      <td>Token</td>
                      <td>455-981-221</td>
                      <td>Open Lecture를 이용하기 위한 화폐</td>
                      <td>{{price()}}</td>
                    </tr>
                    </tbody>
                  </table>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <div class="row">
                <!-- accepted payments column -->
                <div class="col-6">
                  
                 
                  <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                    이 금액은 실제로 결제되지 않으며, 단지 시스템의 테스트 용도로만 사용됩니다.
                  </p>
                </div>
                <!-- /.col -->
                <div class="col-6">
                  <p class="lead">Amount</p>

                  <div class="table-responsive">
                    <table class="table">
                      <tr>
                        <th style="width:50%">소계:</th>
                        <td>{{price()}}원</td>
                      </tr>
                      <tr>
                        <th>세금:</th>
                        <td>00.00원</td>
                      </tr>
                      <tr>
                      <tr>
                        <th>총계:</th>
                          <td><h2>{{price()}}원</h2></td>
                      </tr>
                    </table>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- this row will not appear when printing -->
              <div class="row no-print">
               <form class="w-100" id="frmtoken"  action="tokenpayAction.jsp" method="post">
                <div class="w-100"><input type="button" class="btn btn-success w-100" id="btnPay" value="결제하기" > </div>
               </form>
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
