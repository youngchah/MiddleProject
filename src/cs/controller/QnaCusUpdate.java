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
@WebServlet("/mypage/qnaupdate.do")
public class QnaCusUpdate extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int qnaNum =Integer.parseInt(req.getParameter("qnaNum"));
		
		ICsService csService = CsServiceImpl.getInstance();
		
		QnaVO qv = csService.getQnaDetail(qnaNum);
		
		req.setAttribute("qv", qv);
		
		
		req.getRequestDispatcher("/views/mypage/qnaupdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		//세션객체생성 
//		HttpSession session = req.getSession();
		
		int qnaNum = Integer.parseInt(req.getParameter("qnaNum"));
		String qnaCat = req.getParameter("qnaCat");
		String qnaTitle = req.getParameter("qnaTitle");
		String qnaCn = req.getParameter("qnaCn");
		//qnaNum은 넣어줘야됨
//		int qnaNum = Integer.parseInt((String) session.getAttribute("QNA_NUM"));
		
		
		ICsService csService = CsServiceImpl.getInstance();
		
//		QnaVO qna = new QnaVO(qnaCat,qnaTitle,qnaCn,qnaNum);
		QnaVO qv = new QnaVO();
		
		qv.setQnaTitle(qnaTitle);
	    qv.setQnaCat(qnaCat);
	    qv.setQnaCn(qnaCn);
	    qv.setQnaNum(qnaNum);
		
		int cnt = csService.updateQnaCus(qv);
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";		
			resp.sendRedirect(req.getContextPath()+"/mypage/qnalist");
		} else {
			msg="실패";
			resp.sendRedirect("/mypage/cs");
		}
		
		req.getSession().setAttribute("msg", msg);
		
		System.out.println(msg);
	}
}
