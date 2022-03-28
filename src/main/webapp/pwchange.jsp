<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>웹뽀중고마켓 | 비밀번호 변경</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.ico">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/templatemo.css">
<link rel="stylesheet" href="assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">

<!-- Load map styles -->
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
	integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
	crossorigin="" />
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
	<%@ include file="header.jsp"%>

	<!-- Start Content Page -->
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">비밀번호 찾기</h1>
			<p>
				비밀번호 찾기 페이지입니다.<br> 아이디를 입력하시면 입력하셨던 이메일로 임시 비밀번호가 발송되니, 해당
				임시비밀번호로 재로그인하세요.
			</p>
		</div>
	</div>


	<!-- Start Contact -->
	<div class="container py-5">
		<div class="row py-5">
			<form class="col-md-9 m-auto" action="sendpw.do" method="post"
				role="form">
				<div class="row">
					<div class="mb-3">
						<label for="inputsubject">ID</label> <input type="text"
							class="form-control mt-1" id="subject" name="mid"
							placeholder="아이디를 입력하세요.">
					</div>
					<div class="mb-3">
						<input type="submit" class="form-control mt-1" id="subject"
							name="send-Email" value="임시 비밀번호 보내기" onclick="sendEmail();">
					</div>
				</div>
				<div class="row">
					<div class="col text-end mt-2">
						<a class="btn btn-success btn-lg px-3" href="login.jsp">로그인
							페이지로 이동</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- End Contact -->
	<script type="text/javascript">
   function sendEmail(){
      alert("이메일을 발송했습니다!");
   }

</script>

	<%@include file="footer.jsp"%>

	<!-- Start Script -->
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<!-- End Script -->
</body>
</html>