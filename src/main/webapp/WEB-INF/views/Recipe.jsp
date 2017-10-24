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


<link rel="stylesheet" href="/yumyum/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/yumyum/resources/css/color.css">


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
	<!-- Page Content -->
	<div class="container">
		<ul id="ul-gray">
			<li><a id="pont-sizea" href="Recipe">Recipe</a></li>
		</ul>
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">한식</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/yumyum/Main">Main</a></li>
			<li class="breadcrumb-item active">한식</li>
		</ol>

		<div class="row">
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="#KF"><img class="card-img-top"
						src="/yumyum/resources/img/korea2.jpg" data-toggle="modal"
						data-target="#KF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#KF" data-toggle="modal" data-target="#KF">한식</a>
						</h4>
						<p class="card-text">가벼운 음식 소개</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="/yumyum/resources/img/korea2.jpg"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">한식</a>
						</h4>
						<p class="card-text">가벼운 음식 소개</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="/yumyum/resources/img/korea2.jpg"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">한식</a>
						</h4>
						<p class="card-text">가벼운 음식 소개</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="/yumyum/resources/img/korea2.jpg"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">한식</a>
						</h4>
						<p class="card-text">가벼운 음식 소개</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="/yumyum/resources/img/korea2.jpg"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">한식</a>
						</h4>
						<p class="card-text">가벼운 음식 소개</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="/yumyum/resources/img/korea2.jpg"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">한식</a>
						</h4>
						<p class="card-text">가벼운 음식 소개</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Pagination -->
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
					class="sr-only">Previous</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
					class="sr-only">Next</span>
			</a></li>
		</ul>

	</div>
	<!-- Modal -->
	<div class="modal fade" id="KF" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id="modalsize">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">한식</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/korea2.jpg"
								class="img-responsive card-img-top" id="modalimagesize2">
						</p>
					</div>
					<p id="modaltextsize" class="modalradius">설명</p>
					<p class="modalradius">한식</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="py-4 bg-redred">
	<div class="container">
		<p class="m-0 text-center text-white">(주) 구디 &copy; 2017-09-11</p>
	</div>
	<!-- /.container --> </footer>
</body>
</html>