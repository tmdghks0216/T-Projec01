<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="nick"%>

<c:choose>
   <c:when test="${nick!=null}">
      <a href="sale.jsp"><img
         style="position: fixed; bottom: 5%; right: 5%; width: 64px; height: 64px;"
         alt="판매등록" src="./assets/img/plus3.png"></a>
      <a href="#"><img
         style="position: fixed; bottom: 15%; right: 5%; width: 64px; height: 64px;"
         alt="위로가기" src="./assets/img/up3.png"></a>
   </c:when>
   <c:otherwise>
      <a href="login.jsp"><img
         style="position: fixed; bottom: 5%; right: 5%; width: 64px; height: 64px;"
         alt="판매등록" src="./assets/img/plus3.png"></a>
      <a href="#"><img
         style="position: fixed; bottom: 15%; right: 5%; width: 64px; height: 64px;"
         alt="위로가기" src="./assets/img/up3.png"></a>
   </c:otherwise>
</c:choose>