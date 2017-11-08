<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String type = request.getParameter("type");

	if(type == null){
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


<link rel="stylesheet" href="/yumyum/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/yumyum/resources/css/color.css">


<link rel="stylesheet" href="/yumyum/resources/css/modern-business.css">
<script type="text/javascript">
$(document).ready(function(){
   var type='<%=type%>';

   var data1 = []; // 데이터 담을 배열 변수 선언
   var page = 1; // 현재 페이지 값
   var viewRow = 6; // 화면에 보여질 행 갯수
   var totCnt = 0;
   
    function createHtml(){ // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
        $(".container .row").empty();
        for(var i = 0; i < data1.length; i++){
        	var modal = "";
            modal += '<div class="modal fade" id="' + data1[i].NO + '" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">';
            modal += '<div class="modal-dialog">';
            modal += '<div class="modal-content" id="modalsize">';
            modal += '<div class="modal-header">';
            modal += '<h4 class="modal-title" id="myModalLabel">'  + data1[i].NAME +  '</h4>';
            modal += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
            modal += '</div>';
            modal += '<div class="modal-body">';
            modal += '<div id="modalimagesize">';
            modal += '<p>';
            if(data1[i].IMAGE != ""){
         	   modal += '<img src="/yumyum/resources/img/' + type + '/'  + data1[i].IMAGE + '" class="img-responsive card-img-top" id="modalimagesize2">';
            }else {
         	   modal += '<a href="#"><img class="card-img-top" src="/yumyum/resources/img/manager.jpg"></a>';
            }
            modal += '</p>';
            modal += '</div>';
            modal += '<p id="modaltextsize" class="modalradius">'   + data1[i].INGREDIENT +  '<br><button type="button" id="navershop" class="btn btn-default text-white yellowgreen writbtn3"style="cursor: pointer">네이버 쇼핑</button></p>';
            modal += '<p class="modalradius">'   + data1[i].RECIPE +  '</p>';
            modal += '</div>';
            modal += '</div>';
            modal += '</div>';
            modal += '</div>';
            $(".mmmodalRecipe").prepend(modal);
        	console.log(data1[i].NO);
        	
           var tag = "";
           tag += '<div class="col-lg-6 portfolio-item">';
           tag += '<div class="card h-100">';
           if(data1[i].IMAGE != ""){
              tag += '<a href="#' + data1[i].NO + '"><img class="card-img-top" src="/yumyum/resources/img/' + type + '/' + data1[i].IMAGE + '" data-toggle="modal" data-target=#' + data1[i].NO + '></a>';
           }else {
              tag += '<a href="#' + data1[i].NO + '"><img class="card-img-top" src="/yumyum/resources/img/manager.jpg"></a>';
           }
           tag += '<div class="card-body">';
           tag += '<h4 class="card-title">';
           tag += '<a href="#"data-toggle="modal" data-target=#' + data1[i].NO + '>'+data1[i].NAME+'</a>';
           tag += '</h4>';
           tag += '<p class="card-text">'+data1[i].INTRO+'</p>';
           tag += '</div>';
           tag += '</div>';
           tag += '</div>';
           $(".container .row").prepend(tag);
           
           
           $("#navershop").on("click", function(){
        	   var windowWidth = $( window ).width();
        	   if(windowWidth < 992) {
        	   //창 가로 크기가 992 미만일 경우
        	   location.href="http://shopping2.naver.com/home/m/index.nhn";	   
        	   } else {
        	   //창 가로 크기가 992보다 클 경우
        		location.href="http://pc.shopping2.naver.com/home/p/index.nhn";
        	   }
           });
      }
   } 
   function getData(){
      var paging = totCnt / viewRow;
      $("#ul").empty(); // ul 태그의 자식들를 초기화가 필요하다.
      for(var i = 0; i < paging; i++){
         $("#ul").append("<li class='page-item'>"+"<a class='page-link' href='#'"+ (i + 1) + ">" + (i + 1) + "</a></li>");
      }   
   
      
      $("#ul a").eq(page - 1); 
      // page의 변수를 이용하여 a 태그의 인덱스 값을 구하여 bg 클래스를 적용한다.
      
      $("#ul a").off().on("click", function(){ // 페이지 전환 이벤트를 작성 한다.
         // a 태그 중에 몇번째 페이지인지 알면 리스트 화면를 다시 보여 줄 수 있다. page 변수 활용 할것!
         page = $(this).text();
         setTimeout(function(){
            initData(); // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
         }, 100); // 0.1초 후에 실행 하기 위하여 setTimeout() 함수를 실행한다.
      });
      

      } 
   function initData(){ // 디비에서 데이터 가져오기 위한 함수
      
      var hash = location.hash; // a 태그의 이벤트로 발생한 hash 값을 가져온다.
      if(hash != ""){ // hash 값이 있을 경우 page 변수의 값으로 사용한다.
         page = hash.substr(1, hash.length);
      }
      
      var end = (viewRow * page); // 10 * 2 = 20 
      var start = (end - viewRow); // 20 - 10 = 10
      $.ajax({
         url :"RE_Data",
         data : {
            "type" : type ,"start":start, "viewRow":viewRow
         }, datetype : "json" // 파라메터로 사용할 변수 값 객체 넣기
      }).done(function(d){ // 비동기식 데이터 가져오기
         data1 = d.list;
         totCnt = d.ToT.tot;
         createHtml(); // 화면에 표현하기 위하여 함수 호출 
         getData(); // 페이지 링크 표현하기 우하여 함수 호출
           var food = d.food;

           $(".container h1").text(food);
             $(".breadcrumb li").eq(1).text(food);
      });
   }
   initData();
   
   
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
					<% if(session.getAttribute("user") == null && session.getAttribute("manager") == null) {%> 
            		<li><a id="navbarDropdownBlog" class="nav-link" href="Modallogin">login</a></li>
         		<% } else { %>
         			<li><a id="navbarDropdownBlog" class="nav-link hide" href="Modallogin">login</a></li>
            	<% } %>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Content -->
	<div class="container">
		<ul id="ul-gray">
			<li><a id="pont-sizea" href="Recipe">Recipe</a></li>
		</ul>
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3"></h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/yumyum/Main">Main</a></li>
			<li class="breadcrumb-item active"></li>
		</ol>
		<ul class="ulstyle">
			<li class="listyle"><a class="libtn" href="${pageContext.request.contextPath }/Recipe?type=KF">한식</a></li>
			<li class="listyle"><a class="libtn" href="${pageContext.request.contextPath }/Recipe?type=JF">일식</a></li>
			<li class="listyle"><a class="libtn" href="${pageContext.request.contextPath }/Recipe?type=CF">중식</a></li>
			<li class="listyle"><a class="libtn" href="${pageContext.request.contextPath }/Recipe?type=EF">양식</a></li>
		</ul>

		<div class="row">
			
		</div>
		<!-- /.row -->

		<!-- Pagination -->
		<ul id="ul" class="pagination justify-content-center">
			
		
			
			
		</ul>

	</div>
	<div class="mmmodalRecipe">
	
	</div>
 	<!-- Modal -->
<!-- 	<div class="modal fade" id="RecipeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content" id="modalsize"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<h4 class="modal-title" id="myModalLabel">요리제목</h4> -->
<!-- 					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->
<!-- 					<div id="modalimagesize"> -->
<!-- 						<p> -->
<!-- 							<img src="/yumyum/resources/img/korea2.jpg" class="img-responsive card-img-top" id="modalimagesize2"> -->
<!-- 						</p> -->
<!-- 					</div> -->
<!-- 					<p id="modaltextsize" class="modalradius">재료</p> -->
<!-- 					<p id="modalsogae" class="modalradius">설명</p> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

	<!-- Footer -->
	<footer class="py-4 bg-redred">
	<div class="container">
		<p class="m-0 text-center text-white">(주) 구디 &copy; 2017-09-11</p>
	</div>
	<!-- /.container --> </footer>
</body>
</html>