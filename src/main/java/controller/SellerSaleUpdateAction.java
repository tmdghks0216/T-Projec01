package controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Action;
import common.ActionForward;
import member.MemDAO;
import member.MemVO;
import product.ProDAO;
import product.ProVO;

public class SellerSaleUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		ServletContext sc=req.getServletContext();
		ActionForward forward=null;
		ProVO pvo=new ProVO();
		ProDAO pdao=new ProDAO();

		
		String realFolder=sc.getRealPath("file");//server.core 폴더명
		int maxSize=1024*1024*200;
		String encType="UTF-8";
		MultipartRequest mr=new MultipartRequest(req,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	   
		String frn=mr.getFilesystemName("ppic");
		pvo.setPpk(Integer.parseInt(mr.getParameter("ppk")));;
		
		
		if(frn==null) {
			pvo=pdao.selectOne(pvo);
			
		}else {
		
			pvo.setPpic(frn);
		}	
		pvo.setPtitle(mr.getParameter("ptitle"));
		pvo.setPcontent(mr.getParameter("pcontent"));
		pvo.setPprice(Integer.parseInt(mr.getParameter("pprice")));
		
		if(pdao.update(pvo)) {
			pvo=pdao.selectOne(pvo);
			forward=new ActionForward();
			forward.setPath("detail.do?ppk="+pvo.getPpk());
			forward.setRedirect(false);
		}else {
			System.out.println("판매자 상품 업데이트중 에러발생!");
			throw new Exception("j");
		}
		return forward;
	}

}
