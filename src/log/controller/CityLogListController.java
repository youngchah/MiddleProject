package log.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.service.IMainService;
import city.service.MainServiceImpl;
import city.vo.AllVO;
import city.vo.MCityVO;
import file.service.AtchFileServiceImpl;
import file.service.IAtchFileService;
import file.vo.AtchFileVO;
import log.service.ILogService;
import log.service.LogServiceImpl;
import log.vo.LogVO;


@WebServlet("/log/loglistBycity.do")
public class CityLogListController extends HttpServlet {
	
	//log리스트 출력 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int cityNum = (Integer.parseInt(req.getParameter("cityNum")));
		
		String memId = req.getParameter("memId");
		
		//서비스 객체 생성 
		ILogService logService = LogServiceImpl.getInstance();
		
		List<LogVO> logList = logService.selectAllLog();
		
		List<LogVO> CityLogList = logService.selectLogByCity(cityNum);
		
		IMainService mainService = MainServiceImpl.getInstance();
		
		
		
		/////////////////////////////////////////////////////////////////////
			
			
		List<MCityVO> civ = mainService.getlistcity(cityNum);
		req.setAttribute("CityList", civ);
		
		
//		int logNum = (Integer.parseInt(req.getParameter("logNum")));
//		//댓글 수 세어주는 메서드..안되네 리스트가 아니라 
//		
//		int countComment = logService.countComment(logNum);
//		
//		req.setAttribute("countComment", countComment);
		
		
		req.setAttribute("CityLogList", CityLogList);
		
		
		req.setAttribute("logList", logList);
		
		//SQL commit 합시다.. 
		//jsp를 전달
		req.getRequestDispatcher("/views/log/loglistBycity.jsp").forward(req, resp);
		
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
		
		
	}
}
