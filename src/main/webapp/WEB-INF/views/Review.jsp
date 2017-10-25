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
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var pathname = location.pathname;
						console.log("")
						if (pathname == "/yumyum/Review") {
							function getData() {

								$
										.ajax({
											url : "Review_Data",
											data : $(this).serialize()
										})
										.done(
												function(result) {
													var data = result.list;
													var text = result.text;
													var tag = "";

													$(".container h1").text(
															text);
													$(".breadcrumb li").eq(1)
															.text(text);
													$(
															".container .row .col-md-8")
															.empty();

													for (var i = 0; i < data.length; i++) {
														var tag = "";
														tag += '<div class="col-md-4-2 col-sm-6-2  portfolio-item">';
														tag += '<div class="card h-100">';
														tag += '<a href="#"><img class="card-img-top"src="/yumyum/resources/img/manager.jpg" alt=""></a>';
														tag += '<div class="card-body">';
														tag += '<h4 class="card-title">';
														tag += '<a href="#">'
																+ data[i].TITLE
																+ '</a>';
														tag += '</h4>';
														tag += '<p id="cardne" class="card-text">'
																+ data[i].WRITER
																+ '</p>';
														tag += '</div>';
														tag += '</div>';
														tag += '</div>';

														$(
																".container .row .col-md-8")
																.append(tag);
													}
												});
							}
							getData();
						} else if (pathname == "/yumyum/BestReview") {

							function getData1() {
								$
										.ajax({
											url : "bestReview_Data",
											data : $(this).serialize()
										})
										.done(
												function(result) {
													var data = result.list;
													var text = result.text;
													var tag = "";

													$(".container h1").text(
															text);
													$(".breadcrumb li").eq(1)
															.text(text);
													$(
															".container .row .col-md-8")
															.empty();

													for (var i = 0; i < data.length; i++) {
														var tag = "";
														tag += '<div class="col-md-4-2 col-sm-6-2  portfolio-item">';
														tag += '<div class="card h-100">';
														tag += '<a href="#"><img class="card-img-top"src="/yumyum/resources/img/manager.jpg" alt=""></a>';
														tag += '<div class="card-body">';
														tag += '<h4 class="card-title">';
														tag += '<a href="#">'
																+ data[i].TITLE
																+ '</a>';
														tag += '</h4>';
														tag += '<p id="cardne" class="card-text">'
																+ data[i].WRITER
																+ '</p>';
														tag += '</div>';
														tag += '</div>';
														tag += '</div>';

														$(
																".container .row .col-md-8")
																.append(tag);
													}
												});
							}
							getData1();
						} else {
							response.sendRedirect("Main");
						}

					});
</script>
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
							<a class="dropdown-item" href="/yumyum/BestReview">우수 리뷰</a> <a
								class="dropdown-item" href="/yumyum/Review">리뷰</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Board </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<!-- aria-labelledby를 사용하면 어떤 요소의 레이블로서 DOM에 있는 다른 요소의 ID를 지정할 수 있습니다. -->
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/Board?type=no">공지사항</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/Board?type=fr">자유게시판</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/Board?type=qa">QnA</a>
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
			<div class="col-md-8"></div>
			<div class="col-md-4">
				<div class="card my-4 ">
					<h5 class="card-header bg-redred text-white">Search</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button class="btn btn-default text-white bg-redred writbtn3"
									type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>
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
