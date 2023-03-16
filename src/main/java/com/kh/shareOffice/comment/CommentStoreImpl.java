package com.kh.shareOffice.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<Comment> selectCnQAll() {
		List<Comment> commetList = session.selectList("CommentMapper.selectCnQAll");
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

}