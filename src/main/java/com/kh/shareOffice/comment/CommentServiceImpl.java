package com.kh.shareOffice.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.PageInfo;
import com.kh.shareOffice.Search;

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
	public List<Comment> selectCnQAll(PageInfo pi, Search search) {
		List<Comment> commetList = cStore.selectCnQAll(pi, search);
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

	@Override
	public int getListCnt(Search search) {
		int result = cStore.getListCnt(search);
		return result;
	}
	
	@Override
	public int totalCntNotOk() {
		int result = cStore.totalCntNotOk();
		return result;
	}
	
	@Override
	public int totalCntOK() {
		int result = cStore.totalCntOK();
		return result;
	}

	@Override
	public List<Comment> selectCommentOk(PageInfo pi) {
		List<Comment> list = cStore.selectCommentOk(pi);
		return list;
	}

	@Override
	public List<Comment> selectCommentNotOk(PageInfo pi) {
		List<Comment> list = cStore.selectCommentNotOk(pi);
		return list;
	}

}
