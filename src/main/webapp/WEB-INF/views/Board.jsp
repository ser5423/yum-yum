<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%
   String type = request.getParameter("type");
   if (type == null) {
      response.sendRedirect("Main");
   }
%> 


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
$(document).ready(function(){
   var type='<%=type%>';
//    var url = $(location).attr('search');


   var data1 = []; // 데이터 담을 배열 변수 선언
   var page = 1; // 현재 페이지 값
   var viewRow = 10; // 화면에 보여질 행 갯수
   var totCnt = 0;
   
    function createHtml(){ // ul(부모) 태그 속에 li(자식) 태그 넣기 위한 함수
       $(".container .row tbody").empty(); // div 태그 속에 a 태그를 초기화 한다.
      for (var i = 0; i < data1.length; i++) {
         var tag = "";
         tag += '<tr>';
            tag += '<a href ="/BoardView">';
            tag += '<td>' + data1[i].TITLE + '</td>';
            if(data1[i].NAME != ("")){
            	tag += '<td>' + data1[i].NAME + '</td>';
            } else {
            	tag += '<td>admin</td>'; 
            }
            tag += '<td>' + data1[i].UPLOAD2 + '</td>';
            tag += '<td>' + data1[i].VIEWCNT + '</td>';
            tag += '</a>';
            tag += '</tr>';
         $(".container .row tbody").append(tag);
      }
 
   } 
    $("form").on("submit", function(event) { // 예나는 돼?
        event.preventDefault();
        if ($("#KeyWord").val() == "") {
           var text = "";
           if ($("#keyField").val() == "TITLE") {
              text = "제목";
           } else if ($("#keyField").val() == "WRITER") {
              text = "이름";
           }
           alert(text + "에 대한 검색어를 입력하세요.");
           $("#KeyWord").focus();
           return;
        }
        initData();
     });

     $("#keyField").change(function() {
        if ($(this).val() == "ALL") {
           $("#KeyWord").attr("disabled", true);
           $("#check").attr("disabled", true);
           $("#KeyWord").val("");
           initData();
        } else {
           $("#KeyWord").attr("disabled", false);
           $("#check").attr("disabled", false);
        }
     });

   function getData(){
      var paging = totCnt / viewRow;
      $("#ul").empty(); // ul 태그의 자식들를 초기화가 필요하다.
      for(var i = 0; i < paging; i++){
         $("#ul").append("<li class='page-item'>"+"<a class='page-link' href='#"+ (i + 1) + "'>" + (i + 1) + "</a></li>");
      }   
   
      
      $(".page-item a").eq(page - 1); 
      // page의 변수를 이용하여 a 태그의 인덱스 값을 구하여 bg 클래스를 적용한다.
      
      $(".page-item a").off().on("click", function(){ // 페이지 전환 이벤트를 작성 한다.
         // a 태그 중에 몇번째 페이지인지 알면 리스트 화면를 다시 보여 줄 수 있다. page 변수 활용 할것!
         page = $(this).text();
         setTimeout(function(){
            initData(); // 디비에서 데이터 다시 가져 오기 위하여 함수 호출
         }, 100); // 0.1초 후에 실행 하기 위하여 setTimeout() 함수를 실행한다.
      });
      
      
       $("tbody tr").on("click", function(){
          
               var index = $("tbody tr").index(this);
            
               location.href = "BoardView?type=${param.type}"+"&NO="+ data1[index].NO;
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
         url :"Board1_Data",
         // 이미 받은거를 버리고 새로, 기본설정은 true!
         cache : false,
         data : {
            "type" : type ,"start":start, "viewRow":viewRow,
            "keyField" : $("#keyField").val(),
            "KeyWord" : $("#KeyWord").val()
         }, datetype : "json" // 파라메터로 사용할 변수 값 객체 넣기
      }).done(function(result){ // 비동기식 데이터 가져오기
    	  d = JSON.parse(result);
          data1 = d.list;
          totCnt = d.ToT.tot;
          createHtml(); // 화면에 표현하기 위하여 함수 호출 
          getData(); // 페이지 링크 표현하기 우하여 함수 호출
          var board = d.Board;

          $(".container h1").text(board);
          $(".breadcrumb li").eq(1).text(board);
      })
      .fail(function(d){
    	  alert("fail");
      });
   }
   initData();
   
//    console.log(url);
//    if(url == "?type=qa"){
// 	      location.href="${pageContext.request.contextPath }/Board?type=qa";
// 	      continue;
// 	   }else if(url == "?type=no") {
// 	      location.href="${pageContext.request.contextPath }/Board?type=no"; 
// 	      continue;
// 	   }else if(url == "?type=fr"){
// 	      location.href="${pageContext.request.contextPath }/Board?type=fr";  
// 	      continue;
// 	   } else {
// 	      location.href="${pageContext.request.contextPath }/Main";   
// 	   }
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
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Recipe?type=KF#">한식</a>
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Recipe?type=JF#">일식</a>
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Recipe?type=CF#">중식</a>
                     <a class="dropdown-item" href="${pageContext.request.contextPath }/Recipe?type=EF#">양식</a>
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
   <!-- nav 끝 -->
   <div class="container">
      <ul id="ul-gray">
         <li><p id="pont-sizea" class="col-xs-6">Board</p></li>
      </ul>
      <h1 class="mt-4 mb-3"></h1>
      <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="/yumyum/Main">Main</a></li>
         <li class="breadcrumb-item active"></li>
      </ol>
      <ul class="ulstyle">
         <li class="listyle"><a class="libtn" href="${pageContext.request.contextPath }/Board?type=no">공지사항</a></li>
         <li class="listyle"><a class="libtn" href="${pageContext.request.contextPath }/Board?type=fr">자유게시판</a></li>
         <li class="listyle"><a class="libtn" href="${pageContext.request.contextPath }/Board?type=qa">QnA</a></li>
      </ul>
      <form>
               <div class="card my-4 ">
                  <h5 class="card-header bg-redred text-white">Search</h5>
                  <div class="card-body ">
                     <div class="input-group ">
                        <select id="keyField" name="keyField"
                           class="box form-control inputformne">
                           <option value="ALL">전체</option>
                           <option value="WRITER">이름</option>
                           <option value="TITLE">제목</option>
                        </select>
                        <!--                             <option value="">내용</option> -->
                        <span class="input-group-btn input-group2"> <!--                         <button class="btn btn-default text-white bg-redred writbtn3" type="submit">Go!</button> -->
                           <input type="text" size="16" name="KeyWord" id="KeyWord"
                           value="${keyWord}" class="form-control"
                           placeholder="Search for..."> <input
                           class="btn btn-default text-white bg-redred writbtn3"
                           type="submit" value="검색"> <input type="hidden"
                           name="page" value="0">
                        </span>
                     </div>
                  </div>
               </div>
            </form>
      <!-- 게시판 메인 부분 -->
      <div class="row">
         <table class="table table-hover ">
            <thead>
               <tr>
                  <th>Title</th>
                  <th>Writer</th>
                  <th>Date</th>
                  <th>View</th>
               </tr>
            </thead>
            <tbody>

            </tbody>
         </table>
                 <div class="writbtn2">
<!--           일반로그인 세션이 없거나 매니저 세션 없을 때 글쓰기 버튼 보이지 않게 -->
         <% if(session.getAttribute("user") == null && session.getAttribute("manager") == null) {%> 
            <button id="writebtn" type="button" class="btn btn-default text-white bg-redred writbtn3 hide" onclick="location.href='BoInput?type=${param.type}'">글쓰기</button>
<!--           일반로그인 세션이 있지만 매니저 세션 없을 때 type=no일 때 글쓰기 버튼 보이지 않게 -->         
         <% } else if((session.getAttribute("manager") == null && session.getAttribute("user") != null) && ("no").equals(type) ){%> 
            <button id="writebtn" type="button" class="btn btn-default text-white bg-redred writbtn3 hide" onclick="location.href='Board?type=${param.type}'">글쓰기</button>
<!--           일반로그인 세션이 있거나 매니저 세션 있을 때 글쓰기 버튼 보이지 않게 -->         
         <% } else {%>
            <button id="writebtn" type="button" class="btn btn-default text-white bg-redred writbtn3" onclick="location.href='BoInput?type=${param.type}'">글쓰기</button>
         <% } %>
         </div>
      </div>

      <!-- Pagination -->
      <ul id="ul" class="pagination justify-content-center">
         
    
        
      </ul>
   </div>
   <footer class="py-4 bg-redred">
      <div class="container">
         <p class="m-0 text-center text-white">(주) 구디 &copy; 2017-09-11</p>
      </div>
   </footer>
</body>
</html>