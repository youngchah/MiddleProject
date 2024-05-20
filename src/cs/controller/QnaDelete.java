package cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.dao.ICsDao;
import cs.service.CsServiceImpl;
import cs.service.ICsService;
import cs.vo.QnaVO;
import member.vo.MemberVO;

@WebServlet("/mypage/qnadelete.do")
public class QnaDelete extends HttpServlet {

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int qnaNum = Integer.parseInt(req.getParameter("qnaNum"));

//		MemberVO mv = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
		
//		String memId = mv.getMem_Id();
		

		QnaVO qv = new QnaVO();
		//하드코딩 풀기
		qv.setQnaNum(qnaNum);
//		qv.setMemId(memId);
		
		ICsService csService = CsServiceImpl.getInstance();
		
		int cnt = csService.deleteQna(qv);
		
		resp.sendRedirect(req.getContextPath() + "/mypage/qnalist");
		
		
		
		

	}
	
		
		
		
		
	
	
	
}
