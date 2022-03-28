<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>웹뽀중고마켓 | 제품검색</title>
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
</head>

<body>
	<%@ include file="header.jsp"%>

	<!-- Start Content -->
	<div class="container py-5">
		<form name="" action="search.do" method="post"
			class="modal-content modal-body border-0 p-0">
			<div class="row">
				<div class="col-lg-3">
					<h1 class="h2 pb-4">검색 페이지</h1>


					<div class="input-group mb-2">
						<input type="text" class="form-control" id="inputModalSearch"
							name="keywords" value="${keywords}" placeholder="Search">
						<button type="submit"
							class="input-group-text bg-success text-light">
							<i class="fa fa-fw fa-search text-white"></i>
						</button>
					</div>
					<div class="input-group mb-2">
						<select class="form-control" name="topic" style="cursor: pointer;">
							<option ${topic=='ptitle' ? 'selected' : ''}
								style="cursor: pointer;" value="ptitle">제목</option>
							<option ${topic=='pmid' ? 'selected' : ''}
								style="cursor: pointer;" value="pmid">작성자</option>
						</select>
					</div>
					<div class="range_form">
						<label for="from">Price: from</label> <input class="form-control"
							name="from" type="number" id="from" value="${from}"> <label
							for="to">to</label> <input class="form-control" name="to"
							type="number" id="to" value="${to}">
					</div>


				</div>

				<div class="col-lg-9">
					<div style="margin-top: 16px; float: left;">
						<p>검색 결과</p>
					</div>
					<div style="float: right; margin-top: 12px;">
						<select class="form-control" style="cursor: pointer;" name="cate"
							onchange="javascript:searchCate.submit()">
							<option ${searchCondition=='inquiry' ? 'selected' : ''}
								style="cursor: pointer;" value="inquiry">조회순</option>
							<option ${searchCondition=='new' ? 'selected' : ''}
								style="cursor: pointer;" value="new">최신순</option>
						</select>
					</div>

					<div class="row" style="clear: both;">

						<c:forEach var="v" items="${pdatas}">
							<div class="col-md-4">
								<div class="card mb-4 product-wap rounded-0">
									<div class="card rounded-0">
										<a href="detail.do?ppk=${v.ppk}"><img
											class="card-img rounded-0 img-fluid"
											src="${pageContext.request.contextPath}/file/${v.ppic}"></a>
									</div>
									<div class="card-body">
										<a href="detail.do?ppk=${v.ppk}"
											class="h3 text-decoration-none">${v.ptitle}</a>
										<ul
											class="w-100 list-unstyled d-flex justify-content-between mb-0">
											<li>${v.pmid}</li>
										</ul>
										<p class="text-center mb-0">${v.pprice}원</p>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- End Content -->


	<lee:plus />

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