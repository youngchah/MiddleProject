package log.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import log.service.ILogService;
import log.service.LogServiceImpl;
import log.vo.LogVO;
import member.vo.MemberVO;

@WebServlet("/log/logdelete.do")
public class LogDelete extends HttpServlet{

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVO loginUser = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
		
		int logNum = (Integer.parseInt(req.getParameter("logNum")));
		 
		
		
		LogVO lgv = new LogVO();
		lgv.setLogNum(logNum);
		
		//하드코딩
//		lgv.setMemId(loginUser.getMem_Id());
		
		ILogService logService = LogServiceImpl.getInstance();
		
		int cnt = logService.deleteLog(lgv);
		
		resp.sendRedirect(req.getContextPath() + "/log/loglist.do");
		
		

	}
	
	
	
	
	
}
