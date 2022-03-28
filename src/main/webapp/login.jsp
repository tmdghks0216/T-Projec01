<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹뽀중고마켓 | 로그인</title>
</head>
<head>
    <title>Zay Shop - Contact</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

    <!-- Load map styles -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
        <%@ include file="header.jsp" %>


    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1">Login</h1>
            <p>
                WebBBO 중고거래에 오신 것을 환영합니다!<br>
                ----- 로그인 -----
            </p>
        </div>
    </div>


    <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form class="col-md-9 m-auto" action="login.do" method="post" role="form">
                <div class="row">
                    <div class="mb-3">
                        <label for="inputname">ID</label>
                        <input type="text" class="form-control mt-1" name="mid" placeholder="아이디를 입력하세요.">
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputsubject">PASSWORD</label>
                    <input type="password" class="form-control mt-1" name="mpw" placeholder="비밀번호를 입력하세요.">
                </div>
                <div class="row">
                    <div class="col text-end mt-2">
                    	<a style="text-decoration: none; color: black;" class="sbtn-success" href="pwchange.jsp">비밀번호 찾기</a> &nbsp;/&nbsp;
                    	<a style="text-decoration: none; color: black;" class="sbtn-success" href="signin.jsp">회원가입</a>
                        <button style="margin-left: 20px;" type="submit" class="btn btn-success btn-lg px-3">로그인</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Contact -->


<%@include file="footer.jsp" %>

    <!-- Start Script -->
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
</body>

</html>