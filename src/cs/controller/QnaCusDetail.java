package cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.service.CsServiceImpl;
import cs.service.ICsService;
import cs.vo.FaqVO;
import cs.vo.QnaVO;
import member.vo.AdminVO;
import member.vo.MemberVO;

@WebServlet("/mypage/qnacusdetail.do")
public class QnaCusDetail extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession();
//		String memId = (String) session.getAttribute("LOGIN_USER");
//		String memId = req.getParameter("memId");
//		String memId = "a002";
		
		
		int qnaNum =Integer.parseInt(req.getParameter("qnaNum"));
//		session.setAttribute("QNA_NUM", qnaNum);
		ICsService csService = CsServiceImpl.getInstance();
		
		System.out.println("여기는 QnaCusDetail 여기오나?>??????????????????????????");
		
		HttpSession session = req.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("LOGIN_USER");
		AdminVO av = (AdminVO) session.getAttribute("LOGIN_ADMIN");
		
		System.out.println(mv + "<<<< mv값" + av +"<<<< av값");
		
		if (mv != null || av != null) {
	        String memId = (mv != null) ? mv.getMem_Id() : null;

	        QnaVO qv = csService.getQnaDetail(qnaNum);

	        List<FaqVO> faqList = csService.displayFaq();

	        boolean qnaDelete = (memId != null && memId.equals(qv.getMemId())) || (av != null);
	        boolean qnaUpdate = (memId != null && memId.equals(qv.getMemId())) || (av == null);

	        
	        System.out.println("mv가 널이 아닐때" +qnaDelete + "<<<qnaDelete 값" + qnaUpdate +"<<<<<<<qnaUpdate 값");
	        System.out.println("av가 널이 아닐때" +qnaDelete + "<<<qnaDelete 값" + qnaUpdate +"<<<<<<<qnaUpdate 값");
	        req.setAttribute("qnaDelete", qnaDelete);
	        req.setAttribute("qnaUpdate", qnaUpdate);

	        req.setAttribute("faqList", faqList);
	        req.setAttribute("qv", qv);

	        req.getRequestDispatcher("/views/mypage/qnacusdetail.jsp").forward(req, resp);
	    } else {
	        // mv가 null일 때 처리
	        String memId = (String) session.getAttribute("someDefaultId"); // 기본값을 지정하거나 null을 허용하는 메서드를 사용
	        QnaVO qv = csService.getQnaDetail(qnaNum);
	        List<FaqVO> faqList = csService.displayFaq();

	        boolean qnaDelete = false; // 적절한 값을 지정
	        boolean qnaUpdate = false; // 적절한 값을 지정

	        req.setAttribute("qnaDelete", qnaDelete);
	        req.setAttribute("qnaUpdate", qnaUpdate);

	        req.setAttribute("faqList", faqList);
	        req.setAttribute("qv", qv);

	        req.getRequestDispatcher("/views/mypage/qnacusdetail.jsp").forward(req, resp);
	    }
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	
	}
}
