package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Action;
import common.ActionForward;
import member.MemDAO;
import member.MemVO;

public class UserchangeAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
      ActionForward forward=null;
      MemDAO dao=new MemDAO();
      MemVO vo=new MemVO();
      vo.setMid(req.getParameter("mid"));
      vo.setMpw(req.getParameter("mpw"));
      vo.setMname(req.getParameter("mname"));
      vo.setAddr(req.getParameter("addr"));
      vo.setAddrapt(req.getParameter("addrapt"));
      if(dao.update(vo)) {
         forward=new ActionForward();
         forward.setPath("mypage.do");
         forward.setRedirect(true);
      }
      else{
    	  System.out.println("내정보수정에서 에러발생!");
         throw new Exception("o");
      }
      return forward;
   }
}

