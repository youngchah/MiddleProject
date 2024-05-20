package landmark.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import landmark.service.ILandmarkService;
import landmark.service.LandmarkServiceImpl;
import landmark.vo.LandmarkVO;

@WebServlet("/city/landmarkdetail")
public class LandmarkDetailController extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		int cityNum = Integer.parseInt(req.getParameter("cityNum"));
		int cityNum = 1;
		String landName = req.getParameter("landName");
		System.out.println(landName);
		
		ILandmarkService landService = LandmarkServiceImpl.getInstance();
		
		LandmarkVO landVO = new LandmarkVO(landName, cityNum);
		
		LandmarkVO lv = landService.selectDetail(landVO);
		
		req.setAttribute("lv", lv);
		
		req.getRequestDispatcher("/views/landmark/landmarkDetail.jsp").forward(req, resp);
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
