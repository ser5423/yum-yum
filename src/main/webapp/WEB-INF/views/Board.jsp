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
<title>Food Factory</title>
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
   function getData(){
      var type = '<%=type%>';
		$.ajax({
			url :"Board1_Data",
			data : {
				"type" : type
			},
			datetype : "json"
		}).done(function(result) {
			var data = result.list;
			var board = result.Board;

			$(".container h1").text(board);
			$(".breadcrumb li").eq(1).text(board);
			$(".container .row tbody").empty();

			for (var i = 0; i < data.length; i++) {
				var tag = "";
				tag += '<tr>';
	            tag += '<a href ="/BoardView">';
	            tag += '<td>' + data[i].TITLE + '</td>';
	            tag += '<td>' + data[i].NAME + '</td>';
	            tag += '<td>' + data[i].UPLOAD2 + '</td>';
	            tag += '<td>' + data[i].VIEWCNT + '</td>';
	            tag += '</a>';
	            tag += '</tr>';
				$(".container .row tbody").append(tag);
			}

		 $("tbody tr").on("click", function(){
			 
	            var index = $("tbody tr").index(this);
	            // BoardView.jsp뒷 주소 =>get방식
	            location.href = "BoardView?NO=" + data[index].NO;
	         }); 
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
			<li><a id="pont-sizea" href="Board">Board</a></li>
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
			<% if(session.getAttribute("user") == null) {%> 
				<button id="writebtn" type="button" class="btn btn-default text-white bg-redred writbtn3 hide" onclick="location.href='BoInput?type=${param.type}'">글쓰기</button>
			<% } else { %>
				<button id="writebtn" type="button" class="btn btn-default text-white bg-redred writbtn3" onclick="location.href='BoInput?type=${param.type}'">글쓰기</button>
				<% } %>
			</div>
		</div>

		<!-- Pagination -->
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					<span class="sr-only">Previous</span>
				</a>
			</li>
			
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					<span class="sr-only">Next</span>
				</a>
			</li>
		</ul>
	</div>
	<footer class="py-4 bg-redred">
		<div class="container">
			<p class="m-0 text-center text-white">(주) 구디 &copy; 2017-09-11</p>
		</div>
	</footer>
</body>
</html>
