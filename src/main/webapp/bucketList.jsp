<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>웹뽀중고마켓 | 찜목록</title>
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
      <div class="row">

         <div class="col-lg-3" style="margin-bottom: 24px;">
            <h1 class="h2 pb-4">${nick}님의 찜 목록</h1>
            <a class="btn btn-success btn-lg px-3" href="bucketdelall.do">
               찜목록 전체 삭제 </a>
         </div>

         <div class="col-lg-9">
            <div class="row">

               <c:forEach var="v" items="${pdatas}">
                  <div class="col-md-4">
                     <div class="card mb-4 product-wap rounded-0">
                        <div class="card rounded-0">
                           <a style="cursor:pointer;" href="detail.do?ppk=${v.ppk}"><img class="card-img rounded-0 img-fluid" src="${pageContext.request.contextPath}/file/${v.ppic}"></a>
                        </div>
                        <div class="card-body">
                           <a href="detail.do?ppk=${v.ppk}" class="h3 text-decoration-none">${v.ptitle}</a>
                           <p>${v.pmid}</p>
                           <p class="text-center mb-0">${v.pprice}원</p>
                        </div>
                     </div>
                  </div>
               </c:forEach>


            </div>
         </div>
      </div>
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