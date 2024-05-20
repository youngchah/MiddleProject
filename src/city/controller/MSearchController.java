package city.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import city.service.IMainService;
import city.service.MainServiceImpl;
import city.vo.MCityVO;

public class MSearchController extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IMainService mainService = MainServiceImpl.getInstance();
		
		List<MCityVO> civ = mainService.getcitynum();
		
		System.out.println("trtrt" + civ);
		
		req.setAttribute("civl", civ);
		
		req.getRequestDispatcher("/include/footer.jsp").forward(req, resp);
	
		
	}
	

}
