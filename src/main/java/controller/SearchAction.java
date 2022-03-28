package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Action;
import common.ActionForward;
import product.ProDAO;
import product.ProVO;

public class SearchAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
      // TODO Auto-generated method stub
      ActionForward forward=null;
      String keywords=req.getParameter("keywords");
      String topic=req.getParameter("topic");
      String from=req.getParameter("from");
      String to=req.getParameter("to");
      int max;
      int min;
      //int from=Integer.parseInt(req.getParameter("from"));
      //int to=Integer.parseInt(req.getParameter("to"));
      ProDAO pdao=new ProDAO();
      ProVO pvo=new ProVO();
      ArrayList<ProVO> datas=new ArrayList<ProVO>();
      String searchCondition=req.getParameter("cate");
      
      if(from==null ||from=="") {//from값 입력안했을때
         min=0;
      }else {
         min=Integer.parseInt(from);
      }
      if(to==null||to=="") {//to값 입력안했을때
         
         max=100000000;
      }else {
         max=Integer.parseInt(to);
      }
      pvo.setPprice(min);
      pvo.setSearchCondition(searchCondition);
      System.out.println(searchCondition);
      if(min>max) {
    	  System.out.println("가격비교 잘못된값 입력");
         throw new Exception("h");
      }else {
         if(keywords==null||keywords=="") {//제목이나 닉네임으로 검색 안하고 가격만 검색
        	 keywords="";
        	 pvo.setPtitle(keywords);
             datas=pdao.title_select(pvo, max);
         }else {
            if(topic.equals("ptitle")) {//제목 입력하였을떄
               pvo.setPtitle(keywords);
               datas=pdao.title_select(pvo, max);
            }else if(topic.equals("pmid")) {//id 입력하였을때
               pvo.setPmid(keywords);
               datas=pdao.pmid_select(pvo, max);
            }
         }
         forward=new ActionForward();
         req.setAttribute("pdatas", datas);
         req.setAttribute("from", min);
       req.setAttribute("to", max);
        req.setAttribute("keywords", keywords);
        req.setAttribute("topic", topic);
        req.setAttribute("searchCondition", searchCondition);
         forward.setPath("search.jsp");
         forward.setRedirect(false);
      }
      return forward;
   }

}