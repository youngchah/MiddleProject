package member.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.service.ComServiceImpl;
import community.service.IComService;
import log.service.ILogService;
import log.service.LogServiceImpl;
import member.service.IMemberService;
import member.service.MemberServiceImpl;
import member.vo.MemberVO;

@WebServlet("/login.do")
public class MemberLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		req.getRequestDispatcher("/views/member/loginForm.jsp").forward(req, resp);;
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		String memId = req.getParameter("mem_Id");
		
		if(memId.equals("admin")) {
			
			req.getRequestDispatcher("/adminLogin.do").forward(req, resp);
			
		} else {

			String memPass = req.getParameter("mem_Pass");

			System.out.println(memId + " | " + memPass);

			// 서비스 생성
			IMemberService memService = MemberServiceImpl.getInstance();
			ILogService logService = LogServiceImpl.getInstance();
			IComService comService = ComServiceImpl.getInstance();
			// 사용자 ID 및 패스워드를 사용하여 DB로부터 해당 사용자 정보를 가져온다.
			
			
			MemberVO loginInfo = new MemberVO();
			loginInfo.setMem_Id(memId);
			loginInfo.setMem_Pass(memPass);

			MemberVO mv = memService.getLoginInfo(loginInfo);
			System.out.println(mv + "<<<<<<<<<<<<<<<<< mv 여기는 멤버 로그인1");

			
			if (mv != null) { // 인증된 사용자인 경우..
				// 세션에 로그인 정보 설정하기
				req.getSession().setAttribute("LOGIN_USER", mv);

				String redirctURL = (String) req.getSession().getAttribute("redirectURL");

				if (redirctURL != null) { // null이 아니면 클릭한 url이 잇는경우

					// 세션에서 요청했던 URL 삭제 처리
					req.getSession().removeAttribute("redirectURL");

					// 요청했던 URL로 이동시키기
					resp.sendRedirect(redirctURL);
					
					memId = mv.getMem_Id();
					
					// 여행기록 갯수 세어주는 메서드
					Integer logCount1 = 0;
					try {
						logCount1 = logService.logCount(memId);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					Integer logCount =(Integer)logCount1;
					
					if (logCount != null) {
					      logCount = logCount1;
					      req.getSession().setAttribute("logCount", logCount);
					    System.out.println(logCount + "여기는 멤버 로그인");
					}
					
					// 커뮤니티 갯수
					Integer comCount1 = 0;
					comCount1 = comService.comCount(memId);
					
					Integer comCount =(Integer)logCount1;
					
					if (comCount != null) {
					      comCount = comCount1;
					      req.getSession().setAttribute("comCount", comCount);
					    System.out.println(comCount + "여기는 멤버 로그인");
					}
					
				} else {

					// 게시물 갯수 세어주는 메서드
					memId = mv.getMem_Id();
					
					Integer logCount1 = 0;
					try {
						logCount1 = logService.logCount(memId);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					Integer logCount =(Integer)logCount1;
					
					if (logCount != null) {
					      logCount = logCount1;
					      req.getSession().setAttribute("logCount", logCount);
					    System.out.println(logCount + "여기는 멤버 로그인");
					}

					// 커뮤니티 갯수
					Integer comCount1 = 0;
					comCount1 = comService.comCount(memId);
					
					Integer comCount =(Integer)logCount1;
					
					if (comCount != null) {
					      comCount = comCount1;
					      req.getSession().setAttribute("comCount", comCount);
					    System.out.println(comCount + "여기는 멤버 로그인");
					}
					
					
					
					// 메인 페이지로 이동하기
					resp.sendRedirect(req.getContextPath() + "/index.jsp");
//				resp.sendRedirect("/index.jsp");
				}

			} else { // 사용자 인증 실패한경우...

				req.setAttribute("message", "아이디 와 비밀번호를 확인해주세요 .");
				// 로그인 페이지로 이동
				req.getRequestDispatcher("/views/member/loginForm.jsp").forward(req, resp);

			}
		}
		
		
		
	}

}
