package controller;

import java.util.Enumeration;

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

public class SaleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		ServletContext sc=req.getServletContext();
		HttpSession session=req.getSession();
		ActionForward forward=null;
		MemDAO mdao=new MemDAO();
		MemVO mvo=new MemVO();
		ProVO pvo=new ProVO();
		ProDAO pdao=new ProDAO();
		String mid=(String)session.getAttribute("id");
		/////////////
		   
		String realFolder=sc.getRealPath("file");//server.core 폴더명
			int maxSize=1024*1024*200;
			String encType="UTF-8";
			MultipartRequest mr=new MultipartRequest(req,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		   
			String frn=mr.getFilesystemName("ppic");
		
		
			System.out.println(frn);
		
		
		
		
		
		
		//////////

		
	
		
		pvo.setPtitle(mr.getParameter("ptitle"));
		pvo.setPpic(frn);
		pvo.setPcontent(mr.getParameter("pcontent"));
		pvo.setPprice(Integer.parseInt(mr.getParameter("pprice")));
		pvo.setPmid(mid);

		if(pdao.insert(pvo)) {
			forward=new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}else {
			System.out.println("상품등록중 에러발생!");
			throw new Exception("g");
		}
		
		
		
		
		return forward;
	}

}
