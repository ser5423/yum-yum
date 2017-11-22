<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Yum - Yum</title>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="/yumyum/resources/js/jquery.min.js"></script>
<script src="/yumyum/resources/js/popper.min.js"></script>
<script src="/yumyum/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
   charset="utf-8"></script>


<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="/yumyum/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/yumyum/resources/css/color.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="/yumyum/resources/css/modern-business.css">
<script type="text/javascript">
   $(window).on("load", function() {
      $('#myModal').modal('show');
      
   });
</script>

</head>
<body>
   <div class="container ">
      <div class="row ">
         <img id="modalloginimage" class="card-img-top"
            src="/yumyum/resources/img/modalimage.jpg">

         <div class="modal fade " id="myModal" role="dialog">
            <div class="modal-dialog ">
               <div class="modal-content myModalsize">
                  <div class="modal-header">
                     <h4 class="modal-title">Login</h4>
                     <button type="button" class="close" style="cursor: pointer"
                        onclick="location.href='Main'" data-dismiss="modal">&times;</button>
                  </div>
                  <div class="modal-body">
                     <form>
                        <div class="form-group">
                           <div id="naver_id_login"></div>
                        </div>
                     </form>
                  </div>
                  <div class="modal-footer">
                     <div class="form-group">
                        <button type="button"
                           class="btn btn-default text-white yellowgreen writbtn3"
                           style="cursor: pointer" onclick="location.href='Main'">확인</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <input type="text" id="token">
         <script type="text/javascript">
         // 확인용.
//          var href = "https://nid.naver.com/oauth2.0/authorize?response_type=token&client_id=5pRw5lS7lYqvs0xHnEv4&redirect_uri=http://localhost:9090/yumyum/resources/html/callback.html&state=";
//          var opener = window.open(href, 'naverloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550');   
         
            var domainUrl;
            if('${pageContext.request.serverPort}' == '9090' || '${pageContext.request.serverPort}' == '8080') {
               domainUrl = '${pageContext.request.scheme}' + '://' + '${pageContext.request.serverName}' + ':' + '${pageContext.request.serverPort}' + '${pageContext.request.contextPath}';
            } else {
               domainUrl = '${pageContext.request.scheme}' + '://' + '${pageContext.request.serverName}' + '${pageContext.request.contextPath}';
            }
            
            var naver_id_login = new naver_id_login("5pRw5lS7lYqvs0xHnEv4",
                  domainUrl+"/resources/html/callback.jsp");
            var state = naver_id_login.getUniqState();
            naver_id_login.setButton("green", 3, 40);
            

            
//             alert(domainUrl);
            naver_id_login.setDomain(domainUrl);
            naver_id_login.setState(state);
            naver_id_login.setPopup();
            naver_id_login.init_naver_id_login();
            
         </script>
      </div>
   </div>
</body>
</html>