<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   String EMAIL = (String) request.getAttribute("EMAIL"); 
   String EMAILmanager = (String) request.getAttribute("EMAILmanager");    
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
<script type="text/javascript">
$(document).ready(function(){
	var EMAIL='<%=EMAIL%>';
	var EMAILmanager = '<%=EMAILmanager%>';
    $.getScript("https://cdn.ckeditor.com/4.7.3/full-all/ckeditor.js").done(function() {
        if (CKEDITOR.instances['CONT']) {
            CKEDITOR.instances['CONT'].destroy();
        }
        CKEDITOR.replace('CONT', {
      	  customConfig: '/yumyum/resources/js/config.js',
      	  filebrowserUploadUrl: '${pageContext.request.contextPath}/upload'
        });
    });
	$("#write").on("click", function(){
              
		 // #writeform의 모든 값을 가져온다
		var formData = $('#writeform')[0];
	
		// ck자체 들어가 있는 java script 언어
		var ckeditor = CKEDITOR.instances.CONT.getData();
		$('#CONT').val(ckeditor);
		
	  	var data = new FormData(formData);
	  
		$.ajax({
        	url: "ReInput_Data",
        	cache : false,
        	processData : false,
        	contentType : false,
        	data : data,
        	type : "POST",
        	success : function(data) 
            { // 성공 시 	메세지 및 이동할주소
            	alert(data.data);
            	location.href= data.move;
       		},error : function(req,data) {
       			alert(data.data);
            	location.href= data.move;
       		}
        });
    })
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
					<% if(session.getAttribute("user") == null && session.getAttribute("manager") == null) {%> 
            		<li><a id="navbarDropdownBlog" class="nav-link" href="Modallogin">login</a></li>
         		<% } else { %>
         			<li><a id="navbarDropdownBlog" class="nav-link hide" href="Modallogin">login</a></li>
            	<% } %>
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
		<!--* 파일업로드를 위해 enctype="multipart/form-data"  
		    * enctype : 전송되는 데이터 형식
		    * multipart/form-data : 파일이나 이미지를 서버로 전송 -->
			<form class="form-horizontal inputform" id="writeform" name="writeform" enctype="multipart/form-data" accept-charset="utf-8"  method="post">
         <!-- type을 보내주는 이유는 디비 삽입 후 성공 하였을때 게시판목록으로보낸다 했는데 어느 게시판을 보낼지 모르니깐.. -->
            
               <div class="form-group">
               <label for="name" class="col-xs-6 control-label"></label>
               <div class="col-xs-6">
                  <input type="text" class="form-control inputformne hide"
                     id="WRITER" name="WRITER" value="${EMAIL}">
               </div>
            </div>
            <div class="form-group">
               <label for="EMAIL" class="col-xs-6 control-label"></label>
               <div class="col-xs-6">
                  <input type="hidden" class="form-control inputformne"
                     id="EMAIL" name="EMAIL" value="<%=request.getParameter("user")%>" placeholder="EMAIL 입력하세요">
               </div>
            </div>
            <div class="form-group">
               <label for="subject" class="col-xs-6 control-label">제목</label>
               <div class="col-xs-6">
                  <input type="text" class="form-control inputformne"
                     id="TITLE" name="TITLE" placeholder="글 제목을 입력하세요">
               </div>
            </div>
            <div class="form-group">
               <label for="cont" class="col-xs-6 control-label">내용</label>
               <div class="col-xs-6">
                  <textarea id="CONT" name="CONT" class="ckeditor form-control col-xs-12" rows="300" cols="100"></textarea>
               </div>
            </div>
            
            <div class="form-group">
               <label for="cont" class="col-xs-6 control-label"><b>메인썸네일 이미지</b></label>
               <div class="col-xs-6">
                  <input type="file" id="file" name="file" class="form-control col-xs-12" />
                </div>
            </div>
            
            <div class="form-group writbtn3-1">
               <div class="col-xs-3">
                  <button type="button" class="btn text-white bg-redred writbtn3"
                     onclick="location.href='javascript:history.go(-1)'">목록</button>
                  <button type="button" class="btn btn-default text-white bg-redred writbtn3" id="write">작성</button>
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
