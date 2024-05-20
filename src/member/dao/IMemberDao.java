package member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.vo.MemberVO;


public interface IMemberDao {

	//로그인 id-pw 검증
	public String loginChk(Map<String, Object> map) throws SQLException;
	
public int insertMember(MemberVO mv);

	
	
	/**
	 * MemberVO에 담긴 데이터를 update하기 위한 메서드
	 * @param mv 등록할 회원정보를 담은 VO객체
	 * @return DB작업이 성공하며 1, 실패하면 0이 반환된다.
	 */
	public int updateMember(MemberVO mv);
	
	/**
	 * 회원이 존재하는지 체크하기 윈한 메서드
	 * @param memId 존재여부 체크할 회원ID
	 * @return 회원이 존재하면 true, 존재하지 않으면 false
	 */
	public boolean checkMember(String memId);
	
	/**
	 * 상세 회원정보를 가져오기 위한 메서드
	 * @param memId 상세회원정보를 가져오기 위한 회원 ID
	 * @return 상세회원정보를 담은 MemberVO객체
	 */
	public MemberVO getMember(String memId);

	/**
	 * 로그인 사용자 정보를 가져오기 위한 메서드
	 * @param mv 로그인시 사용한  회원 ID 및 패스워드 담은 memberVO객체
	 * @return 상세회원정보를 담은 MemberVO객체
	 */
	public MemberVO getLoginInfo(MemberVO mv);
	
	/**
	 * 회원정보를 delete하기 위한 메서드
	 * @param mv 삭제할 회원ID
	 * @return DB작업이 성공하며 1, 실패하면 0이 반환된다.
	 */
	public int deleteMember(MemberVO mv);
	
	/**
	 * DB에 존재하는 모든 회원정보를 조회하기 윈한 메서드
	 * @return
	 */
	public List<MemberVO> selectAll();

	
	/**
	 * 회원 정보를 검색하기 위한 메서드
	 * @param mv 검색조건을 담은 MemberVO객체
	 * @return 검색된 회원 정보를 담은 List
	 */
	public List<MemberVO> searchMember(MemberVO mv);
	
	/**
	 * 회원 아이디를 찾기 위한 메서드
	 * @param mv
	 * @return
	 */
	public String findId(MemberVO mv);

	// 전체 회원 수 조회하기
	public int countList ();
	
	// 페이지 별 회원 리스트 조회
	public List<MemberVO> memList(Map<String, Object>map);
	
}
