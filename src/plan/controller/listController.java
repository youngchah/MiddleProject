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

@WebServlet("/plan/list.do")
public class listController extends HttpServlet
{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
		
		
		String memId = (String) req.getParameter("mem_Id");
		
		IPlanService service = PlanServiceImpl.getInstance();
		
		List<CombinePlanVO> selectMyPlanList = service.selectMyPlanList(memId);
		
		System.out.println("asdasdsada   " + memId);
		
		req.setAttribute("selectMyPlanList", selectMyPlanList);
		
		req.getRequestDispatcher("/views/plan/listplan.jsp").forward(req, resp);
			
		
	}

}
