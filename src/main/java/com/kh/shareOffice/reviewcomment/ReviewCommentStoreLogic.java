package com.kh.shareOffice.reviewcomment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class ReviewCommentStoreLogic implements ReviewCommentStore{

	@Override
	public int insertComment(SqlSession session, ReviewComment comment) {
		int result = session.insert("ReviewCommentMapper.insertComment", comment);
		return result;
	}
	
	@Override
	public int insertCommentComment(SqlSession session, ReviewComment comment) {
		int result = session.insert("ReviewCommentMapper.insertCommentComment", comment);
		return result;
	}

	@Override
	public int updateComment(SqlSession session, ReviewComment comment) {
		int result = session.update("ReviewCommentMapper.updateComment", comment);
		return result;
	}

	@Override
	public int deleteComment(SqlSession session, int commentNo) {
		int result = session.delete("ReviewCommentMapper.deleteComment", commentNo);
		return result;
	}

	@Override
	public List<ReviewComment> selectCommentList(SqlSession session, int reviewNo) {
		List<ReviewComment> cList = session.selectList("ReviewCommentMapper.selectCommentList", reviewNo);
		return cList;
	}


}
