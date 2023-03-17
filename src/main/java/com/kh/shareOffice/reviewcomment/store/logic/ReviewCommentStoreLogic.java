package com.kh.shareOffice.reviewcomment.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.shareOffice.reviewcomment.domain.ReviewComment;
import com.kh.shareOffice.reviewcomment.store.ReviewCommentStore;


@Repository
public class ReviewCommentStoreLogic implements ReviewCommentStore{

	@Override
	public int insertComment(SqlSession session, ReviewComment comment) {
		int result = session.insert("ReviewCommentMapper.commentInsert", comment);
		return result;
	}

	@Override
	public int deleteComment(SqlSession session, int commentNo) {
		int result = session.delete("CommentMapper.insertComment", commentNo);
		return result;
	}

	@Override
	public int updateComment(SqlSession session, ReviewComment comment) {
		int result = session.update("CommentMapper.updateComment", comment);
		return result;
	}

	@Override
	public List<ReviewComment> selectCommentList(SqlSession session, int reviewNo) {
		List<ReviewComment> cList = session.selectList("ReviewCommentMapper.selectCommentList", reviewNo);
		return cList;
	}

}
