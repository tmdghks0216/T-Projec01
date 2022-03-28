package common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.*;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request,response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String uri=request.getRequestURI();
		String cp=request.getContextPath();
		String command=uri.substring(cp.length());
		String err=null;
		String msg="잘못된요청입니다";
		ActionForward forward=null;
		try {
			if(command.equals("/login.do")) {
				System.out.println("로그: FC: 로그인 요청");
				forward=new LoginAction().execute(request, response);
			}
			else if(command.equals("/main.do")) {
				System.out.println("로그: FC: 메인페이지 출력 요청");
				forward=new MainAction().execute(request, response);
			}
			else if(command.equals("/signin.do")) {
				System.out.println("로그: FC: 회원가입 요청");
				forward=new SigninAction().execute(request, response);
			}
				else if(command.equals("/mypage.do")) {
					System.out.println("로그: FC: 마이페이 출력 요청");
					forward=new MypageAction().execute(request, response);

				}else if(command.equals("/userchangepage.do")) {
					System.out.println("로그: FC:내정보 수정페이지 요청 ");
					forward=new userchangepageAction().execute(request, response);

				}else if(command.equals("/userchange.do")) {
					System.out.println("로그: FC: 내정보 업데이트 요청");
					forward=new UserchangeAction().execute(request, response);

				}else if(command.equals("/Mdelete.do")) {
					System.out.println("로그: FC: 회원 탈퇴 요청");
					forward=new MdeleteAction().execute(request, response);

				}else if(command.equals("/Logout.do")) {
					System.out.println("로그: FC: 회원 탈퇴 요청");
					forward=new LogoutAction().execute(request, response);

				}else if(command.equals("/detail.do")) {
					System.out.println("로그: FC: 상세보기페이지 요청");
					forward=new DetailAction().execute(request, response);

				}else if(command.equals("/sale.do")) {
					System.out.println("로그: FC: 제품등록 요청");
					forward=new SaleAction().execute(request, response);

				}else if(command.equals("/sellerSale.do")) {
					System.out.println("로그: FC: 판매자 수정페이지 요청");
					forward=new SellerSaleAction().execute(request, response);

				}else if(command.equals("/sellerSaleUpdate.do")) {
					System.out.println("로그: FC: 판매자 수정업데이트 요청");
					forward=new SellerSaleUpdateAction().execute(request, response);

				}else if(command.equals("/sellerSaleDelete.do")) {
					System.out.println("로그: FC: 판매자 수정업데이트 요청");
					forward=new SellerSaleDeleteAction().execute(request, response);

				}else if(command.equals("/sendpw.do")) {
					System.out.println("로그: FC: 임시비밀번호 보내기 요청");
					forward=new SendpwAction().execute(request, response);

				}else if(command.equals("/trade.do")) {
					System.out.println("로그: FC: 거래요청문자 보내기 요청");
					forward=new TradeAction().execute(request, response);

				}else if(command.equals("/bucketpage.do")) {
					System.out.println("로그: FC: 찜목록 페이지 요청");
					forward=new BucketpageAction().execute(request, response);

				}else if(command.equals("/bucketdelall.do")) {
					System.out.println("로그: FC: 찜목록 모두비우기 요청");
					forward=new BucketdelallAction().execute(request, response);

				}else if(command.equals("/search.do")) {
					System.out.println("로그: FC: 검색 요청");
					forward=new SearchAction().execute(request, response);

				}else if(command.equals("/emailUpdate.do")) {
					System.out.println("로그: FC: 이메일변경 요청");
					forward=new EmailUpdateAction().execute(request, response);

				}else if(command.equals("/phoneUpdate.do")) {
					System.out.println("로그: FC: 휴대폰번호변경 요청");
					forward=new PhoneUpdateAction().execute(request, response);
				}else {
					forward=new ActionForward();
					forward.setPath("error.jsp");
					forward.setRedirect(false);
				}
			}catch(Exception e) {
				e.printStackTrace();
				err=e.getMessage();
			}



			if(forward!=null) {
				// dispatcher 이슈★★★★★
				if(forward.isRedirect()) { 
					response.sendRedirect(forward.getPath());
				}
				else {
					RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
			if(err!=null) {
				if(err.equals("a")) {
				msg="로그인을 실패하셨습니다!";
			}
				else if(err.equals("b")) {
					msg="찜목록 전체삭제 실패!";
				}
				else if(err.equals("c")) {
					msg="로그인후 이용해주세요!";
				}
				else if(err.equals("d")) {
					msg="이메일정보 수정중 오류가 발생했습니다. 다시이용해주세요!";
				}
				else if(err.equals("e")) {
					msg="회원탈퇴시도중 오류가 발생했습니다. 다시이용해주세요!";
			}
			else if(err.equals("f")) {
					msg="휴대폰번호정보 수정중 오류가 발생했습니다. 다시이용해주세요!";
				}
			else if(err.equals("g")) {
				msg="상품등록에 실패했습니다. 다시이용해주세요!";
			}
			else if(err.equals("h")) {
				msg="가격 범위을 잘못 입력하셨습니다. 다시이용해주세요!";
			}
			else if(err.equals("i")) {
				msg="상품삭제에 실패했습니다. 다시이용해주세요!";
			}
			else if(err.equals("j")) {
				msg="상품정보변경에 실패했습니다. 다시이용해주세요!";
			}
			else if(err.equals("k")) {
				msg="임시비밀번호변경에 실패했습니다. 다시이용해주세요!";
			}
			else if(err.equals("l")) {
				msg="임시비밀번호 전송에 실패했습니다. 다시이용해주세요!";
			}
			else if(err.equals("n")) {
				msg="회원가입에 실패했습니다. 다시이용해주세요!";
			}
			else if(err.equals("m")) {
				msg="거래요청 메세지 전송이 실패했습니다. 다시이용해주세요!";
			}
			else if(err.equals("o")) {
				msg="내정보수정에 실패했습니다. 다시이용해주세요!";
			}
			
			
			
			PrintWriter out=response.getWriter();
			out.println("<script>alert('"+msg+"');history.go(-1);</script>");

		}
			
			
	}
}