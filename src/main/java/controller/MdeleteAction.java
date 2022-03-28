package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bucket.BucketDAO;
import bucket.BucketVO;
import common.Action;
import common.ActionForward;
import member.MemDAO;
import member.MemVO;
import product.ProDAO;
import product.ProVO;

public class MdeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session=req.getSession();
		ActionForward forward=null;
		MemVO mvo=new MemVO();
		MemDAO mdao=new MemDAO();	
		ProDAO pdao=new ProDAO();
		ProVO pvo=new ProVO();
		ArrayList<ProVO> datas = new ArrayList<ProVO>();
		BucketDAO bdao=new BucketDAO();
		BucketVO bvo=new BucketVO();
		String id= (String) session.getAttribute("id");
		ArrayList<ProVO> data=new ArrayList<ProVO>();
		//이용자의 제품의 찜했던 목록제거
		pvo.setPmid(id);
		data=pdao.pmid_select1(pvo);
		for(ProVO pvoo:data) {
			bvo.setProductpk(pvoo.getPpk());
			bdao.deleteAll_productpk(bvo);	
		}
		//이용자가 찜한 제품 찜횟수 차감
		bvo.setMemberid(id);
		datas=bdao.selectAll(bvo);
		
		if(bdao.deleteAll(bvo)) {
			for(ProVO v:datas) {
				pdao.pbkcnt_update2(v);
			}
		}else {
			throw new Exception("b");
		}

		//이용자가 올린 제품제거
		pdao.delete_pmid(pvo);

		//회원삭제
		mvo.setMid(id);
		if( mdao.delete(mvo)) {
			session.invalidate();
			forward=new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}else {
			System.out.println("회원탈퇴에서 에러발생!");
			throw new Exception("e");
		}
		return forward;
	}

}
