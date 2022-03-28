<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bucket.*"%>
<jsp:useBean id="bdao" class="bucket.BucketDAO" />
<jsp:useBean id="bvo" class="bucket.BucketVO" />
<jsp:setProperty property="*" name="bvo"/>
<jsp:useBean id="pdao" class="product.ProDAO" />
<jsp:useBean id="pvo" class="product.ProVO" />
<jsp:setProperty property="ppk" name="pvo" param="productpk"/>
<%
	String result = null;
	
	System.out.println(bvo);
	System.out.println(pvo);

	BucketVO data = bdao.selectOne(bvo);
	if(data == null){
		if(bdao.insert(bvo)&&pdao.pbkcnt_update(pvo)){
			result = "1";
		}
	}
	else{
		if(bdao.deleteOne(bvo)&&pdao.pbkcnt_update2(pvo)){
			result = "0";
		}
	}

	out.write(result);
%>