<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags" %>
<!-- JSTL 사용하려면 얘 추가해야함 -->

<!DOCTYPE html>
<html>
<head>
<title>웹뽀중고마켓 | 중고마켓의 모든 것</title>
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
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->

<style type="text/css">
	.img-fluid{
		width: 100%;
	}
</style>

</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Start Banner Hero -->
	<div id="template-mo-zay-hero-carousel" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
		







		</div>
		<a class="carousel-control-prev text-decoration-none w-auto ps-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="prev"> <i class="fas fa-chevron-left"></i>
		</a> <a class="carousel-control-next text-decoration-none w-auto pe-3"
			href="#template-mo-zay-hero-carousel" role="button"
			data-bs-slide="next"> <i class="fas fa-chevron-right"></i>
		</a>
	</div>
	<!-- End Banner Hero -->




	<!-- Start Featured Product -->
	<section class="bg-light">
		<div class="container py-5">
			<div class="row text-center py-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">중고 거래 매물</h1>
					<p>중고 거래부터 동네 정보까지, 이웃과 함께해요.<br>가깝고 따뜻한 당신의 근처를 만들어요.</p>
				</div>
			</div>


			<div class="row">

				<c:forEach var="v" items="${pdatas}">
					<div class="col-12 col-md-4 mb-4">
						<div class="card h-100">
							<a href="detail.do?ppk=${v.ppk}"> <img src="${pageContext.request.contextPath}/file/${v.ppic}"
								class="card-img-top" alt="...">
							</a>
							<div class="card-body">
								<a href="detail.do?ppk=${v.ppk}"
									class="h2 text-decoration-none text-dark">${v.ptitle}</a>
								<p style="margin-top: 16px;">${v.pprice}원</p>
								<p>${v.pmid}</p>
								<p class="card-text">${v.pcontent}</p>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</section>
	<!-- End Featured Product -->

	<lee:plus/>
	

	<%@include file="footer.jsp"%>


	<!-- Start Script -->
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<!-- End Script -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	
		
	<script type="text/javascript">
		$.ajax({
			type : "post",
			url : "data.json",
			dataType : "json",
			success : function(data) {

			console.log('로드성공');
			console.log(data);

			var ele = "";

			
				
			$(".carousel-inner").append(ele);
			
			for(var i=0;i<data.length;i++){

	            if(i==0){
	            	ele += "<div class='carousel-item active'>";
	            } else{
	            	ele += "<div class='carousel-item'>";
	            }
				ele += "<div class='order-lg-last'>";
				ele += "<a href='"+data[i].href+"'><img class='img-fluid' src='"+data[i].src+"' alt='제품사진'></a>";
				ele += "</div>";
				ele += "</div>";
	        }
			
			$(".carousel-inner").append(ele);

			},
			error : function() { 
				console.log('에러발생!');
				console.log(err.status + " | " + err.errText);
			}
		});
	</script>
	
</body>

</html>