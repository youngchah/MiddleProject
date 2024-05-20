package cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.service.CsServiceImpl;
import cs.service.ICsService;
import cs.vo.NoticeVO;

@WebServlet("/noticeUpdate.do")
public class NoticeUpdate extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		int notiNum = Integer.parseInt(req.getParameter("notiNum"));
		
		System.out.println(notiNum + "<<<<<<<<<<<<<<<<<<<<<<<!@#$!%@%@##@$#@$@!$@$@!%!@#%@#$!@$#@$@#");
		ICsService notiService = CsServiceImpl.getInstance();
		
		NoticeVO nv = notiService.getnotiNum(notiNum);
		
		System.out.println(nv);
		
		req.setAttribute("nv", nv);
		
		req.getRequestDispatcher("/views/mypage/noticeUpdate.jsp").forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int notiNum = Integer.parseInt(req.getParameter("noti_num"));
		String notiTitle = req.getParameter("noti_title");
		String notiCn = req.getParameter("noti_cn");
		
		
		ICsService notiService = CsServiceImpl.getInstance();
		
		NoticeVO nv = new NoticeVO();
		nv.setNotiNum(notiNum);
		nv.setNotiTitle(notiTitle);
		nv.setNotiCn(notiCn);
	
		System.out.println("post!@$!$@#%#^FDDS>>>>>>>>>>>>>>>>>>>>>" + nv);
		int cnt = notiService.updateNotice(nv);
		
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
