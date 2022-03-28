package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import member.MemDAO;
import member.MemVO;


public class userchangepageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		ActionForward forward=new ActionForward();
		MemVO mvo=new MemVO();
		MemDAO mdao=new MemDAO();			
		String id= (String) session.getAttribute("id");
		
		mvo.setMid(id);
		mvo=mdao.selectOne(mvo);
		req.setAttribute("mdata",mvo);
		forward.setPath("userchange.jsp");
		forward.setRedirect(false);
		
		
		
		return forward;
	}

}
