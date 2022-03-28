<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lee" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>

<head>
<title>웹뽀중고마켓 | 마이페이지</title>
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

<!-- Slick -->
<link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body>
   <%@ include file="header.jsp"%>


   <!-- Open Content -->
   <section class="bg-light">
      <div class="container pb-5">
         <div class="row">
            <div class="col-lg-7 mt-5" style="width: 100%">
               <div class="card">
                  <div class="card-body">
                     <h1 class="h2">내 정보</h1>
                     <ul class="list-inline" style="margin-bottom: 0px;">
                        <li class="list-inline-item">
                           <h6>
                              <strong>이름:</strong>
                           </h6>
                        </li>
                        <li class="list-inline-item">
                           <p class="text-muted" style="margin-bottom: 0px;">
                              <strong>${mdata.mname}</strong>
                           </p>
                        </li>
                     </ul>
                     <ul class="list-inline" style="margin-bottom: 0px;">
                        <li class="list-inline-item" style="margin-bottom: 0px;">
                           <h6>
                              <strong>아이디:</strong>
                           </h6>
                        </li>
                        <li class="list-inline-item">
                           <p class="text-muted" style="margin-bottom: 0px;">
                              <strong>${mdata.mid}</strong>
                           </p>
                        </li>
                     </ul>
                     <ul class="list-inline" style="margin-bottom: 0px;">
                        <li class="list-inline-item" style="margin-bottom: 0px;">
                           <h6>
                              <strong>닉네임:</strong>
                           </h6>
                        </li>
                        <li class="list-inline-item">
                           <p class="text-muted" style="margin-bottom: 0px;">
                              <strong>${mdata.mnick}</strong>
                           </p>
                        </li>
                     </ul>
                     <ul class="list-inline" style="margin-bottom: 0px;">
                        <li class="list-inline-item" style="margin-bottom: 0px;">
                           <h6>
                              <strong>주소:</strong>
                           </h6>
                        </li>
                        <li class="list-inline-item">
                           <p class="text-muted" style="margin-bottom: 0px;">
                              <strong>${mdata.addr}</strong>
                           </p>
                        </li>
                     </ul>
                     <ul class="list-inline" style="margin-bottom: 0px;">
                        <li class="list-inline-item" style="margin-bottom: 0px;">
                           <h6>
                              <strong>휴대폰번호:</strong>
                           </h6>
                        </li>
                        <li class="list-inline-item">
                           <p class="text-muted" style="margin-bottom: 0px;">
                              <strong id="phNumText">${mdata.mphone}</strong> 
                              <a style="text-decoration: none;" onclick="phoneNumChange()" href="#">수정</a>
                           </p>
                        </li>
                     </ul>
                     <ul class="list-inline" style="margin-bottom: 0px;">
                        <li class="list-inline-item" style="margin-bottom: 0px;">
                           <h6>
                              <strong>이메일:</strong>
                           </h6>
                        </li>
                        <li class="list-inline-item">
                           <p class="text-muted" style="margin-bottom: 0px;">
                              <strong id="emailText">${mdata.memail}</strong> <a
                                 style="text-decoration: none;" onclick="emailChange()"  href="#">수정</a>
                           </p>
                        </li>
                     </ul>
                     <ul class="list-unstyled text-light footer-link-list"
                        style="text-align: right;">
                        <li><a class="text-decoration-none"
                           href="userchangepage.do"><strong>수정하기</strong></a></li>
                        <li><a class="text-decoration-none"
                           href="Mdelete.do?mid=${mdata.mid}"><strong>회원탈퇴</strong></a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Close Content -->

   <!-- Start Article -->
   <section class="py-5">
      <div class="container">
         <div class="row text-left p-2 pb-3">
            <h4>내 판매 목록</h4>
         </div>

         <!--Start Carousel Wrapper-->
         <div id="carousel-related-product">

            <c:forEach var="v" items="${pdatas}">
               <div class="p-2 pb-3">
                  <div class="product-wap card rounded-0">
                     <div class="card rounded-0">
                        <a href="detail.do?ppk=${v.ppk}"><img
                           class="card-img rounded-0 img-fluid" src="${pageContext.request.contextPath}/file/${v.ppic}"></a>
                     </div>
                     <div class="card-body">
                        <a href="detail.do?ppk=${v.ppk}" class="h3 text-decoration-none">${v.ptitle}</a>
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
   </section>
   <!-- End Article -->

<lee:plus/>

   <%@include file="footer.jsp"%>

   <!-- Start Script -->
   <script src="assets/js/jquery-1.11.0.min.js"></script>
   <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
   <script src="assets/js/bootstrap.bundle.min.js"></script>
   <script src="assets/js/templatemo.js"></script>
   <script src="assets/js/custom.js"></script>
   <!-- End Script -->

   <!-- Start Slider Script -->
   <script src="assets/js/slick.min.js"></script>
   
   <script type="text/javascript">
   function phoneNumChange() {
      window.open(
               "phoneNumChange.jsp", "확인창", "width=470, height=550, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
}
   </script>
   <script type="text/javascript">
   function emailChange() {
      window.open(
               "emailChange.jsp", "확인창", "width=470, height=550, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
}
   </script>
   <script>
        $('#carousel-related-product').slick({
            infinite: true,
            arrows: false,
            slidesToShow: 4,
            slidesToScroll: 3,
            dots: true,
            responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                }
            ]
        });
    </script>
   <!-- End Slider Script -->

</body>

</html>