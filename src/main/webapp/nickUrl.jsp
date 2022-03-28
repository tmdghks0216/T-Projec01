<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
<jsp:useBean id="mdao" class="member.MemDAO" />
<jsp:useBean id="mvo" class="member.MemVO" />
<jsp:setProperty property="*" name="mvo" />
<%
	System.out.println(mvo.getMnick());	

	String result = null;
	
	MemVO data=mdao.selectmnick(mvo);
	System.out.println("DAO통과");	
	if(data == null){
		result = "0"; // 닉네임 만들기 가능
	}else{
		result = "1"; // 닉네임 이미 있음
	}
	System.out.println(result);
	out.write(result);
%>