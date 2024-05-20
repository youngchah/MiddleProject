package community.service;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;

import community.vo.AtchFileVO;

public interface IAtchFileService {

	/**
	 * 첨부파일 목록을 저장하기 위한 메서드
	 * @param parts 파트정보를 담고 있는 컬렉션 객체
	 * @return
	 */
	public AtchFileVO saveAtchFileList(Collection<Part> parts);
	
	/**
	 * 첨부파일 목록 조회하기
	 * @param atchFileVO
	 * @return
	 */
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO);
	
	/**
	 * 첨부파일 세부정보 조회 메소드
	 * @param atchFileVO
	 * @return
	 */
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO);

}
