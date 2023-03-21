package com.kh.shareOffice.reviewcomment;

import java.util.List;

public interface ReviewCommentService {

	/**
	 * 댓글 작성 Service
	 * @param comment
	 * @return int
	 */
	public int insertComment(ReviewComment comment);

	/**
	 * 댓글 삭제 Service
	 * @param commentNo
	 * @return int
	 */
	public int deleteComment(int commentNo);

	/**
	 * 댓글 수정 Service
	 * @param comment
	 * @return int
	 */
	public int updateComment(ReviewComment comment);

	/**
	 * 댓글 목록 Service
	 * @return List<Comment>
	 */
	public List<ReviewComment> selectCommentList(int reviewNo) throws Exception;

	/**
	 * 댓글번호로 글번호 불러오기
	 * @param commentNo
	 * @return int
	 */
	public int selectReviewNoByCommentNo(int commentNo);

}
