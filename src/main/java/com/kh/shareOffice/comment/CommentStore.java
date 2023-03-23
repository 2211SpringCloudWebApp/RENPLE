package com.kh.shareOffice.comment;

import java.util.List;

import com.kh.shareOffice.PageInfo;
import com.kh.shareOffice.Search;

public interface CommentStore {

	int insertComment(Comment comment);

	List<Comment> selectCnQAll(PageInfo pi, Search search);

	Comment selectOneByNo(int questionNo);

	int deleteComment(int commentNo);

	int updateComment(Comment comment);

	int getListCnt(Search search);

	int totalCnt();

	List<Comment> selectCommentOk(PageInfo pi);

	List<Comment> selectCommentNotOk(PageInfo pi);

}
