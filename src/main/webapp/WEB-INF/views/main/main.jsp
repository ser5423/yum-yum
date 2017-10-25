<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Food Factory</title>
<script src="/yumyum/resources/js/jquery.min.js"></script>
<script src="/yumyum/resources/js/popper.min.js"></script>
<script src="/yumyum/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<link rel="stylesheet" href="/yumyum/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/yumyum/resources/css/color.css">

<link rel="stylesheet" href="/yumyum/resources/css/modern-business.css">

<script type="text/javascript">
	$(document).ready(function() {
		$("#img1").load("/yumyum/resources/html/1016/img1.html");
		$("#img2").load("/yumyum/resources/html/1016/img2.html");
		$("#img3").load("/yumyum/resources/html/1016/img3.html");
		$("#img4").load("/yumyum/resources/html/1016/img4.html");

		$("form").on("submit", function(event) {
			event.preventDefault();
			$.ajax({
				url : "Login",
				data : $(this).serialize()
			}).done(function(result) {
				console.log(result);
				$("#loginPop").modal("hide");
				if (result.stat) {
					alert(result.email + " 로그인이 성공하였습니다.");
				} else {
					alert("입력하신 [" + result.email + "] 정보가 잘못되었습니다.");
				}
			});
		});

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
	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<!-- carousel = 이미지 슬라이드 하는 기능 -->
			<ol class="carousel-indicators">
				<li style="cursor: pointer" data-target="#carouselExampleIndicators"
					data-slide-to="0" class="active"></li>
				<li style="cursor: pointer" data-target="#carouselExampleIndicators"
					data-slide-to="1"></li>
				<li style="cursor: pointer" data-target="#carouselExampleIndicators"
					data-slide-to="2"></li>
				<li style="cursor: pointer" data-target="#carouselExampleIndicators"
					data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active"
					style="background-image: url(/yumyum/resources/img/korea.jpg)"
					onclick="location.href='${pageContext.request.contextPath }/Recipe?type=KF';">
					<div class="carousel-caption d-none d-md-block">
						<h3>한식</h3>
						<p>소개글</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url(/yumyum/resources/img/jp.jpg)"
					onclick="location.href='${pageContext.request.contextPath }/Recipe?type=JF';">
					<div class="carousel-caption d-none d-md-block">
						<h3>일식</h3>
						<p>소개글</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url(/yumyum/resources/img/ch.jpg)"
					onclick="location.href='${pageContext.request.contextPath }/Recipe?type=CF';">
					<div class="carousel-caption d-none d-md-block">
						<h3>중식</h3>
						<p>소개글</p>
					</div>
				</div>
				<div class="carousel-item"
					style="background-image: url(/yumyum/resources/img/us.jpg)"
					onclick="location.href='${pageContext.request.contextPath }/Recipe?type=EF';">
					<div class="carousel-caption d-none d-md-block">
						<h3>양식</h3>
						<p>소개글</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">이전</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">다음</span>
			</a>
		</div>
	</header>
	<div class="container">
		<h2>Best Recipe</h2>
		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#KF"><img class="card-img-top"
						src="/yumyum/resources/img/korea2.jpg" data-toggle="modal"
						data-target="#KF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#KF" data-toggle="modal" data-target="#KF">한국</a>
						</h4>
						<p id="cardne" class="card-text">소개글소개글소개글소개글소개글소개글소개글소개</p>
						<button id="plusbtn" type="button" data-toggle="modal"
							data-target="#KF">...</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#JF"><img class="card-img-top"
						src="/yumyum/resources/img/jp2.jpg" data-toggle="modal"
						data-target="#JF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#JF" data-toggle="modal" data-target="#JF">일식</a>
						</h4>
						<p id="cardne" class="card-text">소개글소개글소개글소개글소개글소개글소개글소개</p>
						<button id="plusbtn" type="button" data-toggle="modal"
							data-target="#JF">...</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#CF"><img class="card-img-top"
						src="/yumyum/resources/img/ch2.jpg" data-toggle="modal"
						data-target="#CF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#CF" data-toggle="modal" data-target="#CF">중식</a>
						</h4>
						<p id="cardne" class="card-text">소개글소개글소개글소개글소개글소개글소개글소개</p>
						<button id="plusbtn" type="button" data-toggle="modal"
							data-target="#CF">...</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#EF"><img class="card-img-top"
						src="/yumyum/resources/img/us2.jpg" data-toggle="modal"
						data-target="#EF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#EF" data-toggle="modal" data-target="#EF">양식</a>
						</h4>
						<p id="cardne" class="card-text">소개글소개글소개글소개글소개글소개글소개글소개</p>
						<button id="plusbtn" type="button" data-toggle="modal"
							data-target="#EF">...</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#BF"><img class="card-img-top"
						src="/yumyum/resources/img/review.png" data-toggle="modal"
						data-target="#BF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#BF" data-toggle="modal" data-target="#BF">우수리뷰</a>
						</h4>
						<p id="cardne" class="card-text">소개글소개글소개글소개글소개글소개글소개글소개</p>
						<button id="plusbtn" type="button" data-toggle="modal"
							data-target="#BF">...</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#MF"><img class="card-img-top"
						src="/yumyum/resources/img/manager.jpg" data-toggle="modal"
						data-target="#MF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#MF" data-toggle="modal" data-target="#MF">관리자 추천</a>
						</h4>
						<p id="cardne" class="card-text">소개글소개글소개글소개글소개글소개글소개글소개</p>
						<button id="plusbtn" type="button" data-toggle="modal"
							data-target="#MF">...</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 로그인창  -->
	<div class="modal fade" id="loginPop" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">로그인</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<div id="naver_id_login"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="signPop" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">회원 가입</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
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
	<!-- Modal -->
	<div class="modal fade" id="JF" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">일식</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/jp2.jpg"
								class="img-responsive card-img-top" id="modalimagesize2">
						</p>
					</div>
					<p id="modaltextsize" class="modalradius">설명</p>
					<p class="modalradius">일식</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="CF" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">중식</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/ch2.jpg"
								class="img-responsive card-img-top" id="modalimagesize2">
						</p>
					</div>
					<p id="modaltextsize" class="modalradius">설명</p>
					<p class="modalradius">중식</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="EF" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">양식</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/us2.jpg"
								class="img-responsive card-img-top" id="modalimagesize2">
						</p>
					</div>
					<p id="modaltextsize" class="modalradius">설명</p>
					<p class="modalradius">양식</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="BF" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">우수리뷰</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body reviewmodal">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/review.png"
								class="img-responsive card-img-top">
						</p>
					</div>
					<p class="modalradius">우수리뷰</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="MF" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">관리자 추천</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/manager.jpg"
								class="img-responsive card-img-top" id="modalimagesize2">
						</p>
					</div>
					<p id="modaltextsize" class="modalradius">설명</p>
					<p class="modalradius">관리자 추천</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="managerlogin" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content managerlogin">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Manager Login</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal inputform">
						<div class="form-group">
							<label for="inputEmail3" class="col-xs-6 control-label">ID</label>
							<div class="col-xs-6">
								<input type="text" class="form-control inputformne2"
									id="inputEmail3" placeholder="아이디를 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-xs-6 control-label">Password</label>
							<div class="col-xs-6">
								<input type="password" class="form-control inputformne2"
									id="inputPassword3" placeholder="비밀번호를 입력하세요">
							</div>
						</div>
						<div class="form-group writbtn3-1">
							<div class="col-xs-3">
								<button type="submit"
									class="btn btn-default text-white bg-redred writbtn3">Login</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="py-4 bg-redred">
		<div class="container">
			<p class="m-0 text-center text-white">(주) 구디 &copy; 2017-09-11</p>
			<div id="navbarDropdownBlog" class="nav-link reviewmodal managerbtn">
				<a class="managerbtn" href="#" data-toggle="modal"
					data-target="#managerlogin">Manager Login</a> <a class="managerbtn"
					href="Manager">Manager Page</a>
			</div>
		</div>
	</footer>
</body>
</html>
