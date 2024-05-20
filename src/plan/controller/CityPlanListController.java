package plan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plan.service.IPlanService;
import plan.service.PlanServiceImpl;
import plan.vo.CombinePlanVO;

@WebServlet("/plan/listplanBycity.do")
public class CityPlanListController extends HttpServlet
{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
		int city_num = (Integer.parseInt(req.getParameter("city_num")));
		
		
		IPlanService service = PlanServiceImpl.getInstance();
		
		List<CombinePlanVO> listPlanByCity = service.planListByCity(city_num);
		
		String cityName = service.getPlanCityName(city_num);
		
		
		req.setAttribute("planCityName", cityName);
		
		req.setAttribute("listPlanByCity", listPlanByCity);
		
		req.getRequestDispatcher("/views/plan/listplanBycity.jsp").forward(req, resp);
			
		
	}

}
