<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>웹뽀중고마켓 | 회원가입 -signin.jsp</title>
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

<style type="text/css">
.error {
   color: red;
   font-size: 12px;
}
</style>

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
         <h1 class="h1">SignIn</h1>
         <p>
            WebBBO 중고거래에 오신 것을 환영합니다!<br>----- 회원가입 -----
         </p>
      </div>
   </div>


   <!-- Start Contact -->
   <div class="container py-5">
      <div class="row py-5">
         <form class="col-md-9 m-auto" action="signin.do" method="post"
            role="form">
            <div class="row">
               <div class="mb-3">
                  <label for="inputsubject">Name</label> <input type="text"
                     class="form-control mt-1" id="name" name="mname"
                     placeholder="실명을 입력하세요." required> <span id="nameError"
                     class="error"></span>

               </div>
               <br>
               <div class="mb-3">
                  <label for="inputsubject">Nickname</label> <input type="text"
                     class="form-control mt-1" id="nickname" name="mnick"
                     placeholder="닉네임을 입력하세요." required> <span id="nickError"
                     class="error"></span>
               </div>
               <br>
               <div class="mb-3">
                  <label for="inputsubject">ID</label> <input type="text"
                     class="form-control mt-1" id="uid" name="mid"
                     placeholder="아이디를 입력하세요." required> <span id="idError"
                     class="error"></span>
               </div>
               <br>
               <div class="mb-3">
                  <label for="inputsubject">Password</label> &nbsp;&nbsp;&nbsp; <input
                     type="password" class="form-control mt-1" id="upw" name="mpw"
                     placeholder="비밀번호를 입력하세요." required> <span id="pwError"
                     class="error"></span>
               </div>
               <br>
               <div class="mb-3">
                  <label for="inputsubject">Password verification</label> <input
                     type="password" class="form-control mt-1" id="upw2" name="mpw2"
                     placeholder="비밀번호를 재확인하세요." required> <span id="pw2Error"
                     class="error"></span>
               </div>
               <br>
               <div class="mb-3">
                  <input type="button" style="width: 100%; margin-top: 10px;"
                     class="btn btn-success btn-lg px-3"
                     onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
               </div>
               <br>
               <div class="mb-3">
                  <label for="inputsubject">Address</label>
                  <!--
                    <input type="text" class="form-control mt-1" id="subject" name="subject" placeholder="Subject">
                     -->
                  <input readonly="readonly" required type="text" class="form-control mt-1"
                     id="sample5_address" name="addr" placeholder="주소 검색을 이용해주세요.">
                  <span id="sample5_addressError" class="error" ></span>
               </div>
               <br>
               <div class="mb-3">
                  <label for="inputsubject">Detailed-Address</label> <input
                     type="text" class="form-control mt-1" id="detailAddress"
                     name="addrapt" placeholder="상세주소를 입력하세요." required><span
                     id="dtAddressError" class="error"></span>
               </div>
               <div id="map"
                  style="width: 100%; height: 300px; margin-top: 10px; margin-bottom: 16px; display: none"></div>
               

               <br>
               <div class="mb-3">
                  <label for="inputsubject">Phone number</label> <input type="text"
                     class="form-control mt-1" id="handphone" name="mphone"
                     placeholder="(-) 없이 번호를 입력하세요." required> <span id="phoneError"
                     class="error"></span> <input type="button"
                     class="form-control mt-1" id="send-sms" name="send-sms"
                     value="문자 인증" disabled="disabled"> <input type="text"
                     class="form-control mt-1" id="phonecheck" name="phonecheck"
                     placeholder="SMS 인증코드를 입력하세요." required> <span
                     id="pcError" class="error"></span>
               </div>
               <br>
               <div class="mb-3">
                  <label for="inputsubject">E-mail</label> <input type="text"
                     class="form-control mt-1" id="email" name="memail"
                     placeholder="이메일을 입력하세요." required> <span id="emailError"
                     class="error"></span> <input type="button"
                     class="form-control mt-1" id="send-email" name="send-email"
                     value="이메일 인증" disabled="disabled"> <input type="text"
                     class="form-control mt-1" id="emailcheck" name="emailcheck"
                     placeholder="이메일 인증코드를 입력하세요." required> <span
                     id="ecError" class="error"></span>
               </div>
               <div class="mb-3">
               <label for="inputsubject">필수동의</label><br>
                  <input type="checkbox" id="policyp" required><a href="javascript:policy_person()">&nbsp;개인정보처리방침</a><br>
                  <input type="checkbox" id="policys" required><a href="javascript:policy_service()">&nbsp;서비스약관</a>
               </div>
               <br> <br> <br>
               <div class="mb-3">
                  <button type="submit" id="nickbtn" style="width: 100%;"
                     class="btn btn-success btn-lg px-3" onclick="signin_check();">가입하기</button>
               </div>
            </div>
         </form>
      </div>
   </div>
   <!-- End Contact -->
   <script type="text/javascript">
      function policy_person(){
         window.open(
            "https://policies.google.com/privacy?hl=ko","width=400,height=300"   
         );
      }
      function policy_service(){
         window.open(
               "https://policies.google.com/terms?hl=ko","width=400,height=300"
            );
      }
   </script>


   <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=
