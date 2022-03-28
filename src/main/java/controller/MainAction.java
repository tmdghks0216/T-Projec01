package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Action;
import common.ActionForward;
import member.MemDAO;
import member.MemVO;
import product.ProDAO;
import product.ProVO;
public class MainAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
      // TODO Auto-generated method stub
      ActionForward forward=new ActionForward();
      ProDAO dao=new ProDAO();
      MemDAO mdao = new MemDAO();
      ArrayList<ProVO> datas=new ArrayList<ProVO>();
      
      datas=dao.selectAll();
      req.setAttribute("pdatas", datas);
      MemVO data = new MemVO();
      data=mdao.selectOne_mid(data);
      req.setAttribute("mdata", data);
      
      
      forward.setPath("main.jsp");
      forward.setRedirect(false);
      
      
      return forward;
   }
   
}