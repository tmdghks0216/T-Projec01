<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="key" class="Logic.Randomkey" />
<jsp:useBean id="mail" class="Logic.Certified_Mail" />
<%
	String result = key.randomkey();
	
	if(mail.certified_mail(request.getParameter("emAdrr"),result)){
		System.out.println("메일 전송 성공!");
		out.write(result);
	}else{
		System.out.println("메일 전송 실패 ㅠㅠ");
	}
	out.write(result);
	System.out.println("result: "+result);
%>