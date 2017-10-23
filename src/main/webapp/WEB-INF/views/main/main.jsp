<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Food Factory</title>
    <script src="/yumyum/resources/js/jquery.min.js"></script>
    <script src="/yumyum/resources/js/popper.min.js"></script>
    <script src="/yumyum/resources/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/yumyum/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/yumyum/resources/css/color.css">

    <link rel="stylesheet" href="/yumyum/resources/css/modern-business.css">
<script type="text/javascript">
$(document).ready(function(){
	$("#img1").load("/yumyum/resources/html/1016/img1.html");
	$("#img2").load("/yumyum/resources/html/1016/img2.html");
	$("#img3").load("/yumyum/resources/html/1016/img3.html");
	$("#img4").load("/yumyum/resources/html/1016/img4.html");
	
	$("form").on("submit", function( event ) {
		  event.preventDefault();
		  $.ajax({
					url:"Login", 
					data: $( this ).serialize()
			}).done(function(result){
				console.log(result);
				$("#loginPop").modal("hide");
				if(result.stat){
					alert(result.email + " 로그인이 성공하였습니다.");
				}else{
					alert("입력하신 [" + result.email + "] 정보가 잘못되었습니다.");
				}
			});
	});
});
</script> 

  </head>
  <body>
    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-redred fixed-top">
      <div class="container">
        <a class="navbar-brand" href="Main">Food Factory</a>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Recipe
              </a>
              <div id="recipeset" class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="/yumyum/resources/html/re1.html">한식</a>
                <a class="dropdown-item" href="/yumyum/resources/html/re1.html">일식</a>
                <a class="dropdown-item" href="/yumyum/resources/html/re1.html">중식</a>
                <a class="dropdown-item" href="/yumyum/resources/html/re1.html">양식</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Review
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="/yumyum/resources/html/Review.html">우수 리뷰</a>
                <a class="dropdown-item">리뷰</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Board
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog"> <!-- aria-labelledby를 사용하면 어떤 요소의 레이블로서 DOM에 있는 다른 요소의 ID를 지정할 수 있습니다. -->
                <a class="dropdown-item">공지사항</a>
                <a class="dropdown-item" href="/yumyum/resources/html/Board.html">자유게시판</a>
                <a class="dropdown-item">QnA</a>
              </div>
            </li>
              <li data-toggle="modal" data-target="#loginPop">
              <a id="navbarDropdownBlog" class="nav-link" href="#">login</a>
            </li>
              <li data-toggle="modal" data-target="#signPop">
              <a class="nav-link" href="#">membership</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel"> <!-- carousel = 이미지 슬라이드 하는 기능 -->
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="carousel-item active" style="background-image: url(/yumyum/resources/img/korea.jpg)">
            <div class="carousel-caption d-none d-md-block">
              <h3>한식</h3>
              <p>소개글</p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url(/yumyum/resources/img/jp.jpg)">
            <div class="carousel-caption d-none d-md-block">
              <h3>일식</h3>
              <p>소개글</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url(/yumyum/resources/img/ch.jpg)">
            <div class="carousel-caption d-none d-md-block">
              <h3>중식</h3>
              <p>소개글</p>
            </div>
          </div>
            <div class="carousel-item" style="background-image: url(/yumyum/resources/img/us.jpg)">
            <div class="carousel-caption d-none d-md-block">
              <h3>양식</h3>
              <p>소개글</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">이전</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">다음</span>
        </a>
      </div>
    </header>
    <div class="container">
        <h2>Best Recipe</h2>
      <div class="row">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#myModal"><img class="card-img-top" src='/yumyum/resources/img/korea2.jpg' data-toggle="modal" data-target="#myModal"></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">한국</a>
              </h4>
              <p class="card-text">소개글</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="/yumyum/resources/img/jp2.jpg"></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">일식</a>
              </h4>
              <p class="card-text">소개글</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="/yumyum/resources/img/ch2.jpg"></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">중식</a>
              </h4>
              <p class="card-text">소개글</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="/yumyum/resources/img/us2.jpg"></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">양식</a>
              </h4>
              <p class="card-text">소개글</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="/yumyum/resources/img/review.png"></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">우수리뷰</a>
              </h4>
              <p class="card-text">소개글</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="/yumyum/resources/img/manager.jpg"></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">관리자 추천</a>
              </h4>
              <p class="card-text">소개글</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal -->
<div class="modal fade" id="loginPop" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">로그인</h4>
      </div>
      <div class="modal-body">
		<form>
		  <div class="form-group">
		    <label for="email">Email address:</label>
		    <input type="email" class="form-control" id="email" name="email">
		  </div>
		  <div class="form-group">
		    <label for="pwd">Password:</label>
		    <input type="password" class="form-control" id="pwd" name="pwd">
		  </div>
		  <button type="submit" class="btn btn-success">login</button>
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
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
              <div class="modal-dialog"> 
                  <div class="modal-content"> 
                      <div class="modal-header"> 
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> 
                          <h4 class="modal-title" id="myModalLabel">한식</h4> 
                      </div> 
                      <div class="modal-body"> 
                          <p><img src="/yumyum/resources/img/korea2.jpg" class="img-responsive card-img-top"></p> 
                          <p>한식 한식</p> 
                        </div> 
                  </div> 
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
