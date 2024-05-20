package admin.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import common.MyBatisDao;
import member.vo.AdminVO;
import util.MyBatisUtil;

public class AdminDaoImpl extends MyBatisDao implements IAdminDao{

	// 싱글톤으로 dao객체 생성
	private static IAdminDao admindao;
	
	private AdminDaoImpl () {}
	
	public static IAdminDao getInstance() {
		if (admindao == null) admindao = new AdminDaoImpl();
		return admindao;
	}

	@Override
	public String loginChk(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return selectOne("admin.loginChk",map);
	}

	@Override
	public AdminVO getLoginInfo(AdminVO loginInfo) {

//		System.out.println("DAO argument>>" + loginInfo );
//		System.out.println("DAO argument>>" + loginInfo.getAdPass() );
//		System.out.println("DAO argument>>" + loginInfo.getAdId() );
		
		SqlSession sqlsession = MyBatisUtil.getInstance(true);
		
		AdminVO av = null;
		
		try {
			
			av = sqlsession.selectOne("admin.getLoginInfo", loginInfo);
			
			//av = sqlsession.selectOne("admin.getLoginInfo", loginInfo);
			
		} catch (Exception e) {

			e.printStackTrace();
		}finally {
			sqlsession.close();
		}
		
		
		System.out.println("dao return av>> " + av);
		return av;
		
	}
	
}
