package community.dao;

import community.vo.ComCommentVO;

public interface IComCommentDao {
	
	/**
	 * 커뮤니티 댓글 등록을 위한 메서드
	 * @param ccv
	 * @return
	 */
	public int insertComComment(ComCommentVO ccv);

}
