package landmark.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import common.MyBatisDao;
import landmark.vo.LandmarkVO;
import util.MyBatisUtil;

public class LandmarkDaoImpl extends MyBatisDao implements ILandmarkDao{

	private static ILandmarkDao landDao;
	
	private LandmarkDaoImpl() {}
	
	public static ILandmarkDao getInstance() {
		if(landDao == null) {
			landDao = new LandmarkDaoImpl();
		}
		return landDao;
	}
	
	
	@Override
	public List<LandmarkVO> selectfour() {
		return selectList("landmark.selectfour");
	}

	@Override
	public List<LandmarkVO> selectAll() {
		
		System.out.println("landmarkdaoimplall");
		
		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		List<LandmarkVO> landList = new ArrayList<LandmarkVO>();
		
		try {
			landList = sqlSession.selectList("landmark.selectAll");
			
//			System.out.println("다오에서 랜드리스트~"+landList);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return landList;
	}

	@Override
	public LandmarkVO selectDetail(LandmarkVO landVo) {
		
		System.out.println("다오 랜드마크디테일");
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		LandmarkVO lv = null;
		
		try {
			lv = sqlSession.selectOne("landmark.selectDetail", landVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return lv;
	}
	
	
	
	
	
	
	
	//신하림코드
	public List<LandmarkVO> selectCityList(int cityNum) {
		
		System.out.println("landmarkdaoimplall");
		
		SqlSession sqlSession = MyBatisUtil.getInstance(true);

		List<LandmarkVO> landList = new ArrayList<LandmarkVO>();
		
		try {
			landList = sqlSession.selectList("landmark.selectCityList", cityNum);
			
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return landList;
	}

	
	
	

	
}
