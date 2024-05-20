package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import member.vo.AdminVO;

@WebServlet("/adminLogin.do")
public class AdminLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views/admin/adminLogin.jsp").forward(req, resp);;
		
		System.out.println("관리자 로그인 doget");
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("관리자 로그인 dopost");
		
		String adminId = req.getParameter("admin_Id");
		String adminPass = req.getParameter("admin_Pass");
	
		System.out.println(adminId + " | " + adminPass);
		
		// 서비스 생성
		IAdminService adService = AdminServiceImpl.getInstance();
		
		// 사용자 ID 및 패스워드를 사용하여  DB로부터 해당 사용자 정보를 가져온다.
		AdminVO loginInfo = new AdminVO();
		loginInfo.setAd_Id(adminId);
		loginInfo.setAd_Pass(adminPass);
		
//		loginInfo.setAd_Id(adminId);
//		loginInfo.setAd_Pass(adminPass);
		
		System.out.println(loginInfo + "로긴이포");
		AdminVO av = adService.getLoginInfo(loginInfo);
		
		System.out.println(av + "av<<<<<<<");
		
		if(av != null) { // 인증된 사용자인 경우..
			
			// 세션에 로그인 정보 설정하기
			req.getSession().setAttribute("LOGIN_ADMIN", av);
			
			String redirctURL = (String) req.getSession().getAttribute("redirectURL");
			
			if(redirctURL != null) { // null이 아니면 클릭한 url이 잇는경우
				
				// 세션에서 요청했던 URL 삭제 처리
				req.getSession().removeAttribute("redirectURL");
				
				// 요청했던 URL로 이동시키기
				resp.sendRedirect(redirctURL);
			}else {
				
				// 메인 페이지로 이동하기
				resp.sendRedirect(req.getContextPath() + "/index.jsp");
//				resp.sendRedirect("/index.jsp");
			}
			
		}else { // 사용자 인증 실패한경우...
			
			// 로그인 페이지로 이동
			resp.sendRedirect(req.getContextPath() + "/adminLogin.do");
			
		}
		
		
		
	}

}
