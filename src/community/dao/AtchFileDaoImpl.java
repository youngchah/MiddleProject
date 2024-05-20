package community.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import community.vo.AtchFileVO;
import util.MyBatisUtil;

public class AtchFileDaoImpl implements IAtchfileDao {

	private static IAtchfileDao fileDao;

	public AtchFileDaoImpl() {

	}

	public static IAtchfileDao getInstance() {
		if (fileDao == null)
			fileDao = new AtchFileDaoImpl();
		return fileDao;
	}

	@Override
	public int insertAtchFile(AtchFileVO atchFileVO) {
		SqlSession session = MyBatisUtil.getInstance();

		int cnt = 0;

		try {

			cnt = session.insert("atchFile.insertAtchFile", atchFileVO);

			if (cnt > 0) {
				session.commit();
			}

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertAtchFileDetail(AtchFileVO atchFileVO) {

		SqlSession session = MyBatisUtil.getInstance();

		int cnt = 0;

		try {

			cnt = session.insert("atchFile.insertAtchFileDetail", atchFileVO);

			if (cnt > 0) {
				session.commit();
			}

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO) {

		List<AtchFileVO> atchFileList = new ArrayList<AtchFileVO>();

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			atchFileList = session.selectList("atchFile.getAtchFileList", atchFileVO);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return atchFileList;
	}

	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO) {
		AtchFileVO atchFileDetail = null;

		SqlSession session = MyBatisUtil.getInstance(true);

		try {

			atchFileDetail = session.selectOne("atchFile.getAtchFileDetail", atchFileVO);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return atchFileDetail;
	}

	public static void main(String[] args) {
		IAtchfileDao fileDao = AtchFileDaoImpl.getInstance();

		AtchFileVO atchFileVO = new AtchFileVO();
		int cnt = fileDao.insertAtchFile(atchFileVO);

		if (cnt > 0) {
			System.out.println("등록성공!!");
			System.out.println(atchFileVO.getAtchFileId());

			/////////////////////////////////////////////

			atchFileVO.setFileStreCours("aaa/bbb/ccc.jpg");
			atchFileVO.setStreFileNm("aaaabbbbb.jpg");
			atchFileVO.setOrignlFileNm("ccc.jpg");
			atchFileVO.setFileExtsn("jpg");
			atchFileVO.setFileCn("");
			atchFileVO.setFileSize(10);
			cnt = fileDao.insertAtchFileDetail(atchFileVO);

			if (cnt > 0) {
				System.out.println("detail등록 성공!!!");
			}

		}
	}

}
