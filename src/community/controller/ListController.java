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

@WebServlet("/community/list.do")
public class ListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IComService comService = ComServiceImpl.getInstance();
		
		List<ComVO> comList = comService.displayAllCom();
		
		req.setAttribute("comList", comList);
		
		
//		예시
//		String nick = "영상이형";
//		req.getSession().setAttribute("nick", nick);
//		System.out.println(comList);
		
		req.getRequestDispatcher("/views/community/list.jsp").forward(req, resp);
		
	}

}
