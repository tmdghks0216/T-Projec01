<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
<jsp:useBean id="mdao" class="member.MemDAO" />
<jsp:useBean id="mvo" class="member.MemVO" />
<jsp:setProperty property="*" name="mvo"/>
<%
   String result = null;
   
   MemVO data=mdao.selectOne(mvo);
   if(data == null){
      result = "0"; // 아이디 만들기 가능
   }else{
      result = "1"; // 아이디 이미 있음
   }
   
   out.write(result);
%>