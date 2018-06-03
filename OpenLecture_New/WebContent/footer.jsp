<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Main Footer -->
  <footer class="main-footer">
  </footer>
</div>
<!-- ./wrapper -->
              <script>
                var app5 = new Vue({
                  el: '#wrap',
                  data: {
                      inpdata:0,
                      PayType:0,
                      show: false
                  },
                  methods: {
                    price: function () {
                      return this.inpdata*10
                    },
                    CreditCard: function () {
                      this.PayType='CreditCard'
                    },
                    BitCoin: function () {
                        this.PayType='BitCoin'
                    },
                    Cash: function () {
                        this.PayType='Cash'
                    }
                  }
                })
              </script>
<%out.println(request.getContextPath());%>