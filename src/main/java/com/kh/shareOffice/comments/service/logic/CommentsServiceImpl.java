package com.kh.shareOffice.comments.service.logic;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shareOffice.comments.domain.Comment;
import com.kh.shareOffice.comments.service.CommentsService;
import com.kh.shareOffice.comments.store.CommentsStore;

@Service
public class CommentsServiceImpl implements CommentsService{

	@Autowired
	private CommentsStore cStore;

	@Override
	public int insertComment(Comment comment) {
		return cStore.insertComment(comment);
	}
}