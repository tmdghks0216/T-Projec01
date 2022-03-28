<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.*"%>
<jsp:useBean id="pdao" class="product.ProDAO" />
<jsp:useBean id="pvo" class="product.ProVO" />
<jsp:setProperty property="*" name="pvo"/>
<%
	if(pdao.update_state(pvo)){
		System.out.println("stateUrl 로그: 업데이트 완료");
	}
	
	String result = request.getParameter("pstate");
	
	out.write(result);
%>