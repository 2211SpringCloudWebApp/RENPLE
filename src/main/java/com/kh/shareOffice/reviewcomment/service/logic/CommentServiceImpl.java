package com.kh.shareOffice.reviewcomment.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.reviewcomment.domain.Comment;
import com.kh.shareOffice.reviewcomment.service.CommentService;
import com.kh.shareOffice.reviewcomment.store.CommentStore;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentStore cStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertComment(Comment comment) {
		int result = cStore.insertComment(session, comment);
		return result;
	}

	@Override
	public int deleteComment(int commentNo) {
		int result = cStore.deleteComment(session, commentNo);
		return result;
	}

	@Override
	public int updateComment(Comment comment) {
		int result = cStore.updateComment(session, comment);
		return result;
	}

	@Override
	public List<Comment> selectCommentList(int reviewNo) throws Exception {
		List<Comment> cList = cStore.selectCommentList(session, reviewNo);
		return cList;
	}

}
