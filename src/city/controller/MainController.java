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
import city.vo.AllVO;
import city.vo.MCityVO;
import city.vo.MComVO;
import city.vo.MLandVO;
import city.vo.MPlanVO;
import landmark.service.ILandmarkService;
import landmark.service.LandmarkServiceImpl;
import landmark.vo.LandmarkVO;
import plan.service.IPlanService;
import plan.service.PlanServiceImpl;
import plan.vo.CombinePlanVO;

@WebServlet("/maincity/main.do")
public class MainController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		///서비스를 하나 더 만들고 

		//메인서블릿.java

		// String cityname = getParameter("city_name"); 이거는 곧 서울특별시 라는 값이 들어오겠지?
		// 이제 이것을 어떻게? 
		
		//service.selectCityAll(cityname);
		// severce.selcetPlanAll(cityname);
		// service.selectLogAll(cityname);
		
		// rep.getDispatcher("main.jsp").forward(req.resp);
		
		// ex) status 404  아래에는 Repository 
		
		// resp.sendRedirect("main.jsp")
		 
		
		String search_name = req.getParameter("search_name");	//검색시 나오는
		System.out.println("search_name = "+search_name);
		
		int city_num = (Integer.parseInt(req.getParameter("city_num")));		//누르면 불러오는
		System.out.println("city_num = "+city_num);
		
		IMainService mainService = MainServiceImpl.getInstance();
		
		IPlanService service = PlanServiceImpl.getInstance();
		
		List<AllVO> al = mainService.allList(city_num);
		
		req.setAttribute("allList", al);
		
		
		/////////////////////////////////////////////////////////////////////
			
			
		List<MCityVO> civ = mainService.getlistcity(city_num);
		req.setAttribute("CityList", civ);
		
		List<MPlanVO> pv = mainService.getlistPlan(city_num);
		req.setAttribute("PlanList", pv);
		
		List<MLandVO> lv = mainService.getlistLand(city_num);
		req.setAttribute("LandList", lv);
		
		List<MComVO> cv = mainService.getlistCom(city_num);
		req.setAttribute("ComList", cv);
		
		ILandmarkService landSer = LandmarkServiceImpl.getInstance();
		List<LandmarkVO> landList = landSer.selectAll();
		req.setAttribute("landList", landList);
		
		List<CombinePlanVO> pcv = service.planListByCity(city_num);
		req.setAttribute("Plan", pcv);
		
		
		req.getRequestDispatcher("/views/maincity/main.jsp").forward(req, resp);
			
			
	}
	
	
	/*	else {
			
			
			IMainService mainService = MainServiceImpl.getInstance();
			
			List<AllVO> av = mainService.allList(search_name);
			
			List<MCityVO> civ = mainService.getSearchlistcity(city_name);
			
			List<MPlanVO> pv = mainService.getSearchlistPlan(city_name);
			
			List<MLandVO> lv = mainService.getSearchlistLand(city_name);
			
			List<MComVO> cv = mainService.getSearchlistCom(city_name);
			
			
			req.setAttribute("CityList", civ);
			
			req.setAttribute("", pv);
			
			req.setAttribute("LandList", lv);
			
			req.setAttribute("ComList", cv);
			
			req.getRequestDispatcher("/views/maincity/main.jsp").forward(req, resp);
			
			
		}
		
		*/
		
		
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
