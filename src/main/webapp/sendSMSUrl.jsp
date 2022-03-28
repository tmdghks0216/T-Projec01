<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="key" class="Logic.Randomkey" />
<jsp:useBean id="sns" class="Logic.Certified_SNS" />
<%
	System.out.println("SMS Url 접속 완료");

	String result = key.randomkey();
	sns.certified_sns(request.getParameter("phNum"), result);
	
	System.out.println("인증코드: "+result+" 전송 완료");
	
	out.write(result);
	
	System.out.println("success");
%>