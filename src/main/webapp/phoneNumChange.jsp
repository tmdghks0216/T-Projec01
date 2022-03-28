<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>웹뽀중고마켓 | 핸드폰번호 변경</title>
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
   <!-- Start Content Page -->
   <div class="container-fluid bg-light py-5">
      <div class="col-md-6 m-auto text-center">
         <h1 class="h1">휴대폰번호 변경</h1>
         <p>
         ---------- 변경할 휴대폰 번호를 입력하세요 ----------
         </p>
      </div>
   </div>


   <!-- Start Contact -->
   <div class="container py-5">
      <div class="row py-5">
         <form class="col-md-9 m-auto" action="phoneUpdate.do" method="post"
            role="form">
            <div class="row">
               <div class="mb-3">
                  <label for="inputsubject">Phone number</label> 
                  <input type="text" class="form-control mt-1" id="handphone" name="mphone" placeholder="(-) 없이 번호를 입력하세요." required> 
                  <span id="phoneError" class="error"> </span>
                     <input type="button" class="form-control mt-1" id="send-sms" name="send-sms" value="문자 인증" disabled="disabled"> 
                     <input type="text" class="form-control mt-1" id="phonecheck" name="phonecheck" placeholder="SMS 인증코드를 입력하세요." required> 
                     <span id="pcError" class="error"> </span>
                     <input id="checkOK" style="width: 100%; margin-top: 4px;" type="submit" class="btn btn-success btn-lg px-3" onclick="saveAndRefresh()" value="수정 완료" disabled="disabled"> 
               </div>
            </div>
         </form>
      </div>
   </div>
   <!-- End Contact -->


   <script src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"></script>

	<script type="text/javascript">
		function saveAndRefresh() {
			var phNum = $("#handphone").val();
			$(opener.document).find("#phNumText").text(phNum);
	       	window.open("about:blank", "_selt").close();
		}
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
	               $("#checkOK").removeAttr("disabled");
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
            }
         }
      });
   </script>


   <script type="text/javascript">
      document.getElementById("handphone").addEventListener("focusout",
            phoneCheck);
      document.getElementById("email").addEventListener("focusout",
            emailCheck);

      function phoneCheck() {

         var isPhoneNum = /^(?=.*[0-9]).{11}$/;
         ;

         if (document.getElementById("handphone").value === "") {
            document.getElementById("phoneError").innerHTML = "필수 정보입니다.";
            document.getElementById("send-sms").setAttribute( 'disabled', 'disabled' );
         } else if (!isPhoneNum
               .test(document.getElementById("handphone").value)) {
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
         } else if (!emailPattern
               .test(document.getElementById("email").value)) {
            document.getElementById("emailError").innerHTML = "형식에 맞지 않는 이메일입니다.";
         } else {
            document.getElementById("emailError").innerHTML = "";
         }
      }

   </script>


   <script type="text/javascript">
      function signin_check() {

         var handphone = document.getElementById("handphone");
         var phonecheck = document.getElementById("phonecheck");
         var email = document.getElementById("email");
         var emailcheck = document.getElementById("emailcheck")

         //값을 입력하지 않았을때 alert창
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
         
         alert("이메일 or 휴대폰번호가 수정되었습니다!!");
         location.href = 'mypage.jsp';
      }
   </script>



   <!-- Start Script -->
   <script src="assets/js/jquery-1.11.0.min.js"></script>
   <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
   <script src="assets/js/bootstrap.bundle.min.js"></script>
   <script src="assets/js/templatemo.js"></script>
   <script src="assets/js/custom.js"></script>
   <!-- End Script -->
</body>


</html>