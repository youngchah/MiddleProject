package community.service;

import community.vo.ComCommentVO;

public interface IComCommentService {
	
	/**
	 * 커뮤니티 댓글을 위한 메서드
	 * @param ccv
	 * @return
	 */
	public int registComComment(ComCommentVO ccv);

}
