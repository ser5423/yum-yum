<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Yum - Yum</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="/yumyum/resources/js/jquery.min.js"></script>
<script src="/yumyum/resources/js/popper.min.js"></script>
<script src="/yumyum/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="/yumyum/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/yumyum/resources/css/color.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="/yumyum/resources/css/modern-business.css">
<script type="text/javascript">
   $(window).on("load", function() {
      $('#managerlogin').modal({backdrop: 'static', keyboard: false});
      $('#managerlogin').modal('show');
      
      $("form").on("submit", function(event) {
         var ID = $("#ID").val();
         var PW = $("#PW").val();
         if (ID == "") {
            alert("아이디를 입력하세요.");
            $("#ID").focus(); // 입력포커스 이동
            return; // 함수 종료
         }
         if (PW == "") {
            alert("비밀 번호를 입력하세요.");
            $("#PW").focus();
            return;
         }
         document.form1.action = "${path}/yumyum/Managerlogin1"

         document.form1.submit();
      });

   });
</script>

</head>
<body>
   <div class="container ">
      <div class="row ">
         <img id="modalloginimage" class="card-img-top" src="/yumyum/resources/img/modalimage.jpg">
         <!-- Modal -->
         <div class="modal fade" id="managerlogin" role="dialog">
            <div class="modal-dialog">
               <div class="modal-content managerlogin">
                  <div class="modal-header">
                     <h4 class="modal-title">Manager Login</h4>
                     <button type="button" class="close" style="cursor: pointer" onclick="location.href='/yumyum/Main'" data-dismiss="modal">&times;</button>
                  </div>
                  <div class="modal-body">
                     <form name="form1" id="managermodallogin" class="form-horizontal inputform" method="post">
                        <div class="form-group">
                           <label class="col-xs-6 control-label">ID</label>
                           <div class="col-xs-6">
                              <input type="text" class="form-control inputformne2" id="ID" name="ID" placeholder="아이디를 입력하세요">
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-xs-6 control-label">Password</label>
                           <div class="col-xs-6">
                              <input type="password" class="form-control inputformne2" id="PW" name="PW" placeholder="비밀번호를 입력하세요">
                           </div>
                        </div>
                        <div class="form-group writbtn3-1">
                           <div class="col-xs-3">
                              <button type="submit"
                                 class="btn btn-default text-white bg-redred writbtn3">Login</button>
                              <button type="button" class="btn btn-default text-white bg-redred writbtn3" style="cursor: pointer" onclick="location.href='/yumyum/Main'">Main</button>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>