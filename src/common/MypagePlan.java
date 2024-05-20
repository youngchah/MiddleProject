package common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.MemberVO;
import plan.service.IPlanService;
import plan.service.PlanServiceImpl;
import plan.vo.CombinePlanVO;

@WebServlet("/mypage/myTripPlan.do")
public class MypagePlan extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVO memVO = (MemberVO) req.getSession().getAttribute("LOGIN_USER");
		String memId = memVO.getMem_Id();
		
		IPlanService planService = PlanServiceImpl.getInstance();
		
//		List<CombinePlanVO> listPlanByCity = planService.planListByCity(memId);
		
		req.getRequestDispatcher("/views/mypage/myTripPlan.jsp").forward(req, resp);
		
		
	}
	
}
