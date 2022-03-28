package controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bucket.BucketDAO;
import bucket.BucketVO;
import common.Action;
import common.ActionForward;
import product.ProDAO;
import product.ProVO;


public class BucketdelallAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward=null;
		ArrayList<ProVO> datas = new ArrayList<ProVO>();
		BucketDAO bdao=new BucketDAO();
		BucketVO bvo=new BucketVO();
		ProDAO pdao=new ProDAO();
		
		HttpSession session=req.getSession();
		String id= (String) session.getAttribute("id");		
		bvo.setMemberid(id);
		datas=bdao.selectAll(bvo);
		
		if(bdao.deleteAll(bvo)) {
			//찜한 제품 횟수 차감
			for(ProVO v:datas) {
				pdao.pbkcnt_update2(v);
			}
			
			forward=new ActionForward();
			forward.setPath("bucketpage.do");
			forward.setRedirect(true);
		}else {
			throw new Exception("b");
		}
		
		
		
		return forward;
	}

}
