package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;

public class LogoutAction implements Action {


	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ActionForward forward=new ActionForward();
		forward.setPath("main.do");
		forward.setRedirect(true);
		
		HttpSession session=req.getSession();
		session.invalidate();
		
		return forward;
	}

}
