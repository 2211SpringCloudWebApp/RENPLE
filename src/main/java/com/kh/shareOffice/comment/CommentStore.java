package com.kh.shareOffice.comment;

import java.util.List;

public interface CommentStore {

	int insertComment(Comment comment);

	List<Comment> selectCnQAll();

	Comment selectOneByNo(int questionNo);

	int deleteComment(int commentNo);

	int updateComment(Comment comment);

}
