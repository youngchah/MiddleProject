package member.service;

import java.util.List;
import java.util.Map;

import member.vo.MemberVO;

public interface IMemberService {

	//접근제한자 반환타입 메소드명(매개변수)
	
	//로그인 id-pw 검증
	public String loginChk(Map<String, Object> map);
	
	/**
	 * 회원등록을 위한 메서드
	 * @param mv 등록할 회원정보를 담은 VO객체
	 * @return 등록 성공하며 1, 실패하면 0이 반환된다.
	 */
	public int registMember(MemberVO mv);

	
	
	/**
	 * 회원정보를 수정하기 위한 메서드
	 * @param mv 등록할 회원정보를 담은 VO객체
	 * @return 작업이 성공하며 1, 실패하면 0이 반환된다.
	 */
	public int modifyMember(MemberVO mv);
	
	/**
	 * 회원이 존재하는지 체크하기 윈한 메서드
	 * @param memId 존재여부 체크할 회원ID
	 * @return 회원이 존재하면 true, 존재하지 않으면 false
	 */
	public boolean checkMember(String memId);
	
	/**
	 * 회원 상세정보를 가져오기 위한 메서드
	 * @param memId 회원 상세정보를 가져오기 위한 회원 ID
	 * @return 회원정보를 담은 MemberVO객체 리턴함
	 */
	public MemberVO getMember(String memId);
	

	
	/**
	 * 모든 회원정보를 조회하기 윈한 메서드
	 * @return 등록된 모든 회원 정보
	 */
	public List<MemberVO> displayAllMember();

	/**
	 * 회원정보를 검색하기 위한 메서드
	 * @param mv 검색 정보를 담은 MemberVO 객체
	 * @return 검색된 회원정보를 담은 List
	 */
	public List<MemberVO> searchMember(MemberVO mv);

	/**
	 * 로그인 사용자 정보를 가져오기 위한 메서드
	 * @param mv 로그인시 사용한  회원 ID 및 패스워드 담은 memberVO객체
	 * @return 상세회원정보를 담은 MemberVO객체
	 */
	public MemberVO getLoginInfo(MemberVO mv);
	
	/**
	 * 회원 아이디를 찾기 위한 메서드
	 * @param mv
	 * @return
	 */
	public String findId(String memName, String memEmail);
	
	/**
	 * 전체 회원 목록 수 조회하기
	 * @return
	 */
	public int countMember();

	// 회원 리스트 목록 조회를 위한 메서드
	public List<MemberVO> memberList(Map<String, Object> map);

	// 회원 탈퇴 처리 하기 윈한 메서드
	public int deleteMember(MemberVO mv);
	
}
