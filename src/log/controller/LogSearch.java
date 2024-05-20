package log.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import log.service.ILogService;
import log.service.LogServiceImpl;
import log.vo.LogVO;

/**
 * 검색화면 구현 
 * @author Lee
 *
 */
@WebServlet("/log/logsearch.do")
public class LogSearch extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		LocalDate logStart = (LocalDate.parse(req.getParameter("logStart")));
		String logTitle = req.getParameter("logTitle");
//		String logCont = req.getParameter("logCont");

		// LogService 인스턴스 생성
		ILogService logService = LogServiceImpl.getInstance();

		// 파라미터를 List에 담아서 서비스에 전달
		LogVO lgv = new LogVO();
//		lgv.setLogStart(logStart);
		lgv.setLogTitle(logTitle);
//		lgv.setLogCont(logCont);
		

		// 로그 검색 서비스 호출
		List<LogVO> searchList = logService.searchLog(lgv);

		// 검색 결과를 request에 저장
		req.setAttribute("searchList", searchList);

		// forward 방식으로 logSearch.jsp 페이지로 이동
		req.getRequestDispatcher("/views/log/logsearch.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		doGet(req, resp);
		
	}
	
	
	
	
}
