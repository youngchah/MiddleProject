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

@WebServlet("/city/landmarklist")
//주요도시 탭에서 도시 검색 -> 메뉴에서 여행 장소탭 클릭 시 화면
public class LandmarkListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		int cityNum = Integer.parseInt(req.getParameter("cityNum"));
		
		
		
		if(cityNum == 0) {
			
			
			
			ILandmarkService landSer = LandmarkServiceImpl.getInstance();
			
			List<LandmarkVO> landList = landSer.selectAll();
			
			System.out.println("랜드리스트!!!"+landList);
			
			req.setAttribute("landList", landList);
			
			req.getRequestDispatcher("/views/landmark/landmarkList.jsp").forward(req, resp);
			
			System.out.println("landmarklistcon			selectAll");
			
		}
		
		else {
			
			
			ILandmarkService landSer1 = LandmarkServiceImpl.getInstance();
			
			List<LandmarkVO> landList1 = landSer1.selectCityList(cityNum);
			
			System.out.println("랜드리스트!!!"+landList1);
			
			req.setAttribute("landList", landList1);
			
			req.getRequestDispatcher("/views/landmark/landmarkList.jsp").forward(req, resp);
			
			System.out.println("landmarklistcon		selectCityList");
			
			
			
		}
		
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
