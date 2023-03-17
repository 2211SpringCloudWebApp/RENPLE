package com.kh.shareOffice.comment;

import java.util.List;

import com.kh.shareOffice.Search;

public interface CommentStore {

	int insertComment(Comment comment);

	List<Comment> selectCnQAll(Search search);

	Comment selectOneByNo(int questionNo);

	int deleteComment(int commentNo);

	int updateComment(Comment comment);

	int getListCnt(Search search);

}
