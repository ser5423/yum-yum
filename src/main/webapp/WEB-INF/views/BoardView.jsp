<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%   
   String NO = request.getParameter("NO");
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
<title>Food Factory</title>
<script src="/yumyum/resources/js/jquery.min.js"></script>
<script src="/yumyum/resources/js/popper.min.js"></script>
<script src="/yumyum/resources/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="/yumyum/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/yumyum/resources/css/color.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="/yumyum/resources/css/modern-business.css">

<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
   charset="utf-8"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
   
<script type="text/javascript">
$(document).ready(function(){
   function getData(){
      var NO = '<%=NO%>';
               $.ajax({
                  url : "BoardView_Data",
                  data : {"NO" : NO},
                  datetype : "json"
               }).done(function(result) {
                  var board = result.boardview;
                  // 값이 안들어왔을 때 예외처리
                  if(board == null){
//                      location.href = "Main";
                     $(".hanyena").html("<h1>데이터가 없습니다.</h1>");
                  }else{
                     $(".hanyena").empty();
                        var tag = "";
                        
                        tag += '<div class="form-group">';
                        tag += '<label for="inputEmail3" id="viewtitle" class="col-xs-6 control-label">제목 : ' + board.TITLE + '</label>';
                        tag += '</div>';
                        tag += '<div class="form-group">';
                        tag += '<label for="inputEmail3" id="viewname" class="col-xs-6 control-label">작성자 : ' + board.NAME + '</label>';
                        tag += '</div>';
                        tag += '<div class="form-group" style="text-align: right;">';
                        tag += '<label for="inputEmail3" class="col-xs-6 control-label">ip : 192.168.***.***</label>';
                        tag += '</div>';
                        tag += '<div class="form-group">';
                        var cont = "없다."
                        if(board.CONT){
                           cont = board.CONT; 
                        }
                        tag += '<label for="inputPassword3" id="viewcont" class="col-xs-6 control-label">내용 : </label>';
                        tag += '<div class="col-xs-6">';
                        tag += '<div id="managertable" class="table">'+ cont +'</div>';
                        tag += '</div>';
                        tag += '</div>';
                        
                        $(".hanyena").append(tag);
               }
            });
         }
         getData();         
      }); 
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
         <form class="form-horizontal inputform">
         <div class="hanyena">
            <div class="form-group">
               <label for="inputEmail3" id="viewtitle" class="col-xs-6 control-label">제목
                  : </label>
            </div>
            <div class="form-group">
               <label for="inputEmail3" id="viewname" class="col-xs-6 control-label">작성자
                  : </label>
            </div>
            <div class="form-group" style="text-align: right;">
               <label for="inputEmail3" class="col-xs-6 control-label">ip
                  : 192.168.***.***</label>
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
                  <button type="button" class="btn text-white bg-redred writbtn3"
                     onclick="location.href='javascript:history.go(-1)'">목록</button>
                  <button type="submit" id="updateform"
                     class="btn btn-default text-white bg-redred writbtn3">수정</button>
                  <button type="button"
                     class="btn btn-default text-white bg-redred writbtn3">삭제</button>
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