package cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.service.CsServiceImpl;
import cs.service.ICsService;
import cs.vo.QnaVO;

@WebServlet("/qnaAnsInsert.do")
public class QnaAnsInsert extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int qnaNum = Integer.parseInt(req.getParameter("qnaNum"));
		
		ICsService qnaService = CsServiceImpl.getInstance();
		
		QnaVO qv = qnaService.getQnaNum(qnaNum);
		
		req.setAttribute("qv", qv);
		
		req.getRequestDispatcher("/views/mypage/qnaAnsInsert.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int qnaNum = Integer.parseInt(req.getParameter("qna_num"));
		
		String ansCn = req.getParameter("ans_cn");
	
		ICsService qnaService = CsServiceImpl.getInstance();
		
		QnaVO qv = new QnaVO();
		qv.setQnaNum(qnaNum);;
		qv.setAnsCn(ansCn);
		
		int cnt = qnaService.insertAns(qv);
		
		System.out.println(cnt + "+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<!@#!$@#!%@%!@#$@");
		String msg = "";
	
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		
		
		resp.sendRedirect(req.getContextPath() + "/mypage/qnalist");
	}
	
	
}
