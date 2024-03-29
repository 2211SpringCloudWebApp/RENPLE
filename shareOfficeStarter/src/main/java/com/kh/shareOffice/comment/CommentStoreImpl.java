package com.kh.shareOffice.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.shareOffice.PageInfo;
import com.kh.shareOffice.Search;

@Repository
public class CommentStoreImpl implements CommentStore{

	@Autowired
	private SqlSession session;

	@Override
	public int insertComment(Comment comment) {
		int result = session.insert("CommentMapper.insertComment", comment);
		return result;
	}

	@Override
	public List<Comment> selectCnQAll(Search search) {
		List<Comment> commetList = session.selectList("CommentMapper.selectCnQAll", search);
		return commetList;
	}

	@Override
	public Comment selectOneByNo(int questionNo) {
		Comment comment = session.selectOne("CommentMapper.selectOneByNo", questionNo);
		return comment;
	}

	@Override
	public int deleteComment(int commentNo) {
		int result = session.delete("CommentMapper.deleteComment", commentNo);
		return result;
	}

	@Override
	public int updateComment(Comment comment) {
		int result = session.update("CommentMapper.updateComment", comment);
		return result;
	}

	@Override
	public int getListCnt(Search search) {
		int result = session.selectOne("CommentMapper.getListCnt", search);
		return result;
	}

	@Override
	public int totalCnt() {
		int result = session.selectOne("CommentMapper.totalCnt");
		return result;
	}

	@Override
	public List<Comment> selectCommentOk() {
		List<Comment> list = session.selectList("CommentMapper.selectCommentOk");
		return list;
	}

	@Override
	public List<Comment> selectCommentNotOk(PageInfo pi) {
		List<Comment> list = session.selectList("CommentMapper.selectCommentNotOk");
		return list;
	}

}
