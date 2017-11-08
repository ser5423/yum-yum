<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String NO = request.getParameter("NO");
   String EMAIL = (String) request.getAttribute("EMAIL"); 
   String EMAILmanager = (String) request.getAttribute("EMAILmanager"); 
   if (NO == null) {
      response.sendRedirect("Main");
   }
   
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Yum - Yum</title>
<script src="/yumyum/resources/js/jquery.min.js"></script>
<script src="/yumyum/resources/js/popper.min.js"></script>
<script src="/yumyum/resources/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="/yumyum/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/yumyum/resources/css/color.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="/yumyum/resources/css/modern-business.css">

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
var EMAIL='<%=EMAIL%>';

$(document).ready(function(){
   function getData(){
      
      //2017-10-31 
      <%-- 자바 NO를  스프링 EL로 표시함 ${param.NO}--%>
       var NO = '${param.NO}';
      $.ajax({
         url : "BoardView_Data",
         data : {"NO" : NO},
         datetype : "json",
      }).done(function(result) {
         var board = result.boardview;
         // 값이 안들어왔을 때 예외처리
         if(board == null){
               location.href = "Main";
            $(".hanyena").html("<h1>데이터가 없습니다.</h1>");
         }else{
             $(".hanyena").empty(); 
               var tag = "";
               //2017-10-31 조건비교 자동으로 파라미터 NO를 넣어주어 업데이트시 게시글을 where 하기 위한 용도 , display
               tag += '<input type="hidden" id="NO" name="NO" value="${param.NO}">'
               //2017-10-31 수정화면 구분하기 위해 display 0:게시글 화면 1:수정화면 (jquery 이벤트에서만 사용함 파라미터 의미 X)
               tag += '<input type="hidden" id="display" name="display" value="0">'
               //2017-10-31 무슨게시판인지 구분해주는 파라미터 (필수) ajax 결과값중 return 값으로 url이 있기 떄문에 필요함
               tag += '<input type="hidden" id="type" name="type" value="${param.type}">';
               
               tag += '<div class="form-group">';
               tag += '<label for="viewtitle" id="viewtitle" class="col-xs-6 control-label" >제목 : ' + board.TITLE + '</label>';
               //2017-10-31 TITLE 추가함.
               tag += '<input type="text" class="form-control inputformne" id="TITLE" name="TITLE" placeholder="글 제목을 입력하세요" style="display:none;" value="'+board.TITLE+'">'
               tag += '</div>';
               tag += '<div class="form-group">';
               if(board.NAME != ("")){
                   tag += '<label for="viewname" id="viewname" class="col-xs-6 control-label">작성자 : ' + board.NAME + '</label>';
                   } else {
                   	tag += '<label for="viewname" id="viewname" class="col-xs-6 control-label">작성자 : admin</label>';
                   }
               //2017-10-31 NAME 추가함.
               tag += '<input type="text" class="form-control inputformne" id="NAME" name="NAME" placeholder="이름을 입력하세요" style="display:none" value="'+board.NAME+'">'
               tag += '</div>';
               tag += '<div class="form-group">';
               var cont = "없다."
               if(board.CONT){
                  cont = board.CONT; 
               }
               tag += '<label for="viewcont" id="viewcont" class="col-xs-6 control-label">내용 : </label>';
               tag += '<div class="col-xs-6">';
               //2017-10-31 textarea 추가함.
               tag   += '<textarea id="CONT" name="CONT" class="form-control col-xs-12" rows="25" cols="100" style="display:none">'+cont+'</textarea>'
               tag += '<div id="managertable" class="table">'+ cont +'</div>';
               tag += '</div>';
               tag += '</div>';
               $(".hanyena").append(tag);
               
               var el = '<%=EMAILmanager%>';
               if(EMAIL == board.NAME || el != '') {
                  
               }else{
               
               
               $('#update').hide();
                $('#cancel').hide();
                   $('#delete').hide();
                  
            }
            
            }
 
         })
      }
   getData();
  
  
   //update부분
   $('#update').click(function(){
      // 2017-10-31 0이면 NONE 1이면 DISPLAY
   var display = $('#display').val()=="0"?"none":"block";
   
   var type = $('#update').val();
   
   if(type == "submit") {
      var form = $('#updateform').serialize();
      $.ajax({
         url : "BoUpdate_Data",
         data : form,
         type : "POST",
         datetype : "json",
         success : function(data) { // 성공 시    메세지 및 이동할주소
               alert(data.msg);
               location.href= data.move;
             },error : function(req,msg) {
                alert(data.data);
               location.href= data.move;
             }
      });
   }
   if(display =="none") {
      //2017-10-31 수정화면일때 TITLE,NAME,CONT를 보여줌
      //인풋
      $('#TITLE').css("display","block");
      $('#NAME').css("display","block");
      $('#CONT').css("display","block");

      //2017-10-31 수정화면일때 기존 게시글 보여주는 제목,이름, 내용을 가림
      //데이터보여주는거 라벨? div?
      $('#viewtitle').css("display","none");
      $('#viewname').css("display","none");
      $('#managertable').css("display","none");

      //2017-10-31 게시글을 수정하는 화면으로 변경된 경우 display 인풋 type:hidden value로 1을 지정
      $('#display').val(1);
      //2017-10-31 수정화면일때 update 버튼에 type 변경 오류를 방지하기위해 value:submit 지정
      $('#update').val("submit");
      //2017-10-31 수정화면일때 취소 버튼 생성 block로 하면 css 꺠지기 때문에 빈값으로 처리
      $('#cancel').css("display","");
      $('#delete').css("display","none");


   } else if(display == "block") {
      //2017-10-31 원상복구일때 TITLE,NAME,CONT를 가림
      $('#TITLE').css("display","none");
      $('#NAME').css("display","none");
      $('#CONT').css("display","none");


      //2017-10-31 원상복구일때 기존 게시글 보여주는 제목,이름, 내용을 보여줌
      $('#viewtitle').css("display","block");
      $('#viewname').css("display","block");
      $('#managertable').css("display","block");

      //2017-10-31 원상복구일때 display 인풋 type:hidden value로 0을 지정
      $('#display').val(0);
      
      //2017-10-31 원상복구일때 update 버튼을 submit하는 것을 방지하기위해 value:button 지정
      $('#update').val("button");

   } else {
      // 걍쓴것
      $('#display').val(2);
      alert('오류발생');
   }
})

   //2017-10-31 취소버튼 이벤트 실행할 경우 게시글 원상복구
   $('#cancel').click(function() {
   //2017-10-31 0이면 NONE 1이면 DISPLAY
      $('#display').val(0);
      $('#update').val("button");
      $('#delete').css("display","inline-block");
      $('#cancel').css("display","none");
      $('#TITLE').css("display","none");
      $('#NAME').css("display","none");
      $('#CONT').css("display","none");
      $('#viewtitle').css("display","block");
      $('#viewname').css("display","block");
      $('#managertable').css("display","block");
   })
   
   
   //delete부분
   $('#delete').click(function(){
   
     var type = $('#delete').val();
      var form = $('#updateform').serialize();
      $.ajax({
         url : "BoDelete_Data",
         data : form,
         type : "POST",
         datetype : "json",
         success : function(data) { // 성공 시    메세지 및 이동할주소
               alert(data.msg);
               location.href= data.move;
             },error : function(req,msg) {
                alert(data.data);
               location.href= data.move;
             }
      });

   })
   
})
   

   
      
