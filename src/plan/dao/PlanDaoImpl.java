package plan.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import plan.vo.CombinePlanVO;
import util.MyBatisUtil;

public class PlanDaoImpl implements IPlanDao
{

	private static IPlanDao planDao;

	private PlanDaoImpl()
	{
	}

	public static IPlanDao getInstance()
	{

		if (planDao == null)
		{

			planDao = new PlanDaoImpl();
		}

		return planDao;
	}

	@Override
	public int planInsertWithDetails(CombinePlanVO cpv, List<CombinePlanVO> detailList)
	{
		SqlSession session = MyBatisUtil.getInstance();

		int pass = 0;

		try
		{
			// 첫 번째 삽입 작업 시퀀스 업데이트
			pass += session.insert("plan.insert", cpv);
			session.commit();

			// 두 번째 삽입 작업을 리스트의 각 요소에 대해 반복
			for (CombinePlanVO detail : detailList)
			{
				pass += session.insert("plan.insertDetail", detail);
				session.commit();
			}

		} catch (PersistenceException ex)
		{
			session.rollback();
			ex.printStackTrace();
		} finally
		{
			session.close(); // 세션 닫기
		}

		return pass;
	}

	@Override
	public List<CombinePlanVO> selectMyPlanList(String mem_id)
	{

		List<CombinePlanVO> myPlanList = new ArrayList<CombinePlanVO>();

		SqlSession session = MyBatisUtil.getInstance();

		try
		{
			myPlanList = session.selectList("plan.selectMyPlanList", mem_id);
			System.out.println("다오다오다오다오다오다오" + myPlanList);
			System.out.println(mem_id);

		} catch (PersistenceException ex)
		{
			ex.printStackTrace();
		} finally
		{
			session.close();
		}

		return myPlanList;
	}

	
	@Override
	public List<CombinePlanVO> planListByCity(int city_num) {
		
		List<CombinePlanVO> listPlanByCity = new ArrayList<CombinePlanVO>();

		SqlSession session = MyBatisUtil.getInstance();

		try
		{
			listPlanByCity = session.selectList("plan.planListByCity", city_num);
			System.out.println("다오다오다오다오다오다오" + listPlanByCity);
			System.out.println(city_num);

		} catch (PersistenceException ex)
		{
			ex.printStackTrace();
		} finally
		{
			session.close();
		}

		return listPlanByCity;
	}
	
	public String getPlanCityName(int city_num) {
		
		String cityName = null ;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		
		try {
			
			cityName = session.selectOne("plan.planCity", city_num);
			
		}catch (PersistenceException ex)
		{
			ex.printStackTrace();
		} finally
		{
			session.close();
		}
		
		return cityName;
		
	}

}
