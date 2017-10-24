<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
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

</head>
<body>
<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-redred fixed-top">
		<div class="container">
			<a class="navbar-brand" href="Main">Food Factory</a>
			<!-- width값 992 이하 일 경우 나타나는 메뉴버튼 -->
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
							<a class="dropdown-item" href="Recipe">한식</a>
							<a class="dropdown-item" href="Recipe">일식</a>
							<a class="dropdown-item" href="Recipe">중식</a>
							<a class="dropdown-item" href="Recipe">양식</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Review </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item"
								href="Review">우수 리뷰</a> <a
								class="dropdown-item" href="Review">리뷰</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Board </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<!-- aria-labelledby를 사용하면 어떤 요소의 레이블로서 DOM에 있는 다른 요소의 ID를 지정할 수 있습니다. -->
							<a class="dropdown-item" href="Board">공지사항</a>
							<a class="dropdown-item" href="Board">자유게시판</a>
							<a class="dropdown-item" href="Board">QnA</a>
						</div></li>
					<li><a id="navbarDropdownBlog" class="nav-link"
						href="Modallogin">login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 게시판 -->
	<div class="container">
		<ul id="ul-gray">
			<li><p id="pont-sizea" class="col-xs-6">Create</p></li>
		</ul>
		<!--       <h1 class="mt-4 mb-3">Create Page</h1> -->
		<div class="row">
			<form class="form-horizontal inputform">
				<div class="form-group">
					<label for="inputEmail3" class="col-xs-6 control-label">제목</label>
					<div class="col-xs-6">
						<input type="text" class="form-control inputformne"
							id="inputEmail3" placeholder="글 제목을 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-xs-6 control-label">아이디</label>
					<div class="col-xs-6">
						<input type="text" class="form-control inputformne"
							id="inputEmail3" placeholder="아이디를 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-xs-6 control-label">비밀번호</label>
					<div class="col-xs-6">
						<input type="password" class="form-control inputformne"
							id="inputPassword3" placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-xs-6 control-label">내용</label>
					<div class="col-xs-6">
						<textarea class="form-control col-xs-12" rows="25" cols="100"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-xs-6 control-label">파일첨부</label>
					<div class="col-xs-6">
						<input type="file" id="File" class="form-control">
					</div>
				</div>
				<div class="form-group writbtn3-1">
					<div class="col-xs-3">
						<button type="button" class="btn text-white bg-redred writbtn3"
							onclick="location.href='Review'">목록</button>
						<button type="submit"
							class="btn btn-default text-white bg-redred writbtn3">작성</button>
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
