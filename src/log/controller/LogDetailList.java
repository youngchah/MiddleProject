package log.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import file.service.AtchFileServiceImpl;
import file.service.IAtchFileService;
import file.vo.AtchFileVO;
import log.service.ILogService;
import log.service.LogServiceImpl;
import log.vo.LogComVO;
import log.vo.LogVO;
import member.vo.MemberVO;

@WebServlet("/log/logdetail.do")
@MultipartConfig
public class LogDetailList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		int logNum = (Integer.parseInt(req.getParameter("logNum")));
		
		MemberVO loginUser = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
		
		
		
		ILogService logService = LogServiceImpl.getInstance();
		
		//댓글 수 세어주는 메서드
		
		int countComment = logService.countComment(logNum);
		
		req.setAttribute("countComment", countComment);
		
		List<LogVO> logDetailList = logService.detailLogList(logNum);
		
		
		req.setAttribute("logDetailList",logDetailList);
		

		
		  // 댓글 등록 후, 갱신된 댓글 목록을 다시 가져온다.
	    List<LogComVO> updatedCommentList = logService.selectLogComment(logNum);
	    
	    
	    req.setAttribute("updatedCommentList",updatedCommentList);
		
		
		req.getRequestDispatcher("/views/log/logdetail.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/**
		 * 댓글 기능 구현하기 
		 */
		
		MemberVO loginUser = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
		
//		String logNumParam = req.getParameter("logNum");
		int logNum = Integer.parseInt(req.getParameter("logNum"));

		String logComCn = req.getParameter("logComCn");

		LogComVO lcv = new LogComVO();
		lcv.setLogComCn(logComCn);
		lcv.setLogNum(logNum);
		lcv.setMemId(loginUser.getMem_Id()); // 수정된 부분
		
		ILogService logService = LogServiceImpl.getInstance();

		//댓글
		int countComment = logService.countComment(logNum);
		req.setAttribute("countComment", countComment);

		// 댓글 등록을 위한 비즈니스 로직 호출

		int cnt = logService.insertLogComment(lcv);

		// 댓글 등록 후, 갱신된 댓글 목록을 다시 가져온다.
		List<LogComVO> updatedCommentList = logService.selectLogComment(logNum);

		// 갱신된 댓글 목록을 JSON 형태로 변환
		Gson gson = new Gson();
		String updatedCommentListJson = gson.toJson(updatedCommentList);

		// JSON 형태의 댓글 목록을 응답으로 전송
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(updatedCommentListJson);

//		resp.sendRedirect(req.getContextPath() + "/log/logdetail.do?logNum="+req.getParameter("logNum") );
		
		
	}
	
	
}
