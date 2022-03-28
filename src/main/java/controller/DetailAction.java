package controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bucket.BucketDAO;
import bucket.BucketVO;
import common.Action;
import common.ActionForward;
import member.MemDAO;
import member.MemVO;
import product.ProDAO;
import product.ProVO;

public class DetailAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
      // TODO Auto-generated method stub
      HttpSession session=req.getSession();
      ActionForward forward=new ActionForward();
      ProVO vo=new ProVO();
      ProDAO dao=new ProDAO();
      BucketDAO bdao=new BucketDAO();
      BucketVO bvo=new BucketVO();
      MemDAO mdao=new MemDAO();
      MemVO mvo=new MemVO();
      String id=(String) session.getAttribute("id");
      int ppk=Integer.parseInt(req.getParameter("ppk"));
      vo.setPpk(ppk);
      vo=dao.selectOne(vo);  
      if(vo==null) {
         System.out.println("로그: Detail: 없는 데이터를 출력하려고 시도함");
         forward.setPath("main.do");
         forward.setRedirect(true);
      }else {
         System.out.println(vo);
         if(id==null||!id.equals(vo.getPmid())) {//이용자 상세페이지
            forward.setPath("sellerDetail.jsp");
            
            bvo.setMemberid(id);
            bvo.setProductpk(ppk);
            bvo=bdao.selectOne(bvo);
            req.setAttribute("bkdata", bvo);
            
            dao.pcnt_update(vo);      
            vo=dao.selectOne(vo);
            forward.setPath("detail.jsp");
            
            
         }else {//판매자 상세페이지
        	 forward.setPath("sellerDetail.jsp");
         }
         mvo.setMid(vo.getPmid());
         mvo=mdao.selectOne(mvo);
         req.setAttribute("addr", mvo.getAddr());
         req.setAttribute("pdata", vo);
         forward.setRedirect(false);
      }
      
      return forward;





   }

}