<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>웹뽀중고마켓 | 제품 상세</title>
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
            <div class="col-lg-5 mt-5">
               <div class="card mb-3">
                  <img class="card-img img-fluid" src="${pageContext.request.contextPath}/file/${pdata.ppic}" alt="제품 사진"
                     id="product-detail">
               </div>

            </div>
            <!-- col end -->
            <div class="col-lg-7 mt-5">
               <div class="card">
                  <div class="card-body">
                     <div style="text-align: right;">
                     <h6>${pdata.pdate}</h6>
                     <h6 id="cnt">찜 횟수 ${pdata.pbkcnt} ㆍ 조회수 ${pdata.pcnt}</h6>
                     </div>
                     <h1 class="h2">${pdata.ptitle}</h1>
                     <p class="h3 py-2">${pdata.pprice}원</p>
                     <ul class="list-inline">
                        <li class="list-inline-item">
                           <h6>작성자:</h6>
                        </li>
                        <li class="list-inline-item">
                           <p class="text-muted">
                              <strong>${pdata.pmid}</strong>
                           </p>
                        </li>
                        <br>
                        <li class="list-inline-item">
                           <h6>주소:</h6>
                        </li>
                        <li class="list-inline-item">
                           <p class="text-muted">
                              <strong>${addr}</strong>
                           </p>
                        </li>
                     </ul>

                     <h6>상세설명:</h6>
                     <p>${pdata.pcontent}</p>


                     <form action="trade.do?ppk=${pdata.ppk}" method="POST">
                        <div class="row pb-3">
                           <div class="col d-grid">
                              <div style="text-align: right; margin-top: 8px;">



                                 <c:choose>
                                    <c:when test="${bkdata == null}">
                                       <img style="cursor:pointer;" id="heartbtn" alt="찜 버튼" src="assets/img/heart.png">
                                    </c:when>
                                    <c:otherwise>
                                       <img style="cursor:pointer;" id="heartbtn" alt="찜 버튼"
                                          src="assets/img/heart (1).png">
                                    </c:otherwise>
                                 </c:choose>



                              </div>
                           </div>
                           <div class="col d-grid">

                           <c:if test="${id != null }">
                                    <c:choose>
                                       <c:when test="${pdata.pstate == 0}">
                                          <button id="trade" type="submit" class="btn btn-success btn-lg">거래요청</button>
                                       </c:when>
                                       <c:otherwise>
                                          <button class="btn btn-success btn-lg" disabled="disabled">거래완료</button>
                                       </c:otherwise>
                                    </c:choose>
                           </c:if>
                           
                           <c:if test="${id == null}">
                              <c:choose>
                                       <c:when test="${pdata.pstate == 0}">
                                          <button id="trade" type="submit" class="btn btn-success btn-lg" disabled="disabled">거래요청</button>
                                       </c:when>
                                       <c:otherwise>
                                          <button class="btn btn-success btn-lg" disabled="disabled">거래완료</button>
                                       </c:otherwise>
                                    </c:choose>                  
                           </c:if>
                           
                           </div>
                        </div>
                     </form>
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
            <h4>판매 위치</h4>
         </div>

         <!--Start Carousel Wrapper-->
         <div>
            <div id="map" style="width: 100%; height: 350px; flex-grow: 1;"></div>
         </div>
      </div>
   </section>
   <!-- End Article -->


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
      $("#heartbtn").on("click", function() {
         
         if(${id != null}) {
            
            var productpk = "${pdata.ppk}";
            var memberid = "${id}";
   
            $.ajax({
               type : "post",
               url : "heartUrl.jsp",
               data : {
                  "productpk" : productpk,
                  "memberid" : memberid
               },
               dataType : "json",
               success : function(result) {
                  
                  console.log(result);
                  
                  if(${bkdata == null}){
                     if (result == 1) {
                        $("#heartbtn").attr('src', 'assets/img/heart (1).png');
                        $("#cnt").text("찜 횟수 ${pdata.pbkcnt+1} ㆍ 조회수 ${pdata.pcnt}");
                     } else {
                        $("#heartbtn").attr('src', 'assets/img/heart.png');
                        $("#cnt").text("찜 횟수 ${pdata.pbkcnt} ㆍ 조회수 ${pdata.pcnt}");
                     }
                  }
                  else{
                     if (result == 1) {
                         $("#heartbtn").attr('src', 'assets/img/heart (1).png');
                         $("#cnt").text("찜 횟수 ${pdata.pbkcnt} ㆍ 조회수 ${pdata.pcnt}");
                      } else {
                         $("#heartbtn").attr('src', 'assets/img/heart.png');
                         $("#cnt").text("찜 횟수 ${pdata.pbkcnt-1} ㆍ 조회수 ${pdata.pcnt}");
                      }
                  }
                  
               },
               error : function() {
                  console.log('에러 발생');
                  console.log(err.status + " | " + err.errText);
               }
            });
         }
         else{
            alert('로그인 후 이용 부탁드립니다!');
         }
         
      });
   </script>

   <script type="text/javascript">
      $("#trade").on("click", function() {
         if(${id != null}) {
            alert('판매자에게 거래를 요청하셨습니다!');
         }
      });
   </script>

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

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey="></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
         level : 6
      // 지도의 확대 레벨
      };

      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();

      var address = "${addr}";
      geocoder
            .addressSearch(
                  address,
                  function(result, status) {

                     // 정상적으로 검색이 완료됐으면 
                     if (status === kakao.maps.services.Status.OK) {

                        var coords = new kakao.maps.LatLng(result[0].y,
                              result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker = new kakao.maps.Marker({
                           map : map,
                           position : coords
                        });

                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow = new kakao.maps.InfoWindow(
                              {
                                 content : '<div style="width:150px;text-align:center;padding:6px 0;">직거래 가능 지역</div>'
                              });
                        infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                     }

                     // 지도에 표시할 원을 생성합니다
                     var circle = new kakao.maps.Circle({
                        center : coords, // 원의 중심좌표 입니다 
                        radius : 1000, // 미터 단위의 원의 반지름입니다 
                        strokeWeight : 5, // 선의 두께입니다 
                        strokeColor : '#75B8FA', // 선의 색깔입니다
                        strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                        strokeStyle : 'dashed', // 선의 스타일 입니다
                        fillColor : '#CFE7FF', // 채우기 색깔입니다
                        fillOpacity : 0.7
                     // 채우기 불투명도 입니다   
                     });

                     // 지도에 원을 표시합니다 
                     circle.setMap(map);
                  });
   </script>

</body>

</html>