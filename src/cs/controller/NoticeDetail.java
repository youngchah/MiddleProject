package cs.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.service.CsServiceImpl;
import cs.service.ICsService;
import cs.vo.FaqVO;
import cs.vo.NoticeVO;
import cs.vo.QnaVO;

@WebServlet("/mypage/notidetail")
public class NoticeDetail extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String notiNum = req.getParameter("notiNum");
		
		ICsService csService = CsServiceImpl.getInstance();
		
		NoticeVO nv = csService.getNotiDetail(notiNum);
		
		//★추가할 것 1:1문의 리스트 
		
		//faqList
		List<FaqVO> faqList = csService.displayFaq();
		
		req.setAttribute("faqList", faqList);
		
		req.setAttribute("nv", nv);
		//경로 주의~~! views안에 있는 jsp파일로...
		
		
		
		
	    
		
		
		req.getRequestDispatcher("/views/mypage/notidetail.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	    
	    
	    
	    
	}
}
