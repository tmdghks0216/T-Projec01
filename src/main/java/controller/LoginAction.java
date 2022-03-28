package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import member.*;
public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ActionForward forward=new ActionForward();


		String mid=req.getParameter("mid");
		String mpw=req.getParameter("mpw");
		boolean ch=false;
		MemVO vo=new MemVO();
		MemDAO dao=new MemDAO();
		vo.setMid(mid);
		MemVO data=dao.selectOne(vo);
		if(data!=null) {
			if(data.getMpw().equals(mpw)) {
				HttpSession session=req.getSession();
				session.setAttribute("id", data.getMid());
				session.setAttribute("nick", data.getMnick());

				forward.setPath("main.do");
				forward.setRedirect(true);
				ch=true;
			}
		}
		
		if(!ch) {
			System.out.println("로그: 로그인 실패");
			throw new Exception("a");
//			forward.setPath("login.jsp");
//			forward.setRedirect(true);
		}
		return forward;
	}

}
