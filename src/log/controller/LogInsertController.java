package log.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.controller.CityMapper;
import log.service.ILogService;
import log.service.LogServiceImpl;
import log.vo.LogVO;
import member.vo.MemberVO;

@MultipartConfig
@WebServlet("/log/logInsert.do")
public class LogInsertController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVO loginUser = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
		
		if (loginUser != null) {
	        // 로그인된 상태
			req.getSession().setAttribute("MEM_ID", loginUser.getMem_Id());
	        req.getRequestDispatcher("/views/log/logInsert.jsp").forward(req, resp);
	        
	    } else {
	        // 로그인되지 않은 상태
	        // 로그인 페이지로 이동

			String currentURL = req.getRequestURI();
			req.getSession().setAttribute("redirectURL", currentURL);

	    	String alertMessage = "로그인이 필요합니다.";
	        String redirectPath = req.getContextPath() + "/login.do";
	        
	        String alertScript = "<script>alert('" + alertMessage + "'); window.location.href='" + redirectPath + "';</script>";

	        resp.setContentType("text/html; charset=UTF-8");
	        resp.getWriter().println(alertScript);
	    	
//	        resp.sendRedirect(req.getContextPath() + "/login.do");
	    }
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		/**
		 * cityName으로 넘어오는데 CityMapper.getCityNum(cityName)하면 알아서 cityNum으로 바뀜
		 */
		String cityName = req.getParameter("cityName");
		int cityNum = CityMapper.getCityNum(cityName);
		
		LocalDate logStart = LocalDate.parse(req.getParameter("startDate"));
		LocalDate logEnd = LocalDate.parse(req.getParameter("endDate"));
		String logTitle = req.getParameter("logTitle");
		String logCat = req.getParameter("logCat");
		String button = req.getParameter("button");
		String logCont = req.getParameter("contents");
		MemberVO loginUser = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
		
		LogVO logVO = new LogVO();
		logVO.setLogTitle(logTitle);
		logVO.setLogStart(logStart);
		logVO.setLogEnd(logEnd);
		logVO.setLogCont(logCont);
		logVO.setLogCat(logCat);
		logVO.setCityNum(cityNum);
		logVO.setMemId(loginUser.getMem_Id());
		
		if(button.equals("issue")) {
			
			ILogService logService = LogServiceImpl.getInstance();
			
			int cnt = logService.registerLog(logVO);
			
			String msg = "";
			
			if(cnt>0) {
				msg = "여행기록이 등록되었습니다";
				
				req.getSession().setAttribute("msg", msg);
				
				//여행 기록 리스트 페이지로 이동
				resp.sendRedirect(req.getContextPath()+"/log/loglist.do");
			}
			
		}else {
			ILogService logService = LogServiceImpl.getInstance();
			
			int cnt = logService.temporyLog(logVO);
			
			String msg = "";
			
			if(cnt>0) {
				
				msg = "임시저장 되었습니다";
				
			}else {
				msg = "여행기록 작성이 취소되었습니다";
			}
			
			req.getSession().setAttribute("msg", msg);
			
			resp.sendRedirect(req.getContextPath()+"/log/loglist.do");
			
		}
	}
}
