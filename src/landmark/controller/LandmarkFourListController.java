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

@WebServlet("/city/landmarkfour")
//주요도시 탭에서 도시 검색 -> 랜드마크 4개 보이는 화면
public class LandmarkFourListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ILandmarkService landSer = LandmarkServiceImpl.getInstance();
		
		List<LandmarkVO> landList = landSer.selectfour();
		
		req.setAttribute("landList", landList);
		
		req.getRequestDispatcher("/views/landmark/landmarkFour.jsp").forward(req, resp);
		
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
