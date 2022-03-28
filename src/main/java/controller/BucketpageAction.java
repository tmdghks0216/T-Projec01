package controller;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bucket.BucketDAO;
import bucket.BucketVO;
import common.Action;
import common.ActionForward;
import product.ProVO;

public class BucketpageAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
      // TODO Auto-generated method stub
      ActionForward forward=null;
      ArrayList<ProVO> datas = new ArrayList<ProVO>();
      BucketDAO bdao=new BucketDAO();
      BucketVO bvo=new BucketVO();
      HttpSession session=req.getSession();
      String id= (String) session.getAttribute("id");
      if(id==null) {
    	  System.out.println("로그인 안하고 찜목록열려함!");
         throw new Exception("c");
         
      }else {
         forward=new ActionForward();
         bvo.setMemberid(id);
         datas=bdao.selectAll(bvo);

         req.setAttribute("pdatas", datas);

         forward.setPath("bucketList.jsp");
         forward.setRedirect(false);
         }

      return forward;

   }

}