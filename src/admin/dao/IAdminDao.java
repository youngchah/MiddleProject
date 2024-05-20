package admin.dao;

import java.sql.SQLException;
import java.util.Map;

import member.vo.AdminVO;

public interface IAdminDao {

	//로그인 id-pw 검증
		public String loginChk(Map<String, Object> map) throws SQLException;

		/**
		 * 로그인 관리자 정보 가져오기
		 * @param loginInfo
		 * @return
		 */
		public AdminVO getLoginInfo(AdminVO loginInfo);
	
	
}
