package com.kh.shareOffice.reviewcomment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewCommentServiceImpl implements ReviewCommentService{

	@Autowired
	private ReviewCommentStore cStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertComment(ReviewComment comment) {
		int result = cStore.insertComment(session, comment);
		return result;
	}
	
	@Override
	public int insertCommentComment(ReviewComment comment) {
		int result = cStore.insertCommentComment(session, comment);
		return result;
	}

	@Override
	public int deleteComment(int commentNo) {
		int result = cStore.deleteComment(session, commentNo);
		return result;
	}

	@Override
	public int updateComment(ReviewComment comment) {
		int result = cStore.updateComment(session, comment);
		return result;
	}

	@Override
	public List<ReviewComment> selectCommentList(int reviewNo) {
		List<ReviewComment> cList = cStore.selectCommentList(session, reviewNo);
		return cList;
	}



}
