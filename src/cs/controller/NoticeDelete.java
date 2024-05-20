package cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.dao.CsDaoImpl;
import cs.service.CsServiceImpl;
import cs.service.ICsService;
import cs.vo.NoticeVO;

@WebServlet("/noticeDelete.do")
public class NoticeDelete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int notiNum = Integer.parseInt(req.getParameter("notiNum"));
		
		ICsService notiService = CsServiceImpl.getInstance();
		
		NoticeVO nv = new NoticeVO();
		
		nv.setNotiNum(notiNum);
				
		int cnt = notiService.deleteNotice(nv);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.getSession().setAttribute("msg", msg);
		
		
		resp.sendRedirect(req.getContextPath() + "/mypage/cs");
	}
	
	
}
