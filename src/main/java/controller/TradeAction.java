package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Logic.Trade_SNS;
import common.Action;
import common.ActionForward;
import member.MemDAO;
import member.MemVO;
import product.ProDAO;
import product.ProVO;

public class TradeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("로그 TA 0");
		ActionForward forward=null;
		HttpSession session=req.getSession();
		ProVO pvo=new ProVO();
		ProDAO pdao=new ProDAO();
		MemVO mvo=new MemVO();
		MemDAO mdao=new MemDAO();
		Trade_SNS trade=new Trade_SNS();
		
		pvo.setPpk(Integer.parseInt(req.getParameter("ppk")));
		
		pvo=pdao.selectOne(pvo);
		mvo.setMid(pvo.getPmid());
		MemVO data=new MemVO();
		data=mdao.selectOne_mid(mvo);
		
		String phonenum=data.getMphone();
		
		
		mvo.setMid((String) session.getAttribute("id"));
		mvo=mdao.selectOne(mvo);
		
		
		if(trade.trade_SNS(phonenum,mvo)) {
			System.out.println("로그 TA 2");
			forward=new ActionForward();
			forward.setPath("detail.do");
			forward.setRedirect(false);
		}else {
			System.out.println("거래요청 메세지보내기 실패!!");
			throw new Exception("m");
		}
		
		
		return forward;
	}

}
