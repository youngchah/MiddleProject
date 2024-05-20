package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/findId.do")
public class FindId extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		req.getRequestDispatcher("/views/member/findId.jsp").forward(req, resp);
	
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		
		
		String memName = req.getParameter("mem_Name");
		String memEmail = req.getParameter("mem_Email");
		// mem_Email mem_Name
		//System.out.println(memName);
		
		// 서비스 객체 생성
		IMemberService memService =  MemberServiceImpl.getInstance(); 
			
		/*
		 * MemberVO mv = new MemberVO(); mv.setMem_Name(memName);
		 * mv.setMem_Email(memEmail);
		 */
		
		try {
			String findId = memService.findId(memName, memEmail);

			System.out.println(">>>>>>" + findId);


			if (findId != null) {
				// 아이디를 찾았을 때
				req.setAttribute("findid", findId);
				req.getRequestDispatcher("/views/member/findId.jsp").forward(req, resp);

			} else {
				
				resp.getWriter().print("false");
				
				
//				RequestDispatcher dispatcher = req.getRequestDispatcher("/views/member/findPw.jsp");
//				dispatcher.forward(req, resp);
//
//				resp.sendRedirect(req.getContextPath() + "/views/member/findId.jsp");
				// req.getRequestDispatcher("/views/member/findId.jsp").forward(req, resp);

			}
		} catch (Exception e) {
			// 예외 처리
			e.printStackTrace(); // 실제로는 로그에 기록하거나 적절히 처리해야 합니다.
			req.setAttribute("error", "아이디 찾기 중 오류가 발생했습니다.");
			req.getRequestDispatcher("/views/member/findId.jsp").forward(req, resp);
		}
	}
		
//		String findId = memService.findId(memName, memEmail);
//		
//		System.out.println(">>>>>>" + findId);
//		
//		req.setAttribute("findid", findId);
//
//		
//		
//		
//		if(findId != null) {
//			// 아이디를 찾았을 때
//			req.getRequestDispatcher("/views/member/findId.jsp").forward(req, resp);
//			
//		}else {
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/views/member/findPw.jsp");
//			dispatcher.forward(req, resp);
//			
//			resp.sendRedirect(req.getContextPath() + "/views/member/findId.jsp");
////			req.getRequestDispatcher("/views/member/findId.jsp").forward(req, resp);
//			
//		}
//		
//		
//	}
	
	
}
  