package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Logic.*;
import common.Action;
import common.ActionForward;
import member.MemDAO;
import member.MemVO;

public class SendpwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ActionForward forward=null;
		MemDAO mdao=new MemDAO();
		MemVO mvo=new MemVO();
		PwVO pwvo=new PwVO();
		Randomkey rkey=new Randomkey();
		PW_Mail pwmail=new PW_Mail();
		String key=rkey.randomkey(); //랜덤키 생성
		mvo.setMid(req.getParameter("mid"));
		mvo=mdao.selectOne(mvo);
		
		
		pwvo.setPw(key);
		pwvo.setMail(mvo.getMemail());
		if(pwmail.Mail(pwvo)) {//메일보내기 성공했을때
			mvo.setMpw(key);
			if(mdao.update(mvo)) {//랜덤키로 비밀번호 업데이트
				forward=new ActionForward();
				forward.setPath("login.jsp");
				forward.setRedirect(true);
			}else {
				System.out.println("비밀번호 업데이트에서 에러발생!");
				throw new Exception("k");
			}
		}else {
			System.out.println("비밀번호메일 보내기에서 에러발생!");
			throw new Exception("l");
		}
		
		
		
		// TODO Auto-generated method stub
		return forward;
	}

}
