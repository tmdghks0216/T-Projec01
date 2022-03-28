package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Action;
import common.ActionForward;
import member.*;
public class SigninAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward=null;
		MemDAO dao=new MemDAO();
		MemVO vo=new MemVO();
		vo.setMid(req.getParameter("mid"));
		vo.setMpw(req.getParameter("mpw"));
		vo.setMnick(req.getParameter("mnick"));
		vo.setMname(req.getParameter("mname"));
		vo.setMphone(req.getParameter("mphone"));
		vo.setAddr(req.getParameter("addr"));
		vo.setAddrapt(req.getParameter("addrapt"));
		vo.setMemail(req.getParameter("memail"));
		if(dao.insert(vo)) {
			forward=new ActionForward();
			forward.setPath("login.jsp");
			forward.setRedirect(true);
		}
		else{
			System.out.println("회원가입에서 에러발생!");
			throw new Exception("n");
		}
		return forward;
	}

}
