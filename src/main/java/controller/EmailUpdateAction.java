package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import member.MemDAO;
import member.MemVO;

public class EmailUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward=null;
		HttpSession session=req.getSession();
		String id= (String) session.getAttribute("id");
		MemVO mvo=new MemVO();
		MemDAO mdao=new MemDAO();
		
		mvo.setMid(id);
		mvo.setMemail(req.getParameter("memail"));
		
		if(mdao.email_update(mvo)) {
			forward=new ActionForward();
			forward.setPath("mypage.do");
			forward.setRedirect(true);
		}else {
			System.out.println("이메일 업데이트 실패!!");
			throw new Exception("d");
		}
		
		
		
		
		
		return forward;
	}

}
