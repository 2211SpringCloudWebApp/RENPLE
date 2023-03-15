package com.kh.shareOffice.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentStore cStore;

	@Override
	public int insertComment(Comment comment) {
		int result = cStore.insertComment(comment);
		return result;
	}

	@Override
	public List<Comment> selectCnQAll() {
		List<Comment> commetList = cStore.selectCnQAll();
		return commetList;
	}

	@Override
	public Comment selectOneByNo(int questionNo) {
		Comment comment = cStore.selectOneByNo(questionNo);
		return comment;
	}

	@Override
	public int deleteComment(int commentNo) {
		int result = cStore.deleteComment(commentNo);
		return result;
	}

	@Override
	public int updateComment(Comment comment) {
		int result = cStore.updateComment(comment);
		return result;
	}

}