&libraries=services"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div
      mapOption = {
         center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
         level : 5
      // 지도의 확대 레벨
      };

      //지도를 미리 생성
      var map = new daum.maps.Map(mapContainer, mapOption);
      //주소-좌표 변환 객체를 생성
      var geocoder = new daum.maps.services.Geocoder();
      //마커를 미리 생성
      var marker = new daum.maps.Marker({
         position : new daum.maps.LatLng(37.537187, 127.005476),
         map : map
      });

      function sample5_execDaumPostcode() {
         new daum.Postcode({
            oncomplete : function(data) {
               var addr = data.address; // 최종 주소 변수

               // 주소 정보를 해당 필드에 넣는다.
               document.getElementById("sample5_address").value = addr;
               // 주소로 상세 정보를 검색
               geocoder.addressSearch(data.address, function(results,
                     status) {
                  // 정상적으로 검색이 완료됐으면
                  if (status === daum.maps.services.Status.OK) {

                     var result = results[0]; //첫번째 결과의 값을 활용

                     // 해당 주소에 대한 좌표를 받아서
                     var coords = new daum.maps.LatLng(result.y,
                           result.x);
                     // 지도를 보여준다.
                     mapContainer.style.display = "block";
                     map.relayout();
                     // 지도 중심을 변경한다.
                     map.setCenter(coords);
                     // 마커를 결과값으로 받은 위치로 옮긴다.
                     marker.setPosition(coords)
                  }
               });
            }
         }).open();
      }
   </script>

   <script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"></script>


   <script type="text/javascript">
      $("#nickname").on("focusout", function() {

         var mnick = $(this).val();
         
         $.ajax({
            type : "post",
            url : "nickUrl.jsp",
            data : {
               "mnick" : mnick
            },
            dataType : "json",
            success : function(result) {
               
               console.log(result);
               
               if($("#nickname").val() == ""){
                  $("#nickError").text("필수 정보입니다.");
               } else{
                  if (result == "0") {
                     $("#nickError").text("사용 가능한 닉네임입니다.");
                     $("#nickError").css("color", "green");
                  }  else {
                     $("#nickError").text("사용 불가능한 닉네임입니다.");
                     $("#nickError").css("color", "red");
                     $("#nickname").val('');
                  }
               }
               
            },
            error : function() {
               console.log('에러 발생');
               console.log(err.status + " | " + err.errText);
            }
         });
      });
   </script>

   <script type="text/javascript">
      $("#uid").on("focusout", function() {

         var mid = $(this).val();
         

         $.ajax({
            type : "post",
            url : "idUrl.jsp",
            data : {
               "mid" : mid
            },
            dataType : "json",
            success : function(result) {
               
               if($("#uid").val() == ""){
                  $("#idError").text("필수 정보입니다.");
               } else {
                  if (result == 0) {
                     $("#idError").text("사용 가능한 아이디입니다.");
                     $("#idError").css("color", "green");
                  }  else {
                     $("#idError").text("사용 불가능한 아이디입니다.");
                     $("#idError").css("color", "red");
                     $("#uid").val('');
                  }
               }
               
            },
            error : function() {
               console.log('에러 발생');
               console.log(err.status + " | " + err.errText);
            }
         });
      });
   </script>


   <script type="text/javascript">
      var keyCode = null;
      $("#send-sms").on("click", function() {

         var phNum = $("#handphone").val();
         
         $.ajax({
            type : "post",
            url : "sendSMSUrl.jsp",
            data : {
               "phNum" : phNum
            },
            dataType : "text",
            success : function(result) {
               
               keyCode = result.substr(result.length-5,5);
               console.log("문자 전송 완료" + keyCode);
               alert("인증코드를 보냈습니다. 문자를 확인해주세요!");
               
            },
            error : function() {
               console.log('에러 발생');
               console.log(err.status + " | " + err.errText);
            }
         });
      });

      $("#phonecheck").on("focusout", function() {

         var input = $(this).val();
         
         if($("#handphone").attr("readonly") == "readonly"){
            $("#pcError").text("이미 인증을 완료하였습니다.");
         }
         else{
            
            if ($("#phonecheck").val() == "") {
               $("#pcError").text("인증 필수");
            } else{
               if (input != keyCode) {
                  $("#pcError").text("인증번호 불일치 재인증 요망");
                  $("#phonecheck").val('');
               } else {
                  $("#pcError").text("인증 성공");
                  $("#pcError").css("color", "green");
                  $("#phonecheck").attr("readonly", "readonly");
                  $("#handphone").attr("readonly", "readonly");
               }
            }
            
         }
         
         
      });
   </script>


   <script type="text/javascript">
      var keyCode = null;
      $("#send-email").on("click", function() {

         var emAdrr = $("#email").val();
         
         $.ajax({
            type : "post",
            url : "sendMailUrl.jsp",
            data : {
               "emAdrr" : emAdrr
            },
            dataType : "text",
            success : function(result) {
               
               keyCode = result.substr(result.length-5,5);
               console.log("메일 전송 완료" + keyCode);
               alert("인증코드를 보냈습니다. 메일을 확인해주세요!");
               
            },
            error : function(request, status, error) {
               console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
         });
      });

      $("#emailcheck").on("focusout", function() {

         var input = $(this).val();
         
         console.log("input: "+input);
         console.log("keyCode: "+keyCode);
         
         if($("#emailcheck").attr("readonly") == "readonly"){
            $("#ecError").text("이미 인증을 완료하였습니다.");
         }
         else{
            
            if ($("#emailcheck").val() == "") {
               $("#ecError").text("인증 필수");
            } else{
               if (input != keyCode) {
                  $("#ecError").text("인증번호 불일치 재인증 요망");
                  $("#emailcheck").val('');
               } else {
                  $("#ecError").text("인증 성공");
                  $("#ecError").css("color", "green");
                  $("#emailcheck").attr("readonly", "readonly")
                  $("#email").attr("readonly", "readonly");
               }
            }
            
         }

      });
   </script>


   <script type="text/javascript">
      document.getElementById("name").addEventListener("focusout", nameCheck);
      document.getElementById("upw").addEventListener("focusout", pwCheck);
      document.getElementById("upw2").addEventListener("focusout", pw2Check);
      document.getElementById("handphone").addEventListener("focusout",
            phoneCheck);
      document.getElementById("email").addEventListener("focusout",
            emailCheck);
      document.getElementById("detailAddress").addEventListener("focusout",
            dtAddressCheck);
      document.getElementById("sample5_address").addEventListener("focusout",
            AddressCheck);

      function nameCheck() {

         var pattern_num = /[0-9]/;
         var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;

         if (document.getElementById("name").value.indexOf(" ") >= 0
               || pattern_spc.test(document.getElementById("name").value)
               || pattern_num.test(document.getElementById("name").value)) {
            document.getElementById("nameError").innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
         } else if (document.getElementById("name").value === "") {
            document.getElementById("nameError").innerHTML = "필수 정보입니다.";
         } else {
            document.getElementById("nameError").innerHTML = "";
         }
      }

      function pwCheck() {

         var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

         if (document.getElementById("upw").value === "") {
            document.getElementById("pwError").innerHTML = "필수 정보입니다.";
         } else if (!pwPattern.test(document.getElementById("upw").value)) {
            document.getElementById("pwError").innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
            document.getElementById("upw").value = "";
         } else {
            document.getElementById("pwError").innerHTML = "";
            document.getElementById("upw2").value = "";
         }
      }

      function pw2Check() {

         if (document.getElementById("upw2").value === "") {
            document.getElementById("pw2Error").innerHTML = "필수 정보입니다.";
         } else if (document.getElementById("upw2").value !== document
               .getElementById("upw").value) {
            document.getElementById("pw2Error").innerHTML = "비밀번호가 일치하지 않습니다.";
            document.getElementById("upw2").value = "";
         } else {
            document.getElementById("pw2Error").innerHTML = "";
         }
      }

      function phoneCheck() {

         var isPhoneNum = /^(?=.*[0-9]).{11}$/;
         ;

         if (document.getElementById("handphone").value === "") {
            document.getElementById("phoneError").innerHTML = "필수 정보입니다.";
            document.getElementById("send-sms").setAttribute( 'disabled', 'disabled' );
         } else if (!isPhoneNum.test(document.getElementById("handphone").value)) {
            document.getElementById("phoneError").innerHTML = "형식에 맞지 않는 번호입니다.";
            document.getElementById("send-sms").setAttribute( 'disabled', 'disabled' );
         } else {
            document.getElementById("phoneError").innerHTML = "";
            document.getElementById("send-sms").removeAttribute("disabled");
         }
      }

      function emailCheck() {

         var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

         if (document.getElementById("email").value === "") {
            document.getElementById("emailError").innerHTML = "필수 정보입니다.";
            document.getElementById("send-email").setAttribute( 'disabled', 'disabled' );
         } else if (!emailPattern
               .test(document.getElementById("email").value)) {
            document.getElementById("emailError").innerHTML = "형식에 맞지 않는 이메일입니다.";
            document.getElementById("send-email").setAttribute( 'disabled', 'disabled' );
         } else {
            document.getElementById("emailError").innerHTML = "";
            document.getElementById("send-email").removeAttribute("disabled");
         }
      }

      function dtAddressCheck() {

         if (document.getElementById("detailAddress").value === "") {
            document.getElementById("dtAddressError").innerHTML = "필수 정보입니다.";
         } else {
            document.getElementById("dtAddressError").innerHTML = "";
         }
      }

      function AddressCheck() {

         if (document.getElementById("sample5_address").value === "") {
            document.getElementById("sample5_addressError").innerHTML = "필수 정보입니다.";
         } else {
            document.getElementById("sample5_addressError").innerHTML = "";
         }
      }
   </script>


   <script type="text/javascript">
      function signin_check() {

         var upw = document.getElementById("upw");
         var upw2 = document.getElementById("upw2");

         var name = document.getElementById("name");
         var nickname = document.getElementById("nickname");
         var uid = document.getElementById("uid");
         var address = document.getElementById("sample5_address");
         var detailAddress = document.getElementById("detailAddress");
         var handphone = document.getElementById("handphone");
         var phonecheck = document.getElementById("phonecheck");
         var email = document.getElementById("email");
         var emailcheck = document.getElementById("emailcheck");
         var checkboxp = document.getElementById("policyp");
         var checkboxs = document.getElementById("policys");

         //값을 입력하지 않았을때 alert창
         if (name.value == "") {
            alert("이름을 입력하세요.");
            name.focus();
            return false; //아래코드부터 진행되지 않도록
         }

         var pattern_num = /[0-9]/;
         var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;

         if (name.value.indexOf(" ") >= 0 || pattern_spc.test(name.value)
               || pattern_num.test(name.value)) {
            alert("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
            name.focus();
            return false; //아래코드부터 진행되지 않도록
         }

         if (nickname.value == "") {
            alert("닉네임을 입력하세요.");
            nickname.focus();
            return false;
         }

         if (uid.value == "") {
            alert("아이디를 입력하세요.");
            uid.focus();
            return false;
         }
         if (upw.value == "") {
            alert("비밀번호를 입력하세요.");
            upw.focus();
            return false;
         }

         var upwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

         if (!upwReg.test(upw.value)) {
            alert("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
            upw.focus();
            return false;
         }
         if (upw2.value == "") {
            alert("비밀번호 확인란을 입력하세요.");
            upw2.focus();
            return false;
         }
         if (upw.value != upw2.value) {
            alert("비밀번호가 일치하지 않습니다.");
            upw2.focus();
            return false;
         }
         if (address.value == "") {
            alert("주소를 입력하세요.");
            address.focus();
            return false;
         }
         if (detailAddress.value == "") {
            alert("상세주소를 입력하세요.");
            detailAddress.focus();
            return false;
         }
         if (handphone.value == "") {
            alert("핸드폰번호를 입력하세요.");
            handphone.focus();
            return false;
         }
         var handphoneReg = /^(?=.*[0-9]).{11}$/;

         if (!handphoneReg.test(handphone.value)) {
            alert("형식에 맞지 않는 번호입니다.");
            handphone.focus();
            return false;
         }

         if (phonecheck.value == "") {
            alert("핸드폰 인증번호를 입력하세요.");
            phonecheck.focus();
            return false;
         }
         if (email.value == "") {
            alert("이메일을 입력하세요.");
            email.focus();
            return false;
         }
         var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

         if (!emailReg.test(email.value)) {
            alert("형식에 맞지 않는 이메일입니다.");
            email.focus();
            return false;
         }
         if (emailcheck.value == "") {
            alert("이메일 인증코드를 입력하세요.");
            emailcheck.focus();
            return false;
         }
         if(!checkboxp.checked){
            alert("개인정보처리는 필수동의 사항입니다.");
            return false;
         }
         if(!checkboxs.checked){
            alert("서비스약관은 필수동의 사항입니다.");
            return false;
         }
         
         alert("회원가입을 축하드립니다!!");
         location.href = 'main.jsp';
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