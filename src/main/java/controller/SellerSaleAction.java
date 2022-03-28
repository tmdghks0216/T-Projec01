package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Action;
import common.ActionForward;
import product.ProDAO;
import product.ProVO;

public class SellerSaleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward=new ActionForward();
		ProVO pvo=new ProVO();
		ProDAO pdao=new ProDAO();
		int ppk=Integer.parseInt(req.getParameter("ppk"));
		pvo.setPpk(ppk);
		pvo=pdao.selectOne(pvo);

		req.setAttribute("pdata", pvo);
		System.out.println(pvo);
		forward.setPath("sellerSale.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
