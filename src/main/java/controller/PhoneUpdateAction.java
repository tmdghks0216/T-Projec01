package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import member.MemDAO;
import member.MemVO;

public class PhoneUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward=null;
		HttpSession session=req.getSession();
		String id= (String) session.getAttribute("id");
		MemVO mvo=new MemVO();
		MemDAO mdao=new MemDAO();
		
		mvo.setMid(id);
		mvo.setMphone(req.getParameter("mphone"));
		
		System.out.println(req.getParameter("mphone"));
		System.out.println(id);
		
		if(mdao.phone_update(mvo)) {
			forward=new ActionForward();
			forward.setPath("mypage.do");
			forward.setRedirect(false);
		}else {
			System.out.println("폰번호 업데이트 실패!!");
			throw new Exception("f");
		}
		
		
		
		
		
		return forward;
	}

}
