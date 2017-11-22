<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
   charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
var id = request.getParameter("token");
</script>
</head>
<body>
   <script type="text/javascript">
      var naver_id_login = new naver_id_login("5pRw5lS7lYqvs0xHnEv4","${pageContext.request.contextPath}/resources/html/callback.jsp");
      var result = "";
      // 접근 토큰 값 출력
//       alert(naver_id_login.oauthParams.access_token);
//       console.log(naver_id_login.oauthParams.access_token);
      // 네이버 사용자 프로필 조회
      naver_id_login.get_naver_userprofile("naverSignInCallback()");
      // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
      function naverSignInCallback() {
//          alert(naver_id_login.getProfileData('email'));
//          alert(naver_id_login.getProfileData('nickname'));
//          alert(naver_id_login.getProfileData('age'));
//          alert(naver_id_login.getProfileData('name'));
         var data = {
               "access_token": naver_id_login.oauthParams.access_token,
               "EMAIL": naver_id_login.getProfileData('email'),
               "NICKNAME": naver_id_login.getProfileData('nickname'),
               "AGE": naver_id_login.getProfileData('age'),
               "NAME": naver_id_login.getProfileData('name')
         };
//          console.log(data);
         $.ajax({type:"post", url:"${pageContext.request.contextPath}/TokenCheck",data:data, datatype : "json"}).done(function(result){
            console.log(result);
            if(result.state == 1){
               alert("회원 가입을 축하드립니다.");
            }else{
               alert("로그인이 정상 처리 되었습니다.");
            }
            
            window.close();
         });
      }
   </script>
</body>
</html>