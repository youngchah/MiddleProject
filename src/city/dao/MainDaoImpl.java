package city.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import city.vo.AllVO;
import city.vo.MCityVO;
import city.vo.MComVO;
import city.vo.MLandVO;
import city.vo.MPlanVO;
import community.dao.ComDaoImpl;
import community.dao.IComDao;
import util.MyBatisUtil;

public class MainDaoImpl implements IMainDao{
		
		private static IMainDao landDao;

		private MainDaoImpl() {

		}

		public static IMainDao getInstance() {
			if (landDao == null) {
				landDao = new MainDaoImpl();
			}
			return landDao;
		}
		
		@Override
		public List<MCityVO> getcity(int city_num) {
			
			SqlSession sqlSession = MyBatisUtil.getInstance(true);
			
			List<MCityVO> civ = null;
			
			try {
				civ = sqlSession.selectList("city.selectCity", city_num);
			}catch(PersistenceException ex) {
				ex.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return civ;
		}
		
		@Override
		public List<MPlanVO> getplan(int city_num) {

			SqlSession sqlSession = MyBatisUtil.getInstance(true);
			
			List<MPlanVO> pv = null;
			
			try {
				pv = sqlSession.selectList("city.", city_num);
			}catch(PersistenceException ex) {
				ex.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return pv;
		}
		
		@Override
		public List<MLandVO> getLand(int city_num) {
			
			SqlSession sqlSession = MyBatisUtil.getInstance(true);
			
			
			List<MLandVO> lv = null;
			
			try {
				lv = sqlSession.selectList("city.selectland", city_num);
			}catch(PersistenceException ex) {
				ex.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return lv;
		}

		@Override
		public List<MComVO> getCom(int city_num) {
			
			SqlSession sqlSession = MyBatisUtil.getInstance(true);
			
			List<MComVO> cv = null;
			
			try {
				cv = sqlSession.selectList("city.selectCom", city_num);
			}catch(PersistenceException ex) {
				ex.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return cv;
		}

		@Override
		public List<AllVO> alllist(int city_num) {
			
			SqlSession sqlSession = MyBatisUtil.getInstance();
			
			List<AllVO> av = null;
			
			try {
				av = sqlSession.selectList("city.allcity", city_num);
				System.out.println("dao에서 av = "+av);
			}catch(PersistenceException ex) {
				ex.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return av;
		}

		@Override
		public List<MCityVO> getcitynum() {
			
			SqlSession sqlSession = MyBatisUtil.getInstance();
			
			List<MCityVO> mcv = null;
			
			try {
				mcv = sqlSession.selectList("city.getcitynum");
				System.out.println(mcv);
			}catch(PersistenceException ex) {
				ex.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return mcv;
		}

	

		

		
}
