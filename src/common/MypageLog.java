package common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import log.service.ILogService;
import log.service.LogServiceImpl;
import log.vo.LogVO;
import member.vo.MemberVO;

@WebServlet("/mypage/myTripLog.do")
public class MypageLog extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		MemberVO memVO = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
		String memId = memVO.getMem_Id();
		System.out.println("마이페이지기록 컨트롤러 logList : "+memId);
		
		ILogService logService = LogServiceImpl.getInstance();
		
		List<LogVO> myLogList = logService.selectMemberLogList(memId);
		
		req.setAttribute("myLogList", myLogList);
		
		req.getRequestDispatcher("/views/mypage/myTripLog.jsp").forward(req, resp);
		
		
	}
	
}
