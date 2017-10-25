<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-redred fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/yumyum/Main">Food Factory</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				style="cursor: pointer" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Recipe </a>
						<div id="recipeset" class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="re1.html">한식</a> <a
								class="dropdown-item" href="re1.html">일식</a> <a
								class="dropdown-item" href="re1.html">중식</a> <a
								class="dropdown-item" href="re1.html">양식</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Review </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="Review.html">우수 리뷰</a> <a
								class="dropdown-item" href="Review.html">리뷰</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Board </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="Board.html">공지사항</a> <a
								class="dropdown-item" href="Board.html">자유게시판</a> <a
								class="dropdown-item" href="Board.html">QnA</a>
						</div></li>
					<li data-toggle="modal" data-target="#loginPop"><a
						id="navbarDropdownBlog" class="nav-link" href="#">login</a></li>
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
				<div class="form-group">
					<label for="inputEmail3" class="col-xs-6 control-label">글 번호 : </label>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-xs-6 control-label">제목 : </label>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-xs-6 control-label">작성자  : </label>
				</div>
				<div class="form-group" style="text-align : right;">
					<label for="inputEmail3" class="col-xs-6 control-label">ip : 192.168.***.***</label>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-xs-6 control-label">내용 : </label>
					<div class="col-xs-6">
						<div id="managertable" class="table"></div>
					</div>
				</div>
				<div class="form-group writbtn3-1">
					<div class="col-xs-3">
						<button type="button" class="btn text-white bg-redred writbtn3"
							onclick="location.href='Review'">목록</button>
						<button type="submit"
							class="btn btn-default text-white bg-redred writbtn3">수정</button>
							<button type="button"
							class="btn btn-default text-white bg-redred writbtn3">삭제</button>
					</div>
				</div>
			</form>
			
<!-- 			<div class="writbtn2"> -->
<!-- 				<button id="writebtn" type="button" -->
<!-- 					class="btn btn-default text-white bg-redred writbtn3" -->
<!-- 					onclick="location.href='/yumyum/resources/html/BoInput.html'">글쓰기</button> -->
<!-- 			</div> -->
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
