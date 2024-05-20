package log.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

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

@MultipartConfig
@WebServlet("/log/logupdate.do")
public class LogUpdate extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int logNum = Integer.parseInt(req.getParameter("logNum"));
		
		
		ILogService logService = LogServiceImpl.getInstance();
		
		
		
		
		
		List<LogVO> logDetailList = logService.detailLogList(logNum);
		
		req.setAttribute("logDetailList", logDetailList);
		
		req.getRequestDispatcher("/views/log/logupdate.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		
		
		String cityName = req.getParameter("cityName");
		int cityNum = CityMapper.getCityNum(cityName);
		
		LocalDate logStart = LocalDate.parse(req.getParameter("startDate"));
		LocalDate logEnd = LocalDate.parse(req.getParameter("endDate"));
		String logTitle = req.getParameter("logTitle");
		String logCat = req.getParameter("logCat");
		String button = req.getParameter("button");
		String logCont = req.getParameter("contents");
		
		int logNum = (Integer.parseInt(req.getParameter("logNum")));
		
		
		LogVO logVO = new LogVO();
		logVO.setLogTitle(logTitle);
		logVO.setLogStart(logStart);
		logVO.setLogEnd(logEnd);
		logVO.setLogCont(logCont);
		logVO.setLogCat(logCat);
		logVO.setCityNum(cityNum);
		logVO.setLogNum(logNum);
		
		
		if (button.equals("issue")) {
		    ILogService logService = LogServiceImpl.getInstance();
		    int cnt = logService.updateLog(logVO);
		    
		    String msg = "";
		    
		    if (cnt > 0) {
		        msg = "여행기록이 수정되었습니다";
		        req.getSession().setAttribute("msg", msg);
		        // 여행 기록 리스트 페이지로 이동
		        resp.sendRedirect(req.getContextPath() + "/log/logdetail.do?logNum=" + logNum);
		    } else {
		        // 여행 기록 수정이 실패한 경우
		        msg = "여행기록 수정에 실패했습니다";
		        req.getSession().setAttribute("msg", msg);
		        resp.sendRedirect(req.getContextPath() + "/log/loglist.do");
		    }
		} else {
		    // 여행기록 작성이 취소된 경우
		    String msg = "여행기록 작성이 취소되었습니다";
		    req.getSession().setAttribute("msg", msg);
		    resp.sendRedirect(req.getContextPath() + "/index.jsp");
		}
		
	}
}

