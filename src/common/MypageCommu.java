package common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.service.ComServiceImpl;
import community.service.IComService;
import community.vo.ComVO;
import member.vo.MemberVO;

@WebServlet("/mypage/myCommu.do")
public class MypageCommu extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVO memVO = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
		String memId = memVO.getMem_Id();
		System.out.println("마이페이지 커뮤 컨트롤러 logList : "+memId);
		
		IComService comService = ComServiceImpl.getInstance();
		
		List<ComVO> myCommuList = comService.selectMyCommuAll(memId);
		
		req.setAttribute("myCommuList", myCommuList);
		
		req.getRequestDispatcher("/views/mypage/myCommu.jsp").forward(req, resp);
		
		
	}
	
}
