<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>웹뽀중고마켓 | 제품올리기</title>
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
<style>
/* 이미지 파일 넣는 */
.filebox label {
   display: inline-block;
   padding: .5em .75em;
   color: #fff;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   cursor: pointer;
   border-radius: .25em;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
}
</style>

</head>

<body>

   <%@ include file="header.jsp"%>


   <!-- Open Content -->
   <section class="bg-light">
      <div class="container pb-5">
         <div class="row">
            <form action="sale.do" method="post" enctype="multipart/form-data">
               <div class="col-lg-5 mt-5">
                  <div class="card mb-3">
                     <div id="image_container" style="text-align: center;"></div>
                  </div>
                  <div class="row">
                     <!--Start Controls-->
                     <!--End Controls-->
                     <!--Start Carousel Wrapper-->
                     <div id="multi-item-example"
                        class="col-10 carousel slide carousel-multi-item"
                        data-bs-ride="carousel">
                        <!--Start Slides-->
                        <div class="carousel-inner product-links-wap" role="listbox">
                        </div>
                        <!--End Slides-->
                        <!--  이미지 업로드 -->

                        <div class="filebox btn btn-success btn-lg"
                           style="text-align: center;">

                           <label for="image">이미지 업로드</label> <input type="file"
                              name="ppic" id="image" accept="image/*"
                              onchange="setThumbnail(event);" required="required" />
                        </div>
                        <!--  이미지 업로드 -->
                     </div>
                     <!--End Carousel Wrapper-->
                     <!--Start Controls-->
                     <!--End Controls-->
                  </div>
               </div>
               <!-- col end -->
               <div class="col-lg-7 mt-5">
                  <div class="card">
                     <div class="card-body">
                        <h1 class="h2">
                           <input style="width: 100%" type="text" name="ptitle"
                              placeholder="제목 입력">
                        </h1>
                        <p class="h3 py-2">
                           <input style="width: 100%" type="number" name="pprice"
                              placeholder="금액 입력">
                        </p>

                        <h6>상세설명:</h6>
                        <p>
                           
                     <textarea rows="12" cols="100" name="pcontent" style="width: 100%; height: 300px;" placeholder="물품에 대한 자세한 정보를 입력해주세요!"></textarea>
                         
                        </p>


                        <input type="hidden" name="product-title" value="Activewear">
                        <div class="row pb-3">
                           <div class="col d-grid"></div>
                           <div class="col d-grid">
                              <button type="submit" class="btn btn-success btn-lg"
                                 name="submit" value="addtocard">제품 등록</button>
                           </div>

                        </div>

                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </section>
   <!-- Close Content -->

   <!-- End Article -->


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
   <script>
      $('#carousel-related-product').slick({
         infinite : true,
         arrows : false,
         slidesToShow : 4,
         slidesToScroll : 3,
         dots : true,
         responsive : [ {
            breakpoint : 1024,
            settings : {
               slidesToShow : 3,
               slidesToScroll : 3
            }
         }, {
            breakpoint : 600,
            settings : {
               slidesToShow : 2,
               slidesToScroll : 3
            }
         }, {
            breakpoint : 480,
            settings : {
               slidesToShow : 2,
               slidesToScroll : 3
            }
         } ]
      });
   </script>
   <!-- End Slider Script -->
   <script>
      function setThumbnail(event) {
         if (document.querySelector("div#image_container img") == null) {
            var reader = new FileReader();
            reader.onload = function(event) {
               var img = document.createElement("img");
               img.setAttribute("src", event.target.result);
               document.querySelector("div#image_container").appendChild(
                     img);
            };
            reader.readAsDataURL(event.target.files[0]);
         } else {
            var reader = new FileReader();
            reader.onload = function(event) {
               var img = document.querySelector("div#image_container img");
               img.setAttribute("src", event.target.result);
            };
            reader.readAsDataURL(event.target.files[0]);
         }
      }
   </script>

</body>

</html>