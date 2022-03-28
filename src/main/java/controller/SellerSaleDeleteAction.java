package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Action;
import common.ActionForward;
import product.ProDAO;
import product.ProVO;

public class SellerSaleDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ActionForward forward=null;
		ProVO pvo=new ProVO();
		ProDAO pdao=new ProDAO();
		int ppk=Integer.parseInt(req.getParameter("ppk"));
		pvo.setPpk(ppk);
		if(pdao.delete(pvo)) {
			forward=new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}else {
			System.out.println("판매자 상품 삭제중 에러발생!");
			throw new Exception("i");
		}
		
		
		// TODO Auto-generated method stub
		return forward;
	}

}
