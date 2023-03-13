package com.kh.shareOffice.comments.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.shareOffice.comments.store.CommentsStore;

@Repository
public class CommentsStoreImpl implements CommentsStore{

	@Autowired
	private SqlSession session;
}
