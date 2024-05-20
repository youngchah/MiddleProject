package admin.service;

import java.util.Map;

import admin.dao.AdminDaoImpl;
import admin.dao.IAdminDao;
import member.vo.AdminVO;

public class AdminServiceImpl implements IAdminService {

	private IAdminDao adminDao;
	private static IAdminService service;
	
	private AdminServiceImpl() {
		adminDao = AdminDaoImpl.getInstance();
	}
	public static IAdminService getInstance() {
		if(service == null) service = new AdminServiceImpl();
		return service;
	}
	@Override
	public String loginChk(Map<String, Object> map) {
		
		String adminId = "";
		try {
			adminId = adminDao.loginChk(map);
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		return adminId;
	}
	@Override
	public AdminVO getLoginInfo(AdminVO loginInfo) {
		System.out.println("service loginInfo>>>" + loginInfo);
		AdminVO av = adminDao.getLoginInfo(loginInfo);
		System.out.println("service av>>>" + av);
		return av;
	}

	
	
	
}