</script>

</head>
<body>
   <!-- 상단 제목 및 각 버튼 있는 fixed 부분 -->
   <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-redred fixed-top">
      <div class="container">
         <a class="navbar-brand" href="Main">Yum - Yum</a>
         <!-- width값 992 이하 일 경우 나타나는 메뉴버튼 -->
         <button class="navbar-toggler navbar-toggler-right" type="button" style="cursor: pointer" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false"> Recipe </a>
                  <div id="recipeset" class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Recipe?type=KF">한식</a>
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Recipe?type=JF">일식</a>
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Recipe?type=CF">중식</a>
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Recipe?type=EF">양식</a>
                  </div>
               </li>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Review </a>
                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                     <a class="dropdown-item" href="/yumyum/BestReview">우수 리뷰</a>
                     <a class="dropdown-item" href="/yumyum/Review">리뷰</a>
                  </div>
               </li>
               <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Board </a>
                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                     <!-- aria-labelledby를 사용하면 어떤 요소의 레이블로서 DOM에 있는 다른 요소의 ID를 지정할 수 있습니다. -->
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Board?type=no">공지사항</a>
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Board?type=fr">자유게시판</a>
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Board?type=qa">QnA</a>
                  </div>
               </li>
               <li><a id="navbarDropdownBlog" class="nav-link" href="Modallogin">login</a></li>
            </ul>
         </div>
      </div>
   </nav>
   <!-- nav 끝 -->
   <div class="container">
      <ul id="ul-gray">
         <li><p id="pont-sizea" class="col-xs-6">View</p></li>
      </ul>
      <!-- 게시판 메인 부분 -->
      <div class="row">
         <form class="form-horizontal inputform" id="updateform" name="updateform" action="BoUpdate_Data" method="post">
         <div class="hanyena">
            <div class="form-group">
               <label for="inputEmail3" id="viewtitle" class="col-xs-6 control-label">제목
                  : </label>
            </div>
            <div class="form-group">
               <label for="inputEmail3" id="viewname" class="col-xs-6 control-label">작성자
                  : </label>
            </div>
            <div class="form-group">
               <label for="inputPassword3" id="viewcont" class="col-xs-6 control-label">내용
                  : </label>
               <div class="col-xs-6">
                  <div id="managertable" class="table"></div>
               </div>
               
            </div>
         </div>
      
         <div class="form-group writbtn3-1">
            <div class="col-xs-3">
               <button type="button" class="btn text-white bg-redred writbtn3" onclick="location.href='javascript:history.go(-1)'">목록</button>
               <button type="button" id="update" class="btn btn-default text-white bg-redred writbtn3" value="button">수정</button>  
               <button type="button" id="cancel" class="btn btn-default text-white bg-redred writbtn3" style="display:none">취소</button>
               <button type="submit" id="delete" class="btn btn-default text-white bg-redred writbtn3">삭제</button>
            </div>
         </div>
      </form>
      </div>
   </div>

   <!-- Footer -->
   <footer class="py-4 bg-redred">
      <div class="container">
         <p class="m-0 text-center text-white">(주) 구디 &copy; 2017-09-11</p>
      </div>
   </footer>
</body>
</html>