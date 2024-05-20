package plan.service;

import java.util.List;

import plan.dao.IPlanDao;
import plan.dao.PlanDaoImpl;
import plan.vo.CombinePlanVO;

public class PlanServiceImpl implements IPlanService{

	
	private static IPlanService planService;
	
	private IPlanDao planDao;
	
	private PlanServiceImpl() {
		
		planDao = PlanDaoImpl.getInstance();
	}
	
	public static IPlanService getInstance() {
		
		if(planService == null) {
			
			planService = new PlanServiceImpl();
		}
		
		return planService;
	}
	
	
//	@Override
//	public int planInsert(CombinePlanVO cpv) {
//		
//		return planDao.planInsert(cpv);
//	}
//
//	@Override
//	public int planInsertDetail(CombinePlanVO cpv) {
//		
//		return planDao.planInsertDetail(cpv);
//	}

	@Override
	public int planInsertWithDetails(CombinePlanVO cpv, List<CombinePlanVO> detailList)
	{
		return planDao.planInsertWithDetails(cpv, detailList);
	}

	@Override
	public List<CombinePlanVO> selectMyPlanList(String memId)
	{
		return planDao.selectMyPlanList(memId);
	}

	@Override
	public List<CombinePlanVO> planListByCity(int city_num) {
		
		return planDao.planListByCity(city_num);
	}
	
	@Override
	public String getPlanCityName(int city_num) {
		
		return planDao.getPlanCityName(city_num);
	}
	
	
	
	
	

}
