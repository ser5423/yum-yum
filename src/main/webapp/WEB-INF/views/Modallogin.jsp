<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Modal Login</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="/yumyum/resources/js/jquery.min.js"></script>
<script src="/yumyum/resources/js/popper.min.js"></script>
<script src="/yumyum/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>


<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="/yumyum/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/yumyum/resources/css/color.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="/yumyum/resources/css/modern-business.css">
<script type="text/javascript">
	$(window).on("load", function() {
		$('#myModal').modal('show');
	});
</script>

</head>
<body>
	<div class="container ">
		<div class="row ">
			<img id="modalloginimage" class="card-img-top"
				src="/yumyum/resources/img/modalimage.jpg">

			<div class="modal fade " id="myModal" role="dialog">
				<div class="modal-dialog ">
					<div class="modal-content myModalsize">
						<div class="modal-header">
							<h4 class="modal-title">Login</h4>
							<button type="button" class="close" onclick="location.href='/yumyum/Main'" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<form>
								<div class="form-group">
									<div id="naver_id_login"></div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<div class="form-group">
								<button type="button"
									class="btn btn-default text-white yellowgreen writbtn3"
									style="cursor: pointer" onclick="location.href='/yumyum/Main'">Main</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				var naver_id_login = new naver_id_login("5pRw5lS7lYqvs0xHnEv4",
						"http://localhost:9090/yumyum/resources/html/callback.html");
				var state = naver_id_login.getUniqState();
				naver_id_login.setButton("green", 3, 40);
				naver_id_login.setDomain("http://localhost:9090");
				naver_id_login.setState(state);
				naver_id_login.setPopup();
				naver_id_login.init_naver_id_login();
			</script>
		</div>
	</div>
</body>
</html>
