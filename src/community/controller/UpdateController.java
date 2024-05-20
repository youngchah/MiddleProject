package community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import city.controller.CityMapper;
import community.service.ComServiceImpl;
import community.service.IComService;
import community.vo.ComVO;
import member.vo.MemberVO;

@MultipartConfig
@WebServlet("/community/update.do")
public class UpdateController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("LOGIN_USER");
		System.out.println("mv.getMem_Id() = "+mv.getMem_Id());
		
		int com_num = (Integer.parseInt(req.getParameter("com_num")));
				
		IComService comService = ComServiceImpl.getInstance();
		
		ComVO cv = comService.getCom(com_num);
		System.out.println("업데이트 컨트롤러 cv : "+cv);
		
		req.setAttribute("cv", cv);
		
		req.getRequestDispatcher("/views/community/update.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//도시이름, 도시번호
		String cityName = req.getParameter("city_name");
		int cityNum = CityMapper.getCityNum(cityName);
		System.out.println("update cityName = " +cityName);
		System.out.println("update cityNum = " +cityNum);
		
		//커뮤니티 제목
		String comTitle = req.getParameter("com_title");
		System.out.println("update comTitle = " +comTitle);
		
		//커뮤니티 내용
		String comCont = req.getParameter("contents");
		System.out.println("update comCont = " +comCont);

		//커뮤니티 넘버
		int comNum = Integer.parseInt(req.getParameter("com_num"));
		System.out.println("update comNum = " + comNum);
		
		
		HttpSession session = req.getSession();
		MemberVO mv = (MemberVO) session.getAttribute("LOGIN_USER");
		System.out.println("updateCon 멤아이디 : "+mv.getMem_Id());
		
		
		IComService comService = ComServiceImpl.getInstance();
		
		ComVO cv = new ComVO();
		cv.setCityName(cityName);
		cv.setCityNum(cityNum);
		cv.setComTitle(comTitle);
		cv.setComCont(comCont);
		cv.setComNum(comNum);
		cv.setMemId(mv.getMem_Id());
		
		int cnt = comService.modifyCom(cv);
		
		resp.sendRedirect(req.getContextPath() + "/community/list.do");
			
//		String msg = "";
		
//		if(cnt > 0) {
//			msg = "성공";
//		}else {
//			msg = "실패";
//		}
//		
//		req.getSession().setAttribute("msg", msg);
	}
}
