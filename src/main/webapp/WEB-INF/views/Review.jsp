<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
			<a class="navbar-brand" href="Main">Yum - Yum</a>
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
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/Recipe?type=KF">한식</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/Recipe?type=JF">일식</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/Recipe?type=CF">중식</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/Recipe?type=EF">양식</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Review </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="Review">우수 리뷰</a> <a
								class="dropdown-item" href="Review">리뷰</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Board </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<!-- aria-labelledby를 사용하면 어떤 요소의 레이블로서 DOM에 있는 다른 요소의 ID를 지정할 수 있습니다. -->
							<a class="dropdown-item" href="Board">공지사항</a> <a
								class="dropdown-item" href="Board">자유게시판</a> <a
								class="dropdown-item" href="Board">QnA</a>
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
			<li><a id="pont-sizea" href="Review">Review</a></li>
		</ul>
		<h1 class="mt-4 mb-3">우수리뷰</h1>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/yumyum/Main">Main</a></li>
			<li class="breadcrumb-item active">우수리뷰</li>
		</ol>
		<div class="row">
			<div class="col-md-8">
				<div class="col-md-4-2 col-sm-6-2  portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="/yumyum/resources/img/manager.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">우수리뷰</a>
							</h4>
							<p id="cardne" class="card-text">우수리뷰</p>
						</div>
					</div>
				</div>
				<div class="col-md-4-2 col-sm-6-2 portfolio-item ">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="/yumyum/resources/img/manager.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">우수리뷰2</a>
							</h4>
							<p id="cardne" class="card-text">우수리뷰</p>
						</div>
					</div>
				</div>
				<div class="col-md-4-2 col-sm-6-2 portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="/yumyum/resources/img/manager.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">우수리뷰3</a>
							</h4>
							<p id="cardne" class="card-text">우수리뷰</p>
						</div>
					</div>
				</div>
				<div class="col-md-4-2 col-sm-6-2 portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="/yumyum/resources/img/manager.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">우수리뷰4</a>
							</h4>
							<p id="cardne" class="card-text">우수리뷰</p>
						</div>
					</div>
				</div>
				<div class="col-md-4-2 col-sm-6-2 portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="/yumyum/resources/img/manager.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">우수리뷰5</a>
							</h4>
							<p id="cardne" class="card-text">우수리뷰</p>
						</div>
					</div>
				</div>
				<div class="col-md-4-2 col-sm-6-2 portfolio-item">
					<div class="card h-100">
						<a href="#"><img class="card-img-top"
							src="/yumyum/resources/img/manager.jpg" alt=""></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#">우수리뷰6</a>
							</h4>
							<p id="cardne" class="card-text">우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰우수리뷰</p>
						</div>
					</div>
				</div>


				<!-- 			<table class="table table-hover "> -->
				<!-- 				<thead> -->
				<!-- 					<tr> -->
				<!-- 						<th>No</th> -->
				<!-- 						<th>Title</th> -->
				<!-- 						<th>Writer</th> -->
				<!-- 						<th>Date</th> -->
				<!-- 						<th>View</th> -->
				<!-- 						<th>Recommend</th> -->
				<!-- 					</tr> -->
				<!-- 				</thead> -->
				<!-- 				<tbody> -->
				<!-- 					<tr> -->
				<!-- 						<td>1</td> -->
				<!-- 						<td>맛있는 요리</td> -->
				<!-- 						<td>매니저</td> -->
				<!-- 						<td>2017-10-23</td> -->
				<!-- 						<td>10</td> -->
				<!-- 						<td>24</td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<td>2</td> -->
				<!-- 						<td>맛있는 요리</td> -->
				<!-- 						<td>매니저</td> -->
				<!-- 						<td>2017-10-23</td> -->
				<!-- 						<td>10</td> -->
				<!-- 						<td>24</td> -->
				<!-- 					</tr> -->
				<!-- 					<tr> -->
				<!-- 						<td>3</td> -->
				<!-- 						<td>맛있는 요리</td> -->
				<!-- 						<td>매니저</td> -->
				<!-- 						<td>2017-10-23</td> -->
				<!-- 						<td>10</td> -->
				<!-- 						<td>24</td> -->
				<!-- 					</tr> -->
				<!-- 				</tbody> -->
				<!-- 			</table> -->
				<!-- 			<div class="writbtn2"> -->
				<!-- 				<button id="writebtn" type="button" -->
				<!-- 					class="btn btn-default text-white bg-redred writbtn3" -->
				<!-- 					onclick="location.href='ReInput'">글쓰기</button> -->
				<!-- 			</div> -->
				<!-- Sidebar Widgets Column -->

			</div>


			<div class="col-md-4">

				<!-- Search Widget -->
				<div class="card my-4 ">
					<h5 class="card-header bg-redred text-white">Search</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button class="btn btn-default text-white bg-redred writbtn3" type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>

				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header bg-redred text-white">여기엔 정렬을 넣장</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">한식만</a></li>
									<li><a href="#">일식만</a></li>
									<li><a href="#">중식만</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">양식만</a></li>
									<li><a href="#">잡다</a></li>
									<li><a href="#">추천수</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header bg-redred text-white">여기에 뭘 넣을까..</h5>
					<div class="card-body">여기에 뭘 넣을까..</div>
				</div>

			</div>

		</div>
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
	<!-- Footer -->
	<footer class="py-4 bg-redred">
		<div class="container">
			<p class="m-0 text-center text-white">(주) 구디 &copy; 2017-09-11</p>
		</div>
	</footer>
</body>
</html>
