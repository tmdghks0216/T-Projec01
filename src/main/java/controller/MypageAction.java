package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import member.*;
import product.*;

public class MypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		ActionForward forward=new ActionForward();
		MemVO mvo=new MemVO();
		MemDAO mdao=new MemDAO();
		ProVO pvo=new ProVO();
		ProDAO pdao=new ProDAO();
		ArrayList<ProVO> pdatas=new ArrayList<ProVO>();
		String id= (String) session.getAttribute("id");
	
		mvo.setMid(id);
		mvo=mdao.selectOne(mvo);
		
		pvo.setPmid(id);
		System.out.println("로그: myPageAction 1");
		pdatas=pdao.pmid_select1(pvo);
		
		System.out.println("로그: myPageAction"+pdatas);
		
		req.setAttribute("mdata",mvo);
		req.setAttribute("pdatas",pdatas);
		forward.setPath("mypage.jsp");
		forward.setRedirect(false);
		
		
		
		return forward;
	}

}
