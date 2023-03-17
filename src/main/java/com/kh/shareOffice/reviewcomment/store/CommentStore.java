package com.kh.shareOffice.reviewcomment.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.shareOffice.reviewcomment.domain.Comment;

public interface CommentStore {

	/**
	 * 댓글 작성 Store
	 * @param session
	 * @param comment
	 * @return int
	 */
	public int insertComment(SqlSession session, Comment comment);

	/**
	 * 댓글 삭제 Store
	 * @param session
	 * @param commentNo
	 * @return int
	 */
	public int deleteComment(SqlSession session, int commentNo);

	/**
	 * 댓글 수정 Store
	 * @param session
	 * @param comment
	 * @return int
	 */
	public int updateComment(SqlSession session, Comment comment);

	/**
	 * 댓글 목록 Store
	 * @param session
	 * @return List<Comment>
	 */
	public List<Comment> selectCommentList(SqlSession session, int reviewNo);

}
