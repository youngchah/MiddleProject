package community.controller;

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
import log.vo.LogVO;
import member.vo.MemberVO;

@WebServlet("/community/detail.do")
public class DetailController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int com_num = (Integer.parseInt(req.getParameter("com_num")));
		System.out.println("디테일 컨트롤러 com_num : "+com_num);
		
//		MemberVO memberVO = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
//		if(memberVO != null) {
//			System.out.println("디테일 컨트롤러 memId : "+memberVO.getMem_Id());
//		}
		
		IComService comService = ComServiceImpl.getInstance();
		
		ComVO cv = comService.getCom(com_num);
		System.out.println("디테일 컨트롤러 cv : "+cv);
		
		req.setAttribute("cv", cv); //멤 닉을 가져온것임
		
		req.getRequestDispatcher("/views/community/detail.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
