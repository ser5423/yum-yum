<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	session.getAttribute("manager");
	session.getAttribute("user");
	%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Yum - Yum</title>
<script src="/yumyum/resources/js/jquery.min.js"></script>
<script src="/yumyum/resources/js/popper.min.js"></script>
<script src="/yumyum/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
window.onunload=function(){
	  window.location.replace(self.location);
	 }
</script>
<link rel="stylesheet" href="/yumyum/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/yumyum/resources/css/color.css">

<link rel="stylesheet" href="/yumyum/resources/css/modern-business.css">
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
	<!-- image slide 하는 부분 -->
	<header>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<!-- carousel = 이미지 슬라이드 하는 기능 -->
			<ol class="carousel-indicators">
				<li style="cursor: pointer" data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li style="cursor: pointer" data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li style="cursor: pointer" data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li style="cursor: pointer" data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active" style="background-image: url(/yumyum/resources/img/korea.jpg)" onclick="location.href='${pageContext.request.contextPath }/Recipe?type=KF';">
					<div class="carousel-caption d-none d-md-block">
						<h3>한식</h3>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item" style="background-image: url(/yumyum/resources/img/jp.jpg)" onclick="location.href='${pageContext.request.contextPath }/Recipe?type=JF';">
					<div class="carousel-caption d-none d-md-block">
						<h3>일식</h3>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item" style="background-image: url(/yumyum/resources/img/ch.jpg)" onclick="location.href='${pageContext.request.contextPath }/Recipe?type=CF';">
					<div class="carousel-caption d-none d-md-block">
						<h3>중식</h3>
					</div>
				</div>
				<div class="carousel-item" style="background-image: url(/yumyum/resources/img/us.jpg)" onclick="location.href='${pageContext.request.contextPath }/Recipe?type=EF';">
					<div class="carousel-caption d-none d-md-block">
						<h3>양식</h3>
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
	<!-- 본문 시작 -->
	<div class="container">
		<h2>Best Recipe</h2>
		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#KF"><img class="card-img-top" src="/yumyum/resources/img/KF/KF_Bulgogi.jpg" data-toggle="modal" data-target="#KF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#KF" data-toggle="modal" data-target="#KF">불고기</a>
						</h4>
						<p id="cardne" class="card-text">쇠고기를 얇게 썰어 채소와 함께 갖은 양념을 넣고 미리 재워두웠다가 뜨거워진 불판에 구워 먹는 음식</p>
						<button id="plusbtn" type="button" data-toggle="modal" data-target="#KF">...</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#JF"><img class="card-img-top" src="/yumyum/resources/img/JF/JF_JapanOudong.jpg" data-toggle="modal" data-target="#JF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#JF" data-toggle="modal" data-target="#JF">정통 일본식 우동</a>
						</h4>
						<p id="cardne" class="card-text">냄비에 우동 면과 계란, 소고기, 가마보코, 파 등을 올려 1인분씩 끓여낸 일본 우동</p>
						<button id="plusbtn" type="button" data-toggle="modal" data-target="#JF">...</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#CF"><img class="card-img-top" src="/yumyum/resources/img/CF/CF_TANG.jpg" data-toggle="modal" data-target="#CF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#CF" data-toggle="modal" data-target="#CF">찹쌀 탕수육</a>
						</h4>
						<p id="cardne" class="card-text">감자 전분으로 튀김옷을 입힌 돼지고기에 새콤달콤한 소스를 묻힌 요리 (꿔바로우)</p>
						<button id="plusbtn" type="button" data-toggle="modal" data-target="#CF">...</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#EF"><img class="card-img-top" src="/yumyum/resources/img/EF/EF_LATTA.png" data-toggle="modal" data-target="#EF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#EF" data-toggle="modal" data-target="#EF">라타뚜이</a>
						</h4>
						<p id="cardne" class="card-text">프랑스의 프로방스 지방에서 즐겨먹는 전통적인 야채 스튜</p>
						<button id="plusbtn" type="button" data-toggle="modal" data-target="#EF">...</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#BF"><img class="card-img-top" src="/yumyum/resources/img/rkfkdkrp.jpg" data-toggle="modal" data-target="#BF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#BF" data-toggle="modal" data-target="#BF">치킨 가라아게(우수리뷰)</a>
						</h4>
						<p id="cardne" class="card-text">닭고기에 밑간을 하거나 그대로 전분이나 밀가루를 묻혀서 튀기는 일본식 닭요리</p>
						<button id="plusbtn" type="button" data-toggle="modal" data-target="#BF">...</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#MF"><img class="card-img-top" src="/yumyum/resources/img/dusdjtoffjem.jpg" data-toggle="modal" data-target="#MF"></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#MF" data-toggle="modal" data-target="#MF">연어 샐러드</a>
						</h4>
						<p id="cardne" class="card-text">연어를 이용한 샐러드, 비타민 A와 D가 풍부하고 단백질과 지방 등 좋은 영양소가 많은 요리</p>
						<button id="plusbtn" type="button" data-toggle="modal" data-target="#MF">...</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 숨겨진 부분 각 modal 클릭 시에만 나오는 부분들 -->
	<!-- Modal -->
	<div class="modal fade" id="KF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id="modalsize">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">불고기</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/KF/KF_Bulgogi.jpg" class="img-responsive card-img-top" id="modalimagesize2">
						</p>
					</div>
					<p id="modaltextsize" class="modalradius">쇠고기(등심) 300g, 양파 200g, 간장 2T, 설탕 1T, 꿀 1/2T, 다진 파 1T, 다진 마늘 1/2T,깨소금 1/2T, 후춧가루 1/5t, 참기름 1T </p>
					<p class="modalradius"> 
					<span>1. 재료 준비 </span> <br>
					쇠고기는 핏물을 닦고, 기름과 힘줄을 떼어 낸 후, 결의 반대방향으로 가로 5cm, 세로 4cm, 두께 0.3cm 정도로 썰어줍니다.<br>
					양파는 손질하여 깨끗이 씻은 후, 폭 0.5cm로 채 썹니다.<br>
					쇠고기에 양념장을 넣고, 간이 베이도록 주물러, 양파를 넣고 30분 정도 재워 놓습니다.<br>
					<span>2. 요리</span><br>
					불고기판을 달구어 쇠고기를 놓고, 센불에서 3분 정도 굽다가 뒤집어 중불로 낮추어 5분 정도 더 구워주면 완성입니다.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="JF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">전통 일본식 우동</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/JF/JF_JapanOudong.jpg" class="img-responsive card-img-top" id="modalimagesize2">
						</p>
					</div>
					<p id="modaltextsize" class="modalradius">중력분 500g,가쓰오브시 60g,물 1/2컵,소금 35g,실파 약간,김 약간,쑥갓 약간,어묵 약간,표고버섯 약간,유부 약간,다시마 20g,물 2L,미림 약간,간장 약간,고춧가루 약간</p>
					<p class="modalradius">
					<span>1. 반죽 준비 </span><br>
					물에 소금을 완전히 녹인 다음 중력분에 넣어 반죽합니다.<br>
					손으로 힘차게 반죽을 치댄 다음 비닐봉지에 넣어 1시간쯤 숙성 시킵니다. <br>
					<span>2. 육수 준비 </span><br>
					찬물에 가쓰오부시를 넣고 휘저은 다음 불에 올립니다. 다시마를 넣고 물이 끓기 시작하면 체에 밭쳐 국물만 준비합니다 .<br>
					<span>3. 면 삶기 </span><br>
					숙성되어 끈기가 생긴 반죽을 밀대로 밀고 적당한 길이로 접어서 썹니다.<br>
					다 만들어진 면에 면이 서로 붙지 않도록 중력분을 뿌리면서 털어줍니다.<br>
					물을 끓여 면을 삶는다. 20분쯤 충분히 삶아서 찬물에 헹굽니다.<br>
					<span>4. 양념장 및 마무리</span><br>
					가쓰오부시 국물에 간장 : 미림을 17 : 1 : 1의 비율로 잘 섞은 다음 소금과 고춧가루로 간하여 끓입니다.<br>
					국물이 끓으면 삶아놓은 면을 넣고 다시 한소끔 끓인뒤 파, 어묵, 유부, 쑥갓등 곁들입니다. 이때 재료를 기호에 따라 적당량 넣어 드시면 됩니다.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="CF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">찹쌀 탕수육</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/CF/CF_TANG.jpg" class="img-responsive card-img-top" id="modalimagesize2">
						</p>
					</div>
					<p id="modaltextsize" class="modalradius">닭가슴살 600g,우유,소금,후추,전분가루 반컵,튀김가루 반컵,찹쌀가루 한컵,달걀흰자,물 약간,파슬리가루,양파,당근,파프리카,오이,사과,물 2컵,설탕,간장 각 3T,식초,녹말물 각 2T,레몬즙 </p>
					<p class="modalradius">
					<span> 1. 고기 손질</span><br>
					닭가슴살 6덩이 소환해서 깨끗하게 씻어줍니다.<br>
					먹기 좋은 크기로 잘라서 우유에 살짝 재워두고 이때 소금과 후추 약간 넣어서 밑간 해줍니다.<br>
					<span> 2. 튀김 준비 및 튀기기 </span><br>
					볼에 전분, 튀김, 찹쌀가루 종이컵 기준 용량만큼 넣고 물은 저어가면서 농도 맞춰가며 넣어줍니다. <br>
					밑간 다 된 닭가슴살은 꺼내서 키친타월에 물기 한 번 닦아내고 비닐봉투에 전분가루 넣어서 몽땅 넣고 흔들어서 묻혀줍니다.<br>
					그리고 적당히 달궈진 기름에 넣고 튀겨줍니다.<br>
					튀김은 온도가 일정해야 합니다 그리고 소스는 적당히 불조절이 필요하기에 처음에 센불에서 조리하다 나중에 녹말물 넣고 나서부터는 남은 잔열로 조리하면 적당한 농도로 만들어집니다.<br>
					<span> 3. 소스 준비 및 마무리</span><br>
					탕수육 소스 레시피는 양파와 당근을 볶다가 간장, 설탕, 물을 섞어서 나머지 양념들을 넣어줍니다.<br>
					그렇게 5분 정도 바글바글 끓이다가 식초 2T을 넣어주세요.<br>
					녹말물을 넣기 직전에 레몬을 잘라 반개 정도의 레몬즙을 뿌려주고 남은 야채들을 함께 넣고 2~3분간 더 끓여주다가 마지막에 녹말물 2~3T을 넣어가며 농도를 맞춰줍니다.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="EF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">라타뚜이</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/EF/EF_LATTA.png" class="img-responsive card-img-top" id="modalimagesize2">
						</p>
					</div>
					<p id="modaltextsize" class="modalradius">가지1개,양파1/2개, 홍피망1/2개,애호박1/2개, 다진마늘1작은술,토마토소스(혹은 캔토마토) 100g,야채스톡3g, 케찹 약간,올리브오일5T,통후추 약간, 천일염 약간,월계수잎1장,로즈마리 약간</p>
					<p class="modalradius">
					<span>1. 재료 손질</span><br>
					가지와 호박을 단면이 둥근 모양이 되도록 얇게 잘라줍니다.<br>
					피망을 잘게 자르고 양파는 다져 놓습니다.<br>
					토마토의 껍질을 벗겨 씨와 수분을 빼놓습니다. <br>
					<span>2. 채소 볶기 및 소스 만들기</span><br>
					냄비에 올리브 오일을 두르고 가지, 호박, 피망, 양파를 각각 따로 볶아줍니다.<br>
					바닥이 두툼하고 큰 냄비에 올리브 오일을 두르고 다진 마늘과 허브(타임, 파슬리, 바질 등), 토마토를 넣고 걸쭉해 질 때까지 서서히 가열해 토마토 소스를 만들어 줍니다.<br>
					앞서 볶아 놓은 채소를 토마토 소스에 넣고 고루 섞이도록 잘 저어줍니다.<br>
					<span>3. 마무리</span><br>
					단면을 둥글게 자른 가지와 호박을 서로 번갈아 가며 켜켜이 접시에 올리고, 토마토 소스를 위에 뿌린 후 오븐에서 구우면 완성입니다.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="BF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">치킨 가라아게(우수리뷰)</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body reviewmodal">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/rkfkdkrp.jpg" class="img-responsive card-img-top">
						</p>
					</div>
					<p class="modalradius">
					닭고기를 먹기 좋은 크기로 자르고 간장, 술, 생강즙, 소금, 후추로 양념을 하여 10분 정도 상온에서 재워둔다.<br>
					닭고기에 양념이 잘 배면 밀가루나 녹말가루를 묻힌다. 쌀가루로 대신하면 더욱 바삭하게 튀길 수 있다.<br>
					반대로 좀 더 부드러운 식감을 원한다면 밀가루 또는 녹말가루에 계란을 풀어 넣는다.<br>
					튀김용 기름을 170~180도로 가열한 후 밀가루나 녹말가루를 입힌 닭고기를 넣고,<br>
					속까지 완전히 익을 때까지 튀겨낸다.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="MF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">연어 샐러드</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="modalimagesize">
						<p>
							<img src="/yumyum/resources/img/dusdjtoffjem.jpg" class="img-responsive card-img-top" id="modalimagesize2">
						</p>
					</div>
					<p id="modaltextsize" class="modalradius">훈제연어 8조각. 로메인 1~1.5포기. 어린잎 샐러드 한줌 반. 양파 1/2개. 플레인 요구르트 1개. 마요네즈 1t. 고추냉이 0.5~1T. 레몬즙, 시럽 각각 1T씩. 케이퍼 7~8개</p>
					<p class="modalradius">
					<span>1. 채소 손질 및 드레싱</span><br>
					로메인과 어린잎 샐러드 채소는 씻어서 물기를 제거합니다.<br>
					양파는 채 썰어서 찬물에 담가 매운맛을 제거 합니다<br>
					분량의 드레싱 재료에 케이퍼를 다져 넣고 섞어 둡니다.<br>
					<span>2. 세팅 및 마무리</span><br>
					그릇에 로메인을 손으로 뚝뚝 대충 뜯어 담고 어린잎 샐러드를 올리고,<br>
					연어는 한 장씩 돌돌 말아 꽃 모양을 만들어 양파와 함께 샐러드 채 소위에 올려 마무리합니다.</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 하단 footer 부분 -->
	<footer class="py-4 bg-redred">
		<div class="container">
			<p class="m-0 text-center text-white">(주) 구디 &copy; 2017-09-11</p>
			<div id="navbarDropdownBlog" class="nav-link reviewmodal managerbtn">
				<% if(session.getAttribute("user") == null && session.getAttribute("manager") == null) {%> 
            		<a class="managerbtn" href="/yumyum/Managerlogin" >Manager Login</a>
            		
            		<% } else if(session.getAttribute("user") != null){ %>
            		<a id="logout" class="managerbtn hide" href="logout">Manager Logout</a>
            		
         		<% } else { %>
         			<a id="logout" class="managerbtn" href="logout">Manager Logout</a>
            		<a class="managerbtn hide" href="/yumyum/Managerlogin" >Manager Login</a>
            	<% } %>
			</div>
		</div>
	</footer>
</body>
</html>
