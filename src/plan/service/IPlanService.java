package plan.service;

import java.util.List;

import plan.vo.CombinePlanVO;

public interface IPlanService {
	
	
//	public int planInsert(CombinePlanVO cpv);
//	
//	public int planInsertDetail(CombinePlanVO cpv);
	
	
	public int planInsertWithDetails(CombinePlanVO cpv, List<CombinePlanVO> detailList);
	
	public List<CombinePlanVO> selectMyPlanList(String memId);

	public List<CombinePlanVO> planListByCity(int city_num);
	
	public String getPlanCityName(int city_num);
}
