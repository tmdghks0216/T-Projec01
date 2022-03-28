<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- Header -->
   <nav class="navbar navbar-expand-lg navbar-light shadow">
      <div
         class="container d-flex justify-content-between align-items-center">

         <a class="navbar-brand text-success logo h1 align-self-center"
            href="index.jsp"> WebBBO </a>

         <div class="navbar align-self-center d-flex">


            <c:choose>
               <c:when test="${id!=null}">
                  <!-- 로그인에 성공했을때 -->
                             <strong>${nick}</strong>님 환영합니다.   
                          <form action="Logout.do" method="post">
                     <input type="submit" class="btn sbtn-success" value="로그아웃">
                  </form>
               </c:when>
               <c:otherwise>
                  <!-- 로그인해야할때 -->
                  <a type="button" class="btn sbtn-success"
                     onclick="location.href='login.jsp'">로그인</a>
                  <a type="button" class="btn sbtn-success"
                     onclick="location.href='signin.jsp'">회원가입</a>
               </c:otherwise>
            </c:choose>

            <a style="margin-right: 6px;" class="nav-icon position-relative text-decoration-none"
               href="search.do" data-bs-target="#templatemo_search"> <i
               class="fa fa-fw fa-search text-dark mr-2"></i>
            </a> <a style="margin-right: 6px;" class="nav-icon position-relative text-decoration-none"
               href="bucketpage.do">
               <img class="fa fa-fw text-dark mr-1" alt="찜목록 가기 버튼" src="./assets/img/heart4.png" style="width: 18px; height: 18px; margin-bottom: 5px;"></i>
            </a>
            <c:choose>
               <c:when test="${id==null}">
                  <a style="margin-right: 6px;" class="nav-icon position-relative text-decoration-none"
                     href="login.jsp"> <i class="fa fa-fw fa-user text-dark mr-3"></i>
                  </a>
               </c:when>
               <c:otherwise>
                  <a style="margin-right: 6px;" class="nav-icon position-relative text-decoration-none"
                     href="mypage.do"> <i class="fa fa-fw fa-user text-dark mr-3"></i>
                  </a>
               </c:otherwise>
            </c:choose>
         </div>
      </div>

   </nav>
   <!-- Close Header -->

</body>
</html>