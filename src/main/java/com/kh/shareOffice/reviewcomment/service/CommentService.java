package com.kh.shareOffice.reviewcomment.service;

import java.util.List;

import com.kh.shareOffice.reviewcomment.domain.Comment;

public interface CommentService {

	/**
	 * 댓글 작성 Service
	 * @param comment
	 * @return int
	 */
	public int insertComment(Comment comment);

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
	public int updateComment(Comment comment);

	/**
	 * 댓글 목록 Service
	 * @return List<Comment>
	 */
	public List<Comment> selectCommentList(int reviewNo) throws Exception;

}
