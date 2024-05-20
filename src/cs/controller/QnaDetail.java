package cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.service.CsServiceImpl;
import cs.service.ICsService;
import cs.vo.QnaVO;

@MultipartConfig
@WebServlet("/mypage/qna")
public class QnaDetail extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views/mypage/qna.jsp").forward(req, resp);
		
	}
	
	/**
	 * 문의 사항 insert
	 */
	
	//회원이 입력한 문의사항을 DB에  insert해줄거임..
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		// 문의하기 버튼을 누르면 나오게..
		// QnaInsert
		// 세션 객체 생성
		HttpSession session = req.getSession();
		String qnaCat = req.getParameter("qnaCat");
		String qnaTitle = req.getParameter("qnaTitle");
		String qnaCn = req.getParameter("qnaCn");
//		String memId = (String) session.getAttribute("LOGIN_USER");
		String memId = req.getParameter("memId");
//		String memId = "a002";
		ICsService csService = CsServiceImpl.getInstance();
			
		System.out.println(memId + "글쓰는 사람 아이디인가?????????????????????");

		QnaVO qna = new QnaVO(memId, qnaCat, qnaTitle, qnaCn);

		
		
		int cnt = csService.insertQna(qna);

		String msg = "";

		if (cnt > 0) {
			msg = "성공";		//링크부분 바꿀것 .. qna리스트로 
			resp.sendRedirect(req.getContextPath()+"/mypage/qnalist");
		} else {
			resp.sendRedirect("/mypage/cs");
		}

		req.getSession().setAttribute("msg", msg);
		
		System.out.println(msg);
	
	
	}
}
