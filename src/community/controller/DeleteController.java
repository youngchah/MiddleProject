package community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.service.ComServiceImpl;
import community.service.IComService;

@WebServlet("/community/delete.do")
public class DeleteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int com_num = (Integer.parseInt(req.getParameter("com_num")));
		
		
		IComService comService = ComServiceImpl.getInstance();
		
		comService.removeCom(com_num);
		
//		String msg = "";
//		
//		if(cnt > 0) {
//			msg = "성공";
//		}else {
//			msg = "실패";
//		}
//		
//		req.getSession().setAttribute("msg", msg);
//		System.out.println("들어가기전");
		
		resp.sendRedirect(req.getContextPath() + "/community/list.do"); 
//		System.out.println("들어가기후");
	}
	

}
